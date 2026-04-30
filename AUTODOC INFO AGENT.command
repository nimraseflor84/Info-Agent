#!/bin/bash
cd "$(dirname "$0")"

echo "============================================"
echo "  AUTODOC Info Agent"
echo "============================================"

# Alten Prozess auf Port 5050 beenden (falls noch läuft)
OLD_PID=$(lsof -ti:5050 2>/dev/null)
if [ -n "$OLD_PID" ]; then
    echo "Stoppe alten Prozess (PID $OLD_PID)..."
    kill -9 $OLD_PID 2>/dev/null
    sleep 1
fi

# Python prüfen
if ! command -v python3 &>/dev/null; then
    echo ""
    echo "FEHLER: Python3 nicht gefunden."
    echo "Bitte von https://www.python.org herunterladen."
    read -p "Enter zum Schließen..."
    exit 1
fi

# Pakete installieren/aktualisieren falls nötig
if [ ! -f ".deps_installed" ]; then
    echo "Installiere Pakete (einmalig, ca. 30–60 Sek.)..."
    pip3 install -r requirements.txt --quiet --upgrade
    if [ $? -eq 0 ]; then
        touch .deps_installed
        echo "✓ Pakete installiert."
    else
        echo "! Fehler bei Installation. Versuche trotzdem zu starten..."
    fi
fi

# /etc/hosts Eintrag (einmalig, braucht Passwort)
if ! grep -q "autodoc-info-agent" /etc/hosts 2>/dev/null; then
    echo ""
    echo "Einmalige URL-Einrichtung (Mac-Passwort wird abgefragt)..."
    echo "127.0.0.1    autodoc-info-agent" | sudo tee -a /etc/hosts >/dev/null 2>&1
fi

echo ""
echo "  Läuft auf: http://localhost:5050"
echo "  Browser öffnet sich automatisch..."
echo "  Zum Beenden: Dieses Fenster schließen"
echo "============================================"
echo ""

python3 app.py
