#!/bin/sh
set -e

echo "Starting Rocket-Quack Wortdpress Treafik setup..."

TEMPLATE=".env.example"
TARGET=".env"
SETUP_ENV="./scripts/setup-env.sh"

# First the .env.example is copied
if [ ! -f "$TARGET" ]; then
  echo "📄 Copying $TEMPLATE to $TARGET"
  cp "$TEMPLATE" "$TARGET"
else
  echo "$TARGET already exists – keeping it."
fi

# Creating .env with input values from console
if [ -x "$SETUP_ENV" ]; then
  echo "Running interactive setup..."
  "$SETUP_ENV"
else
  echo "Error: $SETUP_ENV not found or not executable."
  exit 1
fi

echo "Environment setup complete"
echo "Preparing the engines to start docker"

# Start docker stack
echo "Docker liftoff..."
docker compose up -d
