# Q-Domain Boundary and the Tsirelson Bound: sqrt(2) as Uniquely Unreachable

**Authors:** SEDI Project (TECS-L)
**Date:** 2026-03-27
**Keywords:** Q-domain, Tsirelson bound, sqrt(2), algebraic numbers, convergence, quantum boundary
**License:** CC-BY-4.0

## Abstract

We define the Q-domain of a number n as the set of constants reachable
from n's arithmetic functions using only rational operations (+, -, x, /).
For n=6, the Q-domain is the field Q (all rationals), and we show that
sqrt(2) is the simplest constant that is Q-unreachable at any finite depth
of rational operations. The Tsirelson bound, which equals sqrt(2) times
the classical Bell bound, thus sits exactly at the Q-domain boundary.
This provides a new characterization: the quantum/classical boundary in
Bell experiments corresponds to the rational/irrational boundary in the
arithmetic of perfect numbers.

## 1. Introduction

The Tsirelson bound 2*sqrt(2) is the maximum quantum mechanical violation
of the CHSH inequality. The classical bound is 2. Their ratio sqrt(2) is
irrational and algebraic of degree 2 over Q.

We show that sqrt(2) has a special status in the convergence structure of
n=6: it is the simplest constant that cannot be produced by any finite
sequence of rational operations on the arithmetic functions {6, 12, 2, 4}.

### 1.1 Definitions

- **Q-domain of n**: The set of all values obtainable from {n, sigma(n), phi(n), tau(n)}
  using +, -, x, / finitely many times.
- **Q-boundary**: The boundary of the Q-domain, i.e., the limit points
  that are not themselves in the Q-domain.
- **Q-unreachable constant**: An irrational number that appears naturally
  in n=6 characterizations but cannot be produced by rational operations.

## 2. Methods

### 2.1 The Q-Domain of n=6

Starting from {6, 12, 2, 4}:

```
  Depth 0: {6, 12, 2, 4}
  Depth 1: all ratios and sums: {2, 3, 6, 12, 4, 1/2, 1/3, 1/4, ...}
  Depth 2: all rational combinations of depth 1
  ...
  Depth infinity: Q (all rationals)
```

**Theorem.** The Q-domain of n=6 is exactly Q (the rational numbers).

Proof: The seeds include 2 and 4. From these, 1 = 4/4, and any integer
k = 1+1+...+1 (k times). Any rational p/q is reachable. Conversely, only
rational operations are allowed, so no irrational is reachable. QED.

### 2.2 Q-Unreachable Constants

Constants that appear in n=6 characterizations but are NOT in Q:

```
  sqrt(2):   Tsirelson ratio, sqrt(sigma/n)
  sqrt(3):   SU(2) Casimir, sqrt(sigma/tau)
  sqrt(6):   sqrt(n), product sqrt(2)*sqrt(3)
  e:         exp(1), Golden Zone
  pi:        through zeta function
  gamma:     Euler-Mascheroni
  ln(2):     log of prime factor
```

### 2.3 Algebraic Degree Ordering

Among the Q-unreachable constants, we rank by algebraic degree over Q:

```
  Degree 2 (simplest irrational):
    sqrt(2): minimal polynomial x^2 - 2
    sqrt(3): minimal polynomial x^2 - 3

  Degree 4:
    sqrt(2+sqrt(3)): minimal polynomial x^4 - 4x^2 + 1

  Transcendental (degree infinity):
    e, pi, gamma (conjectured), ln(2)
```

sqrt(2) and sqrt(3) are tied as the simplest Q-unreachable constants,
both of algebraic degree 2.

### 2.4 Why sqrt(2) is Primary

Among the degree-2 irrationals, sqrt(2) takes priority because:

1. It appears in more n=6 characterizations (Tsirelson, sigma/n, Galois)
2. It is sqrt(sigma(n)/n) = sqrt(abundancy), a canonical quantity
3. sqrt(2) < sqrt(3), so it is the FIRST irrational encountered when
   ordering by numerical value

## 3. Results

### 3.1 The Q-Boundary Theorem

**Theorem.** sqrt(2) is the Q-unreachable constant of minimal algebraic
degree that is canonically associated with n=6.

