Yann Beaudouin

# Listage régulier des vulnérabilités CVE sur Linux

## Introduction

Les 2 scripts permettent d'avoir une liste de tous les CVE présents sur l'OS installé ainsi que leur nombre. Le script rech.sh cherche les CVE et le script prog.sh lui programme cette recherche de manière à ce qu'elle se fasse régulièrement.

## Script rech.sh

Ce script permet de renseigner les failles présentes sur notre OS via les CVE et leur nombre dans un fichier log daté au moment de l'exécution du script.

```
debsecan $(lsb_release --codename --short) | wc -l
```

Cette ligne de code permet d'avoir le nombre de faille, en effet le paramètre --short permet d'afficher seulement le "titre" du CVE. En utilisant la commande wc -l qui compte le nombre de ligne du résultat de la commande avant le "|" on a le nombre de CVE.

```
debsecan $(lsb_release --codename --short) --format detail
```

Cette ligne quand à elle permet d'avoir tous les CVE avec une explication de la faille grâce au paramètre --format detail.

```
echo -e "NOMBRE DE CVE : $nb_cve \n \n $liste_cve" > ./CVE_$(date +"%d-%m-%Y_%H:%M:%S").log
```

Cette ligne permet de reseigner le nombre de CVE ansi que leur détail dans un fichier log daté au jour et à la seconde près.

## Script prog.sh

Ce script permet de lancer automatiquement le script rech.sh tous les jours à 2h30 du matin grâce à la commande crontab.

```
(crontab -l 2>/dev/null; echo "30 2 * * * ./rech.sh") | crontab -
```

Cette ligne avec une syntaxe un peu particulière permet d'ajouter dans le fichier contab notre programmation horaire. Cette syntaxe est obligatoire car le nom du fichier crontab possède un identifiant qui peux changer, on ne peux donc pas renseigner le nom du fichier dans le script.

## Utilisation des scripts :
- rech.sh :

```
./rech.sh
```

Apparition du fichier log dans le dossier courant

- prog.sh : 

```
./prog.sh
```

Apparition du notre programmation horaire dans le fichier crontab faire cette commande pour voir le fichier : 

```
crontab -e
```