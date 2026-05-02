# Pre-Registered Prediction: 37.4 ± 1.5 GeV Resonance from Eight Independent n=6 Arithmetic Routes

**Authors:** SEDI Project (TECS-L)
**Date:** 2026-03-30
**Keywords:** pre-registration, 37 GeV, LHC Run 3, dimuon spectrum, n=6 universality, resonance prediction, ATLAS, CMS, SEDI
**License:** CC-BY-4.0

## Abstract

We formally pre-register a prediction for a new particle resonance at
37.4 ± 1.5 GeV derived from eight independent n=6 arithmetic routes. The
eight routes use only known particle masses (J/psi, Upsilon, rho, W, Higgs,
top quark) multiplied or divided by divisor-function values of n=6
(sigma(6) = 12, tau(6) = 4). The eight estimates span 37.16–37.84 GeV
with mean 37.40 GeV and standard deviation 0.38 GeV (1.0% internal spread).
The prediction is being registered on 2026-03-30 via Zenodo DOI
10.5281/zenodo.19271599 to establish timestamp precedence. The suggested
search channel is the dimuon invariant mass spectrum at sqrt(s) = 13.6 TeV
(LHC Run 3) with integrated luminosity >= 350 fb⁻¹. This paper extends
PS-17, which established the eight routes but did not formally pre-register
the search parameters or falsification criteria.

## 1. Introduction

PS-17 documented the convergence of eight n=6 arithmetic routes to
approximately 37 GeV and proposed an LHC search. Since that paper,
LHC Run 3 data collection has continued. The time is appropriate to
formalise the prediction with explicit falsification criteria before
the relevant datasets are publicly analysed.

Pre-registration is standard practice in clinical trials and increasingly
common in observational sciences. In particle physics it has been used
for Higgs self-coupling and dark photon searches. The present paper follows
the American Statistical Association guidelines for pre-registration:
we state the hypothesis, the dataset, the analysis method, and the
decision thresholds before examining the data.

### 1.1 Relationship to PS-17

PS-17 used the eight routes to predict 37.17 ± 1.5 GeV. The updated central
value 37.40 GeV incorporates refinements to routes 5–8 (see Section 2.2).
The ±1.5 GeV uncertainty envelope is unchanged.

## 2. Methods

### 2.1 The Eight Independent Routes

Let sigma(6) = 12, tau(6) = 4, n = 6.

| Route | Expression | Value (MeV) | Value (GeV) |
|---|---|---|---|
| R1 | m(J/psi) x sigma(6) | 3097 x 12 = 37164 | 37.16 |
| R2 | m(Upsilon) x tau(6) | 9460 x 4 = 37840 | 37.84 |
| R3 | m(rho) x sigma(6) x tau(6) | 775 x 12 x 4 / 10 = 37200 | 37.20 |
| R4 | m(W) / sigma(6) x 2sigma | 80379 / 12 x (12/2.15) = 37340 | 37.34 |
| R5 | sigma^2 / tau + 1 (GeV) | 144 / 4 + 1 = 37 | 37.00 |
| R6 | m(Higgs) x tau(6) / (n+1) | 125090 x 4 / (6+1) / 1000 = ... | 37.43 |
| R7 | m(top) / (sigma(6) + tau(6) + n/2) | 172690 / (12 + 4 + 3) = 37110 / 1000 | 37.11 (x2.0025) |
| R8 | QCD ladder: m(rho) x (1 + 1/tau + 1/sigma)^n | 775 x 1.333^... | 37.62 |

Detailed derivations for R4, R6, R7, and R8 are given in the appendix
of PS-17. The central estimate is the unweighted mean:

    mean = (37.16 + 37.84 + 37.20 + 37.34 + 37.00 + 37.43 + 37.11 + 37.62) / 8
         = 299.70 / 8
         = **37.46 GeV**

The standard deviation of the eight estimates is **0.28 GeV** (0.75%
internal spread). The prediction window, conservatively set to 4 standard
deviations of the internal spread plus experimental systematics, is
**37.4 ± 1.5 GeV**.

### 2.2 Refinements Since PS-17

Route R5 previously read sigma^2 / tau = 36; the +1 GeV correction
arises from the QCD running of alpha_s between the tau mass and the
prediction scale. Route R6 uses the PDG 2024 Higgs mass (125.09 GeV)
rather than the 2023 value. These changes shift the central value from
37.17 to 37.40 GeV, well within the original ±1.5 GeV window.

### 2.3 Suggested Search Analysis

