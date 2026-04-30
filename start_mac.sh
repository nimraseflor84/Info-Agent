#!/bin/bash
echo "============================================"
echo "  AUTODOC Info Agent wird gestartet..."
echo "============================================"
echo ""

# Ins Skript-Verzeichnis wechseln
cd "$(dirname "$0")"

# Python prüfen
if ! command -v python3 &> /dev/null; then
    echo "FEHLER: Python3 ist nicht installiert."
    echo "Bitte Python von https://www.python.org herunterladen."
    read -p "Enter zum Beenden..."
    exit 1
fi

# Abhängigkeiten installieren falls nötig
if [ ! -f ".deps_installed" ]; then
    echo "Pakete werden installiert (einmalig)..."
    pip3 install -r requirements.txt
    touch .deps_installed
    echo "Installation abgeschlossen."
    echo ""
fi

# Eigene Domain einrichten (einmalig) — braucht sudo-Passwort einmalig
if ! grep -q "autodoc-info-agent" /etc/hosts 2>/dev/null; then
    echo ""
    echo "Einmalige Einrichtung: Eigene URL wird konfiguriert..."
    echo "→ WuDa-9821 (wird nur für /etc/hosts benötigt):"
    echo "127.0.0.1    autodoc-info-agent" | sudo tee -a /etc/hosts > /dev/null
    if [ $? -eq 0 ]; then
        echo "✓ Eigene URL eingerichtet: http://autodoc-info-agent:5050"
    else
        echo "! Keine Berechtigung — App läuft auf http://localhost:5050"
    fi
    echo ""
fi

echo "App läuft auf: http://autodoc-info-agent:5050"
echo "Browser öffnet sich automatisch..."
echo "Terminal offen lassen. Zum Beenden: Strg+C"
echo ""
python3 app.py

