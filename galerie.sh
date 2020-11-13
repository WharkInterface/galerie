#!/bin/bash
#****
# Script : Galerie
# Description : Génération de miniatures à partir de ces derniers et un fichier HTML présentant toutes les images du dossier. 
#
# Date : 13/11/2020
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

# On fait une boucle qui converti toutes les images qui sont au format (jpg, png) depuis le dossier courant jusqu'au dossier de destination, miniatures en l'occurance, puis on affiche le nom de l'image avec comme message "success" qui indique que la conversion s'est effecuté sans problèmes.

for I in *.{jpg,png}
do
convert -thumbnail "300x300" $I miniatures/$I
echo $I success
done

# Génération du fichier HTML.

echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Miniatures</title>
</head>
<body>' > "miniatures.html"

# On fait une boucle qui affiche toutes les miniatures au format (jpg, png) depuis le dossier "miniatures".

for I in *.{jpg,png}
do
echo "<a href="$I"><img src=\"miniatures/$I\"></a>" >> "miniatures.html"
done
echo "</body>
</html>" >> "miniatures.html"

#Suppression des Variables