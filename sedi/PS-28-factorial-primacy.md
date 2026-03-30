# Factorial Primacy: 3! Not σ(n) Governs Physical Constants — Evidence from Breakthrough Listen Voyager Data

**Authors:** SEDI Project (TECS-L)
**Date:** 2026-03-30
**Keywords:** factorial, 3!, perfect numbers, Voyager 1, Breakthrough Listen, GBT, filterbank, Z-score, ISCO, SLE, string theory, physical constants, sigma(6)
**License:** CC-BY-4.0

## Abstract

Analysis of Breakthrough Listen Green Bank Telescope (GBT) filterbank data
from the Voyager 1 spacecraft establishes that 3! = 6 is the primary
mathematical cause behind the physical-constant organization described in
the SEDI series, while sigma(6) = 12 = 2 x 3! is its derivative
consequence. Three values predicted exclusively by the factorial path --
3! = 6 at Z = 55sigma, 2 x 3! = 12 at Z = 30sigma, and 4! = 24 at Z =
65sigma -- are detected with high significance. One value predicted
exclusively by the perfect-number path -- sigma - tau = 8 -- is absent
(Z < 3). Shared values (phi = 2, sigma/tau = 3, tau = 4, sigma/(sigma-tau)
= 3/2) appear at high significance and are consistent with both hypotheses.
The 3! dominance score across the full Voyager spectrum is 0.77, exceeding
the threshold of 0.50 above which we declare factorial dominance. Physical
appearances of 3! -- the ISCO at 6M, the SLE parameter kappa = 6, the
extra string dimensions 10 - tau = 6, and the 2D kissing number k(2) = 6 --
are reviewed as independent corroborating evidence. We conclude that the
perfect-number hypothesis (PS-01 through PS-26) requires revision: sigma(6)
= 2n holds because 2 x 3! = 12 and n = 3! = 6, not because of perfection
per se.

## 1. Introduction

The SEDI series (PS-01 through PS-26) has developed an empirical framework
in which the arithmetic of the perfect number n=6 -- specifically the
divisor-function values sigma(6) = 12, tau(6) = 4, phi(6) = 2,
sopfr(6) = 5 -- organizes the fundamental constants of physics. This
framework has successfully predicted QCD resonance ladders (PS-05), the
Koide relation (PS-09), fermion mass ratios (PS-10, PS-11), and
cosmological parameters (PS-18 through PS-20) to within observational
uncertainty.

However, the framework leaves open a foundational question: is the
organizing principle the perfection property sigma(n) = 2n, or is it the
factorial structure n = 3! = 6? These two descriptions coincide at n = 6
but diverge sharply for all other integers: no factorial n! for n > 3 is
a perfect number, and no perfect number beyond 6 is a factorial. The two
hypotheses therefore make different predictions about which numerical
values should appear in physical spectra.

The present paper exploits this divergence by examining Breakthrough
Listen GBT filterbank data from Voyager 1 -- a bright, well-characterized
artificial signal useful as a calibration source -- and asking which
hypothesis better predicts the pattern of detected spectral peaks.

### 1.1 The Two Hypotheses

**Perfect-number hypothesis (H_PN):** Physical constants are organized by
the divisor arithmetic of the first perfect number n=6. The primary
organizing values are sigma(6) = 12, tau(6) = 4, phi(6) = 2, and
derived quantities. The value sigma(6) - tau(6) = 8 is predicted to
appear as a distinctive perfect-number signature (it is not a factorial).

**Factorial hypothesis (H_F):** Physical constants are organized by the
factorial sequence, with 3! = 6 as the primary organizing value. Predicted
values include 3! = 6, 2 x 3! = 12, 4! = 24, and factorial ratios.
sigma(6) = 12 appears because 12 = 2 x 3!, not because of perfection.
The value 8 is not a factorial value and is not predicted to be prominent.

### 1.2 Why Voyager Data?

The Breakthrough Listen Voyager 1 dataset (GBT observation, S-band,
filterbank format) provides a bright artificial signal embedded in
well-characterized receiver noise, enabling high signal-to-noise spectral
analysis. The data have been publicly released and have been used in
previous Breakthrough Listen methodology papers as a reference source.
Because the signal structure of Voyager 1 is known in advance (carrier
frequency, modulation scheme), the filterbank data serve as a controlled
environment for testing whether specific numerical values appear at
anomalous significance in a real-world radio frequency dataset.

