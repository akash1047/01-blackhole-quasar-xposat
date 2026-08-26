# Project Instructions

This directory stores research files on **black holes**, **quasars**, and **XPoSat** (ISRO X-ray Polarimeter Satellite) data usage. It is a literature + analysis workspace, not an application.

`CLAUDE.md` is a symlink to this file.

## Purpose

- Collect papers, notes, and datasets related to black holes and quasars.
- Document how XPoSat / POLIX / XSPECT products are obtained, reduced, and used.
- Keep analysis scripts, figures, and write-ups next to the notes they support.

## Tech Stack

No application stack yet. Typical tools for this domain (add here when locked in):

- Python scientific stack (NumPy, Astropy, Matplotlib) if analysis is local
- HEASoft / XSPEC / IXPE/XPoSat-specific reduction tools as needed
- Jupyter or scripts under `analysis/`

## Project Structure

Keep this tree in sync with the repo. **When you create, move, rename, or delete a file or directory, update this tree in the same change** (add a one-line comment for new paths; drop vanished ones). Do not list gitignored bulk data (raw FITS, etc.); only the provenance README under `data/`. Skip `.gitkeep` placeholders.

```
.
├── AGENTS.md                 # project instructions (canonical)
├── CLAUDE.md                 # symlink → AGENTS.md
├── README.md                 # human overview; points at the wiki
├── .gitignore                # FITS, .obsidian, and other local/large files
├── analysis/                 # scripts, notebooks, reduction pipelines
├── data/
│   └── README.md             # how data was obtained, versions, citations
├── docs/
│   ├── ONBOARDING.md         # contributor/agent onboarding
│   ├── wiki/
│   │   ├── README.md         # primer index (black holes → quasars)
│   │   ├── black-holes.md    # horizons, accretion, mass scales
│   │   ├── quasars.md        # AGN anatomy, unification, X-ray hook
│   │   └── glossary.md       # one-line terms
│   └── book/
│       └── book.typ          # Typst book build of the wiki; compiled PDF is gitignored
├── figures/
│   └── wiki/                 # teaching art + labeled SVG diagrams
│       ├── black-hole-accretion.jpg
│       ├── quasar-host-jets.jpg
│       ├── agn-engine.jpg
│       ├── schwarzschild-radii.svg
│       ├── agn-anatomy.svg
│       └── agn-unification.svg
├── literature/               # papers, bib, reading notes
└── notes/                    # dated working notes (YYYY-MM-DD-topic.md)
```

## Conventions

- Prefer dated filenames for notes: `YYYY-MM-DD-topic.md`
- Cite data products (mission, obs-id, processing version) in the nearest README
- Do not commit raw FITS, large catalogs, or proprietary data; record the retrieval path instead
- Keep claims next to a source (paper, obs-id, or notebook cell)
- Update the **Project Structure** tree in this file whenever the filesystem changes

## Code Style

- When analysis code appears: snake_case Python, explicit units (Astropy units where practical)
- Scripts should be runnable from repo root or document the cwd
- Notebooks: clear sections (data → reduction → result); export key figures to `figures/`

## Testing / Build

None configured. If analysis code is added, put tests under `analysis/tests/` and document the run command here.

## Git

### Commit messages

Use [Conventional Commits](https://www.conventionalcommits.org/): `type(optional-scope): short summary`.

- Prefer a **short** subject line (imperative, ~50 characters; skip a body unless needed).
- Common types here: `docs`, `feat`, `fix`, `chore`, `data`.
- Examples: `docs(wiki): add black hole primer`, `chore: ignore FITS products`.

If the commit is **heavily AI-generated**, add an attribution trailer at the end (blank line before it). This agent is **Grok 4.6**:

```
docs(wiki): add quasar anatomy page

Generated-by: Grok 4.6
```

Do not add the trailer for light human-led edits with only minor agent help.
