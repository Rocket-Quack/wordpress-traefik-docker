# 🚀 Configuración de WordPress + Traefik con Docker 🦆

Este proyecto proporciona un entorno de [WordPress](https://github.com/WordPress/WordPress) preparado para producción, basado en Docker, con certificados SSL automáticos mediante [Traefik](https://traefik.io/) y una configuración guiada a través del archivo `.env`.

Con esta configuración, puedes crear fácilmente una instalación de WordPress lista para producción y hacer que tu sitio web esté disponible en Internet usando tu propio dominio.

### Documentación disponible:

| Idioma | Enlace                         |
| ------ | ------------------------------ |
| Inglés | [README.md](/README.md)       |
| Alemán | [README.de.md](./README.de.md) |
| Español | [README.de.md](./README.de.md) |
| Francés | [README.fr.md](./README.fr.md) |


## 🚀 Primeros pasos

### 1. Clona este repositorio

```bash
git clone https://github.com/Rocket-Quack/wordpress-traefik-docker.git
cd wordpress-traefik-docker
```

### 2. Ejecuta el script de instalación

```bash
./start.sh
```

Este script:

* Copiará `.env.example` a `.env` (solo si `.env` aún no existe)
* Te pedirá confirmar o modificar valores (dominio, contraseñas, rutas, etc.)
* Lanzará todos los contenedores de Docker en segundo plano usando `docker-compose.yml`

### 3. Configuración inicial de WordPress

Si es la **primera vez** que inicias el sitio, completa la configuración inicial (idioma, título del sitio, credenciales del administrador, etc.) accediendo a:

```
https://tudominio.com/wp-admin/install.php
```

> Reemplaza `tudominio.com` con el dominio que hayas configurado en el archivo `.env`.
> Este paso solo se realiza una vez durante la instalación inicial.

### 4. Acceso a WordPress

Una vez iniciado, tu sitio estará disponible en:

```
https://tudominio.com
```

> Asegúrate de que el DNS de tu dominio apunte a la IP pública de tu servidor. Esto es necesario para que Let's Encrypt pueda emitir el certificado SSL.


## Requisitos

### Requisitos de software

Este entorno se basa completamente en Docker. Puedes aprender más sobre cómo funciona y cómo instalarlo aquí:

* [Visión general de Docker](https://www.docker.com/)
* [Cómo instalar Docker](https://docs.docker.com/get-docker/)

### Requisitos de hosting

Necesitas un servidor (como un VPS o una instancia en la nube) con **una dirección IP pública** y **Docker instalado**. Algunos proveedores recomendados:

* [Hetzner Cloud](https://www.hetzner.com/cloud)
* [IONOS VPS Hosting](https://www.ionos.com/servers/vps)
* [Amazon AWS EC2](https://aws.amazon.com/ec2/)
* [Google Cloud Compute Engine](https://cloud.google.com/compute)
* [DigitalOcean Droplets](https://www.digitalocean.com/products/droplets/)

> Es fundamental que el DNS del dominio esté apuntando a la IP del servidor para que Traefik pueda emitir certificados SSL mediante Let's Encrypt.


## Imágenes Docker utilizadas

Este proyecto utiliza las siguientes imágenes oficiales de Docker:

* **WordPress**: Versión 6.8.1 – PHP 8.2 – Apache ([Docker Hub](https://hub.docker.com/_/wordpress))
* **MariaDB**: Versión 11.4.5 ([Docker Hub](https://hub.docker.com/_/mariadb))
* **Traefik**: Versión 3.3 ([Docker Hub](https://hub.docker.com/_/traefik))


## 🔐 Consideraciones de seguridad

* El panel de control de Traefik está desactivado por defecto (`TRAEFIK_DASHBOARD=false`)
* Las credenciales de la base de datos y rutas sensibles están gestionadas a través del archivo `.env`
* El archivo `.env` está excluido del control de versiones mediante `.gitignore`


## 🚢 Gestión de contenedores

Comandos útiles de Docker para gestionar el entorno:

```bash
docker compose up -d     # Inicia todos los servicios en segundo plano

docker compose down      # Detiene y elimina los contenedores

docker compose down -v   # Elimina también los volúmenes y los datos guardados
```


## 📄 Licencia

Este proyecto está licenciado bajo la [Licencia MIT](/LICENSE).


## 💬 ¿Necesitas ayuda?

Si necesitas ayuda para configurar o personalizar este entorno de WordPress + Traefik basado en Docker, ofrezco soporte técnico y despliegues personalizados en Fiverr:

[👉 Obtener soporte en Fiverr](https://de.fiverr.com/s/jjLk5pv)

> Por supuesto, esto es completamente opcional. También puedes encontrar suficiente información y ayuda gratuita en Internet a través de Google u otros buscadores.

¡Diviértete creando tu sitio web con WordPress — ya sea un blog, una página personal o un sitio corporativo!
