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

Concept primer (black holes → accretion → quasars / AGN → X-rays): **[docs/wiki/](docs/wiki/README.md)**.

## Book PDF

`docs/book/book.typ` ports the wiki into a single book-form PDF (title page, TOC, numbered chapters). The compiled PDF is gitignored; rebuild it after editing the wiki with:

```
typst compile --root . docs/book/book.typ docs/book/black-holes-quasars-primer.pdf
```

A prebuilt copy is published automatically on every push to `main` that touches the wiki or book source: **[latest PDF](https://github.com/akash1047/01-blackhole-quasar-xposat/releases/latest/download/black-holes-quasars-primer.pdf)**.

## XPoSat (context)

- **Mission**: ISRO X-ray Polarimeter Satellite
- **POLIX**: polarimetry in ~8–30 keV
- **XSPECT**: spectroscopy in ~0.8–15 keV
- Typical science: X-ray polarimetry and spectroscopy of compact objects, including AGN/quasars and stellar-mass black holes, depending on the target list

Record obs-ids, processing versions, and archive URLs in `data/README.md` when data is added.

The current Crab POLIX L2 quick-look is documented in
[`notes/2026-09-13-crab-polix-l2-quicklook.md`](notes/2026-09-13-crab-polix-l2-quicklook.md).

## Getting started

1. Read the wiki if the AGN picture is not yet solid: `docs/wiki/`.
2. Drop papers and notes into `literature/` and `notes/`.
3. Put retrieval instructions (not giant FITS files) in `data/`.
4. Keep reduction/analysis under `analysis/` and export figures to `figures/`.

See `docs/ONBOARDING.md` and `AGENTS.md` (also linked as `CLAUDE.md`) for agent/contributor conventions.
