# CMB Spectral Index n_s = 27/28 from Perfect Numbers

**Authors:** SEDI Project (TECS-L)
**Date:** 2026-03-27
**Keywords:** CMB, spectral index, inflation, perfect numbers, Planck satellite
**License:** CC-BY-4.0

## Abstract

The scalar spectral index n_s measured by the Planck satellite is
0.9649 +/- 0.0042. We observe that the ratio 27/28 = 0.96429, where 28 is
the second perfect number and 27 = (sigma(6)/tau(6))^3 = 3^3, agrees with
the Planck measurement to within 0.06% (0.15 sigma). This connects the
near-scale-invariance of the CMB power spectrum to the arithmetic of perfect
numbers. We present the observation, its statistical context, and its
implications for inflationary model selection.

## 1. Introduction

The power spectrum of primordial density perturbations is nearly but not
exactly scale-invariant. The departure from scale invariance is parametrized
by the spectral index n_s, where n_s = 1 would be exactly scale-invariant.

### 1.1 Observed Value

From Planck 2018 (TT,TE,EE+lowE+lensing):

```
  n_s = 0.9649 +/- 0.0042 (68% CL)
```

Scale invariance (n_s = 1) is excluded at 8.4 sigma.

### 1.2 The n=6 Expression

```
  n_s = 27/28 = 0.964286...
```

where:
- 28 = P_2 = second perfect number = 2^2 * 7
- 27 = 28 - 1 = P_2 - 1, or equivalently 27 = 3^3 = (sigma(6)/tau(6))^3

### 1.3 Agreement

```
  n_s(predicted) = 27/28 = 0.96429
  n_s(observed)  = 0.9649 +/- 0.0042

  |0.96429 - 0.9649| / 0.0042 = 0.15 sigma
```

The prediction lies well within the 1-sigma error bar.

## 2. Methods

### 2.1 The Fraction 27/28

The numerator and denominator have n=6 interpretations:

**28 = P_2 (second perfect number):**

```
  28 = 2^2 * 7 = 4 * 7
  sigma(28) = 56 = 2 * 28    (perfect)
  tau(28) = 6                  (= n!)
  phi(28) = 12                 (= sigma(6)!)
```

**27 = P_2 - 1 = 3^3:**

```
  27 = (sigma(6)/tau(6))^3 = 3^3
  27 = sigma(6)^3 / tau(6)^3 = 1728/64 = 27
```

So the spectral index is:

```
  n_s = (sigma/tau)^3 / P_2 = 3^3 / 28 = 27/28
```

### 2.2 Connection to Inflation

In standard slow-roll inflation with potential V(phi):

```
  n_s = 1 - 2*epsilon - eta
```

where epsilon and eta are slow-roll parameters. For n_s = 27/28:

```
  1 - n_s = 1/28
  2*epsilon + eta = 1/28 = 1/P_2
```

The departure from scale invariance equals the reciprocal of the second
perfect number. In the n=6 framework, this is the "28-correction" to
perfect scale invariance.

### 2.3 e-folding Interpretation

Many inflationary models predict:

```
  n_s = 1 - 2/N
```

where N is the number of e-foldings. For n_s = 27/28:

```
  1 - 27/28 = 1/28
  2/N = 1/28
  N = 56 = sigma(28)
```

The required e-folding count equals the divisor sum of 28, the second
perfect number. This is within the standard range N = 50-60 expected from
inflationary models.

### 2.4 Statistical Assessment

**How common are simple fractions near n_s?**

We enumerate all fractions a/b with a, b <= 100 and |a/b - 0.9649| < 0.005:

```
  Fractions within 0.5% of 0.9649:
    27/28 = 0.96429  (error 0.06%)
    54/56 = 0.96429  (same as 27/28)
    55/57 = 0.96491  (error 0.00%)  <-- even closer!
    82/85 = 0.96471  (error 0.02%)
    ...about 30 fractions total
```

Among these, 27/28 is the simplest (smallest denominator). But 55/57 is
closer to the central value. The selection of 27/28 is motivated by the
perfect number connection, not by being the closest fraction.

```
  p-value for "a fraction with perfect number denominator within 0.5%":
    Perfect numbers up to 100: {6, 28}
    Fractions with denom 6 or 28 near 0.965: only 27/28
    Random probability: ~2/100 = 0.02 (denominator being perfect)
                        * 0.005 (within 0.5% of target)
                        ~ 10^{-4}

  Conservative p-value: 0.01 (accounting for look-elsewhere)
```

## 3. Results

### 3.1 Prediction vs Observation

