#!/bin/sh
set -e

echo "Starting Rocket-Quack Wortdpress Treafik setup..."

TEMPLATE=".env.example"
TARGET=".env"
SETUP_ENV="./scripts/setup-env.sh"

# First the .env.example is copied
if [ ! -f "$TARGET" ]; then
  echo "Create the .env by copying the example."
  echo "Copying $TEMPLATE to $TARGET..."
  cp "$TEMPLATE" "$TARGET"

  # Creating .env with input values from console
  if [ -x "$SETUP_ENV" ]; then
    echo "Running interactive setup..."
    "$SETUP_ENV"
  else
    echo "Error: $SETUP_ENV not found or not executable."
    exit 1
  fi

else
  echo "$TARGET already exists"
  
  # An existing .env is used or a new one is created if required
  read -p "Do you want to overwrite the existing .env file? (y/yes/n/no): " answer
  if [[ "$answer" == "y" || "$answer" == "Y" || "$answer" == "yes" ]]; then
      echo "Overwriting the existing .env file"
      "$SETUP_ENV"
  else
      echo "Existing .env file is used"
  fi

fi

echo "Environment setup complete"
echo "Preparing the engines to start docker"

# Start docker stack
echo "Docker liftoff..."
docker compose up -d
