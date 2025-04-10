#!/bin/bash

# Auteur : gl01
# Version initiale : 20/12/2024

cd "$(dirname "$0")"/../../.. || exit 1

PATH=./src/test/script/launchers:"$PATH"
TEST_PATH=./src/test/deca/context/valid/:"$TEST_PATH"
OBTAINED_RES_PATH=./src/test/deca/context/valid/obtained_res



#Les Tests Valides
echo
printf  "\e[1;33m--------------- VALIDES CONTEXTUAL TESTS ---------------\e[0m"
echo
echo


#Compteur pour les tests
compteurTestCorrect=0
compteurTestIncorrect=0
compteurTestTotal=0

for i in ./src/test/deca/context/valid/*/*/*.deca 
    do

    
    # Construction du chemin pour le fichier résultant dans obtained_res
    output_path="$OBTAINED_RES_PATH/$(basename "${i%.deca}cont.res")"

    test_context "$i" > "$output_path"

    if test_context "$i" 2>&1 | \
    (grep -q -e ':[1-9][0-9]*:[0-9][0-9]*:' || grep -q -e 'Erreur' || grep -q -e 'Exception')
    then
        compteurTestIncorrect=$((compteurTestIncorrect+1))
        printf  "\e[31m[ FAILED ]\e[0m"
        echo " $(basename $i)"
    else
        compteurTestCorrect=$((compteurTestCorrect+1))
        printf  "\e[32m[ OK ]\e[0m"
        echo " $(basename $i)"
    fi
    compteurTestTotal=$((compteurTestTotal+1))
done


echo
printf  "\e[1;33m--------------- RESULTS : VALIDE CONTEXTUAL TESTS ---------------\e[0m"
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


OBTAINED_RES_PATH=./src/test/deca/context/invalid/obtained_res


#Les Tests InValides
echo
printf  "\e[1;33m--------------- INVALIDES CONTEXTUAL TESTS ---------------\e[0m"
echo
echo


for i in ./src/test/deca/context/invalid/*/*/*.deca 
    do

    #numéro de la ligne ou il y'a l'erreur
    numLigne=$(sed -n -e '/^[[:space:]]*\/\/[[:space:]]*R[eé]sultats[[:space:]]*:/,/Ligne[[:space:]][0-9]*:/s/^[[:space:]]*\/\/[[:space:]]*Ligne[[:space:]]\([0-9]*\):[[:space:]]*.*/\1/p' "$i")
    msgErreur=$(sed -n -e '/^[[:space:]]*\/\/[[:space:]]*R[eé]sultats[[:space:]]*:/,/Ligne[[:space:]][0-9]*:/s/^[[:space:]]*\/\/[[:space:]]*Ligne[[:space:]][0-9]*:[[:space:]]*\(.*\)/\1/p' "$i")

    
    # Construction du chemin pour le fichier résultant dans obtained_res
    output_path="$OBTAINED_RES_PATH/$(basename "${i%.deca}cont.res")"

    test_context "$i" > "$output_path" 2>&1
    if [[ $(cat "$output_path") == *":$numLigne:"*"$msgErreur"* ]]
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
printf  "\e[1;33m--------------- RESULTS : INVALIDE CONTEXTUAL TESTS ---------------\e[0m"
echo
echo
echo "PASSED TESTS : $compteurTestCorrect"
echo "FAILED TESTS : $compteurTestIncorrect"
echo "RESULTS : $compteurTestCorrect/$compteurTestTotal"
echo
printf  "\e[1;33m----------------------------- END  ---------------------------\e[0m"
echo
echo