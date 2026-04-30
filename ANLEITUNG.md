# AUTODOC Info Agent — Anleitung

## Voraussetzungen

- Python 3.10 oder neuer → https://www.python.org/downloads/
- Claude API-Key → https://console.anthropic.com (für KI-Bewertung & Artikel-Erstellung)

---

## Einrichtung (einmalig)

### 1. API-Key eintragen
Öffne `config.json` und ersetze `DEIN_API_KEY_HIER` mit deinem Claude API-Key:
```json
"claude_api_key": "sk-ant-..."
```

### 2. Programm starten

**Windows:** Doppelklick auf `start_windows.bat`

**Mac:** Terminal öffnen, in den Ordner navigieren, dann:
```bash
chmod +x start_mac.sh
./start_mac.sh
```

Der Browser öffnet sich automatisch auf `http://localhost:5050`.

---

## Nutzung

- **Aktualisieren** (oben rechts): Holt sofort neue Artikel aus allen Quellen
- **Kategorien** (links): Filter nach Gesetzgebung, Marktdaten, Branchennews etc.
- **Relevanz-Balken**: 10 Striche = höchste AUTODOC-Relevanz
- **★ Stern**: Artikel als Favorit markieren
- **Artikel erstellen (EN)**: KI erstellt aus den Top-Artikeln einen englischen Fachartikel

### Tägliche Routine
Das Programm holt täglich um **07:00 Uhr** automatisch neue Artikel — solange es läuft.

---

## Quellen erweitern

Öffne `sources.json` und füge weitere RSS-Feeds hinzu:
```json
{
  "name": "Quelle XY",
  "url": "https://example.com/feed.xml",
  "category": "Branchennews",
  "relevance": 7
}
```

Kategorien: `Gesetzgebung`, `Technische Daten`, `Marktdaten`, `Branchennews`, `Wirtschaft`

---

## Weitergabe an andere

1. Den gesamten Ordner `autodoc-info-agent/` kopieren oder als ZIP weiterschicken
2. Empfänger braucht Python installiert
3. API-Key in `config.json` eintragen (eigener Key des Empfängers)
4. Starten per `start_windows.bat` oder `start_mac.sh`

---

## Problemlösung

**Browser öffnet sich nicht:** Manuell `http://localhost:5050` im Browser öffnen.

**"Port bereits belegt":** In `config.json` den Port ändern (z.B. auf `5051`), dann auch in `app.py` anpassen.

**Keine Artikel:** Auf "Aktualisieren" klicken. Manche Feeds brauchen 10-20 Sekunden.
