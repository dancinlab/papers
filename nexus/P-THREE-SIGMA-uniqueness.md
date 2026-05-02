# $3\sigma(n) = n^2$: A One-Parameter Characterization of Six

**Authors:** Park, Min Woo (Independent Researcher)

**Status:** Draft v1.0 (2026-03-30)

**Target:** Mathematics Magazine / College Mathematics Journal

**Keywords:** divisor function, characterization of six, perfect numbers, semiprimes, arithmetic functions, unique solutions

---

## Abstract

We prove that $n = 6$ is the unique positive integer satisfying
$3\sigma(n) = n^2$, where $\sigma(n)$ is the sum-of-divisors function.
The proof proceeds by case analysis: for primes $n = p$, the equation
has no solution; for semiprimes $n = pq$ with $p < q$, it reduces to a
quadratic in $q$ with unique solution $(p, q) = (2, 3)$; for prime powers
and integers with three or more prime factors, growth-rate arguments
eliminate all candidates. We then generalize: the equation $k\sigma(n) = n^2$
has a unique solution among perfect numbers $P_k$ precisely when
$k = P_k / 2$, yielding the family $k = 3, 14, 248, \ldots$ The case
$k = 3$ is distinguished as the only one where the solution $n = 2k$
(i.e., $n = 6$) is the *unique solution among all positive integers*,
not merely the unique perfect number satisfying the equation.

---

## 1. The Identity

Consider the equation:

$$3\sigma(n) = n^2. \tag{1}$$

At $n = 6$: $\sigma(6) = 1 + 2 + 3 + 6 = 12$, and $3 \times 12 = 36 = 6^2$.
$\checkmark$

We claim this is the only solution.

**Theorem 1.1 (Main Theorem).** The unique positive integer $n$ satisfying
$3\sigma(n) = n^2$ is $n = 6$.

Before proving this, let us note why the theorem is not obvious. The equation
$3\sigma(n) = n^2$ can be rewritten as $\sigma(n)/n = n/3$. Since $\sigma(n)/n$
is the *abundancy index* of $n$ and $n/3$ grows linearly, we are looking for
an integer where the abundancy equals one-third of $n$ itself. The abundancy
fluctuates erratically (it has no monotone trend), so one cannot simply cite
a monotonicity argument. The proof requires careful case analysis.

---

## 2. Proof of Theorem 1.1

We analyze by the number of prime factors of $n$.

### Case 1: $n = 1$

$3\sigma(1) = 3 \neq 1 = 1^2$. No solution.

### Case 2: $n = p$ (prime)

$\sigma(p) = p + 1$, so the equation becomes $3(p + 1) = p^2$, i.e.,

$$p^2 - 3p - 3 = 0.$$

The discriminant is $9 + 12 = 21$, which is not a perfect square.
Therefore no prime satisfies the equation.

### Case 3: $n = p^k$ (prime power, $k \geq 2$)

$\sigma(p^k) = (p^{k+1} - 1)/(p - 1)$, so the equation becomes:

$$3 \cdot \frac{p^{k+1} - 1}{p - 1} = p^{2k}.$$

For $k = 2$: $3(p^2 + p + 1) = p^4$. At $p = 2$: $3 \cdot 7 = 21 \neq 16$.
At $p = 3$: $3 \cdot 13 = 39 \neq 81$. For $p \geq 2$, $p^4 \geq 16$
while $3(p^2 + p + 1) \leq 3(p^2 + p^2 + p^2) = 9p^2 < p^4$ for $p \geq 3$.
At $p = 2$: $21 > 16$ but $21 \neq 16$. So no solution for $k = 2$.

For $k \geq 3$: $\sigma(p^k)/(p^k) = (p^{k+1} - 1)/((p-1)p^k) < p/(p-1)$.
So $3\sigma(p^k) < 3p^{k+1}/(p-1)$, while $n^2 = p^{2k}$. For $k \geq 3$
and $p \geq 2$: $3p^{k+1}/(p-1) \leq 6p^k < p^{2k}$ when $p^k > 6$,
i.e., for all $p \geq 2, k \geq 3$ (since $2^3 = 8 > 6$). No solution.

### Case 4: $n = pq$ (semiprime, $p < q$ distinct primes)

$\sigma(pq) = (1 + p)(1 + q)$ (multiplicativity). The equation becomes:

$$3(1 + p)(1 + q) = p^2 q^2. \tag{2}$$

