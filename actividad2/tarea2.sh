#!/bin/bash

#Define the GITHUB_USER
GITHUB_USER="Alex4191-usac"

API_URL="https://api.github.com/users/$GITHUB_USER"
USER_DATA=$(curl -s $API_URL)

#echo $USER_DATA

#Get the user data
GITHUB_ID=$(echo $USER_DATA | jq -r '.id')
CREATED_AT=$(echo $USER_DATA | jq -r '.created_at')

echo "Hola $GITHUB_USER. User ID: $GITHUB_ID. Cuenta fue creada el: $CREATED_AT."

#LOGFILE
LOG_DIR="/tmp/$(date +'%Y%m%d')"
LOG_FILE="$LOG_DIR/saludos.log"

mkdir -p $LOG_DIR
echo "Hola $GITHUB_USER. User ID: $GITHUB_ID. Cuenta fue creada el: $CREATED_AT." >> $LOG_FILE


CRON_ENTRY="*/5 * * * * /home/alex4191/Documents/SOPES/tarea2.sh"
(crontab -l ; echo "$CRON_ENTRY") | crontab -

echo "Script configurado y listo para ejecutarse cada 5 minutos mediante cronjob."