#!/usr/bin/env bash
set -euo pipefail

echo "Updaterar paketlistan..."
sudo apt-get update

echo "Installerar nödvändiga paket..."
sudo apt-get install -y ca-certificates curl

echo "Skapar katalog för nycklar..."
sudo install -m 0755 -d /etc/apt/keyrings

echo "Hämtar Docker GPG-nyckel..."
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "Lägger till Docker-repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Uppdaterar paketlistan igen..."
sudo apt-get update

echo "Klart! Docker repository är nu tillagt."
