#!/bin/bash

# Charger les variables secrètes
source ~/.secrets

# Se placer dans le dossier du projet
cd ~/Freeze-hub

# Ajouter les fichiers
git add .

# Créer un commit avec date/heure
git commit -m "Sync auto depuis Kali - $(date)"

# Config GitHub avec token
git remote set-url origin https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${GITHUB_USER}/Freeze-hub.git

# Pousser vers GitHub
git push origin main
