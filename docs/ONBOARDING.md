# Onboarding Guide: Black hole, quasar & XPoSat

## Overview

Empty research workspace for files on black holes, quasars, and XPoSat data usage. No application code, tests, or CI at init.

## Tech Stack

| Layer | Technology | Version |
|-------|-----------|---------|
| Content | Markdown notes, papers, FITS/data products | — |
| Analysis (planned) | Python / Astropy / HEASoft as needed | unset |

## Architecture

Linear research flow, not a request/response app:

```
literature + archive catalogs
        ↓
   notes / questions
        ↓
   data retrieval (ISRO / HEASARC / papers)
        ↓
   analysis (reduction → plots)
        ↓
   figures + write-ups
```

## Key Entry Points

- **Human overview**: `README.md`
- **Agent instructions**: `AGENTS.md` (`CLAUDE.md` is a symlink)
- **Data provenance**: `data/README.md`
- **Working notes**: `notes/`
- **Concept wiki**: `docs/wiki/` (black holes → quasars → X-rays)

## Directory Map

| Path | Purpose |
|------|---------|
| `literature/` | Papers and reading notes |
| `notes/` | Dated working notes |
| `data/` | Local data; gitignored binaries |
| `analysis/` | Scripts and notebooks |
| `figures/` | Plots |
| `docs/` | Onboarding and longer docs |

## Request Lifecycle

Not applicable (no server). A typical analysis path:

1. Identify target / obs-id from literature or XPoSat catalogs
2. Record retrieval in `data/README.md`
3. Reduce in `analysis/`
4. Save figures under `figures/`
5. Summarize in `notes/`

## Conventions

- Dated notes: `YYYY-MM-DD-topic.md`
- Do not commit large/raw data
- Cite mission, obs-id, and processing version next to results
- Git conventions: not yet established (no history)

## Common Tasks

- Add a paper: `literature/`
- Add a working note: `notes/YYYY-MM-DD-topic.md`
- Record a dataset: `data/README.md` + files locally
- Add analysis: `analysis/`

## Where to Look

| I want to... | Look at... |
|--------------|-----------|
| Understand the repo | `README.md` |
| Agent rules | `AGENTS.md` (`CLAUDE.md` symlink) |
| Add reading notes | `literature/`, `notes/` |
| Track data origin | `data/README.md` |
| Write analysis | `analysis/` |