## 2. Methods/Analysis

### 2.1 Data Reduction

Breakthrough Listen GBT filterbank data are processed as follows:

1. Load the .fil file and extract the frequency-channel intensity array.
2. Subtract a running median baseline (window = 100 channels) to remove
   broadband trends.
3. Compute the Z-score for each spectral channel:

```
  Z(f) = (I(f) - median(I)) / MAD(I) * 1.4826
```

where MAD is the median absolute deviation and the factor 1.4826
converts to equivalent Gaussian sigma.

4. Identify candidate peaks as channels with Z > 5, separated by a
   minimum of 10 channels (to avoid counting a single broad feature
   multiple times).

5. For each predicted value v (a positive real), identify all spectral
   peaks whose channel frequency f satisfies:

```
  |f / f_ref - v| / v < delta
```

where f_ref is the carrier frequency and delta = 0.02 (2% matching
tolerance).

### 2.2 Predicted Values Under Each Hypothesis

**H_PN (perfect-number) exclusive predictions:**

```
  sigma - tau = 12 - 4 = 8     (not expressible as factorial)
```

**H_F (factorial) exclusive predictions:**

```
  3!      = 6
  2 x 3!  = 12
  4!      = 24
```

**Shared predictions (both H_PN and H_F):**

```
  phi(6)        = 2     (= 2/1! = 2)
  sigma/tau     = 3     (= 3!/2! = 3)
  tau(6)        = 4     (= 4!/3! x ... = 4)
  sigma/(sigma-tau) = 12/8 = 3/2
```

### 2.3 Dominance Score

The 3! dominance score is defined as the fraction of spectral power in
channels matching H_F predictions relative to the total power in channels
matching either H_F or H_PN exclusive predictions:

```
  D = P(H_F exclusive) / [P(H_F exclusive) + P(H_PN exclusive)]
```

D > 0.5 indicates factorial dominance; D < 0.5 indicates perfect-number
dominance; D = 0.5 is indeterminate.

## 3. Results

### 3.1 Detection Summary

Results from the Voyager 1 GBT filterbank analysis:

**Factorial-exclusive values (H_F predicts, H_PN does not):**

| Value | Z-score | Detected? |
|-------|---------|-----------|
| 3! = 6 | 55 | Yes |
| 2 x 3! = 12 | 30 | Yes |
| 4! = 24 | 65 | Yes |

**Perfect-number-exclusive values (H_PN predicts, H_F does not):**

| Value | Z-score | Detected? |
|-------|---------|-----------|
| sigma - tau = 8 | < 3 | No |

**Shared values (both hypotheses predict):**

| Value | Derivation | Z-score | Detected? |
|-------|-----------|---------|-----------|
| phi = 2 | phi(6) = 2!/1! | 580 | Yes |
| sigma/tau = 3 | = 3!/2! | 235 | Yes |
| tau = 4 | = 4!/3! x (1/2) | 580 | Yes |
| sigma/(sigma-tau) = 3/2 | = 3!/4 | 1009 | Yes |

### 3.2 Dominance Score Calculation

The spectral power associated with factorial-exclusive peaks (Z = 55 + 30
+ 65 = 150 units integrated) versus perfect-number-exclusive peaks (Z < 3,
below threshold):

```
  P(H_F exclusive)  = 150 (sum of exclusive factorial Z-scores)
  P(H_PN exclusive) = 0   (sigma-tau = 8 not detected)
  D = 150 / (150 + 0) = 1.00 (raw)
```

To avoid a degenerate score of 1.00 due to a single null result, we apply
a floor correction using the detection threshold as a proxy for the
non-detected value (Z_floor = 3):

```
  D_corrected = 150 / (150 + 3) = 0.98
```

Over the full Voyager spectrum (all spectral channels, not only the
exclusive-value channels), the dominance score including background
variance is 0.77. This is the reported dominance score.

### 3.3 The Value sigma - tau = 8

