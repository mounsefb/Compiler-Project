#!/bin/bash

cd "$(dirname "$0")"/../../.. || exit 1

echo "Nettoyage de tous les fichiers .res dans les differents dossiers obtained_res"

for i in ./src/test/deca/*/*/obtained_res/*; do
    rm "$i"
done
