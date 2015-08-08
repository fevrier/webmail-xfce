#!/bin/bash -x

# Ce script permet à Firefox d'utiliser Roundcube pour les URL mailto.
# This script will enable the use of Roundcube for mailto URLs in Firefox.

# Indiquez ici l'adresse de votre serveur Roundcube.
# Replace the following URL by your Roundcube server address.

BROWSER="/usr/bin/firefox"
ROUNDCUBE="https://courrier.example.org/roundcube/"

if [ -n "$1" ] ; then

  URI="$( echo "$1" | sed "/^mailto://" )"

  TO="$(      echo "{URI}" | gawk -v RS="[?=&]" '{ print $1 }'  )"
  SUBJECT="$( echo "{URI}" | gawk -v RS="[?=&]" -v IGNORECASE=1 '{ for( I=2 ; I <= NF ; I+= 2 ){ if ( $I ~ /^subject$/ ) { print $(I+1) } } }'  )"
  BODY="$(    echo "{URI}" | gawk -v RS="[?=&]" -v IGNORECASE=1 '{ for( I=2 ; I <= NF ; I+= 2 ){ if ( $I ~ /^body$/    ) { print $(I+1) } } }'  )"

  "${BROWSER}" "${ROUNDCUBE}?_task=mail&_action=compose&_to=$TO&_subject=$SUBJECT&_message=$BODY"

else

  "${BROWSER}" "${ROUNDCUBE}"

fi

exit 0