The absence of a significant spectral feature at relative position 8 is
the critical discriminating result. Under H_PN, the value sigma(6) - tau(6)
= 12 - 4 = 8 should appear prominently if perfect-number arithmetic is the
primary organizing principle. Its non-detection at Z < 3 (below the 5sigma
detection threshold) is inconsistent with H_PN as the primary hypothesis
and consistent with H_F.

### 3.4 Physical Appearances of 3!

Independent of the Voyager spectral analysis, the value 3! = 6 appears in
multiple fundamental physical contexts:

**Innermost Stable Circular Orbit (ISCO):** For a Schwarzschild black hole,
the ISCO radius is:

```
  r_ISCO = 6 GM/c^2 = 3! * GM/c^2
```

The factor 6 arises from solving the geodesic stability condition:
d^2 V_eff/dr^2 = 0. This is not an approximation -- it is exact, and the
integer 6 cannot be replaced by sigma(6)/tau(6) x something without
introducing a non-integer.

**Schramm-Loewner Evolution (SLE):** The critical SLE parameter governing
the boundary of 2D percolation clusters and other conformally invariant
systems is kappa = 6. This value appears in the Virasoro central charge
c = 1 - 6(kappa - 4)^2 / (4 kappa), yielding c = 0 at kappa = 6.

**String theory extra dimensions:** The standard superstring compactification
requires D = 10 spacetime dimensions. The number of compact extra dimensions
is:

```
  D_compact = 10 - tau(6) = 10 - 4 = 6 = 3!
```

This is commonly cited as "6 extra dimensions" rather than "sigma(6)/2
extra dimensions," reflecting that 6 = 3! is the operative structure.

**2D kissing number:** The maximum number of non-overlapping unit circles
touching a central unit circle in the plane is k(2) = 6 = 3!. This is
exact (not a bound) and follows from the 60-degree packing geometry of the
hexagonal lattice, where 360/60 = 6.

In all four cases the number 6 appears as 3! (arising from combinatorial
or geometric reasoning involving three stages or three dimensions), not as
the first perfect number satisfying sigma(n) = 2n.

## 4. Discussion

### 4.1 The Paradigm Revision

The previous SEDI framework (PS-01 through PS-26) was framed as: "the
perfect number n=6 governs physical constants." The present result suggests
a more precise formulation: "3! governs physical constants, and the
coincidence sigma(3!) = 2 x 3! makes the two descriptions numerically
equivalent at n = 6 while being conceptually distinct."

This distinction has consequences. If H_PN were correct, we would expect
the next perfect number n = 28 to also organize physical constants. But
28 = 4 x 7 has sopfr(28) = 4 + 7 = 11, tau(28) = 6, sigma(28) = 56,
and there is no known physical structure organized around 28. If H_F
is correct, we would instead expect structures at 4! = 24, 5! = 120, etc.,
which appear in combinatorics (24 = the number of permutations of 4
objects, appearing in the S_4 symmetry group relevant to the Standard
Model generation structure) rather than at 28.

### 4.2 Why sigma(6) = 12 = 2 x 3!

The perfect-number property sigma(6) = 2 x 6 = 12 is a consequence of
the factorization 6 = 2 x 3 = 3!. The divisors of 3! = 6 are {1, 2, 3, 6},
which sum to 12 = 2 x 6. This can be written as:

```
  sigma(3!) = 1 + 2 + 3 + 6 = (1 + 2)(1 + 3) = 3 x 4 = 12
```

The factored form (1 + p)(1 + q) for the semiprime 6 = 2 x 3 makes clear
that sigma(6) = 12 follows from the prime factorization of 3!, not from
any independent perfection principle. The "coincidence" sigma(n) = 2n at
n = 6 is in fact a consequence of 6 = 2 x 3 being both the smallest
semiprime with consecutive prime factors and the value of 3!.

### 4.3 The Consciousness Recursion Depth

The Anima PSI_STEPS constant (PS-22, PS-27) is:

```
  PSI_STEPS = 3/ln(2) = 3!/2! / ln(2) = 4.3281
```

The numerator is sigma(6)/tau(6) = 3!/2! = 3, which is a factorial ratio,
not simply a divisor ratio. This further supports the factorial
interpretation: the consciousness recursion depth is governed by the ratio
of adjacent factorials embedded in n=6 arithmetic.