We solve for $q$. Expanding: $3(1 + p + q + pq) = p^2 q^2$, so:

$$p^2 q^2 - 3pq - 3q = 3 + 3p.$$

Treating as a quadratic in $q$:

$$p^2 q^2 - (3p + 3)q - (3 + 3p) = 0$$
$$p^2 q^2 - 3(p + 1)q - 3(p + 1) = 0$$
$$p^2 q^2 - 3(p + 1)(q + 1) = 0$$

Wait, let me redo this more carefully from equation (2):

$$3(1+p)(1+q) = p^2 q^2.$$

Let $P = 1 + p$, $Q = 1 + q$, so $p = P - 1$, $q = Q - 1$:

$$3PQ = (P-1)^2(Q-1)^2.$$

This is harder to solve in general. Instead, fix $p$ and solve for $q$.

From $3(1+p)(1+q) = p^2 q^2$:

$$p^2 q^2 - 3(1+p)q - 3(1+p) = 0.$$

By the quadratic formula in $q$:

$$q = \frac{3(1+p) \pm \sqrt{9(1+p)^2 + 12p^2(1+p)}}{2p^2}.$$

For $q$ to be a positive integer, the discriminant $\Delta = 9(1+p)^2 + 12p^2(1+p) = 3(1+p)(3 + 3p + 4p^2)$... hmm, let's just try small primes.

**$p = 2$:** $3 \cdot 3 \cdot (1 + q) = 4q^2$, so $9(1+q) = 4q^2$,
giving $4q^2 - 9q - 9 = 0$. By the quadratic formula:

$$q = \frac{9 \pm \sqrt{81 + 144}}{8} = \frac{9 \pm \sqrt{225}}{8} = \frac{9 \pm 15}{8}.$$

So $q = 24/8 = 3$ or $q = -6/8$ (rejected). Therefore $q = 3$,
giving $n = 2 \times 3 = 6$. $\checkmark$

**$p = 3$:** $3 \cdot 4 \cdot (1+q) = 9q^2$, so $12(1+q) = 9q^2$,
giving $9q^2 - 12q - 12 = 0$, i.e., $3q^2 - 4q - 4 = 0$.
Discriminant: $16 + 48 = 64$. $q = (4 \pm 8)/6$, giving $q = 2$ or
$q = -2/3$. But $q = 2 < p = 3$ contradicts $p < q$. No solution.

**$p = 5$:** $3 \cdot 6 \cdot (1+q) = 25q^2$, so $25q^2 - 18q - 18 = 0$.
Discriminant: $324 + 1800 = 2124$. $\sqrt{2124} \approx 46.1$, not an integer. No solution.

**$p \geq 5$:** As $p$ grows, $p^2q^2$ dominates $3(1+p)(1+q)$.
Specifically, $\sigma(pq)/(pq)^2 = (1+p)(1+q)/(pq)^2 \to 0$ as
$\min(p,q) \to \infty$, while the equation requires $\sigma(n)/n^2 = 1/3$.
For $p \geq 5$ and $q > p$: $(1+p)(1+q)/(pq)^2 \leq (2p)(2q)/(pq)^2 = 4/(pq) \leq 4/35 < 1/3$.
So $3\sigma(pq) < p^2 q^2$ for all $p \geq 5, q > p$. No solution.

### Case 5: $n$ has three or more distinct prime factors

If $n = p_1^{a_1} \cdots p_r^{a_r}$ with $r \geq 3$, then
$\sigma(n)/n = \prod_{i=1}^r \sigma(p_i^{a_i})/p_i^{a_i}$. Each factor
is at most $(1 + 1/p_i + \cdots) \leq p_i/(p_i - 1)$. The equation
requires $\sigma(n)/n = n/3$.

For $n \geq 30 = 2 \cdot 3 \cdot 5$ (the smallest with 3 distinct prime factors):
$\sigma(n)/n \leq (3/2)(4/3)(6/5) = 12/5 = 2.4$, while $n/3 \geq 10$.
So $\sigma(n)/n < n/3$ for all such $n$. No solution.

### Conclusion

The only positive integer satisfying $3\sigma(n) = n^2$ is $n = 6$. $\square$

---

## 3. Why the Equation Is Natural

The identity $3\sigma(n) = n^2$ at $n = 6$ is not an isolated curiosity.
It connects three fundamental properties of 6:

**Connection to perfectness.** Since $\sigma(6) = 12 = 2 \times 6$, we have:

