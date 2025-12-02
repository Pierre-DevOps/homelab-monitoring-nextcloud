#!/bin/bash

# Variables
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/root/backups"

# Création du dossier
mkdir -p $BACKUP_DIR

# Sauvegarde Prometheus
cp /etc/prometheus/prometheus.yml $BACKUP_DIR/prometheus_$DATE.yml

# Sauvegarde Nginx
tar -czf $BACKUP_DIR/nginx_$DATE.tar.gz /etc/nginx/sites-enabled/

# Sauvegarde Grafana
tar -czf $BACKUP_DIR/grafana_$DATE.tar.gz /etc/grafana/ /var/lib/grafana/

# Nettoyage des backups de plus de 7 jours
find $BACKUP_DIR -type f -mtime +7 -delete

echo "Backup terminé : $DATE"