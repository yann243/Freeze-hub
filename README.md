# 🔄 `syncfreeze.sh` — Script de synchronisation Git pour Freeze-hub

Ce script shell automatisé permet de gérer facilement les **push GitHub depuis Kali/Termux**, même hors ligne, et garder le projet `Freeze-hub` à jour sans prise de tête.

---

## 🧊 Objectif du script

- Ajouter automatiquement les fichiers modifiés
- Commit avec un message personnalisé (date & heure auto)
- Pusher les changements vers GitHub en une ligne

---

## 📜 Contenu du script

```bash
#!/bin/bash

# syncfreeze.sh
# Script de synchronisation Git personnalisé pour Freeze-hub

DATE=$(date)
git add .
git commit -m "Mise à jour automatique depuis Kali - $DATE"
git push origin main# Freeze-hub
Auto sync termux files to github