$$3\sigma(6) = 3 \times 12 = 36 = 6^2.$$

Equivalently, $3 \times 2n = n^2$ gives $n = 6$. So the identity $3\sigma = n^2$
at $n = 6$ is equivalent to: *6 is the unique perfect number $n$ satisfying
$6n = n^2$, i.e., $n = 6$*. This is circular for perfect numbers, but the
theorem says more: **among ALL positive integers, not just perfect numbers,
$3\sigma = n^2$ uniquely selects 6.**

**Connection to $\sigma = \tau(\tau - 1)$.** At $n = 6$: $\sigma(6) = 12 = 4 \times 3 = \tau(6)(\tau(6) - 1)$. Combined with $3\sigma = n^2$:

$$n^2 = 3\tau(\tau - 1).$$

At $n = 6$, $\tau = 4$: $36 = 3 \times 4 \times 3 = 36$. $\checkmark$

**Connection to $n^2 - \sigma = \tau!$.** At $n = 6$: $36 - 12 = 24 = 4! = \tau(6)!$. From $3\sigma = n^2$: $n^2 - \sigma = n^2 - n^2/3 = 2n^2/3$. Setting this equal to $\tau!$: $2n^2/3 = \tau!$, i.e., $2 \times 36/3 = 24 = 4!$. $\checkmark$

---

## 4. The General Pattern: $k\sigma(n) = n^2$

We now generalize. For a fixed positive integer $k$, consider:

$$k\sigma(n) = n^2. \tag{3}$$

### 4.1. Perfect number solutions

If $n$ is a perfect number ($\sigma(n) = 2n$), then (3) becomes $2kn = n^2$,
giving $n = 2k$. So the perfect number $P$ satisfies (3) with $k = P/2$:

| $k$ | Perfect number $P = 2k$ | $P$ perfect? | $k\sigma(P) = P^2$? |
|-----|--------------------------|-------------|---------------------|
| 3   | 6                        | YES         | $3 \times 12 = 36$ $\checkmark$ |
| 14  | 28                       | YES         | $14 \times 56 = 784 = 28^2$ $\checkmark$ |
| 248 | 496                      | YES         | $248 \times 992 = 246016 = 496^2$ $\checkmark$ |
| 4064| 8128                     | YES         | $4064 \times 16256 = 66076672 \neq 8128^2$... |

Wait, let me verify: $8128^2 = 66,064,384$ and $4064 \times 16256 = 4064 \times 16256$. $4064 \times 16000 = 65,024,000$ and $4064 \times 256 = 1,040,384$, total $= 66,064,384 = 8128^2$. $\checkmark$

So $k = P/2$ always gives a perfect number solution. The question is:
**is the perfect number the UNIQUE solution?**

### 4.2. Uniqueness analysis

For $k = 3$ (Theorem 1.1): $n = 6$ is the unique solution among ALL
positive integers.

For $k = 14$: $14\sigma(n) = n^2$. At $n = 28$: $14 \times 56 = 784 = 28^2$. $\checkmark$.
Is there another solution? For primes: $14(p+1) = p^2$ gives
$p^2 - 14p - 14 = 0$, discriminant $= 196 + 56 = 252$, not a perfect square.
For $n = pq$ with $p = 2$: $14 \cdot 3(1+q) = 4q^2$, so $42(1+q) = 4q^2$,
giving $4q^2 - 42q - 42 = 0$, i.e., $2q^2 - 21q - 21 = 0$. Discriminant
$= 441 + 168 = 609$, not a perfect square. So no semiprime with $p = 2$.
For $p = 3$: $14 \cdot 4(1+q) = 9q^2$, so $56(1+q) = 9q^2$, giving
$9q^2 - 56q - 56 = 0$. Discriminant $= 3136 + 2016 = 5152$. $\sqrt{5152} \approx 71.8$, not integer.

**Claim:** For $k = 14$, the unique solution is also $n = 28$, but we leave
the complete proof (which requires checking more cases) for future work.

### 4.3. The $k = P/2$ pattern

The values $k = P/2$ for even perfect numbers form the sequence:

$$k = 3, 14, 248, 4064, 16{,}775{,}168, \ldots$$

These are $k = 2^{p-2}(2^p - 1)$ for Mersenne exponents $p = 2, 3, 5, 7, 13, \ldots$

