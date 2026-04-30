# AUTODOC Info Agent

A local Python/Flask web app that aggregates RSS feeds from the automotive industry, rates them with AI, and generates professional articles for internal use.

---

## What it does

- Pulls news from automotive RSS feeds (configurable sources)
- Scores articles by relevance using AI
- Lets you generate publication-ready articles with images, tables, and data
- Export articles as HTML or Word (.docx)
- Filter by topic, region, or category
- Add your own paid news sources (with login credentials)

---

## Requirements

- **Python 3.9 or higher** — check with: `python3 --version`
- **pip** — usually included with Python
- An **Anthropic API key** — only needed to generate AI articles. The app runs without it (browsing, filtering, and feed refresh all work).

---

## Setup (step by step)

### 1. Clone the repository

Open Terminal and run:

```bash
git clone https://github.com/YOUR_USERNAME/autodoc-info-agent.git
cd autodoc-info-agent
```

### 2. Install dependencies

```bash
pip3 install -r requirements.txt
```

### 3. Create your config file

Copy the example config and edit it:

```bash
cp config.example.json config.json
```

Open `config.json` in any text editor. It looks like this:

```json
{
  "claude_api_key": "",
  "refresh_hour": 7,
  "port": 5050,
  "language": "DE"
}
```

- Leave `claude_api_key` empty if you just want to browse and test the app.
- Add your Anthropic API key if you want to generate AI articles.

### 4. Start the app

**On Mac:**

```bash
python3 app.py
```

Then open your browser and go to: [http://localhost:5050](http://localhost:5050)

**Or double-click** `AUTODOC INFO AGENT.command` (Mac only — you may need to allow it in System Settings → Privacy & Security).

---

## Using without an API key

You can use the app fully without an API key — except for generating articles:

| Feature | Without API key | With API key |
|---|---|---|
| Browse & filter articles | YES | YES |
| Refresh RSS feeds | YES | YES |
| Add / manage sources | YES | YES |
| Export HTML / Word | YES | YES |
| Generate AI articles | NO | YES |

If you try to generate an article without an API key, you will see an error message — this is expected.

---

## Project structure

```
autodoc-info-agent/
├── app.py                  # Main Flask application
├── config.json             # Your local config (not in Git — contains your API key)
├── config.example.json     # Template config (safe to share)
├── sources.json            # List of RSS feed sources
├── templates/
│   └── index.html          # Frontend UI
├── requirements.txt        # Python dependencies
└── README.md               # This file
```

---

## Security note

`config.json` is listed in `.gitignore` and will **never be uploaded to GitHub**. Your API key stays on your local machine only.

---

## Troubleshooting

**App doesn't start:**
- Make sure Python 3.9+ is installed: `python3 --version`
- Make sure dependencies are installed: `pip3 install -r requirements.txt`
- Make sure `config.json` exists (copy from `config.example.json`)

**Port already in use:**
- Change `"port": 5050` to another number (e.g. `5051`) in `config.json`

**Feeds not loading:**
- Check your internet connection
- Click the refresh button in the app

---

## Built with

- [Flask](https://flask.palletsprojects.com/) — Python web framework
- [Anthropic Claude API](https://anthropic.com) — AI article generation
- [feedparser](https://feedparser.readthedocs.io/) — RSS feed parsing
- [python-docx](https://python-docx.readthedocs.io/) — Word export (auto-installed on first use)
