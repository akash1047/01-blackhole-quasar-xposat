"""Quick-look diagnostics for public Crab POLIX L2 data; not science products.

Run: ``uv run python analysis/plot_polix_crab_l2.py``
"""

import csv
from pathlib import Path

import matplotlib

matplotlib.use("Agg")
import numpy as np
from astropy.io import fits
from matplotlib import pyplot as plt

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data/xposat/polix/crab"
OUT = ROOT / "figures/polix/crab-l2"
RESULTS = ROOT / "analysis/results"
PROPOSALS = {"P01_0005": "20–31 Jan 2024", "T24_0001": "2–4 Feb 2024", "T24_0002": "13–27 Feb 2024"}
INTERVALS = ("Source", "Background", "Earthoccultation")


def product(pid, folder, name):
    base = DATA / f"X01_PLX_{pid}_000000_L2_V1p1" / folder
    return base / f"X01_PLX_{pid}_000000_{name}"


def read_table(path):
    with fits.open(path) as hdul:
        return hdul[1].data.copy(), hdul[1].header.copy()


def fit_twofold(phi_deg, rate, error):
    """Fit A + B cos(2φ) + C sin(2φ); this is not a polarization fit."""
    phi = np.deg2rad(phi_deg)
    sigma = np.clip(error, 1e-12, None)
    design = np.column_stack([np.ones_like(phi), np.cos(2 * phi), np.sin(2 * phi)])
    weighted = design / sigma[:, None]
    coeff, *_ = np.linalg.lstsq(weighted, rate / sigma, rcond=None)
    model = design @ coeff
    covariance = np.linalg.inv(weighted.T @ weighted)
    mean, cosine, sine = coeff
    amplitude = np.hypot(cosine, sine)
    gradient = np.array([-amplitude / mean**2, cosine / (mean * amplitude), sine / (mean * amplitude)])
    fraction = amplitude / mean
    fraction_error = np.sqrt(gradient @ covariance @ gradient)
    chi2 = np.sum(((rate - model) / sigma) ** 2)
    return model, fraction, fraction_error, chi2, len(rate) - 3


def lightcurve_stats(pid, interval):
    table, header = read_table(product(pid, "Polix_l2_lcpha", f"Eventdata{interval}_L2.lc"))
    rate, error = np.asarray(table["RATE"], float), np.asarray(table["ERROR"], float)
    frac_exp = np.asarray(table["FRAC_EXP"], float)
    good = (frac_exp > 0.5) & np.isfinite(rate) & np.isfinite(error)
    weights = frac_exp[good]
    mean = np.average(rate[good], weights=weights)
    mean_error = np.sqrt(np.sum((weights * error[good]) ** 2)) / weights.sum()
    return mean, mean_error, float(header["EXPOSURE"]), good.sum()


def save(fig, filename):
    fig.tight_layout()
    fig.savefig(OUT / filename, dpi=160)
    plt.close(fig)


def plot_modulation(rows):
    fig, axes = plt.subplots(3, 1, figsize=(8, 9), sharex=True)
    for ax, (pid, date) in zip(axes, PROPOSALS.items()):
        table, _ = read_table(product(pid, "Polix_l2_polarization", "WeightedRoll_L2.fits"))
        phi, rate, error = (np.asarray(table[name], float) for name in ("ROLL_AZ_ANG", "TOTAL_COUNTRATE", "ERROR"))
        model, fraction, fraction_error, chi2, dof = fit_twofold(phi, rate, error)
        rows[pid].update(modulation_fraction=fraction, modulation_fraction_error=fraction_error, modulation_chi2=chi2, modulation_dof=dof)
        ax.errorbar(phi, rate, yerr=error, fmt=".", ms=2, elinewidth=0.4, alpha=0.7)
        ax.plot(phi, model, color="C1", lw=1.5)
        ax.set(title=f"{pid} ({date})", ylabel="count rate")
        ax.text(0.99, 0.92, f"2φ amplitude/mean = {100*fraction:.2f} ± {100*fraction_error:.2f}%\nχ²/dof = {chi2/dof:.1f}", transform=ax.transAxes, ha="right", va="top", fontsize=8)
    axes[-1].set_xlabel("roll azimuth (deg)")
    fig.suptitle("Crab POLIX modulation: source + background (diagnostic only)")
    save(fig, "weighted-roll.png")


