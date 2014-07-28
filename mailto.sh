#!/bin/bash

# Ce script permet à Firefox d'utiliser Squirrelmail pour les URL mailto.
# This script will enable the use of Squirrelmail for mailto URLs in Firefox.

# Indiquez ici l'adresse de votre serveur Squirrelmail (sans barre oblique
# finale).
# Replace the following URL by your Squirrelmail server address (without a
# trailing slash).

SQUIRRELMAIL="http://courrier.example.org/squirrelmail"
NAVIGATEUR="/usr/bin/firefox"

if [ -z "$1" ] ; then

    "${NAVIGATEUR}" "${SQUIRRELMAIL}/src/webmail.php" &

else

    "${NAVIGATEUR}" "${SQUIRRELMAIL}/src/mailto.php?emailaddress=$1" &

fi

exit 0

