#!/bin/bash

SOURCE="$1"
DEST="$2"
COMPRESS="$3"
FILE="/home/aditya/Desktop/Project/backup.log"

if [ -z "$SOURCE" ] || [ -z "$DEST" ]; then
	echo "Please enter directory" 
	exit 1
fi

if [ ! -d "$SOURCE" ]; then
	echo "SOURCE LOCATION DOES NOT EXIST"
	exit 1
fi

mkdir -p "$DEST" 
BACKUP="backup_$(date +%F_%T)"

if [ "$COMPRESS" == "compress" ]; then
	tar -czf "$DEST/$BACKUP.tar.gz" -C "$SOURCE" .
	STATUS=$?

else
	cp -r "$SOURCE" "$DEST/$BACKUP"
	STATUS=$?

fi

if [ $STATUS -eq 0 ]; then
	echo "$(date): Backup successful " | tee -a backup.log
	find $FILE -type f -mtime +7 -exec rm -f {} \;
else
	echo "$(date): ERROR - BACKUP FAILED" | tee -a backup.log
fi

