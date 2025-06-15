#!/bin/bash

# ┌──────────────────────────────────────────────┐
# │       Script de synchronisation GitHub       │
# │      Créé par Freeze pour Kali / Termux       │
# └──────────────────────────────────────────────┘

# ▶️ Configuration du token et du dépôt GitHub
token="${GITHUB_TOKEN}"
USERNAME="yann243"
REPO="Freeze-hub"

# ▶️ Dossier source = où tu mets ton code sur ton phone
SOURCE_DIR="$HOME/CyberFreeze"

# ▶️ Dossier cible = ton dépôt cloné localement
TARGET_DIR="$HOME/Freeze-hub"

# 🔄 On efface l'ancienne copie du dossier
rm -rf "$TARGET_DIR/CyberFreeze"

# 📥 On recopie tout le dossier CyberFreeze dans le dépôt
cp -r "$SOURCE_DIR" "$TARGET_DIR/CyberFreeze"

# 📝 Création automatique d’un README.md simple
README_FILE="$TARGET_DIR/README.md"
echo "# 🔐 Freeze Hub - Synchronisation Kali / Termux" > "$README_FILE"
echo "" >> "$README_FILE"
echo "Ce dépôt contient des scripts et outils synchronisés automatiquement depuis Kali NetHunter / Termux." >> "$README_FILE"
echo "" >> "$README_FILE"
echo "## 📁 Contenu du dossier CyberFreeze" >> "$README_FILE"
echo "" >> "$README_FILE"

for file in "$TARGET_DIR/CyberFreeze"/*; do
    fname=$(basename "$file")
    echo "- $fname" >> "$README_FILE"
done

# 🚀 Préparation du push Git
cd "$TARGET_DIR" || exit
git add .
git commit -m "Ajout du script de synchronisation commenté - $(date)"
git remote set-url origin "https://$TOKEN@github.com/$USERNAME/$REPO.git"
git push origin main
