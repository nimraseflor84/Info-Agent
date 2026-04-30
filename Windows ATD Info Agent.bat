@echo off
title AUTODOC Info Agent
echo ============================================
echo   AUTODOC Info Agent wird gestartet...
echo ============================================
echo.

:: Python pruefen
python --version >nul 2>&1
if errorlevel 1 (
    echo FEHLER: Python ist nicht installiert.
    echo Bitte Python von https://www.python.org herunterladen.
    pause
    exit /b
)

:: Abhaengigkeiten installieren falls noetig
if not exist ".deps_installed" (
    echo Pakete werden installiert (einmalig)...
    pip install -r requirements.txt
    echo. > .deps_installed
    echo Installation abgeschlossen.
    echo.
)

:: App starten
echo App laeuft auf http://localhost:5050
echo Browser oeffnet sich automatisch...
echo Dieses Fenster offen lassen. Zum Beenden: Strg+C
echo.
python app.py
pause
