# AUTODOC Info Agent

> **Automotive industry news aggregator with AI-powered article generation**
> **Automobil-Nachrichtenagregator mit KI-gestützter Artikelgenerierung**

---

## 🇬🇧 English

### What it does

The AUTODOC Info Agent is a local web app that monitors automotive industry news, scores articles by relevance using AI, and generates professional editorial articles for internal use — including images, data tables, and export to HTML or Word.

**Key features:**
- Aggregates news from dozens of automotive RSS feeds
- Rates articles by topic relevance automatically
- Generates publication-ready articles with AI (Anthropic Claude)
- Exports articles as HTML or Word (.docx) with images
- Filter by topic, region (Germany, Austria, etc.), or category
- Add your own paid news sources (with login credentials stored locally)
- Tracks trends and industry topics over time

### Requirements

- Python 3.9 or higher
- pip (included with Python)
- An Anthropic API key — only needed to generate articles. **The app runs without it** (browsing, filtering, and feed refresh all work).

### Setup

**1. Clone the repository:**
```bash
git clone https://github.com/nimraseflor84/Info-Agent.git
cd Info-Agent
```

**2. Install dependencies:**
```bash
pip3 install -r requirements.txt
```

**3. Create your config file:**
```bash
cp config.example.json config.json
```

Open `config.json` and optionally add your Anthropic API key:
```json
{
  "claude_api_key": "YOUR_API_KEY_HERE",
  "refresh_hour": 7,
  "port": 5050,
  "language": "DE"
}
```
Leave `claude_api_key` empty (`""`) if you just want to browse and test.

**4. Start the app:**
```bash
python3 app.py
```

Then open your browser at: **http://localhost:5050**

### What works without an API key

| Feature | Without key | With key |
|---|:---:|:---:|
| Browse and filter articles | ✅ | ✅ |
| Refresh RSS feeds | ✅ | ✅ |
| Add and manage news sources | ✅ | ✅ |
| Export as HTML or Word | ✅ | ✅ |
| Generate AI articles | ❌ | ✅ |

### Security

`config.json` is listed in `.gitignore` and is **never uploaded to GitHub**. Your API key stays on your local machine only.

---

## 🇩🇪 Deutsch

### Was die App macht

Der AUTODOC Info Agent ist eine lokale Web-App, die Nachrichten aus der Automobilbranche überwacht, Artikel per KI nach Relevanz bewertet und professionelle Redaktionsartikel für den internen Gebrauch generiert — inklusive Bildern, Datentabellen und Export als HTML oder Word.

**Funktionen:**
- Aggregiert Nachrichten aus dutzenden Automobil-RSS-Feeds
- Bewertet Artikel automatisch nach Themennähe
- Generiert publikationsreife Artikel mit KI (Anthropic Claude)
- Exportiert Artikel als HTML oder Word (.docx) mit Bildern
- Filtert nach Thema, Region (Deutschland, Österreich usw.) oder Kategorie
- Eigene kostenpflichtige Quellen hinzufügen (Zugangsdaten werden lokal gespeichert)
- Verfolgt Trends und Branchenthemen über Zeit

### Voraussetzungen

- Python 3.9 oder höher
- pip (mit Python mitgeliefert)
- Anthropic API-Key — wird nur für die Artikelgenerierung benötigt. **Die App läuft auch ohne** (Browsen, Filtern und Feed-Aktualisierung funktionieren immer).

### Installation

**1. Repository klonen:**
```bash
git clone https://github.com/nimraseflor84/Info-Agent.git
cd Info-Agent
```

**2. Abhängigkeiten installieren:**
```bash
pip3 install -r requirements.txt
```

**3. Konfigurationsdatei erstellen:**
```bash
cp config.example.json config.json
```

`config.json` öffnen und optional den Anthropic API-Key eintragen:
```json
{
  "claude_api_key": "DEIN_API_KEY_HIER",
  "refresh_hour": 7,
  "port": 5050,
  "language": "DE"
}
```
`claude_api_key` leer lassen (`""`), wenn du nur testen möchtest.

**4. App starten:**
```bash
python3 app.py
```

Dann im Browser öffnen: **http://localhost:5050**

### Was ohne API-Key funktioniert

| Funktion | Ohne Key | Mit Key |
|---|:---:|:---:|
| Artikel durchsuchen und filtern | ✅ | ✅ |
| RSS-Feeds aktualisieren | ✅ | ✅ |
| Quellen hinzufügen und verwalten | ✅ | ✅ |
| Als HTML oder Word exportieren | ✅ | ✅ |
| KI-Artikel generieren | ❌ | ✅ |

### Sicherheit

`config.json` steht in der `.gitignore` und wird **niemals auf GitHub hochgeladen**. Der API-Key bleibt ausschließlich auf deinem lokalen Rechner.

### Fehlerbehebung

**App startet nicht:**
- Python-Version prüfen: `python3 --version` (muss 3.9+ sein)
- Abhängigkeiten installieren: `pip3 install -r requirements.txt`
- Sicherstellen, dass `config.json` existiert (Kopie von `config.example.json`)

**Port bereits belegt:**
- In `config.json` den Port ändern, z.B. von `5050` auf `5051`

**Feeds laden nicht:**
- Internetverbindung prüfen
- Aktualisieren-Button in der App drücken

---

## Tech Stack

- [Flask](https://flask.palletsprojects.com/) — Python web framework
- [Anthropic Claude API](https://anthropic.com) — AI article generation
- [feedparser](https://feedparser.readthedocs.io/) — RSS feed parsing
- [python-docx](https://python-docx.readthedocs.io/) — Word export (auto-installed on first use)
- SQLite — local article database

---

*Built by Armin Rolfes · AUTODOC SE · Internal tool*
