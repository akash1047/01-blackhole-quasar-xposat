# Black hole, quasar & XPoSat research

Workspace for research files on **black holes**, **quasars**, and **XPoSat** data usage (ISRO’s X-ray Polarimeter Satellite: POLIX + XSPECT).

This is a literature, data, and analysis directory — not a software product.

## Layout

```
docs/wiki/    short primer on black holes and quasars
literature/   papers, bib, reading notes
notes/        working notes (prefer YYYY-MM-DD-topic.md)
data/         local products; large files stay off git
analysis/     scripts and notebooks
figures/      plots and wiki illustrations
docs/         longer write-ups
```

## Start here

Concept primer (black holes → accretion → quasars / AGN): **[docs/wiki/](docs/wiki/README.md)**.

## XPoSat (context)

- **Mission**: ISRO X-ray Polarimeter Satellite
- **POLIX**: polarimetry in ~8–30 keV
- **XSPECT**: spectroscopy in ~0.8–15 keV
- Typical science: X-ray polarimetry and spectroscopy of compact objects, including AGN/quasars and stellar-mass black holes, depending on the target list

Record obs-ids, processing versions, and archive URLs in `data/README.md` when data is added.

## Getting started

1. Read the wiki if the AGN picture is not yet solid: `docs/wiki/`.
2. Drop papers and notes into `literature/` and `notes/`.
3. Put retrieval instructions (not giant FITS files) in `data/`.
4. Keep reduction/analysis under `analysis/` and export figures to `figures/`.

See `docs/ONBOARDING.md` and `AGENTS.md` (also linked as `CLAUDE.md`) for agent/contributor conventions.
