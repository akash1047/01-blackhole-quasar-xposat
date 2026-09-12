# Data

Keep large products (FITS, catalogs, simulations) **out of git**. Record how to fetch them here.

## Inventory

| Dataset | Mission / instrument | Obs-id / version | Location | Citation |
|---------|----------------------|------------------|----------|----------|
| Crab POLIX L2 | XPoSat / POLIX | `P01_0005`, `T24_0001`, `T24_0002`; `L2` `V1P1` (2024 Jan–Feb) | `data/xposat/polix/crab/` (gitignored) | ISSDC PRADAN [x01](https://pradan1.issdc.gov.in/x01); handbook `literature/POLIX_User_Handbook.pdf` (v1.0, Oct 2025) |

## Retrieval notes

- Archive: [PRADAN XPoSat](https://pradan1.issdc.gov.in/x01). Filter `Target Equals Crab`. Download only `*_L2_*.tgz` (not split `*_L1_*_part_*`).
- PRADAN bundle: `polix_2026Aug31T110547060.zip` (31 Aug 2026) → three tarballs:
  - `X01_POL_P01_0005_2024_L2_V1P1.tgz` (20–31 Jan 2024)
  - `X01_POL_T24_0001_2024_L2_V1P1.tgz` (2–4 Feb 2024)
  - `X01_POL_T24_0002_2024_L2_V1P1.tgz` (13–27 Feb 2024)
- Polarimetry product per proposal: `Polix_l2_polarization/X01_PLX_<id>_000000_WeightedRoll_L2.fits`
- Handbook caveat: with this public set, variable background modulation means polarization is **not** yet measurable; POLIX has no ARF/RMF (not for spectroscopy).
- Note calibration files, software versions (HEASoft, POLIX L2 pipeline V1.1), and any proprietary windows.

## Local quick-look

Run `uv run python analysis/plot_polix_crab_l2.py`. It writes diagnostic plots to
`figures/polix/crab-l2/` and measurements to
`analysis/results/crab-polix-l2-summary.csv`; interpretation is in
`notes/2026-09-13-crab-polix-l2-quicklook.md`.
