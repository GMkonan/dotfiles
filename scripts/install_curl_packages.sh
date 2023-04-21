#!/bin/bash

echo "Installing LTS NodeJS via nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm use --lts

echo "Installing CLI's..."
# Fly.io
curl -L https://fly.io/install.sh | sh
# Airplane
curl -L https://github.com/airplanedev/cli/releases/latest/download/install.sh | sh