#!/bin/bash

# Lista de directorios donde buscar
DIRECTORIOS=(
    "app/"
    "resources/"
)

# Lista de archivos donde buscar
ARCHIVOS=(
    "*.php"
    "*.twig"
    "*.html"
)

# Textos a buscar
TEXTOS=(
    "dd("
    "dump("
)

# Iterar sobre los directorios
for DIR in "${DIRECTORIOS[@]}"
do
    # Iterar sobre los archivos
    for PATRON in "${ARCHIVOS[@]}"
    do
        # Iterar sobre los textos
        for TEXTO in "${TEXTOS[@]}"
        do
            # Ejecutar el comando grep y mostrar el resultado
            RESULTADO=$(grep -rnw "$DIR" -e "$TEXTO" --include="$PATRON")
            if [ ! -z "$RESULTADO" ]; then
                echo "Archivos encontrados en $DIR:"
                echo "$RESULTADO"
                echo "--------------------------------------"
            fi
        done
    done
done