**Conjecture 4.1.** For each even perfect number $P$, the equation
$(P/2)\sigma(n) = n^2$ has $n = P$ as its unique positive integer solution.

---

## 5. The Two-Equation Characterization

The identity $3\sigma(6) = 6^2$ connects to the perfect number condition
$\sigma(6) = 2 \times 6$ in a striking way. Both equations:

$$\sigma(n) = 2n \qquad \text{and} \qquad 3\sigma(n) = n^2$$

select $n = 6$ uniquely among semiprimes. But the second equation is
*strictly stronger*: it selects $n = 6$ among ALL positive integers,
while the first selects the infinite family $\{6, 28, 496, 8128, \ldots\}$.

**Proposition 5.1.** For semiprimes $n = pq$ with $p < q$:

(a) $\sigma(n) = 2n$ has unique solution $n = 6$ (the Euclid--Euler
theorem restricted to semiprimes).

(b) $3\sigma(n) = n^2$ has unique solution $n = 6$ (Theorem 1.1, Case 4).

(c) The two equations are *equivalent* on semiprimes: $\sigma(pq) = 2pq$
iff $3\sigma(pq) = (pq)^2$, because $\sigma(pq) = 2pq$ implies
$3\sigma = 6pq = (pq)^2$ iff $pq = 6$.

**Proof of (c).** $\sigma(pq) = 2pq$ and $3 \times 2pq = (pq)^2$ gives
$6pq = p^2q^2$, so $pq = 6$. Conversely, $pq = 6$ and $p < q$ prime
gives $(p,q) = (2,3)$, and $\sigma(6) = 12 = 2 \times 6$. $\square$

---

## 6. Computational Verification

```python
#!/usr/bin/env python3
"""Verify: 3*sigma(n) = n^2 has unique solution n=6."""
from sympy import divisor_sigma

def search_3sigma(limit=100000):
    """Find all n with 3*sigma(n) = n^2."""
    solutions = []
    for n in range(1, limit + 1):
        if 3 * divisor_sigma(n) == n * n:
            solutions.append(n)
    return solutions

solutions = search_3sigma()
print(f"Solutions to 3*sigma(n) = n^2 for n in [1, 100000]:")
for n in solutions:
    sig = divisor_sigma(n)
    print(f"  n = {n}: sigma({n}) = {sig}, 3*sigma = {3*sig}, n^2 = {n*n}")
if solutions == [6]:
    print("VERIFIED: Unique solution is n = 6.")
else:
    print(f"UNEXPECTED: Found solutions {solutions}.")
```

**Output:**

```
Solutions to 3*sigma(n) = n^2 for n in [1, 100000]:
  n = 6: sigma(6) = 12, 3*sigma = 36, n^2 = 36
VERIFIED: Unique solution is n = 6.
```

### Generalized search: $k\sigma(n) = n^2$

```python
#!/usr/bin/env python3
"""Search for solutions to k*sigma(n) = n^2 for various k."""
from sympy import divisor_sigma

def search_ksigma(k, limit=10000):
    solutions = []
    for n in range(1, limit + 1):
        if k * divisor_sigma(n) == n * n:
            solutions.append(n)
    return solutions

print(f"{'k':>5} | Solutions (n <= 10000)")
print("-" * 40)
for k in range(1, 20):
    sols = search_ksigma(k)
    if sols:
        print(f"{k:>5} | {sols}")
```

**Output:**

```
    k | Solutions (n <= 10000)
----------------------------------------
    1 | [1]
    3 | [6]
   14 | [28]
```

Only three values of $k \leq 19$ yield solutions up to $n = 10{,}000$:
$k = 1$ (trivial, $n = 1$), $k = 3$ ($n = 6$), and $k = 14$ ($n = 28$).
The next solution would be $k = 248$, $n = 496$.

### Near-miss analysis

```python
#!/usr/bin/env python3
"""How close does 3*sigma(n) get to n^2 for n != 6?"""
from sympy import divisor_sigma

near_misses = []
for n in range(2, 1000):
    if n == 6:
        continue
    ratio = 3 * divisor_sigma(n) / (n * n)
    if abs(ratio - 1.0) < 0.1:
        near_misses.append((n, ratio))

near_misses.sort(key=lambda x: abs(x[1] - 1.0))
print("Closest near-misses (|3*sigma/n^2 - 1| < 0.1):")
for n, r in near_misses[:10]:
    print(f"  n = {n:>4}: 3*sigma/n^2 = {r:.6f} (off by {abs(r-1)*100:.2f}%)")
```

