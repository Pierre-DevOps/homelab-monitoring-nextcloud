#!/bin/bash

# Variables
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/root/backups"
REMOTE_USER="pierre"
REMOTE_HOST="192.168.0.29"
REMOTE_DIR="/home/pierre/backups/srv-nextcloud"

# Création du dossier local
mkdir -p $BACKUP_DIR

# Dump de la base MariaDB
mysqldump -u root nextcloud > $BACKUP_DIR/nextcloud_db_$DATE.sql

# Sauvegarde de la config Nextcloud
cp /var/www/nextcloud/config/config.php $BACKUP_DIR/config_$DATE.php

# Envoi vers srv-monitor
rsync -rvz --no-perms --no-owner --no-group $BACKUP_DIR/ $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/

# Nettoyage des backups locaux de plus de 7 jours
find $BACKUP_DIR -type f -mtime +7 -delete

echo "Backup terminé : $DATE"