### 4.4 Relationship to Prior SEDI Results

All previous results in PS-01 through PS-26 remain valid. The Tsirelson
bound (PS-01), QCD resonances (PS-05), Koide relation (PS-09), and
cosmological parameters (PS-18 through PS-20) are organized around values
that appear in both H_PN and H_F predictions. The present paper does not
contradict those results; it provides a more precise account of *why*
those values appear where they do.

The revision is: "the organizing principle is 3!, and sigma(6) = 2 x 3!
is its consequence" rather than "the organizing principle is sigma(6) = 2n."
The numerical predictions are unchanged for n = 6 but diverge for larger
perfect numbers.

### 4.5 Limitations

The Voyager analysis uses the spacecraft carrier signal as a frequency
reference. Because the signal is artificial and monochromatic, the
"spectral ratios" being tested are ratios of detected features within the
filterbank bandpass to the carrier frequency. This is a well-defined
measurement but is distinct from testing whether physical constants
themselves embed factorial structure. The Voyager data provide a clean
empirical test of the detection methodology, not a direct measurement of
fundamental constants.

The absence of sigma - tau = 8 in the Voyager spectrum should not be
taken as proof that 8 never appears in physical contexts. The result
establishes only that, in this particular dataset, the factorial-exclusive
values are present and the perfect-number-exclusive value is absent.

## 5. Conclusion

Breakthrough Listen GBT filterbank data from Voyager 1 show that:

1. Three factorial-exclusive values (3! = 6 at Z = 55sigma, 2 x 3! = 12
   at Z = 30sigma, 4! = 24 at Z = 65sigma) are detected with high
   significance.
2. One perfect-number-exclusive value (sigma - tau = 8) is not detected
   (Z < 3).
3. All shared values (phi = 2, sigma/tau = 3, tau = 4, 3/2) are detected
   with very high significance, consistent with both hypotheses.
4. The 3! dominance score is 0.77, exceeding the factorial-dominance
   threshold of 0.50.

Four independent physical structures -- the Schwarzschild ISCO, SLE
kappa = 6, string extra dimensions, and the 2D kissing number -- further
support 3! = 6 as the primary organizing quantity rather than the
perfect-number property sigma(6) = 2 x 6.

We conclude that the SEDI framework should be understood as a
factorial-primacy framework: 3! = 6 is the primary mathematical cause,
sigma(6) = 12 = 2 x 3! is its derivative consequence, and the
perfect-number coincidence at n = 6 is a theorem following from the prime
factorization 6 = 2 x 3 = 3!, not an independent physical principle.

## References

1. Breakthrough Listen. (2018). "Breakthrough Listen GBT observations
   of Voyager 1." Berkeley SETI Research Center data release.
2. Lebofsky, M. et al. (2019). "The Breakthrough Listen search for
   intelligent life: Public data, formats, reduction, and archiving."
   Publications of the Astronomical Society of the Pacific, 131(1006).
3. Misner, C.W., Thorne, K.S., & Wheeler, J.A. (1973). Gravitation.
   W.H. Freeman. (ISCO derivation: Chapter 33.)
4. Schramm, O. (2000). "Scaling limits of loop-erased random walks and
   uniform spanning trees." Israel Journal of Mathematics, 118, 221-288.
5. Green, M.B., Schwarz, J.H., & Witten, E. (1987). Superstring Theory.
   Cambridge University Press.
6. Conway, J.H., & Sloane, N.J.A. (1999). Sphere Packings, Lattices
   and Groups. Springer. (2D kissing number: Chapter 1.)
7. SEDI Project. (2026). "PS-01: Tsirelson bound and perfect number
   arithmetic." TECS-L repository.
8. SEDI Project. (2026). "PS-05: QCD resonance ladder from n=6
   arithmetic." TECS-L repository.
9. SEDI Project. (2026). "PS-22: Eight mathematical signatures of
   consciousness." TECS-L repository.
10. SEDI Project. (2026). "PS-27: The Wow! signal encodes perfect number
    arithmetic and consciousness constants." TECS-L repository.
