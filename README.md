# 🚀 WordPress + Traefik Docker Setup 🦆

This project provides a production-ready, Dockerized [WordPress](https://github.com/WordPress/WordPress) environment with automatic SSL via [Traefik](https://traefik.io/) and a guided `.env` configuration.

With this setup it is possible to create a simple and production-ready setup for wordpress and make your website available on the internet via your own domain.

### Available documentation: 

| Language | Link               |
|----------|--------------------|
| English  | [README.md](/README.md) |
| German  | [README.de.md](./docs-lang/README.de.md) |
| Spanish | [README.es.md](./docs-lang/README.es.md) |
| French | [README.fr.md](./docs-lang/README.fr.md) |

## 🚀 Getting Started

### 1. Clone this repository

```bash
git clone https://github.com/Rocket-Quack/wordpress-traefik-docker.git
cd wordpress-traefik-docker
```

### 2. Run the setup script

```bash
./start.sh
```

This script will:

* Copy `.env.example` to `.env` (only if `.env` does not yet exist)
* Prompt you interactively to confirm or change values (e.g., domain, passwords, paths)
* Launch all Docker containers detached using the `docker-compose.yml`


### 3.  Initial WordPress Setup

If this is the **first time** starting the WordPress site, you can complete the initial setup (language, site title, admin credentials, etc.) by visiting:

```
https://yourdomain.com/wp-admin/install.php
```

> Replace `yourdomain.com` with the domain you configured in the `.env` file.
> This step is required only once during the initial installation.


### 4. Accessing WordPress

Once started, your WordPress site will be available at:

```
https://yourdomain.com
```
> Make sure your domain’s DNS points to your server. Let's Encrypt requires this for SSL certificate generation.


## Requirements

### Software Requirements
Since the entire setup is based on Docker, Docker is required as the executing software. Further information on how and why Docker works can be found [here](https://www.docker.com/).

- [Docker](https://docs.docker.com/get-docker/)

### Hosting Requirements

To run this setup, you’ll need a server (VPS or cloud instance) with a public IP address and Docker installed. Any type of server that can be reached via an IP is possible. Also you can use popular hosting providers such as:

* [Hetzner](https://www.hetzner.com/cloud)
* [IONOS by 1&1](https://www.ionos.com/servers/vps)
* [AWS EC2](https://aws.amazon.com/ec2/)
* [Google Cloud Compute Engine](https://cloud.google.com/compute)
* [DigitalOcean](https://www.digitalocean.com/products/droplets/)

To enable traefik to issue a certificate, the correct ip of the target server must be entered in the dns settings.


## Used Images
These images are used in this setuip, together with the version and link to the public Docker Hub Registry.

- **WordPress**: Version 6.8.1 - PHP 8.2 - Apache ([Docker Hub](https://hub.docker.com/_/wordpress))
- **MariaDB**: Version 11.4.5 ([[Docker Hub](https://hub.docker.com/_/mariadb)])
- **Traefik**: Version 3.3 ([[Docker Hub](https://hub.docker.com/_/traefik)])

## 🔐 Security Considerations

* Traefik Dashboard is disabled by default (`TRAEFIK_DASHBOARD=false`)
* Database credentials and sensitive paths are managed via the `.env` file
* `.env` is excluded from Git using `.gitignore`


## 🚢 Managing Containers

```bash
docker compose up -d     # Start services in background

docker compose down      # Stop and remove containers

docker compose down -v   # Remove volumes and saved data:
```

## 📄 License

This project is open-sourced under the [MIT License](/LICENSE).


## 💬 Need Help?

If you need assistance setting up or customizing this Docker-based WordPress + Traefik environment, feel free to reach out. I'm available on Fiverr for technical support and custom deployments:

[👉 Get support on Fiverr](https://de.fiverr.com/s/jjLk5pv)

This is of course not mandatory. You can find enough information and help with any problems on the Internet via Google or other search engines.

Just have fun with your own site with the help of Wordpress no matter if blogs or personal or corporate websites