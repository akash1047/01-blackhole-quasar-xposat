# Project Instructions

This directory stores research files on **black holes**, **quasars**, and **XPoSat** (ISRO X-ray Polarimeter Satellite) data usage. It is a literature + analysis workspace, not an application.

`CLAUDE.md` is a symlink to this file.

## Purpose

- Collect papers, notes, and datasets related to black holes and quasars.
- Document how XPoSat / POLIX / XSPECT products are obtained, reduced, and used.
- Keep analysis scripts, figures, and write-ups next to the notes they support.

## Tech Stack

- **Python**: [uv](https://docs.astral.sh/uv/) project (`pyproject.toml`, name `xposat`). Bare init — add deps with `uv add`.
- Analysis scripts under `analysis/` (NumPy, Astropy, Matplotlib when added)
- HEASoft / XSPEC / POLIX L2 pipeline as needed

## Project Structure

Keep this tree in sync with the repo. **When you create, move, rename, or delete a file or directory, update this tree in the same change** (add a one-line comment for new paths; drop vanished ones). Do not list gitignored bulk data (raw FITS, etc.); only the provenance README under `data/`. Skip `.gitkeep` placeholders.

```
.
├── AGENTS.md                 # project instructions (canonical)
├── CLAUDE.md                 # symlink → AGENTS.md
├── README.md                 # human overview; points at the wiki
├── pyproject.toml            # uv project (astropy, matplotlib, numpy)
├── uv.lock                   # uv lockfile
├── .gitignore                # FITS, .obsidian, and other local/large files
├── .github/
│   └── workflows/
│       └── release-pdf.yml   # builds docs/book/book.typ and publishes it as a rolling GitHub Release
├── analysis/
│   ├── plot_polix_crab_l2.py # Crab POLIX L2 diagnostic plots and summary
│   ├── results/
│   │   └── crab-polix-l2-summary.csv # reproducible quick-look measurements
│   └── tests/
│       └── test_polix_crab_l2.py # two-fold modulation fit check
├── data/
│   └── README.md             # how data was obtained, versions, citations
├── docs/
│   ├── ONBOARDING.md         # contributor/agent onboarding
│   ├── wiki/
│   │   ├── README.md         # primer index (black holes → quasars → X-rays)
│   │   ├── black-holes.md    # horizons, accretion, mass scales
│   │   ├── quasars.md        # AGN anatomy, unification, X-ray hook
│   │   ├── x-ray-astronomy.md # keV band, corona, reflection, polarimetry
│   │   └── glossary.md       # one-line terms
│   └── book/
│       └── book.typ          # Typst book build of the wiki; compiled PDF is gitignored
├── figures/
│   ├── polix/
│   │   └── crab-l2/          # Crab L2 rate, detector, PHA, and modulation diagnostics
│   └── wiki/                 # teaching art + labeled SVG diagrams
│       ├── black-hole-accretion.jpg
│       ├── quasar-host-jets.jpg
│       ├── agn-engine.jpg
│       ├── schwarzschild-radii.svg
│       ├── agn-anatomy.svg
│       ├── agn-unification.svg
│       ├── x-ray-corona.jpg          # teaching art: disk + corona
│       ├── x-ray-spectrum.svg        # disk / corona / Fe Kα / Compton hump
│       └── x-ray-polarimetry.svg     # two-fold roll-curve cartoon
├── literature/
│   └── POLIX_User_Handbook.pdf  # ISSDC POLIX L2 user guide (v1.0, Oct 2025)
└── notes/
    └── 2026-09-13-crab-polix-l2-quicklook.md # methods, results, and limits
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

Run the lightweight analysis check from the repository root:

```sh
uv run python -m unittest discover -s analysis/tests -v
```

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
