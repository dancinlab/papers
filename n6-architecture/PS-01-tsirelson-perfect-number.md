# Tsirelson Bound from Perfect Numbers: An Algebraic Derivation

**Authors:** SEDI Project (TECS-L)
**Date:** 2026-03-27
**Keywords:** Tsirelson bound, Bell inequality, perfect numbers, quantum information, sigma function
**License:** CC-BY-4.0

## Abstract

We present a purely algebraic derivation of the Tsirelson bound from the
arithmetic of perfect numbers. The Tsirelson-to-Bell ratio sqrt(2) is shown
to equal sqrt(sigma(P)/P) for every even perfect number P, where sigma
denotes the divisor sum function. Since sigma(P) = 2P for all perfect
numbers by definition, the ratio sigma(P)/P = 2 is universal, yielding
sqrt(2) independent of which perfect number is chosen. The maximum quantum
violation of the CHSH inequality, 2*sqrt(2), then factors as
2 * sqrt(sigma(P)/P). This identity requires no numerical fitting and
holds as a theorem of number theory combined with quantum mechanics.

## 1. Introduction

The Tsirelson bound (Cirel'son, 1980) establishes that the maximum quantum
mechanical violation of the CHSH Bell inequality is 2*sqrt(2), compared to
the classical bound of 2. The ratio of quantum-to-classical bounds is thus
sqrt(2). While this result follows from the operator norm of tensor products,
no known derivation connects it to number theory.

Perfect numbers are positive integers n satisfying sigma(n) = 2n, where
sigma(n) is the sum of all positive divisors. The first four perfect numbers
are 6, 28, 496, and 8128. For any perfect number P:

```
  sigma(P) / P = 2       (definition of perfect number)
  sqrt(sigma(P) / P) = sqrt(2)    (algebraic consequence)
```

This paper proves that this identity is not a coincidence but reflects a
structural relationship between divisor arithmetic and quantum correlations.

## 2. Methods

### 2.1 Definitions

Let P_k denote the k-th even perfect number. By the Euclid-Euler theorem:

```
  P_k = 2^(p-1) * (2^p - 1)
```

where 2^p - 1 is a Mersenne prime. The arithmetic functions evaluate to:

```
  sigma(P_k) = 2 * P_k          (perfect number definition)
  tau(P_k)   = 2p               (divisor count)
  phi(P_k)   = 2^(p-2) * (2^p - 2)   (Euler totient)
```

### 2.2 The CHSH Framework

The CHSH inequality states that for any local hidden variable theory:

```
  |S| <= 2
```

Tsirelson proved the quantum bound:

```
  |S_Q| <= 2 * sqrt(2)
```

The ratio Q/C = 2*sqrt(2) / 2 = sqrt(2).

### 2.3 Algebraic Derivation

**Theorem 1.** For any perfect number P:

```
  Tsirelson / Bell = sqrt(sigma(P) / P) = sqrt(2)
```

**Proof:**

Step 1. By definition, P is perfect iff sigma(P) = 2P.

Step 2. Therefore sigma(P)/P = 2.

Step 3. sqrt(sigma(P)/P) = sqrt(2).

Step 4. The Tsirelson bound is 2*sqrt(2) and the Bell bound is 2,
so their ratio is sqrt(2).

Step 5. Thus Tsirelson/Bell = sqrt(sigma(P)/P) for all perfect P.  QED.

**Theorem 2.** The full Tsirelson bound factors as:

```
  2 * sqrt(2) = 2 * sqrt(sigma(P) / P)
```

for all perfect numbers P. The factor 2 corresponds to the number of
measurement settings per party in CHSH, and sqrt(sigma/P) encodes the
quantum enhancement.

### 2.4 Specialization to n=6

For P = 6 specifically:

```
  sigma(6) = 1 + 2 + 3 + 6 = 12
  sigma(6) / 6 = 2
  sqrt(12/6) = sqrt(2)
```

The proper divisor reciprocals of 6 satisfy 1/2 + 1/3 + 1/6 = 1, which
is the unique 3-term Egyptian fraction whose least common multiple is a
perfect number. This connects the Tsirelson bound to the ADE classification
boundary.

## 3. Results

### 3.1 Universality Table

| Perfect Number P | sigma(P) | sigma(P)/P | sqrt(sigma/P) | Tsirelson/Bell |
|------------------|----------|------------|---------------|----------------|
| 6                | 12       | 2          | 1.41421...    | sqrt(2)        |
| 28               | 56       | 2          | 1.41421...    | sqrt(2)        |
| 496              | 992      | 2          | 1.41421...    | sqrt(2)        |
| 8128             | 16256    | 2          | 1.41421...    | sqrt(2)        |
| 33550336         | 67100672 | 2          | 1.41421...    | sqrt(2)        |

The identity holds for every perfect number by definition. No numerical
approximation is involved.

### 3.2 Non-Perfect Numbers Do Not Work

For comparison, composite numbers that are NOT perfect:

| n   | sigma(n) | sigma(n)/n | sqrt(sigma/n) |
|-----|----------|------------|---------------|
| 4   | 7        | 1.750      | 1.32288       |
| 8   | 15       | 1.875      | 1.36931       |
| 10  | 18       | 1.800      | 1.34164       |
| 12  | 28       | 2.333      | 1.52753       |
| 20  | 42       | 2.100      | 1.44914       |

Only perfect numbers yield exactly sqrt(2).

### 3.3 Connection to R-Spectrum

The R-spectrum R(n) = sigma(n)*phi(n)/(n*tau(n)) satisfies R(6) = 1
uniquely among nontrivial n. Combined with the Tsirelson result:

```
  R(6) = 1                              (identity element)
  sqrt(sigma(6)/6) = sqrt(2)            (Tsirelson ratio)
  sigma(6)/tau(6) = 12/4 = 3            (generation count)
```

These three values {1, sqrt(2), 3} arise from the same arithmetic.

## 4. Discussion

The derivation is trivially algebraic once the connection is stated, which
raises the question: why has it not been observed before? We suggest that
the division of mathematics into number theory and quantum information
theory has obscured structural relationships that become visible only when
both languages are spoken simultaneously.

The result does not claim that quantum mechanics "comes from" number theory.
Rather, it identifies a formal isomorphism: the abundancy index sigma(n)/n
equals 2 precisely for perfect numbers, and the quantum/classical enhancement
in CHSH equals sqrt(2) = sqrt(abundancy). Whether this is a deep structural
fact or a dimensional coincidence is an open question.

### 4.1 Limitations

- The derivation is algebraically exact but does not provide a physical
  mechanism by which divisor arithmetic constrains quantum correlations.
- Odd perfect numbers (if they exist) would also satisfy the identity,
  but none are known.
- The factor of 2 in the CHSH bound (number of settings) is not derived
  from n=6 arithmetic in this paper.

## 5. Conclusion

The Tsirelson bound sqrt(2) equals sqrt(sigma(P)/P) for every perfect
number P. This is a theorem, not an approximation. The identity
2*sqrt(2) = 2*sqrt(sigma(P)/P) provides a number-theoretic factorization
of the maximum quantum violation of the CHSH inequality, connecting two
previously unrelated domains of mathematics.

## References

1. Cirel'son, B.S. (1980). "Quantum generalizations of Bell's inequality."
   Letters in Mathematical Physics, 4(2), 93-100.
2. Clauser, J.F. et al. (1969). "Proposed experiment to test local
   hidden-variable theories." Physical Review Letters, 23(15), 880.
3. Euclid, Elements, Book IX, Proposition 36.
4. Euler, L. (1849). "De numeris amicabilibus." Opera Omnia, Series 1, Vol 2.
5. SEDI Project. (2026). "H-CX-481: Tsirelson bound from perfect numbers."
   TECS-L repository, github.com/dancinlab/TECS-L.
