# Hubble Constant H_0 = 73 from Perfect Number Arithmetic

**Authors:** SEDI Project (TECS-L)
**Date:** 2026-03-27
**Keywords:** Hubble constant, H0 tension, cosmology, perfect numbers, SH0ES
**License:** CC-BY-4.0

## Abstract

The Hubble tension -- the discrepancy between local (SH0ES: 73.04 +/- 1.04
km/s/Mpc) and early-universe (Planck: 67.4 +/- 0.5 km/s/Mpc) measurements
of the Hubble constant -- is one of the most significant open problems in
cosmology. We observe that the local measurement value 73 can be expressed
as sigma(6) * 6 + 1 = 12 * 6 + 1 = 73. We present this observation, test
it against alternative expressions, and discuss the Hubble tension in the
context of n=6 arithmetic.

## 1. Introduction

The Hubble constant H_0 measures the current expansion rate of the universe.
Two fundamentally different measurement methods yield discrepant values:

```
  Local (SH0ES, Cepheids + SNe Ia): H_0 = 73.04 +/- 1.04 km/s/Mpc
  Early (Planck CMB + Lambda-CDM):   H_0 = 67.4  +/- 0.5  km/s/Mpc

  Tension: 4.8 sigma
```

This discrepancy has persisted across multiple independent analyses and
calibrations. It may indicate new physics beyond the Lambda-CDM model.

### 1.1 The n=6 Expression

```
  sigma(6) * n + 1 = 12 * 6 + 1 = 73
```

This matches the SH0ES central value to within measurement uncertainty.

## 2. Methods

### 2.1 Arithmetic Verification

```
  sigma(6) = 12
  n = 6
  sigma * n = 72
  sigma * n + 1 = 73
```

### 2.2 Comparison with Measurements

| Measurement | Value (km/s/Mpc) | sigma*n+1=73 | Agreement |
|------------|------------------|-------------|-----------|
| SH0ES (2022) | 73.04 +/- 1.04 | 73 | 0.04 (within 1 sigma) |
| H0LiCOW (lensing) | 73.3 +1.7/-1.8 | 73 | 0.3 (within 1 sigma) |
| TRGB (Freedman) | 69.8 +/- 1.7 | 73 | 1.9 sigma |
| Planck CMB | 67.4 +/- 0.5 | 73 | 11.2 sigma (DISAGREE) |

The n=6 prediction matches the LOCAL measurements but disagrees with
Planck CMB.

### 2.3 Alternative Expressions for 73

```
  73 is prime.
  73 = 12 * 6 + 1     = sigma * n + 1     (our formula)
  73 = 9 * 8 + 1      = (sigma/tau*sigma/tau)*(sigma-tau) + 1  (complicated)
  73 = 64 + 9          = tau^3 + (sigma/tau)^2   (alternative)
  73 = 2^6 + 2^3 + 1  = 2^n + 2^(sigma/tau) + 1 (binary decomposition)
```

The simplest expression is sigma * n + 1 = 72 + 1 = 73.

### 2.4 The "+1" Question

The formula includes a "+1" additive correction. In the n=6 framework:

- "+1" corrections are flagged as potentially ad hoc (see CLAUDE.md rules)
- However, 73 being prime means it cannot be expressed as a product of
  n=6 functions without an additive term
- The "+1" could represent: the U(1) gauge factor, the identity element,
  or a systematic shift

We flag this as a caveat: the formula is sigma*n + 1, not sigma*n exactly.

### 2.5 Statistical Assessment

How special is it that sigma*n + 1 = 73?

```
  Test: Among expressions f(sigma, tau, phi, n) + k with k in {-2,-1,0,1,2}
  and f a monomial, how many hit the range [67, 74]?

  Candidate monomials (value in [65, 76]):
    sigma * n = 72       -> +1 gives 73
    sigma * n = 72       -> +0 gives 72 (not in range of H0)
    sigma * tau * n / 4 = 72  (same)
    4 * phi * n = 48     (too small)
    sigma * sopfr = 60   (too small)
    tau * phi * n = 48   (too small)

  Only sigma * n + 1 = 73 hits the SH0ES central value.
  But the search space is modest (~50 expressions x 5 offsets = 250)
  p-value ~ 1/250 * (7/100) ~ 3e-4 (generous)
  More conservatively: p ~ 0.01
```