def plot_interval_rates(rows):
    x = np.arange(len(PROPOSALS))
    fig, ax = plt.subplots(figsize=(8, 4.5))
    for offset, interval in zip((-0.25, 0, 0.25), INTERVALS):
        rates, errors = [], []
        for pid in PROPOSALS:
            rate, error, exposure, bins = lightcurve_stats(pid, interval)
            key = interval.lower().replace("earthoccultation", "earth")
            rows[pid].update({f"{key}_rate": rate, f"{key}_rate_error": error, f"{key}_exposure_s": exposure, f"{key}_bins": bins})
            rates.append(rate); errors.append(error)
        ax.bar(x + offset, rates, 0.24, yerr=errors, label=interval.replace("occultation", " occultation"))
    ax.set(xticks=x, xticklabels=PROPOSALS, ylabel="exposure-weighted mean count s$^{-1}$", title="Event-mode rates by observing interval")
    ax.legend()
    save(fig, "interval-rates.png")


def plot_detector_balance(rows):
    fig, ax = plt.subplots(figsize=(8, 4.5)); x = np.arange(4)
    for offset, pid in zip((-0.22, 0, 0.22), PROPOSALS):
        rates = []
        for detector in range(1, 5):
            table, header = read_table(product(pid, "Polix_l2_polarization", f"ProcessedEventdataSource_Det{detector}_L2.pha"))
            rate = np.asarray(table["COUNTS"], float).sum() / float(header["EXPOSURE"])
            rates.append(rate); rows[pid][f"detector_{detector}_rate"] = rate
        ax.bar(x + offset, rates, 0.21, label=pid)
    ax.set(xticks=x, xticklabels=("Detector 1", "Detector 2", "Detector 3", "Detector 4"), ylabel="all-channel count s$^{-1}$", title="Processed source-event detector balance")
    ax.legend(); save(fig, "detector-balance.png")


def plot_pha_context():
    pid = "T24_0002"; fig, ax = plt.subplots(figsize=(8, 4.2))
    for interval in INTERVALS:
        table, header = read_table(product(pid, "Polix_l2_lcpha", f"Eventdata{interval}_L2.pha"))
        ax.step(table["CHANNEL"], table["COUNTS"] / float(header["EXPOSURE"]), where="mid", lw=1, label=interval.replace("occultation", " occultation"))
    ax.set(xlim=(0, 4096), yscale="log", xlabel="PHA channel (uncalibrated)", ylabel="count s$^{-1}$ channel$^{-1}$", title=f"{pid} PHA context (diagnostic, not spectroscopy)")
    ax.legend(); save(fig, "t24-0002-pha-context.png")


def write_summary(rows):
    path = RESULTS / "crab-polix-l2-summary.csv"
    with path.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=["proposal_id", *next(iter(rows.values())).keys()])
        writer.writeheader(); writer.writerows({"proposal_id": pid, **row} for pid, row in rows.items())


def main():
    OUT.mkdir(parents=True, exist_ok=True); RESULTS.mkdir(parents=True, exist_ok=True)
    rows = {pid: {"date_range": date} for pid, date in PROPOSALS.items()}
    plot_interval_rates(rows); plot_detector_balance(rows); plot_modulation(rows); plot_pha_context(); write_summary(rows)
    print(f"Wrote 4 plots to {OUT.relative_to(ROOT)}/ and a summary to {RESULTS.relative_to(ROOT)}/")


if __name__ == "__main__":
    main()
