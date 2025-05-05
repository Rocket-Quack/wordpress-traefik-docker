# 🚀 WordPress + Traefik Docker Setup 🦆

Dieses Projekt bietet eine produktionsreife, Docker-basierte [WordPress](https://github.com/WordPress/WordPress)-Umgebung mit automatischem SSL-Zertifikat durch [Traefik](https://traefik.io/) und einer geführten `.env`-Konfiguration.

Mit diesem Setup kannst du ganz einfach eine produktionsfertige WordPress-Umgebung aufsetzen und deine Website über deine eigene Domain öffentlich zugänglich machen.

### Verfügbare Dokumentation:

| Sprache  | Link                           |
| -------- | ------------------------------ |
| English | [README.md](/README.md)         |
| Deutsch  | [README.de.md](./README.de.md) |
| Spanisch | [README.es.md](./README.es.md) |
| Französisch | [README.fr.md](./README.fr.md) |

## 🚀 Schnellstart

### 1. Repository klonen

```bash
git clone https://github.com/Rocket-Quack/wordpress-traefik-docker.git
cd wordpress-traefik-docker
```

### 2. Setup-Skript ausführen

```bash
./start.sh
```

Dieses Skript wird:

* `.env.example` nach `.env` kopieren (nur, wenn `.env` noch nicht existiert)
* dich interaktiv nach Werten fragen bzw. bestehende Werte bestätigen lassen (z. B. Domain, Passwörter, Pfade)
* alle Docker-Container im Hintergrund mit `docker-compose.yml` starten

### 3. Erstkonfiguration von WordPress

Wenn du WordPress **zum ersten Mal** startest, kannst du die Initialkonfiguration (Sprache, Seitentitel, Admin-Zugangsdaten etc.) unter folgendem Link vornehmen:

```
https://deinedomain.de/wp-admin/install.php
```

> Ersetze `deinedomain.de` mit der Domain, die du in der `.env`-Datei angegeben hast.
> Dieser Schritt ist nur beim allerersten Start erforderlich.

### 4. Zugriff auf WordPress

Sobald alle Dienste laufen, erreichst du deine WordPress-Seite unter:

```
https://deinedomain.de
```

> Achte darauf, dass der DNS-Eintrag deiner Domain auf die IP deines Servers zeigt – das ist notwendig, damit Let's Encrypt ein SSL-Zertifikat ausstellen kann.


## Voraussetzungen

### Software-Voraussetzungen

Da das gesamte Setup auf Docker basiert, ist Docker erforderlich. Mehr Informationen findest du hier:

* [Docker Übersicht](https://www.docker.com/)
* [Docker installieren](https://docs.docker.com/get-docker/)

### Hosting-Voraussetzungen

Du brauchst einen Server (z. B. einen VPS oder Cloud-Instance) mit **öffentlicher IP-Adresse** und installiertem Docker. Mögliche Hosting-Anbieter:

* [Hetzner Cloud](https://www.hetzner.com/cloud)
* [IONOS VPS Hosting](https://www.ionos.com/servers/vps)
* [Amazon AWS EC2](https://aws.amazon.com/ec2/)
* [Google Cloud Compute Engine](https://cloud.google.com/compute)
* [DigitalOcean Droplets](https://www.digitalocean.com/products/droplets/)

> Stelle sicher, dass der DNS deiner Domain auf die öffentliche IP deines Servers zeigt, damit Traefik ein SSL-Zertifikat ausstellen kann.


## Verwendete Docker-Images

Folgende offiziellen Docker-Images werden verwendet:

* **WordPress**: Version 6.8.1 – PHP 8.2 – Apache ([Docker Hub](https://hub.docker.com/_/wordpress))
* **MariaDB**: Version 11.4.5 ([Docker Hub](https://hub.docker.com/_/mariadb))
* **Traefik**: Version 3.3 ([Docker Hub](https://hub.docker.com/_/traefik))


## 🔐 Sicherheitshinweise

* Das Traefik Dashboard ist standardmäßig deaktiviert (`TRAEFIK_DASHBOARD=false`)
* Zugangsdaten und sensible Pfade werden über die `.env`-Datei verwaltet
* Die `.env`-Datei ist per `.gitignore` vom Git-Tracking ausgeschlossen


## 🚢 Container-Verwaltung

Typische Docker-Kommandos zum Steuern der Umgebung:

```bash
docker compose up -d     # Startet alle Dienste im Hintergrund

docker compose down      # Stoppt und entfernt alle Container

docker compose down -v   # Entfernt zusätzlich Volumes und gespeicherte Daten
```


## 📄 Lizenz

Dieses Projekt steht unter der [MIT-Lizenz](/LICENSE).


## 💬 Hilfe benötigt?

Wenn du Hilfe bei der Einrichtung oder Anpassung dieser WordPress+Traefik-Umgebung brauchst, biete ich technischen Support und individuelle Deployments auf Fiverr an:

[👉 Support auf Fiverr erhalten](https://de.fiverr.com/s/jjLk5pv)

> Natürlich ist das komplett freiwillig. Du findest auch reichlich Hilfe und Informationen kostenlos über Google oder andere Suchmaschinen.

Viel Spaß mit deiner eigenen Website – egal ob Blog, persönliche Seite oder Firmenauftritt!
