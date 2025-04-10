# ! /bin/sh

# Auteur : boutaley
# Version initiale : 20/12/2024

cd "$(dirname "$0")"/../../.. || exit 1

PATH=./src/test/script/launchers:"$PATH"
TEST_PATH=./src/test/deca/syntax/valid/:"$TEST_PATH"
OBTAINED_RES_PATH=./src/test/deca/syntax/valid/obtained_res



#Les Tests Valides
echo
echo  "\e[1;33m--------------- VALIDES LEXICALES TESTS ---------------\e[0m"
echo

#Compteur pour les tests
compteurTestCorrect=0
compteurTestIncorrect=0
compteurTestTotal=0

for i in ./src/test/deca/syntax/valid/*/*/*.deca 
    do


    # Extraire le commentaire au début du fichier .deca
    expected_comment=$(awk '/^\/\// {print} /^\/\// && /Résultats :/ {getline; print}' "$i")

    
    # Construction du chemin pour le fichier résultant dans obtained_res
    output_path="$OBTAINED_RES_PATH/$(basename "${i%.deca}lex.res")"

    test_lex "$i" > "$output_path"

    # Extraire la ligne suivante après "// Résultats :"
    results_line=$(echo "$expected_comment" | awk '{IGNORECASE=1} /R[eé]sultats :/ {getline; print tolower($0)}')


    # Vérifier si la ligne suivante à "// Résultats :" contient "ok"
    if echo "$results_line" | grep -qiF "ok"; then
            compteurTestCorrect=$((compteurTestCorrect+1))
            printf  "\e[32m[ OK ]\e[0m"  # Affichage en vert
            echo " $(basename $i)"
    else
            compteurTestIncorrect=$((compteurTestIncorrect+1))
            printf  "\e[31m[ FAILED ]\e[0m"
            echo " $(basename $i)"
    fi
    compteurTestTotal=$((compteurTestTotal+1))
done


echo
echo  "\e[1;33m--------------- RESULTS : VALIDE LEXICAL TESTS ---------------\e[0m"
echo
echo "PASSED TESTS : $compteurTestCorrect"
echo "FAILED TESTS : $compteurTestIncorrect"
echo "RESULTS : $compteurTestCorrect/$compteurTestTotal"
echo
echo  "\e[1;33m----------------------------- END  ---------------------------\e[0m"
echo





#Les Tests Invalides
#echo
#echo  "\e[1;33m--------------- Tests lexicaux invalides ---------------\e[0m"
#echo
#OBTAINED_RES_PATH=./src/test/deca/syntax/invalid/obtained_res
#
#for i in ./src/test/deca/syntax/invalid/*/*/*.deca 
#    do
#
#    echo "$(basename $i)"
#    # test_lex "$i"
#    
#    # Construction du chemin pour le fichier résultant dans obtained_res
#    output_path="$OBTAINED_RES_PATH/$(basename "${i%.deca}lex.res")"
#
#    test_lex "$i" > "$output_path"
#done
#echo
#echo "tests finis"
#echo