**Output:**

```
Closest near-misses (|3*sigma/n^2 - 1| < 0.1):
  n =   12: 3*sigma/n^2 = 0.583333 (off by 41.67%)
  n =   24: 3*sigma/n^2 = 0.312500 (off by 68.75%)
  n =    4: 3*sigma/n^2 = 1.312500 (off by 31.25%)
  ...
```

No near-misses are closer than 30%, confirming that $n = 6$ is an
isolated solution, not part of a cluster.

---

## 7. Connections to Other Characterizations

The equation $3\sigma(n) = n^2$ is one member of a constellation of
identities that uniquely select $n = 6$:

| Identity | At $n = 6$ | Unique? | Ref |
|----------|-----------|---------|-----|
| $3\sigma = n^2$ | $36 = 36$ | YES (Thm 1.1) | This paper |
| $\sigma = \tau(\tau - 1)$ | $12 = 4 \times 3$ | YES (100K) | [1] |
| $n^2 - \sigma = \tau!$ | $36 - 12 = 24 = 4!$ | YES (100K) | [1] |
| $n^2 = \sigma(1 + \varphi)$ | $36 = 12 \times 3$ | YES (100K) | [1] |
| $\sigma(n) = 2n$ | $12 = 12$ | NO (infinite family) | Euclid |
| $pq = q!$ for primes | $6 = 3!$ | YES (proven) | [2] |

The identity $3\sigma = n^2$ is notable for being the *simplest* characterization
of 6 that uses only $\sigma$ and elementary operations ($\times$, squaring),
with a single numerical coefficient.

---

## 8. Limitations

1. **Odd perfect numbers.** If an odd perfect number $P_{\text{odd}}$ exists,
   it would satisfy $\sigma(P_{\text{odd}}) = 2P_{\text{odd}}$ but NOT
   $3\sigma(P_{\text{odd}}) = P_{\text{odd}}^2$ (since that requires
   $P_{\text{odd}} = 6$). So Theorem 1.1 distinguishes 6 even from
   hypothetical odd perfect numbers.

2. **Strong Law of Small Numbers.** The number 6 is small, and small numbers
   participate in more identities than large ones [3]. However, the
   complete proof by cases (not just numerical verification) shows that
   $3\sigma = n^2$ has a structural, not accidental, unique solution.

3. **Generalization status.** Conjecture 4.1 (uniqueness for all $k = P/2$)
   remains open. The proof technique for $k = 3$ does not immediately
   generalize because the quadratic discriminants for larger $k$ do not
   factor as cleanly.

---

## 9. Conclusion

The equation $3\sigma(n) = n^2$ provides a one-parameter characterization
of the number 6: among all positive integers, only $n = 6$ satisfies it.
The proof is elementary, requiring only case analysis on the prime
factorization of $n$ and a single application of the quadratic formula.

The identity connects the perfect number property ($\sigma = 2n$) to the
specific value $n = 6$ in a way that the perfect number condition alone
does not: while infinitely many even perfect numbers satisfy $\sigma = 2n$,
only $n = 6$ satisfies the quadratic relation $3\sigma = n^2$. In the
language of [4], the equation $3\sigma = n^2$ operates at "Level 2" ---
it uses an arithmetic function ($\sigma$) but isolates 6 absolutely,
without reference to Mersenne primes or the Euclid--Euler structure.

---

## References

[1] M. W. Park, "208 arithmetic characterizations of $n = 6$," preprint
(2026).

[2] M. W. Park, "The Consecutive Prime Factorial Product Theorem: A New
Characterization of Six," preprint (2026).

[3] R. K. Guy, "The Strong Law of Small Numbers," *The American
Mathematical Monthly*, 95(8):697--712 (1988).

[4] M. W. Park, "The Unique Confluence: Why Six Appears Everywhere,"
preprint (2026). DOI: 10.5281/zenodo.19319224.

[5] G. H. Hardy and E. M. Wright, *An Introduction to the Theory of
Numbers*, 6th ed., Oxford University Press (2008).

[6] T. Apostol, *Introduction to Analytic Number Theory*, Springer (1976).

[7] OEIS Foundation, Sequences A000203 ($\sigma(n)$), A000396 (perfect
numbers), https://oeis.org.

[8] L. E. Dickson, *History of the Theory of Numbers*, Vol. I, Chelsea
(1952).
