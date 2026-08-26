// Book-form export of docs/wiki/*.md
// Compile: typst compile docs/book/book.typ docs/book/black-holes-quasars-primer.pdf

#set page(paper: "a4", numbering: "1", margin: (x: 2.5cm, y: 3cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "en")
#set heading(numbering: "1.1")
#set par(justify: true, leading: 0.65em)
#show link: underline

#let fig(path, caption, width: 80%) = figure(
  image(path, width: width),
  caption: caption,
)

// ---------- Title page ----------
#align(center)[
  #v(4cm)
  #text(28pt, weight: "bold")[Black Holes \& Quasars]
  #v(0.5cm)
  #text(16pt)[A Primer]
  #v(2cm)
  #text(12pt)[Research notes --- black hole / quasar / XPoSat workspace]
  #v(0.3cm)
  #text(10pt, style: "italic")[Compiled from docs/wiki/]
]
#pagebreak()

#outline(depth: 2)
#pagebreak()

= Black Holes

A *black hole* is a region of spacetime where gravity is so strong that nothing --- including light --- can escape from inside a surface called the *event horizon*. The object we "see" in pictures is never the interior. It is glowing gas, lensed light, and shadows _outside_ that surface.

#fig("../../figures/wiki/black-hole-accretion.jpg")[
  Teaching illustration: dark silhouette, bright accretion flow, and a lensed image of the far side of the disk wrapping over the hole. Not an observation.
]

== Why "black"?

Escape speed from a mass $M$ of radius $R$ is $v_"esc" = sqrt(2 G M / R)$. Set $v_"esc" = c$ and you get the *Schwarzschild radius*

$ R_"s" = frac(2 G M, c^2) approx 3 "km" times (M / M_"☉") . $

Compress the Sun to ~3 km, or Earth to ~9 mm, and the event horizon would sit at that radius. The matter that formed the hole is not sitting on a hard surface; in classical general relativity it has collapsed toward a *singularity* (a breakdown of the classical description). Astrophysics almost never needs the singularity --- observations probe the horizon-scale _exterior_.

== A few radii that matter

For a *non-spinning* hole (Schwarzschild):

#table(
  columns: 3,
  table.header([*Radius*], [*Value*], [*Role*]),
  [Event horizon], [$R_"s"$], [No return],
  [Photon sphere], [$1.5 R_"s"$], [Unstable light orbit; sets the bright ring / shadow edge],
  [ISCO], [$3 R_"s"$], [Innermost stable circular orbit for matter; inner edge of a thin disk],
)

Spinning (*Kerr*) holes pull the horizon, photon orbit, and ISCO inward. That is why *spin* changes the disk's inner temperature and the X-ray spectrum.

#fig("../../figures/wiki/schwarzschild-radii.svg", width: 70%)[
  Characteristic radii around a non-spinning black hole.
]

== Two mass scales

#table(
  columns: 3,
  table.header([*Kind*], [*Typical mass*], [*How they form (sketch)*]),
  [*Stellar-mass*], [~5--50 $M_"☉"$ (heavier ones exist)], [Collapse of a massive star, or mergers],
  [*Supermassive (SMBH)*], [$10^6$--$10^10 M_"☉"$], [Growth by accretion and mergers in galaxy centers],
)

Examples: *Sgr A\** in the Milky Way is ~4 million $M_"☉"$. *M87\** is several billion $M_"☉"$. Quasar engines sit in this supermassive range, often $10^8$--$10^9 M_"☉"$ or more.

Stellar-mass disks run hotter (~keV, X-rays). Supermassive disks are larger and cooler at a given Eddington ratio; their thermal peak is UV/optical, with X-rays from a *corona* above the disk.

== Accretion: how a black hole shines

Gas rarely falls straight in. It has angular momentum, so it forms a rotating *accretion disk*. Viscosity (in real disks, magnetic turbulence) lets gas spiral inward. Gravitational energy becomes heat. Roughly *~10% of $dot(M) c^2$* can be radiated --- more efficient than nuclear fusion.

