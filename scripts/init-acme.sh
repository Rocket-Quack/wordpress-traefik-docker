#!/bin/sh
set -e

# Go to the directory where the script resides
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="${SCRIPT_DIR%/scripts}"  # falls das Skript in ./scripts liegt

# Load .env from project root
ENV_FILE="${PROJECT_ROOT}/.env"
if [ -f "$ENV_FILE" ]; then
  echo "Loading .env from $ENV_FILE"
  set -a
  . "$ENV_FILE"
  set +a
else
  echo ".env file not found at $ENV_FILE"
  exit 1
fi


# === Build full path ===
ACME_DIR="${VOLUME_BASE_PATH}/${TRAEFIK_LETSENCRYPT_PATH}"
ACME_FILE="${ACME_DIR}/acme.json"

# === Create directory if needed ===
[ -d "$ACME_DIR" ] || mkdir -p "$ACME_DIR"

# === Create file if missing ===
if [ ! -f "$ACME_FILE" ]; then
  echo "Creating $ACME_FILE..."
  touch "$ACME_FILE"
  chmod 600 "$ACME_FILE"
  echo "acme.json created with permission 600."
else
  echo "$ACME_FILE already exists."
fi
