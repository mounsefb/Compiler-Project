#!/bin/bash

# Initialiser les variables par défaut
test_name=""
lex=false
synt=false
context=false
decac=false
ima=false

# Traiter les options
while getopts "lsdcie" opt; do
  case $opt in
    l) lex=true ;;
    s) synt=true ;;
    c) context=true ;;
    d) decac=true ;;
    i) ima=true ;;
    \?) echo "Usage: $0 [-l] [-s] [-d] [-c] [-i] testName"
        exit 1 ;;
  esac
done

# Déplacer l'indice d'option pour accéder aux arguments positionnels
shift $((OPTIND-1))

# Vérifier si le nom du test est fourni
if [ -z "$1" ]; then
  echo "Usage: $0 [-l] [-s] [-d] [-c] [-i] testName"
  exit 1
fi

# Répertoires de tests
syntax_dir="src/test/deca/syntax/valid/created"
context_dir="src/test/deca/context/valid/created"
codegen_dir="src/test/deca/codegen/valid/created"

# Utiliser le nom du test fourni
test_name="$1"
test_file="$test_name.deca"


# Éditer le fichier avec vscode
code "src/test/deca/context/valid/created/$test_file"

# Ajoutez une pause pour attendre que l'utilisateur termine l'édition
read -p "Appuyez sur Entrée lorsque vous avez terminé l'édition dans VSCode"




# Copier le fichier dans le répertoire approprié
if [ "$lex" = true ] || [ "$synt" = true ]; then
  cp "src/test/deca/context/valid/created/$test_file" "$syntax_dir"
  echo "Copie du fichier test dans $syntax_dir"
  test_dir="$syntax_dir"
fi

if [ "$context" = true ]; then
  cp "src/test/deca/context/valid/created/$test_file" "$context_dir"
  echo "Copie du fichier test dans $context_dir"
  test_dir="$context_dir"
fi

if [ "$decac" = true ] || [ "$ima" = true ]; then
  cp "src/test/deca/context/valid/created/$test_file" "$codegen_dir"
  echo "Copie du fichier test dans $codegen_dir"
  test_dir="$codegen_dir"
fi

# Exécuter les commandes en fonction des options
if [ "$lex" = true ]; then
  test_lex_command="src/test/script/launchers/test_lex $test_dir/$test_file"
  echo "Exécution de la commande: $test_lex_command"
  $test_lex_command
fi

if [ "$synt" = true ]; then
  test_synt_command="src/test/script/launchers/test_synt $test_dir/$test_file"
  echo "Exécution de la commande: $test_synt_command"
  $test_synt_command
fi

if [ "$context" = true ]; then
  test_context_command="src/test/script/launchers/test_context $test_dir/$test_file"
  echo "Exécution de la commande: $test_context_command"
  $test_context_command
fi

if [ "$decac" = true ]; then
  decac_command="decac $test_dir/$test_file"
  # Vérifier si le fichier .ass existe et le supprimer le cas échéant
  test_ass_file="${test_file/.deca/.ass}"
  ass_file_path="$test_dir/$test_ass_file"
  if [ -e "$ass_file_path" ]; then
    echo "Suppression du fichier existant: $ass_file_path"
    rm "$ass_file_path"
  fi
  echo "Exécution de la commande: $decac_command"
  $decac_command
fi

if [ "$ima" = true ]; then
  # Remplacer l'extension .deca par .ass pour la commande ima
  test_ass_file="${test_file/.deca/.ass}"
  ima_command="ima $test_dir/$test_ass_file"

  # Vérifier si le fichier .ass existe et le supprimer le cas échéant
  test_ass_file="${test_file/.deca/.ass}"
  ass_file_path="$test_dir/$test_ass_file"
  if [ -e "$ass_file_path" ]; then
    echo "Suppression du fichier existant: $ass_file_path"
    rm "$ass_file_path"
  fi

  decac_command="decac $test_dir/$test_file"
  echo "Exécution de la commande: $decac_command"
  $decac_command
  echo "Exécution de la commande: $ima_command"
  $ima_command
fi
