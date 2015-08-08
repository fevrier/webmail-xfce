#!/bin/bash -x

# Ce script permet à Firefox d'utiliser Roundcube pour les URL mailto.
# This script will enable the use of Roundcube for mailto URLs in Firefox.

# Indiquez ici l'adresse de votre serveur Roundcube.
# Replace the following URL by your Roundcube server address.

BROWSER="/usr/bin/firefox"
ROUNDCUBE="https://courrier.example.org/roundcube/"

if [ -n "$1" ] ; then

  MAILTO="$( echo "$1" | sed -e "s/^mailto://" )"

  URL="$( echo "${MAILTO}" | gawk -v FS="[?=&]" '

  BEGIN {
    URL = "?_task=mail&_action=compose"
    RS="============"
  }
  {
    # Suppression des espaces
    gsub( /(\r\n| )/, "" )

    # Ajout du destinataire
    if ( $1 ) { VALEUR["to"] = $1 }

    # Lecture des autres en-têtes
    for( I=2 ; I <= NF ; I+= 2 ){
      if ( ( tolower($I)  == "to" ) && ( "to" in VALEUR ) ){
	VALEUR["to] = VALEUR["to] "," $(I+1)
      } else {
        VALEUR[ tolower($I) ] = $(I+1)
      }
    }

    # Création du lien
    if ( "to" in VALEUR ) {
      URL = URL "&_to=" VALEUR["to"]
    }
    if ( "cc" in VALEUR ) {
      URL = URL "&_cc=" VALEUR["cc"]
    }
    if ( "subject" in VALEUR ) {
      URL = URL "&_subject=" VALEUR["subject"]
    }
    if ( "body" in VALEUR ) {
      URL = URL "&_body=" VALEUR["body"]
    }
    print URL
  }' )"

  "${BROWSER}" "${ROUNDCUBE}${URL}"

else

  "${BROWSER}" "${ROUNDCUBE}"

fi

exit 0

