#!/bin/bash
set -e

# 1. variables
PSP_DIR="/run/media/$USER/disk/PSP/SAVEDATA/"
EMU_DIR="$HOME/Games/PSP/"
LOG_FILE="$HOME/Games/PSP/psp_ass.log"

# 2. PSP detection
if [ ! -d "$PSP_DIR" ]; then
    notify-send "PSP Sync" "PSP not detected. Aborting sync."
    exit 0
fi

echo "$(date): Starting PSP sync..." >> "$LOG_FILE"
notify-send "PSP Sync" "PSP detected. Starting sync."

# 3. sync from PSP >> emulator
cp -ru "$PSP_DIR" "$EMU_DIR/SAVEDATA/"

# 4. sync from emulator >> PSP
cp -ru "$EMU_DIR/SAVEDATA/" "$PSP_DIR"

# 5. notification and exit
notify-send "PSP Sync" "PSP save sync complete."
[ -f "$LOG_FILE" ] || touch "$LOG_FILE"
echo "$(date): PSP sync completed." >> "$LOGFILE"