That light is produced *outside* the horizon. Material that crosses the horizon does not send a last postcard.

If magnetic fields thread the inner disk and spinning hole, some energy and particles are launched as *jets* along the spin axis.

== What this has to do with quasars

A quiet SMBH (Sgr A\* today) is dim. Feed the same kind of object a large $dot(M)$ and the disk + corona become a lighthouse: an active galactic nucleus, of which a *quasar* is the high-luminosity end.

#pagebreak()

= Quasars

A *quasar* (originally _quasi-stellar radio source_) is a distant galaxy whose *core is so bright* that it can outshine the rest of the galaxy. The engine is a *supermassive black hole* accreting gas through a disk. Quasars are the high-luminosity end of *active galactic nuclei (AGN)*.

NASA's compact statement of the same idea: they are distant galaxies whose cores are powered by supermassive black holes; luminosities can be tens to tens of thousands of times a Milky Way, generated in a region only light-days to light-years across.

#fig("../../figures/wiki/quasar-host-jets.jpg")[
  Teaching illustration: host galaxy, blazing nucleus, approaching (blue) and receding (red) jets, and outer lobes. Real jets need not be this symmetric or this well aligned with a spiral disk.
]

== The one-sentence physics

Gas falls toward the SMBH $arrow$ forms a disk $arrow$ friction and magnetic stresses heat it $arrow$ UV/optical continuum from the disk, X-rays from a hot *corona*, sometimes *jets* along the axis. The hole is the gravitational well. The _lamp_ is the infalling gas.

Radiative efficiency is of order $0.1 dot(M) c^2$. A luminous quasar can swallow on the order of *a solar mass per year* (extreme objects more). That is enough to outshine $10^12$--$10^14$ Suns from a volume smaller than the solar system for the inner disk.

== Anatomy

#fig("../../figures/wiki/agn-anatomy.svg", width: 90%)[
  Labeled anatomy of an AGN / quasar engine.
]

#table(
  columns: 3,
  table.header([*Piece*], [*What it is*], [*Typical light*]),
  [SMBH], [$10^7$--$10^10 M_"☉"$], [none from inside the horizon],
  [Accretion disk], [Orbiting gas; inner edge near ISCO], [thermal UV / optical],
  [Corona], [Hot plasma above the inner disk], [X-rays],
  [BLR], [Fast clouds at light-days], [*broad* emission lines],
  [Dusty torus], [Donut of dust at parsec scales], [infrared; can hide the BLR],
  [NLR], [Slower ionized gas at 10s--100s of pc], [*narrow* lines],
  [Jets], [Magnetically collimated plasma], [radio $arrow$ γ-rays, depending on energy],
)

#fig("../../figures/wiki/agn-engine.jpg")[
  Teaching illustration of the same engine, unlabeled.
]

== AGN family (keep it small)

"Quasar" is a luminosity/class name, not a different machine.

#table(
  columns: 2,
  table.header([*Name*], [*Rough idea*]),
  [*Seyfert*], [Nearby, lower-luminosity AGN; galaxy is easy to see],
  [*Quasar*], [Higher luminosity; at large distance the star-like nucleus dominates],
  [*Radio galaxy*], [Strong jets/lobes; nucleus may be obscured],
  [*Blazar*], [Jet aimed nearly at Earth; wildly variable],
)

*Type 1* vs *Type 2*: type 1 shows broad lines (direct view of BLR); type 2 does not (torus in the way). A common *unification* picture says these can be the same engine at different viewing angles. Jet power (radio-loud vs radio-quiet) is a second axis, not explained by angle alone.

#fig("../../figures/wiki/agn-unification.svg", width: 90%)[
  Unification by viewing angle.
]

== Why they look like stars, and why they are not

Early radio catalogs found objects that looked *stellar* on optical plates (hence _quasi-stellar_). Spectra showed huge *redshift*: they are cosmological. The first widely recognized example was *3C 273* (Schmidt, 1963). Nearest luminous quasars are still hundreds of millions of light-years away; many sit at redshift $z tilde.op 1$--$3$, when galaxies were gas-rich. That is why the local universe has few classic quasars --- the fuel ran down --- while leftover SMBHs remain in galaxy centers (the "dead quasar" / Soltan argument).