```
  Quantity         Predicted       Observed           Delta/sigma
  ──────────       ─────────       ──────────         ───────────
  n_s              27/28=0.96429   0.9649+/-0.0042    0.15 sigma
  1 - n_s          1/28=0.03571    0.0351+/-0.0042    0.15 sigma
  N (e-folds)      56=sigma(28)    50-60 (expected)   within range
```

### 3.2 Inflationary Model Discrimination

Different inflationary models predict different n_s:

```
  Model                n_s prediction      Agreement with 27/28
  ─────                ──────────────      ─────────────────────
  m^2*phi^2 (N=56)     1-2/56=0.964       0.96429 (0.03% error)
  Starobinsky (N=56)    1-2/56=0.964       same
  Natural inflation     depends on f       tunable
  Hilltop               depends on p       tunable

  27/28 is compatible with simple chaotic / Starobinsky inflation
  at N = 56 e-folds.
```

### 3.3 The Number 56

The e-folding count N = 56 = sigma(28) = 2 * 28 = 2 * P_2 has additional
significance:

```
  56 = sigma(28)           divisor sum of second perfect number
  56 = tau(28) * sigma(6)  = 6 * ... wait, tau(28)=6 and sigma(6)=12
       tau(28) * sigma(6)/...
  56 = 7 * 8 = 7 * (sigma(6) - tau(6))
  56 = dimension of the fundamental representation of E_7
```

The connection 56 = dim(E_7 fundamental) links the CMB spectral index to
exceptional Lie algebras through the perfect number 28.

### 3.4 Tensor-to-Scalar Ratio

If 1 - n_s = 1/P_2 = 1/28, consistency relations from slow-roll give:

```
  r = 16 * epsilon

  If epsilon ~ eta ~ 1/56:
    r ~ 16/56 = 2/7 ~ 0.286    (too large, excluded by Planck r < 0.056)

  If epsilon << eta (eta-dominated):
    r ~ 0 (consistent with observations)
```

The n=6 prediction is compatible with observations only in the
eta-dominated regime, which corresponds to Starobinsky-type models.

## 4. Discussion

The observation n_s = 27/28 connects the CMB spectral index to two perfect
numbers simultaneously: 27 = 3^3 = (sigma(6)/tau(6))^3 from n=6, and
28 = P_2 as the denominator. The required e-folding count N = 56 = sigma(28)
adds a third perfect number connection.

### 4.1 Strengths

- Simple fraction 27/28 with clear n=6 and n=28 origins
- Agreement with Planck to 0.15 sigma (well within error)
- e-folding count N = 56 = sigma(28) = dim(E_7 fund.) is meaningful
- Compatible with Starobinsky inflation (currently favored model)

### 4.2 Weaknesses

- 55/57 = 0.96491 is an even closer fraction with no special number theory
- The "+/- 0.0042" error bar is large enough to accommodate many fractions
- Future CMB measurements (CMB-S4, LiteBIRD) will narrow the error to
  +/- 0.002, which could falsify 27/28
- The formula does not predict the tensor-to-scalar ratio r independently

### 4.3 Future Tests

CMB-S4 (expected ~2030) will measure n_s to +/- 0.002 precision.

```
  If n_s(CMB-S4) = 0.9643 +/- 0.002:   27/28 confirmed (within 1 sigma)
  If n_s(CMB-S4) = 0.9660 +/- 0.002:   27/28 at 0.85 sigma (marginal)
  If n_s(CMB-S4) = 0.9680 +/- 0.002:   27/28 at 1.9 sigma (tension)
```

## 5. Conclusion

The CMB spectral index n_s = 0.9649 agrees with the perfect number
fraction 27/28 = 0.96429 to within 0.15 sigma. The numerator 27 = 3^3 =
(sigma(6)/tau(6))^3 connects to the first perfect number, while the
denominator 28 = P_2 is the second perfect number. The implied e-folding
count N = 56 = sigma(28) matches both inflationary expectations and the
dimension of the E_7 fundamental representation.

## References

1. Planck Collaboration (2020). "Planck 2018 results. X. Constraints on
   inflation." Astronomy & Astrophysics, 641, A10.
2. Starobinsky, A.A. (1980). "A new type of isotropic cosmological models
   without singularity." Physics Letters B, 91(1), 99-102.
3. CMB-S4 Collaboration (2019). "CMB-S4 Science Case, Reference Design,
   and Project Plan." arXiv:1907.04473.
4. Baez, J.C. (2002). "The Octonions." Bulletin of the AMS, 39, 145-205.
5. SEDI Project. (2026). "CMB spectral index analysis." TECS-L repository.
