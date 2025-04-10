#!/bin/bash

# Vérifier si le nom du fichier source est fourni en argument
if [ -z "$1" ]; then
  echo "Usage: $0 filename.deca"
  exit 1
fi

# Utiliser le nom du fichier source fourni
source_file="$1"
asm_file="${source_file%.deca}.ass"

# Compiler le fichier source avec decac
decac "$source_file"

# Vérifier si le fichier assembleur a été généré
if [ -e "$asm_file" ]; then
  # Exécuter le fichier assembleur avec ima
  ima "$asm_file"
else
  echo "Erreur lors de la compilation avec decac"
fi
