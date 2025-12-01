# Homelab – Monitoring, Nextcloud & OnlyOffice

## Objectif

Ce projet est un homelab personnel composé de trois machines. L'objectif est de mettre en pratique l'administration système Linux, la supervision, et le déploiement de services collaboratifs.

## Infrastructure

Le lab est composé de trois machines :

**srv-monitor** est un serveur Debian 12 connecté en WiFi (192.168.0.29). Il héberge Prometheus pour la collecte de métriques, Grafana pour la visualisation, et Nginx comme reverse proxy SSL.

**srv-nextcloud** est un serveur Debian 12 connecté en Ethernet (192.168.0.50). Il fait tourner Nextcloud avec Apache et MariaDB. Node Exporter est installé pour remonter les métriques vers Prometheus.

**Le poste client** est sous Windows 11 (192.168.0.11). Docker Desktop y est installé pour faire tourner OnlyOffice Document Server.

## Supervision

Prometheus collecte les métriques des deux serveurs Linux via Node Exporter. Les données sont visualisées dans Grafana avec le dashboard Node Exporter Full.

## Reverse Proxy

Nginx sur srv-monitor fait office de reverse proxy. Il expose les services en HTTPS avec des certificats auto-signés :

- grafana.lab.local redirige vers Grafana
- nextcloud.lab.local redirige vers le serveur Nextcloud
- office.lab.local redirige vers OnlyOffice

Des headers de sécurité sont configurés : HSTS, X-Frame-Options, X-Content-Type-Options, X-XSS-Protection.

## Nextcloud

Nextcloud est installé en bare metal sur srv-nextcloud avec Apache et MariaDB. L'application OnlyOffice est intégrée pour l'édition de documents directement dans l'interface.

## OnlyOffice

OnlyOffice Document Server tourne dans un container Docker sur le poste client. La connexion avec Nextcloud fonctionne en autorisant les IPs privées.

## Certificats SSL

Un certificat auto-signé avec SAN a été généré pour couvrir les trois domaines. Il a été importé dans Windows pour permettre l'accès HTTPS sans erreur.

## Technologies utilisées

- Debian 12
- Prometheus, Grafana, Node Exporter
- Nginx
- Apache, MariaDB
- Nextcloud
- Docker, OnlyOffice
- Certificats SSL auto-signés

## Auteur

Pierre Baroni- Étudiant Bachelor administrateur DevOps
