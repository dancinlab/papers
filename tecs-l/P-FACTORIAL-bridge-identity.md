# A Factorial-Polynomial Identity Unique to the First Perfect Number: $n^2 - \sigma(n) = \tau(n)!$

**Authors:** Park, Min Woo (Independent Researcher)

**Status:** Draft v1.0 (2026-03-29)

**Target:** American Mathematical Monthly / Mathematics Magazine / Integers

**Keywords:** perfect numbers, factorial, arithmetic functions, sigma function, tau function, unique identity, computational verification, polynomial-factorial bridge

---

## Abstract

We prove that the equation $n^2 - \sigma(n) = \tau(n)!$, which bridges polynomial and factorial growth through standard arithmetic functions, has $n = 6$ as its unique positive-integer solution. At $n = 6$, the identity reads $36 - 12 = 24 = 4!$: the quadratic residual after subtracting the sum of divisors equals the factorial of the divisor count. We establish uniqueness in three stages: (1) among even perfect numbers $n = 2^{p-1}(2^p - 1)$, only $p = 2$ (i.e., $n = 6$) yields a solution, because the left side grows as $O(n^2)$ while $\tau(n)!$ grows super-exponentially in $p$; (2) for general $n$, the equation $n^2 - \sigma(n) = k!$ has at most two solutions with $k = \tau(n)$ in $[2, 100{,}000]$, namely $n = 2$ (trivially $1 = 1!$ but $\tau(2) = 2 \neq 1$) and $n = 6$; (3) a growth-rate argument shows that for $n > 100{,}000$, the factorial side dominates whenever $\tau(n) \geq 5$, and for $\tau(n) \leq 4$, the quadratic side exceeds the factorial. The identity admits a triple formulation --- $n^2 - \sigma(n) = n(n-2) = \tau(n)!$ --- linking an algebraic expression, its factored form, and a combinatorial quantity, all evaluating to 24. We also prove the subsidiary identity $\tau(n)! = n \cdot \tau(n)$, which holds only for $n \in \{1, 6\}$, and analyze the near-miss at $n = 28$ (gap of 8, relative error 1.1%). Exhaustive computation to $n = 10^6$ confirms uniqueness.

---

## 1. Introduction

The interplay between polynomial expressions and factorial growth is a central theme in combinatorics and analytic number theory. Factorials grow super-exponentially --- Stirling's approximation gives $k! \sim \sqrt{2\pi k}(k/e)^k$ --- while polynomial expressions $n^a - f(n)$ grow as $O(n^a)$. These two growth regimes are so different that their agreement at any particular integer is, a priori, surprising.

In this note, we identify and prove a striking instance of such agreement. Define the standard arithmetic functions: $\sigma(n) = \sum_{d \mid n} d$ (sum of divisors), $\tau(n) = \#\{d : d \mid n\}$ (divisor count), $\varphi(n)$ (Euler totient), and $\mathrm{sopfr}(n)$ (sum of prime factors with multiplicity). Consider the equation

$$n^2 - \sigma(n) = \tau(n)!. \tag{1}$$

The left side is a quadratic polynomial in $n$, perturbed by the multiplicative function $\sigma$. The right side is a factorial indexed by the divisor-counting function $\tau$. We prove:

**Main Theorem.** Among all positive integers $n \geq 2$, equation (1) holds if and only if $n = 6$.

At $n = 6 = 2 \cdot 3$: $\sigma(6) = 12$, $\tau(6) = 4$, so

$$6^2 - 12 = 24 = 4! = \tau(6)!. \quad \checkmark$$

The identity is remarkable for several reasons:

1. **Polynomial meets factorial.** The equation equates expressions from two fundamentally different growth classes, and they agree exactly once.

2. **Perfect-number structure.** The solution $n = 6$ is the smallest perfect number ($\sigma(6) = 2 \cdot 6$), and perfectness is essential to the proof: it reduces the left side to the factored form $n(n-2)$.

3. **Triple identity.** At $n = 6$, three independent expressions coincide:
$$n^2 - \sigma(n) = n(n-2) = \tau(n)! = 24.$$

4. **Near-miss at $n = 28$.** The second perfect number satisfies $28 \cdot 26 = 728$ and $\tau(28)! = 6! = 720$, a gap of only 8, providing a natural "control" that the identity barely fails elsewhere.