== Feedback

Disk winds and jets dump energy and momentum into the host. They can heat or expel gas and *quench* star formation, or, in some early phases, *compress* gas and help stars form. Either way, the tiny engine talks to the whole galaxy.

== Why X-rays (and later, XPoSat)

The *corona* and inner disk live at tens of gravitational radii. X-rays are produced there, and they *reflect* off the disk (iron K$alpha$, Compton hump). Polarization encodes geometry: disk vs corona vs jet. That is the bridge from this wiki to XPoSat (POLIX polarimetry, XSPECT spectroscopy) in later notes.

#pagebreak()

= Glossary

Short definitions for the black hole and quasar chapters.

#table(
  columns: (auto, 1fr),
  table.header([*Term*], [*Meaning*]),
  [*AGN*], [Active galactic nucleus --- a galaxy center lit by accretion onto an SMBH. Quasars are the bright end.],
  [*Accretion disk*], [Rotating gas that slowly spirals in and radiates.],
  [*BLR*], [Broad-line region --- fast clouds near the engine; Doppler-broadened lines.],
  [*Blazar*], [AGN with a jet pointed nearly at Earth.],
  [*Corona*], [Compact, hot plasma that Compton-upscatters disk photons into X-rays.],
  [*Eddington luminosity*], [Radiation-pressure limit: $L_"Edd" approx 1.3 times 10^38 (M \/ M_"☉") "erg" "s"^(-1)$. Quasars often run at a sizable fraction of this.],
  [*Event horizon*], [Surface of no return. Radius $R_"s" = 2 G M \/ c^2$ if the hole does not spin.],
  [*Gravitational radius*], [$r_"g" = G M \/ c^2 = R_"s" \/ 2$. Convenient inner-engine unit.],
  [*ISCO*], [Innermost stable circular orbit. $3 R_"s"$ if non-spinning; closer if spinning.],
  [*Jet*], [Collimated outflow along the spin axis, often relativistic.],
  [*Kerr / Schwarzschild*], [Spinning / non-spinning vacuum black-hole solutions.],
  [*NLR*], [Narrow-line region --- slower ionized gas farther out.],
  [*Photon sphere*], [Unstable light orbit at $1.5 R_"s"$ (non-spinning).],
  [*Quasar*], [High-luminosity AGN; historically a star-like optical counterpart of a radio source.],
  [*Redshift* $z$], [Stretch of wavelength from cosmic expansion (plus, locally, Doppler/gravity). High $z$ = far / early universe.],
  [*Seyfert*], [Lower-luminosity AGN in a clearly visible nearby galaxy.],
  [*SMBH*], [Supermassive black hole, $gt.tilde 10^6 M_"☉"$, at a galaxy center.],
  [*Torus*], [Dusty, roughly toroidal structure that can obscure the BLR along equatorial sightlines.],
  [*Type 1 / Type 2*], [Broad lines visible / hidden. Often attributed to viewing angle.],
  [*Unification*], [The idea that several AGN classes are one engine seen from different directions.],
)

#pagebreak()

= Sources

- NASA, #link("https://science.nasa.gov/mission/hubble/science/science-behind-the-discoveries/hubble-quasars/")[Hubble quasars]
- NASA, #link("https://science.nasa.gov/mission/webb/science-overview/science-explainers/what-are-active-galactic-nuclei/")[What are active galactic nuclei?]
- Narayan \& Quataert, _Nature_ *615*, 597 (2023) --- accretion and the inner engine
- Tremaine, #link("https://www.ias.edu/ideas/2015/tremaine-quasars")[The Odd Couple: Quasars and Black Holes] (IAS)

Illustrations: Grok Imagine (`figures/wiki/*.jpg`). Diagrams: SVG (`figures/wiki/*.svg`). Neither is telescope data.