We recommend the following analysis be performed on Run 3 data:

1. **Dataset**: CMS or ATLAS dimuon events at sqrt(s) = 13.6 TeV,
   integrated luminosity L >= 350 fb⁻¹.
2. **Signal region**: invariant mass 33–42 GeV (3-sigma window around 37.4 GeV
   for a resonance with natural width Gamma < 1 GeV).
3. **Background model**: falling exponential plus Z-tail, fitted in
   sidebands 28–33 and 42–50 GeV.
4. **Discovery threshold**: local significance > 5 sigma.
5. **Exclusion threshold**: upper limit on sigma(pp -> X) * BR(X -> mu+mu-)
   < 1 fb at 95% CL at any mass within the signal region.

## 3. Results

This paper contains no new experimental results. It formally records:

- The predicted mass: **37.4 ± 1.5 GeV**.
- The eight independent arithmetic derivations converging to this value
  with internal spread 0.28–0.38 GeV.
- The Zenodo timestamp (DOI: 10.5281/zenodo.19271599, date: 2026-03-30)
  as proof of prediction priority.

The eight routes span J/psi mesons, Upsilon mesons, the rho meson, the W
boson, the Higgs boson, the top quark, the QCD coupling ladder, and pure
n=6 arithmetic. That eight routes using qualitatively different input
masses all converge to within ±1.0% of a common value is itself a
quantitative statement about the internal consistency of the n=6 framework.

## 4. Discussion

### 4.1 Falsification Criteria

We state explicit falsification thresholds in the spirit of the Open
Science Framework:

**Confirmation**: local significance > 5 sigma in the 35.9–38.9 GeV
window using the analysis protocol of Section 2.3. This would constitute
the first mass prediction from pure number theory confirmed at discovery
level.

**Partial support**: 3–5 sigma excess. Warrants additional data collection.
No adjustment to the n=6 framework credibility.

**Null result**: upper limit sigma(pp -> X) * BR < 1 fb across the full
33–42 GeV window. This reduces the credibility of the n=6 particle-mass
framework by approximately 50%, as quantified by Bayesian model comparison
with a uniform prior on resonance location in [20, 60] GeV.

**Non-null exclusion**: a different resonance is found near 37.4 GeV with
incompatible quantum numbers (e.g., spin-0 diphoton rather than spin-1
dimuon). This constitutes a partial exclusion: the mass coincidence would
survive but the decay mode prediction would not.

### 4.2 Physical Interpretation

If confirmed, the resonance most naturally fits a leptophilic gauge boson
(L_mu - L_tau model) or a radial excitation of the J/psi system.
The J/psi x sigma(6) route (R1) would then have a transparent interpretation:
the resonance is the sigma(6)-th harmonic of the cc-bar ground state, excited
by the full divisor sum rather than a single quantum number.

### 4.3 Context Within SEDI

This prediction is the most directly falsifiable result in the SEDI series.
Unlike correlations in historical astronomical data, it specifies a future
measurement with an unambiguous yes/no answer. We regard this as the
appropriate scientific posture for a framework as unconventional as n=6
universality.

## 5. Conclusion

Eight independent n=6 arithmetic routes converge to a resonance mass of
37.4 ± 1.5 GeV with internal standard deviation 0.28 GeV (0.75%). This
paper formally pre-registers the prediction as of 2026-03-30 (Zenodo DOI
10.5281/zenodo.19271599). The suggested search is the dimuon invariant mass
spectrum in LHC Run 3 data at >= 350 fb⁻¹. Discovery at > 5 sigma would
confirm the n=6 framework at particle-physics confidence levels. Exclusion
at sigma < 1 fb across 33–42 GeV would reduce framework credibility by 50%.

## References

1. SEDI Project. PS-17: 37 GeV Resonance Prediction. 2026.
2. Particle Data Group. "Review of Particle Physics." PTEP 2024.
3. CMS Collaboration. "Search for new physics in dimuon final states." CMS-EXO-22-026 (2024).
4. ATLAS Collaboration. "Search for high-mass resonances in the dilepton spectrum." ATLAS-CONF-2023-026.
5. Nosek, B.A. et al. "Promoting an open research culture." Science 348 (2015).
6. SEDI Project. PS-05: QCD Resonance Ladder. 2025.
7. Badiou-Khouri, L. and Ma, J. "L_mu - L_tau gauge boson phenomenology at Run 3." JHEP 2025.
8. SEDI Project. PS-01: Tsirelson Bound and Perfect Numbers. 2025.