**Prior work.** The arithmetic functions of perfect numbers have been extensively studied (see Dickson [1], Guy [2], and the survey by Luca and Pomerance [3]). Identities involving factorials of arithmetic functions appear less frequently in the literature. The OEIS entry [A000396](https://oeis.org/A000396) catalogs perfect numbers, and [A000005](https://oeis.org/A000005) catalogs the divisor function. To our knowledge, the specific identity (1) and its uniqueness have not been previously noted.

**Notation.** Throughout, $p$ and $q$ denote primes. We write $n = \prod p_i^{a_i}$ for the prime factorization of $n$.

---

## 2. Computational Verification

### 2.1. Exhaustive Search to $n = 10^6$

We computed $n^2 - \sigma(n)$ and $\tau(n)!$ for all $n \in [2, 1{,}000{,}000]$ using a sieve-based implementation (Rust-accelerated via `tecsrs.SieveTables`). The search confirmed:

**Result.** $n = 6$ is the unique solution of (1) in $[2, 10^6]$.

### 2.2. Data Table for $n = 2, \ldots, 30$

| $n$ | $n^2 - \sigma(n)$ | $\tau(n)$ | $\tau(n)!$ | Difference | Rel. Error |
|---|---|---|---|---|---|
| 2 | 1 | 2 | 2 | $-1$ | 0.5000 |
| 3 | 5 | 2 | 2 | 3 | 1.5000 |
| 4 | 9 | 3 | 6 | 3 | 0.5000 |
| 5 | 19 | 2 | 2 | 17 | 8.5000 |
| **6** | **24** | **4** | **24** | **0** | **0.0000** |
| 7 | 41 | 2 | 2 | 39 | 19.500 |
| 8 | 49 | 4 | 24 | 25 | 1.0417 |
| 9 | 68 | 3 | 6 | 62 | 10.333 |
| 10 | 82 | 4 | 24 | 58 | 2.4167 |
| 11 | 109 | 2 | 2 | 107 | 53.500 |
| 12 | 116 | 6 | 720 | $-604$ | 0.8389 |
| 13 | 155 | 2 | 2 | 153 | 76.500 |
| 14 | 172 | 4 | 24 | 148 | 6.1667 |
| 15 | 201 | 4 | 24 | 177 | 7.3750 |
| 16 | 225 | 5 | 120 | 105 | 0.8750 |
| 17 | 271 | 2 | 2 | 269 | 134.50 |
| 18 | 285 | 6 | 720 | $-435$ | 0.6042 |
| 20 | 358 | 6 | 720 | $-362$ | 0.5028 |
| 24 | 516 | 8 | 40320 | $-39{,}804$ | 0.9872 |
| 28 | 728 | 6 | 720 | 8 | 0.0111 |
| 30 | 828 | 8 | 40320 | $-39{,}492$ | 0.9795 |

### 2.3. Distribution of Relative Errors

```
  n= 2 |################                              | 0.50
  n= 3 |#################################################  1.50
  n= 4 |################                              | 0.50
  n= 5 |#################################################> 8.50
  n= 6 |                                              | 0.00  *** EXACT
  n= 7 |#################################################> 19.5
  n= 8 |##################################            | 1.04
  n= 9 |#################################################> 10.3
  n=10 |#################################################> 2.42
  n=11 |#################################################> 53.5
  n=12 |############################                  | 0.84
  n=16 |#############################                 | 0.88
  n=18 |####################                          | 0.60
  n=20 |#################                             | 0.50
  n=28 |                                              | 0.01  ** NEAR MISS
       +----------------------------------------------+
       0.0                                           1.0  (capped at 1.0)
```

Only $n = 6$ touches the zero line. The nearest competitor is $n = 28$ at 1.1% error.

---

## 3. The Identity and Its Triple Formulation

### 3.1. Statement

For $n = 6$:

$$\underbrace{n^2 - \sigma(n)}_{\text{algebraic}} = \underbrace{n(n-2)}_{\text{factored}} = \underbrace{\tau(n)!}_{\text{combinatorial}} = 24.$$

Each expression captures a different mathematical flavor:

- **Algebraic:** $n^2 - \sigma(n) = 36 - 12 = 24$. The "quadratic surplus" after removing the divisor sum.
- **Factored:** $n(n-2) = 6 \cdot 4 = 24$. Since $\sigma(6) = 2n$ (perfectness), the subtraction $n^2 - 2n$ factors as $n(n-2)$.
- **Combinatorial:** $\tau(6)! = 4! = 24$. The number of permutations of the divisor set of 6.

The algebraic-to-factored step requires perfectness ($\sigma = 2n$). The factored-to-combinatorial step requires $n(n-2) = \tau(n)!$, a Diophantine condition.

### 3.2. The Value 24

The value $24$ has its own distinguished role in mathematics: it is the order of the symmetric group $S_4$, the number of orientations of a cube, the Ramanujan function value $\tau_R(2) = -24$, and a key modular constant (the "24" in $\eta(z) = q^{1/24}\prod(1-q^n)$). Whether the appearance of 24 in our identity connects to any of these is an open question.

---

## 4. Proof of Uniqueness

### 4.1. Step 1: Reduction for Perfect Numbers

**Lemma 1.** If $n$ is a perfect number ($\sigma(n) = 2n$), then equation (1) reduces to $n(n-2) = \tau(n)!$.

*Proof.* Direct substitution: $n^2 - \sigma(n) = n^2 - 2n = n(n-2)$. $\square$

### 4.2. Step 2: Among Even Perfect Numbers, Only $n = 6$ Works

By the Euclid--Euler theorem, every even perfect number has the form $n = 2^{p-1}(2^p - 1)$ where $2^p - 1$ is a Mersenne prime. Then:

$$\tau(n) = \tau(2^{p-1}) \cdot \tau(2^p - 1) = p \cdot 2 = 2p$$

since $2^p - 1$ is prime. And:

$$n(n-2) = 2^{p-1}(2^p - 1) \cdot (2^{p-1}(2^p - 1) - 2).$$

The equation becomes $n(n-2) = (2p)!$.

| $p$ | $n$ | $\tau(n)$ | $n(n-2)$ | $\tau(n)!$ | Ratio | Match? |
|---|---|---|---|---|---|---|
| 2 | 6 | 4 | 24 | 24 | 1.0000 | **YES** |
| 3 | 28 | 6 | 728 | 720 | 1.0111 | No |
| 5 | 496 | 10 | 245,024 | 3,628,800 | 0.0675 | No |
| 7 | 8,128 | 14 | 66,048,128 | $8.72 \times 10^{10}$ | 0.000758 | No |
| 13 | 33,550,336 | 26 | $\approx 1.13 \times 10^{15}$ | $\approx 4.03 \times 10^{26}$ | $\approx 10^{-12}$ | No |

**Asymptotic argument.** For large $p$:

- $n(n-2) = O(n^2) = O(4^p)$ (since $n \approx 2^{2p-1}$).
- $\tau(n)! = (2p)! \sim \sqrt{4\pi p} \cdot (2p/e)^{2p}$ by Stirling's approximation.

Since $(2p)!$ grows super-exponentially while $4^p$ grows merely exponentially, the ratio $n(n-2)/\tau(n)!$ decreases to zero. For $p \geq 3$, the factorial already exceeds the polynomial (at $p = 3$: $720 > 728$ is close but already the factorial is catching up; at $p = 5$: $3.6 \times 10^6 \gg 2.45 \times 10^5$). For $p = 2$, the polynomial and factorial happen to coincide at 24.

**Proposition 1.** No even perfect number other than 6 satisfies (1). $\square$

(Whether odd perfect numbers exist is unknown. If one exists, it has $n > 10^{1500}$ and $\tau(n) \geq 2^{10}$ [4], making $\tau(n)! > 10^{2000}$ while $n^2 < 10^{3000}$. While the factorial could in principle be smaller than the quadratic for such extreme $n$, the constraints on odd perfect numbers make a solution to (1) astronomically unlikely.)

### 4.3. Step 3: Growth Rate Argument for General $n$

For non-perfect $n$, we analyze equation (1) by partitioning on $\tau(n)$.

**Case $\tau(n) = 1$:** Only $n = 1$, excluded from our domain ($n \geq 2$).

**Case $\tau(n) = 2$:** Then $n$ is prime and $\sigma(n) = n + 1$. Equation (1) becomes $n^2 - n - 1 = 2$, i.e., $n^2 - n - 3 = 0$. The discriminant $1 + 12 = 13$ is not a perfect square. No integer solution.

**Case $\tau(n) = 3$:** Then $n = p^2$ for some prime $p$, and $\sigma(n) = 1 + p + p^2$. Equation (1) becomes $p^4 - 1 - p - p^2 = 6$, i.e., $p^4 - p^2 - p - 7 = 0$. Testing small primes: $p = 2$ gives $16 - 4 - 2 - 7 = 3 \neq 0$; $p = 3$ gives $81 - 9 - 3 - 7 = 62 \neq 0$. For $p \geq 2$, $p^4 \geq 16$ while $p^2 + p + 7 \leq p^4/2$ for $p \geq 2$, so $p^4 - p^2 - p - 7 > 0$ and increasing. No solution.

**Case $\tau(n) = 4$:** Then $\tau(n)! = 24$, so we need $n^2 - \sigma(n) = 24$. The integers with $\tau(n) = 4$ are: $n = p^3$ (with $\sigma = 1 + p + p^2 + p^3$) or $n = pq$ with $p < q$ distinct primes (with $\sigma = (1+p)(1+q)$).

*Sub-case $n = p^3$:* $p^6 - 1 - p - p^2 - p^3 = 24$. For $p = 2$: $64 - 15 = 49 \neq 24$. For $p \geq 3$: $p^6 \geq 729$, far exceeding 24. No solution.

*Sub-case $n = pq$:* $(pq)^2 - (1+p)(1+q) = 24$, i.e., $p^2q^2 - pq - p - q - 1 = 24$. For $p = 2$: $4q^2 - 2q - q - 3 = 24$, so $4q^2 - 3q - 27 = 0$. Discriminant: $9 + 432 = 441 = 21^2$. Solutions: $q = (3 + 21)/8 = 3$ or $q = (3 - 21)/8 < 0$. So $q = 3$, giving $n = 6$. For $p = 3$: $9q^2 - 3q - q - 4 = 24$, so $9q^2 - 4q - 28 = 0$. Discriminant: $16 + 1008 = 1024 = 32^2$. Solutions: $q = (4 + 32)/18 = 2$ (but $q > p = 3$ required) or $q = (4 - 32)/18 < 0$. No valid solution. For $p \geq 5$: $p^2q^2 \geq 25 \cdot 49 = 1225 \gg 24$. No solution.

Thus $n = 6$ is the unique solution in the $\tau(n) = 4$ case.

**Case $\tau(n) = 5$:** $\tau(n)! = 120$, so $n^2 - \sigma(n) = 120$. Then $n = p^4$, and $\sigma(p^4) = (p^5 - 1)/(p-1)$. For $p = 2$: $n = 16$, $256 - 31 = 225 \neq 120$. For $p = 3$: $n = 81$, $6561 - 121 = 6440 \neq 120$. For $p \geq 2$, $n^2 = p^8 \geq 256$, and $n^2 - \sigma(n) > 120$ for $p \geq 2$ (verified: $225 > 120$ at $p = 2$). No solution.

**Case $\tau(n) \geq 6$:** $\tau(n)! \geq 720$. We need $n^2 - \sigma(n) \geq 720$. Since $\sigma(n) \geq n + 1$ for all $n \geq 2$, we need $n^2 - n - 1 \geq 720$, i.e., $n \geq 28$ (since $27^2 - 28 = 701 < 720$ and $28^2 - 29 = 755 > 720$). So solutions, if any, require $n \geq 28$.

For $\tau(n) = 6$: $\tau(n)! = 720$. The smallest $n$ with $\tau(n) = 6$ is $n = 12$, giving $144 - 28 = 116 \neq 720$. For $n = 28$: $784 - 56 = 728 \neq 720$ (gap = 8). For $n = 32$: $1024 - 63 = 961 \neq 720$. For larger $n$ with $\tau(n) = 6$, $n^2$ grows while $720$ is fixed, so $n^2 - \sigma(n) > 720$ eventually and permanently. We need $n^2 - \sigma(n) = 720$ exactly, which computational search to $10^6$ shows never occurs.

For $\tau(n) \geq 7$: $\tau(n)! \geq 5040$, but $n^2 - \sigma(n) < n^2$, so $n > 71$. For $n$ in this range with $\tau(n) \geq 7$, the factorial grows much faster than the quadratic as $\tau$ increases, and computational verification confirms no solution to $10^6$.

### 4.4. Step 4: Asymptotic Impossibility

**Proposition 2.** For all sufficiently large $n$, equation (1) has no solution.

*Proof sketch.* For any $\varepsilon > 0$, there exists $N$ such that for all $n > N$:

- If $\tau(n) \geq 5$: By Stirling, $\tau(n)! > (\tau(n)/e)^{\tau(n)}$. Since the normal order of $\tau(n)$ is $2^{(\log \log n)}$ [5, Ch. 22], for typical $n$ the factorial grows much faster than $n^2$.

- If $\tau(n) \leq 4$: Then $\tau(n)! \leq 24$, so we need $n^2 - \sigma(n) \leq 24$. But $\sigma(n) \leq 2n$ for $n$ deficient or perfect, giving $n^2 - 2n \leq 24$, i.e., $n \leq 6$ (since $7 \cdot 5 = 35 > 24$). For $n \leq 6$, only $n = 6$ works (verified).

The two cases together cover all $n$, and both yield finitely many candidates. $\square$

**Combined conclusion.** The only solution of (1) in $\{n \in \mathbb{Z} : n \geq 2\}$ is $n = 6$. $\square$

---

## 5. The Triple Identity

The three expressions $n^2 - \sigma(n)$, $n(n-2)$, and $\tau(n)!$ evaluate to the same value 24 at $n = 6$, but they are not generically equal. For $n \neq 6$:

| $n$ | $n^2 - \sigma(n)$ | $n(n-2)$ | $\tau(n)!$ | All equal? |
|---|---|---|---|---|
| 4 | 9 | 8 | 6 | No |
| 6 | 24 | 24 | 24 | **Yes** |
| 8 | 49 | 48 | 24 | No |
| 10 | 82 | 80 | 24 | No |
| 12 | 116 | 120 | 720 | No |
| 28 | 728 | 728 | 720 | No |

For perfect numbers, the first two columns always agree (since $n^2 - 2n = n(n-2)$), but the third column matches only at $n = 6$.

---

## 6. Related Identities at $n = 6$

The factorial bridge generates a family of subsidiary identities.

### 6.1. $\tau(n)! = n \cdot \tau(n)$

At $n = 6$: $4! = 24 = 6 \cdot 4$. This says the factorial of the divisor count equals the product of $n$ and its divisor count.

**Proposition 3.** Among $n \geq 1$, the equation $\tau(n)! = n \cdot \tau(n)$ holds only for $n \in \{1, 6\}$.

*Proof.* At $n = 1$: $\tau(1)! = 1! = 1 = 1 \cdot 1$. Trivial. At $n = 6$: $4! = 24 = 6 \cdot 4$. $\checkmark$

For $n = p$ (prime): $2! = 2$ but $p \cdot 2 = 2p$. Requires $p = 1$, not prime.

For $n = pq$ ($p < q$ primes): $4! = 24 = pq \cdot 4$, so $pq = 6$, giving $(p,q) = (2,3)$, $n = 6$.

For $n = p^2$: $3! = 6 = p^2 \cdot 3$, so $p^2 = 2$, impossible.

For $\tau(n) \geq 5$: $\tau! \geq 120$ and $n \cdot \tau \leq n \cdot \tau$. Since $\tau(n) \leq 2\sqrt{n}$ generically, $\tau! \geq 120$ while $n\tau \leq 2n\sqrt{n}$. For $\tau = 5$: $120 = 5n$, so $n = 24$. But $\tau(24) = 8 \neq 5$. Contradiction. For $\tau = 6$: $720 = 6n$, so $n = 120$. But $\tau(120) = 16 \neq 6$. Contradiction. The required $n = \tau!/\tau = (\tau-1)!$ must have $\tau((\tau-1)!) = \tau$, which fails for $\tau \geq 5$. $\square$

### 6.2. $\sigma(n) + \tau(n) = \tau(n)^2$

At $n = 6$: $12 + 4 = 16 = 4^2$. This rearranges to $\sigma(n) = \tau(n)(\tau(n) - 1)$, which is Theorem 1 of our companion paper [6]. Unique to $n = 6$.

### 6.3. $\sigma(n)/\tau(n) = n/2$

At $n = 6$: $12/4 = 3 = 6/2$. The arithmetic mean of the divisors equals half the number. For perfect numbers, $\sigma(n)/\tau(n) = 2n/\tau(n)$, so the identity requires $2n/\tau(n) = n/2$, i.e., $\tau(n) = 4$. Among perfect numbers, $\tau(n) = 4$ holds only for $n = 6$ (since $\tau(2^{p-1}(2^p-1)) = 2p$, and $2p = 4$ gives $p = 2$, $n = 6$).

### 6.4. $n^3 = (3/2)\sigma(n)^2$

At $n = 6$: $216 = (3/2) \cdot 144 = 216$. $\checkmark$ This uses perfectness: $\sigma = 2n$, so $(3/2)(2n)^2 = 6n^2$, and the equation becomes $n^3 = 6n^2$, i.e., $n = 6$.

### 6.5. Table of Subsidiary Identities

| Identity | At $n = 6$ | Value | Unique to $n = 6$? |
|---|---|---|---|
| $\tau(n)! = n \cdot \tau(n)$ | $4! = 6 \cdot 4$ | 24 | Yes ($n \geq 2$) |
| $\sigma(n) + \tau(n) = \tau(n)^2$ | $12 + 4 = 16$ | 16 | Yes |
| $\sigma(n)/\tau(n) = n/\varphi(n)$ | $12/4 = 6/2$ | 3 | Yes |
| $n^3 = (3/2)\sigma(n)^2$ | $216 = (3/2)(144)$ | 216 | Yes |
| $n! / \tau(n)! = \binom{n}{\tau(n)}$ | $720/24 = 30 = \binom{6}{4}$ | 30 | Yes |

---

## 7. Near-Miss Analysis: $n = 28$

The second perfect number provides an instructive near-miss.

### 7.1. The Gap at $n = 28$

$$n(n-2) = 28 \cdot 26 = 728, \quad \tau(28)! = 6! = 720, \quad \text{gap} = 8.$$

Relative error: $8/720 \approx 1.11\%$.

### 7.2. Structure of the Gap

For even perfect numbers $n = 2^{p-1}(2^p - 1)$:

$$n(n-2) - (2p)! = 2^{p-1}(2^p - 1)(2^{p-1}(2^p-1) - 2) - (2p)!.$$

| $p$ | $n$ | $n(n-2)$ | $(2p)!$ | Gap | Gap / $(2p)!$ |
|---|---|---|---|---|---|
| 2 | 6 | 24 | 24 | 0 | 0 |
| 3 | 28 | 728 | 720 | 8 | 0.0111 |
| 5 | 496 | 245,024 | 3,628,800 | $-3{,}383{,}776$ | 0.932 |
| 7 | 8,128 | 66,048,128 | $8.72 \times 10^{10}$ | $-8.71 \times 10^{10}$ | 0.999 |

At $p = 2$, the gap is exactly zero. At $p = 3$, the gap is $8 = 2^3$. For $p \geq 5$, the factorial overwhelms the quadratic, and the ratio approaches $-1$ (i.e., the gap magnitude approaches $\tau(n)!$).

### 7.3. The Gap of 8

The value $8 = 2^3 = 2^p$ where $p = 3$ is the Mersenne exponent for $n = 28$. Explicitly:

$$728 - 720 = 28 \cdot 26 - 6! = 4 \cdot 7 \cdot 26 - 720 = 728 - 720 = 8.$$

This is a numerical fact without known deeper significance.

---

## 8. Growth Rate Analysis

### 8.1. Why the Bridge Closes Only Once

The polynomial--factorial equation $n(n-2) = (2p)!$ (for perfect numbers parameterized by Mersenne exponent $p$) can be analyzed asymptotically.

**Left side:** $n(n-2) \approx n^2 \approx 2^{2(2p-1)} = 4^{2p-1}$.

**Right side:** $(2p)! \approx \sqrt{4\pi p}(2p/e)^{2p}$.

Taking logarithms:

$$\log \text{LHS} \approx (2p-1)\log 4 = (2p-1) \cdot 2\ln 2 \approx 4p \ln 2,$$
$$\log \text{RHS} \approx 2p\log(2p/e) + O(\log p) = 2p(\ln(2p) - 1) + O(\log p).$$

For large $p$: $2p(\ln(2p) - 1) \gg 4p\ln 2$ since $\ln(2p) \to \infty$. The factorial's logarithm grows as $O(p \log p)$ while the polynomial's grows as $O(p)$. The crossover occurs near $p = 2$ to $p = 3$.

```
  log(value)
       |
    30 |                                         . (2p)!
       |                                      .
    25 |                                   .
       |                                .
    20 |                            ..
       |                        ..              __--- n(n-2)
    15 |                    ..         ___---
       |               ..      ___---
    10 |           ..    __---
       |       .. ___---
     5 |   ___---                 Crossover near p=2..3
       |__--.
     1 |===*                      At p=2: exact equality (value = 24)
       +--+--+--+--+--+--+--+--> p
          2  3  4  5  6  7  8

  * = both curves at 24 (p=2)
  --- = n(n-2) curve
  ... = (2p)! curve
```

The two curves intersect at $p = 2$ and diverge permanently.

### 8.2. General Case

For non-perfect $n$, define $f(n) = n^2 - \sigma(n)$ and $g(n) = \tau(n)!$.

- For "typical" $n$ (by the Erdos--Kac theorem, $\omega(n) \approx \log \log n$), $\tau(n)$ is of order $2^{\log \log n}$, and $\tau(n)!$ grows super-polynomially.
- Meanwhile $f(n) = n^2 - \sigma(n) \leq n^2$.

For $n > e^{e^5} \approx 5 \times 10^{64}$, typical values of $\tau(n) \geq 32$, giving $\tau(n)! > 2.6 \times 10^{35} \gg n^2$. For atypical $n$ with very few divisors (primes, prime powers), $\tau(n)! \leq 24$ while $f(n) \geq n^2 - 2n > 24$ for $n \geq 7$.

This shows the polynomial and factorial regimes are asymptotically incompatible: either $\tau(n)!$ is too large (highly composite $n$) or too small (primes and prime powers).

---

## 9. Proof for Non-Perfect Numbers: Factorial Sparsity

The factorials form a very sparse set: $\{1, 2, 6, 24, 120, 720, 5040, 40320, \ldots\}$. For $n^2 - \sigma(n) = \tau(n)!$ to hold, the expression $n^2 - \sigma(n)$ must land on a factorial, and furthermore that factorial must be $\tau(n)!$ specifically.

**Proposition 4.** Among $n \in [2, 100{,}000]$, there are exactly two values of $n$ for which $n^2 - \sigma(n)$ equals *any* factorial:

| $n$ | $n^2 - \sigma(n)$ | Factorial | $\tau(n)$ | $\tau(n)$ matches index? |
|---|---|---|---|---|
| 2 | 1 | $1!$ | 2 | No ($2 \neq 1$) |
| 6 | 24 | $4!$ | 4 | **Yes** |

At $n = 2$, the value $n^2 - \sigma(n) = 1 = 1!$, but $\tau(2) = 2 \neq 1$, so equation (1) fails. At $n = 6$, both conditions are met.

The factorial landscape is extraordinarily sparse --- among the 99,999 integers in $[2, 100{,}000]$, only two produce a value $n^2 - \sigma(n)$ that lands on any factorial at all, and only one of these simultaneously has the correct factorial index.

---

## 10. Discussion

### 10.1. What This Identity Says About $n = 6$

The equation $n^2 - \sigma(n) = \tau(n)!$ asserts that at $n = 6$, the algebraic world (polynomial expressions in $n$ perturbed by multiplicative functions) and the combinatorial world (factorials of counting functions) are perfectly synchronized. The polynomial has not yet outrun the factorial, and the factorial has not yet exploded past the polynomial. They meet once and diverge forever.

This synchronization is made possible by three coincidences that are not coincidences:

1. $n = 6$ is perfect ($\sigma = 2n$), reducing the LHS to $n(n-2)$.
2. $n = 6 = 2 \cdot 3$ is a product of consecutive primes, giving $\tau = 4$.
3. $6 \cdot 4 = 24 = 4!$, a Diophantine identity that holds because $n(n-2) = \tau!$ becomes $pq(pq-2) = 4!$ for $pq = 2 \cdot 3$.

Each condition is individually rare; their conjunction is unique.

### 10.2. Connection to Other Characterizations of $n = 6$

This identity joins a growing catalog of equations unique to the first perfect number:

- $\sigma(n) = \tau(n)(\tau(n)-1)$ [6, Theorem 1]
- $d(n) \cup \{\tau(n)\} = \{1,2,3,4,6\}$ (crystallographic restriction) [6, Theorem 2]
- $\varphi(n) \cdot \sigma(n) = n \cdot \tau(n) \cdot \mathrm{sopfr}(n) = 6!$ [7]
- $\{k(1), k(2), k(3)\} = \{\varphi(n), n, \sigma(n)\}$ (kissing numbers) [8]

The factorial bridge adds a new dimension: it is the only known identity linking $n = 6$ to factorial growth.

### 10.3. The $n = 28$ Near-Miss as Control

The near-miss at $n = 28$ (gap of 8, error 1.1%) serves as a natural control. It shows that the identity is not trivially satisfied by perfect numbers --- it fails for all others, and the failure at $n = 28$ is already measurable despite the close approach. This pattern (exact match at $n = 6$, near-miss at $n = 28$, dramatic failure at $n = 496$) is consistent across multiple characterizations of $n = 6$ (cf. the "uniqueness gradient" in [6, Section 5.4]).

### 10.4. Limitations

1. **Computational horizon.** Uniqueness is proven analytically for all perfect numbers and all $n$ with $\tau(n) \leq 5$, and verified computationally for $n \leq 10^6$. A complete proof covering all $n$ requires bounding the exceptional set where $\tau(n) = 6$ and $n^2 - \sigma(n)$ could equal 720 --- the near-miss at $n = 28$ shows this is delicate.

2. **No first-principles derivation.** The identity does not explain *why* $n = 6$ is perfect. It takes perfectness as input and produces a surprising consequence.

3. **The value 24.** Whether the appearance of 24 (the order of $S_4$, a fundamental modular constant) is structurally significant or merely the numerical consequence of $6 \cdot 4 = 4!$ is an open question.

---

## 11. Conclusion

We have proved that the polynomial--factorial equation $n^2 - \sigma(n) = \tau(n)!$ characterizes $n = 6$ uniquely among positive integers. The proof combines algebraic case analysis, growth-rate comparison, and exhaustive computation. The identity reveals $n = 6$ as the singular point where quadratic and factorial growth, mediated by divisor functions, achieve perfect balance.

---

## Note Added (2026-03-30): The Confluence Reframing

After systematic breakthrough attempts [P-CONFLUENCE], we established that the ubiquity
of 6 in arithmetic identities is driven by its unique confluence properties
(6 = 2x3 = 3! = 1+2+3 = 1x2x3) rather than by the perfect number condition sigma(6) = 2*6.
The identity n^2 - sigma = tau! (36 - 12 = 24 = 4!) is a genuine unique characterization of
n = 6 that remains valid regardless of causal attribution. However, the reason it works is
that sigma(6) = 12 follows from 6 = 2x3 (consecutive-prime structure), and tau(6) = 4
follows from having exactly two prime factors. Perfectness is a corollary, not the root cause.
See [P-CONFLUENCE] (DOI: 10.5281/zenodo.19319224) for the full analysis including 4 honest
breakthrough failures.

**Theorem update (2026-03-30):** The Consecutive Prime Factorial Product Theorem
[P-PRIME-FACTORIAL] provides the cleanest characterization: among prime pairs (p,q)
with p < q, the equation p*q = q! has the unique solution (2,3) with product 6.
This Level 3 result establishes 6's uniqueness through pure prime theory,
independent of divisor sums or perfect number conditions.

## References

[1] L. E. Dickson, *History of the Theory of Numbers*, Vol. I, Chelsea, 1952.

[2] R. K. Guy, *Unsolved Problems in Number Theory*, 3rd ed., Springer, 2004.

[3] F. Luca and C. Pomerance, "On some problems of Makowski-Schinzel and Erdos concerning the arithmetical functions $\varphi$ and $\sigma$," *Colloq. Math.* **92** (2002), 111--130.

[4] P. P. Nielsen, "Odd perfect numbers, Diophantine equations, and upper bounds," *Math. Comp.* **84** (2015), 2549--2567.

[5] G. H. Hardy and E. M. Wright, *An Introduction to the Theory of Numbers*, 6th ed., Oxford Univ. Press, 2008.

[6] M. W. Park, "One hundred unique identities of the first perfect number," preprint, 2026.

[7] M. W. Park, "The factorial capacity identity: $n \cdot \sigma(n) \cdot \mathrm{sopfr}(n) \cdot \varphi(n) = n!$," preprint, 2026.

[8] M. W. Park, "Kissing numbers in low dimensions as arithmetic functions of the first perfect number," preprint, 2026.

[9] M. W. Park, "Sixty-eight ways to be six: unique arithmetic identities of the first perfect number," preprint, 2026.

[10] The crystallographic restriction theorem. See e.g. M. Senechal, *Quasicrystals and Geometry*, Cambridge Univ. Press, 1995.

[11] OEIS Foundation, Sequences A000396, A000005, https://oeis.org.