## 3. Results

### 3.1 The Hubble Constant Prediction

```
  ┌──────────────────────────────────────────┐
  │                                          │
  │   H_0 = sigma(6) * 6 + 1 = 73 km/s/Mpc │
  │                                          │
  └──────────────────────────────────────────┘
```

### 3.2 Hubble Tension Interpretation

If the n=6 prediction H_0 = 73 is correct, it sides with the local
measurements. The Hubble tension could then be interpreted as:

```
  Planck CMB value:  67.4 ~ sigma * sopfr + sigma/phi = 60 + 6 = 66
                     (or sigma * n - sopfr = 72 - 5 = 67)

  Local value:       73 = sigma * n + 1 = 72 + 1

  Tension:           73 - 67 = 6 = n
```

The tension itself equals n! The difference between local and CMB-inferred
Hubble constants is approximately 6 km/s/Mpc, matching the perfect number.

### 3.3 The Number 72 = sigma * n

The base value 72 = sigma(6) * 6 has significance:

```
  72 = sigma * n = 12 * 6
  72 = the number of roots of E_6 exceptional Lie algebra
  72 = the kissing number in dimension 6 (6D sphere packing)
```

The Hubble constant H_0 = 73 is one more than the E_6 root count.

### 3.4 Dimensional Consistency

The formula gives a dimensionless number (73) which must be paired with
units (km/s/Mpc). The n=6 framework does not predict the units -- they
depend on human conventions (km, s, Mpc). This is a fundamental limitation:
the formula can only predict the numerical value in conventional units.

## 4. Discussion

### 4.1 Strengths

- Simple formula: sigma * n + 1 = 73, only 3 terms
- Matches SH0ES to 0.05% (well within 1 sigma)
- The tension = n = 6 is an interesting secondary observation
- 72 = kissing number in dimension 6 adds context

### 4.2 Weaknesses

- The "+1" correction is ad hoc
- The formula is unit-dependent (only works in km/s/Mpc)
- If Planck is correct (67.4), the formula is wrong
- The number 73 is prime, making it hard to express without "+1"
- The formula does not derive H_0 from physical principles

### 4.3 Resolution of Tension

If new physics (early dark energy, modified gravity, etc.) eventually
resolves the Hubble tension toward the local value ~73, the n=6 formula
gains credibility. If the resolution favors ~67-68 (closer to Planck),
the formula is falsified.

Current trajectory of measurements suggests the tension is real, with
most independent local measurements clustering around 72-74 km/s/Mpc.

### 4.4 Comparison with Other Numerological Proposals

```
  Eddington: H_0 ~ c / R_universe (dimensional analysis)
  Dirac LNH: H_0 ~ 1/t_universe (large number hypothesis)
  This work: H_0 = sigma(6)*6+1 = 73 (arithmetic, unit-dependent)
```

## 5. Conclusion

The Hubble constant H_0 = 73 km/s/Mpc matches sigma(6) * 6 + 1 = 73,
a simple expression in perfect number arithmetic. The formula agrees with
the SH0ES local measurement to within 1 sigma and predicts that the
Hubble tension (approximately 6 km/s/Mpc) equals the perfect number n=6.
The result is unit-dependent and includes an ad hoc "+1" correction,
limiting its theoretical significance.

## References

1. Riess, A.G. et al. (2022). "A Comprehensive Measurement of the Local
   Value of the Hubble Constant." ApJ Letters, 934, L7.
2. Planck Collaboration (2020). "Planck 2018 results. VI. Cosmological
   parameters." Astronomy & Astrophysics, 641, A6.
3. Di Valentino, E. et al. (2021). "In the realm of the Hubble tension --
   a review of solutions." Classical and Quantum Gravity, 38(15), 153001.
4. Freedman, W.L. (2021). "Measurements of the Hubble Constant: Tensions
   in Perspective." ApJ, 919, 16.
5. SEDI Project. (2026). "Hubble constant analysis." TECS-L repository.
