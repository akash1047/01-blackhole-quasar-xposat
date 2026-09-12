# Crab POLIX Level-2 quick-look

Date: 2026-09-13

## Scope

This pass checks the three public Crab `L2 V1P1` products listed in
[`data/README.md`](../data/README.md). It compares observing intervals and detectors,
inspects the PHA distributions, and fits the final weighted-roll curves with

$$R(\phi)=A+B\cos(2\phi)+C\sin(2\phi).$$

The fit is a compact description of two-fold structure, **not** a polarization
degree or angle. The POLIX User Handbook v1.0 (sections 1, 4.3, and 12) says the
released `WeightedRoll` curve mixes source and background modulation and that
variable background prevents a polarization measurement from these data.

## Reproduction

```sh
uv run python analysis/plot_polix_crab_l2.py
uv run python -m unittest discover -s analysis/tests -v
```

Numeric output is in
[`analysis/results/crab-polix-l2-summary.csv`](../analysis/results/crab-polix-l2-summary.csv).
Rates are exposure-weighted means of event-mode light-curve bins with
`FRAC_EXP > 0.5`. Detector rates are all-channel processed-source PHA counts
divided by the header exposure.

## Findings

| Proposal | Source rate | Background rate | Earth-occultation rate | 2φ amplitude / mean | χ² / 357 |
|---|---:|---:|---:|---:|---:|
| `P01_0005` | 174.30 | 171.84 | 169.17 | 1.697 ± 0.031% | 379.3 |
| `T24_0001` | 174.31 | 174.86 | 170.74 | 1.396 ± 0.063% | 290.8 |
| `T24_0002` | 168.72 | 168.85 | 167.12 | 1.201 ± 0.022% | 488.1 |

- Source, background, and Earth-occultation rates are close, while their
  intervals are not simultaneous. A simple subtraction would therefore be
  fragile and is not attempted.
- Detector 4 is consistently lower than detectors 1–3 in the processed source
  products. This is an instrument/product diagnostic, not evidence of source
  variability.
- All three weighted-roll products contain statistically resolved two-fold
  structure. The handbook's background warning means this structure cannot be
  assigned to Crab polarization.
- PHA channels are plotted only as detector channels. No energy conversion or
  spectral fit is attempted without the applicable calibration and response.

## Next valid step

Revisit polarization only when the matching nearby blank-sky observations and
the mission's background-subtraction method are released. Until then these
outputs are useful for integrity checks and learning the L2 product layout.
