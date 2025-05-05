#!/bin/sh
set -e

# === Check and run init script ===
if [ -x ./scripts/init-acme.sh ]; then
  ./scripts/init-acme.sh
else
  echo "Init script is missing or not executable: ./scripts/init-acme.sh"
  exit 1
fi

# === Start docker stack ===
echo "Starting Docker containers..."
docker compose up -d