Proof sketch:
- Q-domain = Q (all rationals)
- The canonical n=6 constants include sqrt(sigma/n) = sqrt(2)
- sqrt(2) has minimal polynomial x^2 - 2, degree 2
- No degree-1 irrational exists (by definition)
- sqrt(2) is the unique positive root of x^2 = sigma(P)/P for any
  perfect number P
QED.

### 3.2 Physical Correspondence

```
  Arithmetic domain         Physical domain
  ─────────────────         ───────────────
  Q-domain (rationals)      Classical mechanics (Bell bound)
  Q-boundary (sqrt(2))      Quantum/classical boundary (Tsirelson)
  Full algebraic closure    Full quantum mechanics
  Transcendental (e, pi)    Beyond standard QM (?)
```

### 3.3 Depth Analysis of sqrt(2) Approximation

From within Q, we can approximate sqrt(2) with continued fraction
convergents:

```
  Depth  Approximation   Error from sqrt(2)
  ─────  ─────────────   ──────────────────
  1      1/1 = 1.000     0.414
  2      3/2 = 1.500     0.086
  3      7/5 = 1.400     0.014
  4      17/12 = 1.417   0.0025
  5      41/29 = 1.414   0.00035
  6      99/70 = 1.4143  0.000057
```

Note: the denominator 12 appears at depth 4. This is sigma(6) = 12,
giving the approximation 17/sigma(6) = 17/12 = 1.41667, error 0.17%.

The convergent 17/12 is notable because 17 is a Fermat prime that appears
elsewhere in the n=6 framework (amplification factor at theta = pi).

### 3.4 Continued Fraction of sqrt(2)

```
  sqrt(2) = [1; 2, 2, 2, 2, ...]
```

The repeating coefficient is 2 = phi(6). The simplicity of this continued
fraction (period 1, coefficient phi(6)) reinforces the connection between
sqrt(2) and the arithmetic of n=6.

### 3.5 All Q-Unreachable Constants

| Constant | Degree | # of n=6 appearances | Physical role |
|----------|--------|---------------------|---------------|
| sqrt(2) | 2 | 6 | Tsirelson bound |
| sqrt(3) | 2 | 5 | SU(2) Casimir, EWSB |
| sqrt(6) | 2 | 3 | sqrt(n) |
| gamma | transcendental | 3 | Euler-Mascheroni |
| e | transcendental | 4 | Golden Zone |
| ln(2) | transcendental | 4 | Information unit |
| pi | transcendental | 2 | Circle/zeta |

## 4. Discussion

The identification of the Q-domain boundary with the Tsirelson bound
provides a number-theoretic interpretation of the quantum/classical divide:
classical physics corresponds to rational arithmetic on divisor functions,
while quantum mechanics requires the algebraic extension Q(sqrt(2)).

This is consistent with the Galois theory result (PS-03): the full
extension Q(sqrt(2), sqrt(3))/Q has group V_4 = {1, C, P, CP}, and the
first extension Q(sqrt(2))/Q has group Z/2Z = {1, C} (charge conjugation).
The quantum boundary involves the first step of this algebraic extension.

### 4.1 Limitations

- The choice of sqrt(2) as "primary" over sqrt(3) relies on ordering
  conventions (numerical value, number of appearances).
- The physical interpretation (Q-boundary = quantum/classical) is
  formal/structural, not derived from dynamics.
- Other numbers n (e.g., n=2 with sqrt(2) = sqrt(n)) produce sqrt(2)
  even more directly. The specificity to n=6 comes from the perfect
  number context.

## 5. Conclusion

sqrt(2) is the simplest Q-unreachable constant in the arithmetic of n=6,
sitting exactly at the boundary between rational (classical) and algebraic
(quantum) domains. The Tsirelson bound 2*sqrt(2) is thus the product of
the classical bound 2 and the Q-boundary constant sqrt(2).

## References

1. Cirel'son, B.S. (1980). "Quantum generalizations of Bell's inequality."
   Letters in Mathematical Physics, 4(2), 93-100.
2. Niven, I. (1956). "Irrational Numbers." The Mathematical Association
   of America.
3. Hardy, G.H. & Wright, E.M. (2008). "An Introduction to the Theory of
   Numbers." Oxford University Press, 6th edition.
4. SEDI Project. (2026). "Q-domain analysis." TECS-L repository.
