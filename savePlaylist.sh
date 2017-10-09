#!/bin/bash

makePlaylist(){
 echo $1 



 	if [ -z "$1" ] ;then
		echo "no play list supplied"
		echo "		Example: savePlaylist.sh <url to playlist>"
	else
		mkdir $2
		cd $2
		youtube-dl --extract-audio --audio-format mp3 $1
	fi

	git status

	read -p "Push to repo? (y/n) " RESP
	if [ "$RESP" = "y" ]; then
	  echo "pushing"
	  cd ..
	  git add .
	  git commit -m "adding playlist folder"
	  git push origin gh-pages
	else
	  echo "ok"
	fi


}

makePlaylist $1 $2