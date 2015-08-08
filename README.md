## Intégrer Squirrelmail à votre bureau Linux

Le petit script suivant vous permet d'intégrer Squirrelmail ou Roundcube dans Firefox, XFCE, et cætera.

### Installation

 * Installez le script :
  * Copiez le script dans un éditeur de texte (sans les numéros de ligne).
  * Remplacez la valeur de la variable `SQUIRRELMAIL` ou `ROUNDCUBE` par l'adresse de votre serveur (sans barre oblique finale pour Squirrelmail). **Attention !** Vérifiez que vous avez bien conservé les guillemets doubles autour de l'adresse.
  * Sauvegardez ce script sur votre machine. Vous pouvez par exemple le placer dans un répertoire `~/bin` de votre répertoire personnel ou dans `/usr/local/bin` si vous êtes administrateur de votre machine et que vous souhaitez qu'il soit accessible à plusieurs utilisateurs.
  * Ouvrez un terminal.
  * Ajoutez les droits d'exécution pour l'utilisateur :
```
$ chmod u+x squirrelmail.sh
```
  * Vérifiez que le script fonctionne :
```
$ ./squirrelmail.sh mailto:test@example.org
```
  Squirrelmail (ou Roundcube) doit s'ouvrir sur une fenêtre de rédaction de message et l'adresse du destinataire doit être `test@example.org`.

#### Paramétrage de firefox

 * Allez dans les préférences de Firefox (Éditer > Préférences).
 * Cliquez sur l'onglet Applications.
 * Dans la barre de recherche, indiquez « mailto ».
 * À droite, sélectionnez l'action « Use other... ».
 * Sélectionnez le script que vous avez sauvegardé.
 * Validez :-)

#### Paramétrage de XFCE 4.x

 * Ouvrez le gestionnaire de paramètres XFCE
 * Lancez « Applications favorites ».
 * Allez dans l'onglet « Internet ».
 * Cliquez sur le menu sous « Client de messagerie ».
 * Sélectionnez « Autre... ».
 * Sélectionnez le script. Cela devrait vous donner une ligne du type :
```
/home/mon_compte/bin/squirrelmail.sh "%s"
```
 * Validez.
