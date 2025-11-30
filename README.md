\# Homelab – Monitoring \& Nextcloud



\## Mon objectif



Ce projet a pour but de mettre en place un environnement de test complet afin d’expérimenter :

\- La supervision avec Prometheus et Grafana

\- Le déploiement d’un service collaboratif (Nextcloud)

\- La sécurisation par reverse proxy et certificats SSL

\- L’accès depuis un poste client Windows 11



---



\## Infrastructure



\- \*\*srv-monitor (bare metal Linux Debian 12)\*\*  

&nbsp; Héberge Prometheus et Grafana. Nginx est utilisé comme reverse proxy pour exposer les services en HTTPS.



\- \*\*nextcloud (Debian 12 VM)\*\*  

&nbsp; Déploie Nextcloud derrière Nginx, avec le même certificat SSL auto-signé.



\- \*\*Client Windows 11\*\*  

&nbsp; Sert à tester l’accès aux services. Le certificat auto-signé a été importé dans le magasin racine de confiance via MMC pour simuler un poste utilisateur.



---



\## Sécurisation



\- Génération d’un certificat auto-signé avec SAN couvrant `nextcloud.lab.local` et `grafana.lab.local`.

\- Vérification du certificat avec `openssl` côté serveur.

\- Importation dans Windows pour permettre l’accès en HTTPS sans erreur de nom de domaine.



---



\## Reverse Proxy



Nginx est configuré pour rediriger :

\- `https://nextcloud.lab.local` vers le serveur Nextcloud

\- `https://grafana.lab.local` vers Grafana sur srv-monitor



---



\##  Supervision



\- Prometheus collecte les métriques système et services.

\- Grafana affiche des dashboards construits manuellement pour la lisibilité et l’esthétique.

\- L’accès se fait depuis le poste Windows via le domaine interne `grafana.lab.local`.



---



\##  Résultats



\- Accès sécurisé à Nextcloud et Grafana via HTTPS.

\- Supervision fonctionnelle avec Prometheus + Grafana.

\- Nextcloud opérationnel derrière reverse proxy SSL.

\- Documentation minimale conservée pour garder une trace du travail effectué.



---



\##  Conclusion



Ce lab démontre la mise en place d’une infrastructure complète :  

\- Déploiement de services (Nextcloud, Grafana, Prometheus)  

\- Sécurisation par certificats SSL auto-signés  

\- Reverse proxy Nginx  

\- Intégration multi-OS (Linux + Windows)  







