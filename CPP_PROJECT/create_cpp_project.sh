#!/bin/bash

#-------------------------------------------------------------------------#
#      __  ____  ____       ____  ____   ___   ____    ___    __ ______   #
#     /  ]|    \|    \     |    \|    \ /   \ |    |  /  _]  /  ]      |  #
#    /  / |  o  )  o  )    |  o  )  D  )     ||__  | /  [_  /  /|      |  #
#   /  /  |   _/|   _/     |   _/|    /|  O  |__|  ||    _]/  / |_|  |_|  #
#  /   \_ |  |  |  |       |  |  |    \|     /  |  ||   [_/   \_  |  |    #
#  \     ||  |  |  |       |  |  |  .  \     \  `  ||     \     | |  |    #
#   \____||__|  |__|       |__|  |__|\_|\___/ \____||_____|\____| |__|    #
#							                  #
#           Info : Use this bash script to generate a CPP	          #
#	           project with a functional Makefile.		          #
#							                  #
#-------------------------------------------------------------------------#

if [ "$1" == "-p" ] &&  [ ! -z $2 ] &&  [ -d $2 ]
then
       	echo "[i] Chemin : $2"

	read -p "Entrer le nom du projet : " project

	if [ ! -z $project ]
	then
		DIR=$2
		END=${#DIR}-1

		if [ "${DIR:END}" != "/" ]; then
  			echo "[i] last character is ${DIR:END} adding slash."
  			DIR=$2"/"
		else
			echo "[v] valid path."
		fi
		echo $DIR
		mkdir $DIR$project
		mkdir $DIR$project"/apps/"
		mkdir $DIR$project"/apps/your_app/"
		mkdir $DIR$project"/tests/"
		mkdir $DIR$project"/src/"
		cp ./util/Main_Template.cpp $DIR$project"/src/main.cpp"
		cp ./util/Main_Template.cpp $DIR$project"/tests/main_test.cpp"
		cp ./util/Makefile_Template $DIR$project"/Makefile"
		ls $DIR$project"/"
	else
		echo "[x] Erreur dans le nom du projet."
	fi
else
       	echo "[x] Erreur dans le chemin."
	echo "[i] Commande : -p <path>"
fi
