#!/bin/bash

LOGFILE="$HOME/Freeze-hub/autosyncfreeze.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "----- [$DATE] Début du script de sync automatique -----" | tee -a "$LOGFILE"

ping -c 1 github.com > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "[$DATE] ERREUR : Pas de connexion internet. Sync annulée." | tee -a "$LOGFILE"
  exit 1
fi

cd "$HOME/Freeze-hub" || {
  echo "[$DATE] ERREUR : Dossier Freeze-hub non trouvé." | tee -a "$LOGFILE"
  exit 1
}

git add .

git commit -m "Sync auto depuis Kali - $DATE" >> "$LOGFILE" 2>&1

git push origin main >> "$LOGFILE" 2>&1

if [ $? -eq 0 ]; then
  echo "[$DATE] Push réussi ✅" | tee -a "$LOGFILE"
else
  echo "[$DATE] ERREUR : Push échoué ❌" | tee -a "$LOGFILE"
fi

echo "----- [$DATE] Fin du script -----" | tee -a "$LOGFILE"
