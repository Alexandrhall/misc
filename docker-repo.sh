#!/usr/bin/env bash
set -euo pipefail

# Installera nödvändiga paket
sudo apt-get update
sudo apt-get install -y ca-certificates curl

# Skapa katalogen för nycklar om den inte finns
sudo install -m 0755 -d /etc/apt/keyrings

# Hämta Dockers officiella GPG-nyckel
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Lägg till Docker-repot
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
https://download.docker.com/linux/debian \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Uppdatera paketlistan
sudo apt-get update

echo "✅ Docker repository har lagts till."
