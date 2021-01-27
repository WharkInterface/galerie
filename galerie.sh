#!/bin/bash
#****
# Script : Galerie
# Description : Génération de miniatures à partir de ces derniers et un fichier HTML présentant toutes les images du dossier. 
#
# Date : 20/11/2020
# Version : 1.0
# Auteur : Alexandre PINTRAND (CFPTi)
#****

shopt -s -o nounset # Oblige la déclaration de variables.

#Déclarations des Variables

#Traitements

# Si le dossier "miniatures" n'existe pas, alors on effectue sa création.
if [ ! -e "miniatures" ] 
then
    mkdir miniatures
fi

# Génération du fichier HTML.
echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Miniatures</title>
</head>
<body>' > "miniatures.html"


# Boucle qui converti les fichiers *.{jpg,png,jpeg,gif} en miniature de taille "300x300" pixels (uniquement si l'extension existe dans le dossier). Puis, création d'un lien dans la page HTML pour chaque image pour pouvoir avoir un aperçu sur une page entiüre de l'image.
for I in *.{jpg,png,jpeg,gif,JPG}
do
    if [ -e "$I" ]
    then
        convert -thumbnail "300x300" "$I" miniatures/"$I"
        echo "$I success."
        echo "<a href='"$I"'><img src=\"miniatures/$I\" alt=""></a>" >> "miniatures.html"
    else # Sinon
        echo "Aucun fichier avec l'extension $I n'a été trouvé dans le dossier miniatures." # On indique à l'utilisateur qu'il n'y a pas d'image en précisant les extensions.
    fi
done
echo "</body>
</html>" >> "miniatures.html"

#Suppression des Variables