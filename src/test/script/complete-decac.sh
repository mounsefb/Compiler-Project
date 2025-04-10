#!/bin/bash

# Auteur : gl01
# Version initiale : 20/12/2024

cd "$(dirname "$0")"/../../.. || exit 1

PATH=./src/test/script/launchers:"$PATH"
TEST_PATH=./src/test/deca/codegen/valid/:"$TEST_PATH"
OBTAINED_RES_PATH=./src/test/deca/codegen/valid/obtained_res


#Les Tests Valides
echo
printf  "\e[1;33m--------------- VALIDES DECA TESTS ---------------\e[0m"
echo
echo


#Compteur pour les tests
compteurTestCorrect=0
compteurTestIncorrect=0
compteurTestTotal=0


echo "Suppression des fichiers .ass deja existant"
# Supprimer tous les fichiers .ass dans le répertoire et ses sous-répertoires
find ./src/test/deca/codegen/valid/ -type f -name "*.ass" -delete

echo "decac sur tout les fichiers .deca"
# Exécuter decac -P sur tous les fichiers .deca dans le répertoire et ses sous-répertoires
find ./src/test/deca/codegen/valid/ -type f -name "*.deca" -exec decac -P {} +

find ./src/test/deca/codegen/valid/ -type f -name "*.ass" | while read -r i
    do

    compteurTestTotal=$((compteurTestTotal+1))

    # Construction du chemin pour le fichier résultant dans obtained_res
    output_path="$OBTAINED_RES_PATH/$(basename "${i%.deca}deca.res")"

    # Construction du chemin pour le fichier .res attendu
    expected_path="${i%.ass}.expected"

    # Vérifier si le fichier .expected existe
    if [ ! -f "$expected_path" ]; then
        printf  "\e[31m[ MISSING EXPECTED ]\e[0m"
        echo " $(basename "${i%.ass}.deca") : Aucun fichier .expected trouvé"
        continue  
    fi  


    # Exécute decac une seule fois et redirige la sortie vers le fichier
    ima "$i" > "$output_path" 2>&1

    # Récupère la ligne qui commence par // Resultats
    #result_line=$(sed -n -e '/^[[:space:]]*\/\/[[:space:]]*Resultats[[:space:]]*:/,/\/\/.*:/s/^[[:space:]]*\/\/[[:space:]]*[[:digit:]]*[\t ]*//\([^:]*\):.*/\1/p' "$i")

    #echo $i
    #echo $result_line
    #echo $output_path

    # Vérifie la sortie (contenue dans le fichier) avec le résultat attendu
    if diff -q "$expected_path" "$output_path" >/dev/null 2>&1 ; then    
        compteurTestCorrect=$((compteurTestCorrect+1))
        printf  "\e[32m[ OK ]\e[0m"
        echo " $(basename "${i%.ass}.deca")"
    else
        compteurTestIncorrect=$((compteurTestIncorrect+1))
        printf  "\e[31m[ FAILED ]\e[0m"
        echo " $(basename "${i%.ass}.deca")"
    fi
done


echo
printf  "\e[1;33m--------------- RESULTS : VALIDE DECA TESTS ---------------\e[0m"
echo
echo
echo "PASSED TESTS : $compteurTestCorrect"
echo "FAILED TESTS : $compteurTestIncorrect"
echo "RESULTS : $compteurTestCorrect/$compteurTestTotal"
echo
printf  "\e[1;33m----------------------------- END  ---------------------------\e[0m"
echo
echo



#Compteur pour les tests
compteurTestCorrect=0
compteurTestIncorrect=0
compteurTestTotal=0


OBTAINED_RES_PATH=./src/test/deca/codegen/invalid/obtained_res


#Les Tests InValides
echo
printf  "\e[1;33m--------------- INVALIDES DECA TESTS ---------------\e[0m"
echo
echo


for i in ./src/test/deca/codegen/invalid/*/*/*.deca 
    do

    #numéro de la ligne ou il y'a l'erreur
    #numLigne=$(sed -n -e '/^[[:space:]]*\/\/[[:space:]]*R[eé]sultats[[:space:]]*:/,/Ligne[[:space:]][0-9]*:/s/^[[:space:]]*\/\/[[:space:]]*Ligne[[:space:]]\([0-9]*\):[[:space:]]*.*/\1/p' "$i")
    msgErreur=$(sed -n -e '/^[[:space:]]*\/\/[[:space:]]*R[eé]sultats[[:space:]]*:/,/Ligne[[:space:]][0-9]*:/s/^[[:space:]]*\/\/[[:space:]]*Ligne[[:space:]][0-9]*:[[:space:]]*\(.*\)/\1/p' "$i")

    # Construction du chemin pour le fichier résultant dans obtained_res
    output_path="$OBTAINED_RES_PATH/$(basename "${i%.deca}deca.res")"

    decac "$i" && ima "${i%.deca}.ass" > "$output_path" 2>&1
    if [[ $(cat "$output_path") == *"$msgErreur"* ]]
    then
        compteurTestCorrect=$((compteurTestCorrect+1))
        printf  "\e[32m[ OK ]\e[0m"
        echo " $(basename $i)"
    else
        compteurTestIncorrect=$((compteurTestIncorrect+1))
        printf  "\e[31m[ FAILED ]\e[0m"
        echo " $(basename $i)"
    fi
    compteurTestTotal=$((compteurTestTotal+1))
done

echo
printf  "\e[1;33m--------------- RESULTS : INVALIDE DECA TESTS ---------------\e[0m"
echo
echo
echo "PASSED TESTS : $compteurTestCorrect"
echo "FAILED TESTS : $compteurTestIncorrect"
echo "RESULTS : $compteurTestCorrect/$compteurTestTotal"
echo
printf  "\e[1;33m----------------------------- END  ---------------------------\e[0m"
echo
echo