#!/bin/bash

ENV_FILE=".env"

echo "Generating .env file..."

# Funktion zum Abfragen eines Werts mit Default
prompt() {
  local var_name="$1"
  local prompt_text="$2"
  local default_value="$3"

  read -p "$prompt_text [$default_value]: " input
  if [ -z "$input" ]; then
    input="$default_value"
  fi
  echo "$var_name=$input" >> "$ENV_FILE"
}

# Datei neu schreiben
> "$ENV_FILE"

echo "#####################################"
echo "### TRAEFIK SSL CONFIGURATION    ###"
echo "#####################################"
prompt "LETSENCRYPT_EMAIL" "Enter email for Let's Encrypt" "admin@example.com"
prompt "DOMAIN_NAME" "Enter your main domain (without www)" "example.com"
prompt "TRAEFIK_DASHBOARD" "Enable Traefik dashboard? (true/false)" "false"

echo
echo "##############################"
echo "### DATABASE CONFIGURATION ###"
echo "##############################"
prompt "DB_NAME" "Database name" "wordpress"
prompt "DB_USER" "Database user" "wpuser"
prompt "DB_PASSWORD" "Database password" "wppassword"
prompt "DB_ROOT_PASSWORD" "Database root password" "rootpass"

echo
echo "#########################"
echo "### VOLUME DEFINITION ###"
echo "#########################"
prompt "VOLUME_BASE_PATH" "Base path for volumes" "/docker/volumes"
prompt "WORDPRESS_CONTENT_PATH" "WordPress content path" "wordpress/wp-content"
prompt "DB_DATA_PATH" "MariaDB data path" "database/db-data"

echo
echo ".env file created successfully."
