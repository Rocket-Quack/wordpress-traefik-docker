# 🚀 Configuration WordPress + Traefik avec Docker 🦆

Ce projet fournit un environnement [WordPress](https://github.com/WordPress/WordPress) prêt pour la production, basé sur Docker, avec un certificat SSL automatique via [Traefik](https://traefik.io/) et un fichier `.env` interactif pour la configuration.

Cette configuration permet de mettre en place facilement un site WordPress sécurisé et accessible via votre propre nom de domaine.

### Documentation disponible :

| Langue   | Lien                           |
| -------- | ------------------------------ |
| Anglais  | [README.md](/README.md)       |
| Allemand | [README.de.md](./README.de.md) |
| Español | [README.de.md](./README.de.md) |
| Francés | [README.fr.md](./README.fr.md) |


## 🚀 Démarrage rapide

### 1. Cloner ce dépôt

```bash
git clone https://github.com/Rocket-Quack/wordpress-traefik-docker.git
cd wordpress-traefik-docker
```

### 2. Exécuter le script d'installation

```bash
./start.sh
```

Ce script effectue les actions suivantes :

* Copie de `.env.example` vers `.env` (si le fichier `.env` n'existe pas encore)
* Configuration interactive (domaine, mots de passe, chemins, etc.)
* Lancement de tous les conteneurs Docker en arrière-plan via `docker-compose.yml`

### 3. Configuration initiale de WordPress

Si c’est la **première fois** que vous lancez WordPress, terminez l’installation en visitant :

```
https://votredomaine.com/wp-admin/install.php
```

> Remplacez `votredomaine.com` par le domaine que vous avez défini dans le fichier `.env`.
> Cette étape ne doit être effectuée qu’une seule fois.

### 4. Accéder à WordPress

Une fois lancé, votre site WordPress est disponible à l’adresse suivante :

```
https://votredomaine.com
```

> Assurez-vous que le DNS de votre domaine pointe bien vers l’adresse IP de votre serveur. Cela est requis pour que Let's Encrypt puisse générer le certificat SSL.


## Prérequis

### Logiciels nécessaires

Ce projet repose entièrement sur Docker. Pour en savoir plus sur son fonctionnement et comment l’installer :

* [Présentation de Docker](https://www.docker.com/)
* [Installer Docker](https://docs.docker.com/get-docker/)

### Hébergement requis

Vous aurez besoin d’un serveur (VPS ou cloud) disposant :

* d'une adresse IP publique
* de Docker installé

Hébergeurs populaires compatibles :

* [Hetzner Cloud](https://www.hetzner.com/cloud)
* [IONOS VPS Hosting](https://www.ionos.com/servers/vps)
* [AWS EC2](https://aws.amazon.com/ec2/)
* [Google Cloud Compute Engine](https://cloud.google.com/compute)
* [DigitalOcean Droplets](https://www.digitalocean.com/products/droplets/)

> Le DNS de votre domaine doit pointer vers l’adresse IP publique du serveur pour que Traefik puisse émettre un certificat SSL via Let's Encrypt.


## 📦 Images Docker utilisées

Ce projet utilise les images officielles suivantes :

* **WordPress** : Version 6.8.1 – PHP 8.2 – Apache ([Docker Hub](https://hub.docker.com/_/wordpress))
* **MariaDB** : Version 11.4.5 ([Docker Hub](https://hub.docker.com/_/mariadb))
* **Traefik** : Version 3.3 ([Docker Hub](https://hub.docker.com/_/traefik))


## 🔐 Considérations de sécurité

* Le tableau de bord Traefik est désactivé par défaut (`TRAEFIK_DASHBOARD=false`)
* Les identifiants de base de données et chemins sensibles sont gérés via le fichier `.env`
* Le fichier `.env` est exclu du dépôt Git via `.gitignore`


## ⚙️ Gestion des conteneurs

Commandes utiles pour gérer les services Docker :

```bash
docker compose up -d     # Lancer les services en arrière-plan

docker compose down      # Arrêter et supprimer les conteneurs

docker compose down -v   # Supprimer aussi les volumes et les données persistées
```


## 📄 Licence

Ce projet est distribué sous la licence [MIT](./LICENSE).


## 💬 Besoin d’aide ?

Si vous avez besoin d’aide pour configurer ou personnaliser cette solution WordPress + Traefik basée sur Docker, je propose une assistance technique et des déploiements personnalisés sur Fiverr :

[👉 Obtenir de l’aide sur Fiverr](https://de.fiverr.com/s/jjLk5pv)

> Bien entendu, c’est entièrement facultatif. Vous trouverez également beaucoup d’informations et de tutoriels gratuits sur Internet via Google ou d’autres moteurs de recherche.

Amusez-vous bien à créer votre site avec WordPress, que ce soit pour un blog, un projet personnel ou un site d’entreprise !

