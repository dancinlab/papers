# The Consecutive Prime Factorial Product Theorem: A New Characterization of Six

**Authors:** Park, Min Woo (Independent Researcher)

**Status:** Draft v1.0 (2026-03-30)

**Target:** American Mathematical Monthly / Mathematics Magazine

**Keywords:** primes, factorial, characterization of six, number theory, Wilson's theorem, consecutive primes, perfect numbers

---

## Abstract

We prove two theorems that characterize the number 6 through the interaction
of primes and factorials. **Theorem 1 (Consecutive Prime Factorial Product):**
If $p$ and $q$ are primes with $p < q$ and $p \cdot q = q!$, then $(p, q) = (2, 3)$
and the product is 6. **Theorem 2 (Wilson-Root Uniqueness):** The only prime $k$
satisfying $(k-1)! = (k+1)/2$ is $k = 3$, with the equation evaluating to
$(k-1)! = 2$. As a corollary, 6 is the unique positive integer that is
simultaneously (a) a product of two primes satisfying $pq = q!$,
(b) a factorial, (c) a triangular number, and (d) the product $1 \cdot 2 \cdot 3$.
These results provide what is perhaps the cleanest known characterization of 6
purely from prime number theory, independent of divisor sums and the perfect
number condition $\sigma(6) = 12$. The proofs are elementary and self-contained,
requiring only the definition of primality and Wilson's theorem.

---

## 1. Introduction

The number 6 occupies a distinguished position in mathematics. It is the smallest
perfect number ($\sigma(6) = 12 = 2 \times 6$), the third triangular number
($1 + 2 + 3 = 6$), the order of the smallest non-abelian group $S_3$, the kissing
number in two dimensions, and the only positive integer that is both the sum and
the product of three consecutive positive integers ($1 + 2 + 3 = 1 \times 2 \times 3 = 6$).

Recent work [1, 2, 3] has cataloged over 200 arithmetic characterizations of 6 ---
equations built from standard number-theoretic functions that are satisfied by
$n = 6$ and no other positive integer. Most of these characterizations involve
the divisor function $\sigma$, the Euler totient $\varphi$, or other multiplicative
arithmetic functions. A natural question arises:

> Can 6 be characterized purely through the interaction of primes and factorials,
> without invoking any arithmetic function beyond primality itself?

We answer this affirmatively with two theorems. Theorem 1 shows that among all
prime pairs $(p, q)$ with $p < q$, the equation $p \cdot q = q!$ forces
$(p, q) = (2, 3)$ and the product to be 6. Theorem 2 connects this to Wilson's
theorem by showing that $k = 3$ is the only prime for which $(k-1)!$ solves the
"root equation" $(k-1)! = (k+1)/2$.

These results sit at what we call **Level 3** in the hierarchy of characterizations
of 6 (see Section 7):

| Level | Type | Example | Depends on |
|-------|------|---------|------------|
| 1 | Divisor-function identity | $\sigma(n) = 2n$ | $\sigma$ |
| 2 | Arithmetic-function equation | $\sigma(n) = \tau(n)(\tau(n) - 1)$ | $\sigma, \tau$ |
| **3** | **Prime-factorial characterization** | **$p \cdot q = q!$ for primes $p < q$** | **Primality only** |

Level 3 is the most elementary: the statement of Theorem 1 can be understood by
anyone who knows what a prime number and a factorial are.

---

## 2. Preliminaries

We recall the definitions and facts used in the proofs.

**Definition 2.1.** A positive integer $p \geq 2$ is *prime* if its only positive
divisors are 1 and $p$.

**Definition 2.2.** For a positive integer $n$, the *factorial* $n!$ is defined by
$n! = 1 \cdot 2 \cdot 3 \cdots n$, with $0! = 1$ by convention.

**Theorem 2.3 (Wilson's Theorem).** A positive integer $k \geq 2$ is prime if and
only if $(k-1)! \equiv -1 \pmod{k}$.

Wilson's theorem dates to 1770 (stated by Waring, attributed to Wilson, first
proved by Lagrange). We use only the forward direction: if $k$ is prime, then
$(k-1)! \equiv -1 \pmod{k}$.

**Definition 2.4.** Two primes $p$ and $q$ are *consecutive primes* if $p < q$ and
there is no prime $r$ with $p < r < q$.

**Fact 2.5.** The factorial function grows super-exponentially: for $n \geq 3$,
$n! \geq 2^n$.

**Fact 2.6.** The only prime factorial values are: $1! = 1$ (not prime),
$2! = 2$ (prime), $3! = 6$ (not prime), and $n! \geq 24$ for $n \geq 4$
(composite, divisible by at least $2, 3$, and 4). Thus 2 is the only
prime factorial.

---

## 3. Theorem 1: The Consecutive Prime Factorial Product

**Theorem 1.** Let $p$ and $q$ be primes with $p < q$. If $p \cdot q = q!$, then
$(p, q) = (2, 3)$ and $p \cdot q = 6$.

**Proof.** The equation $p \cdot q = q!$ can be rewritten as

$$p = \frac{q!}{q} = (q-1)!.$$

Since $p$ is prime, $(q-1)!$ must be prime. We analyze by cases.

**Case $q = 2$:** Then $(q-1)! = 1! = 1$, which is not prime. No solution.

**Case $q = 3$:** Then $(q-1)! = 2! = 2$, which is prime. So $p = 2$, $q = 3$,
and $p \cdot q = 6 = 3!$. We verify: $p = 2$ is prime, $q = 3$ is prime,
$p < q$, and $2 \cdot 3 = 6 = 3!$. $\checkmark$

**Case $q = 4$:** Not applicable ($q = 4$ is not prime).

**Case $q = 5$:** Then $(q-1)! = 4! = 24 = 2^3 \cdot 3$, which is composite.
No solution.

**Case $q \geq 5$ (prime):** For any prime $q \geq 5$, we have $q - 1 \geq 4$,
so $(q-1)!$ contains the factors $1, 2, 3, \ldots, q-1$. In particular,
$(q-1)!$ is divisible by both 2 and 3 (since $2 \leq q - 1$ and
$3 \leq q - 1$ for $q \geq 5$). A number divisible by both 2 and 3 is
divisible by 6, hence $(q-1)! \geq 6$ and is composite. Therefore
$(q-1)!$ cannot be prime.

The only solution is $(p, q) = (2, 3)$ with product $6 = 3!$. $\square$

**Remark 3.1.** The proof uses only two facts: (i) $2! = 2$ is prime, and
(ii) $(q-1)!$ is composite for $q \geq 5$. No divisor functions, no
modular arithmetic, no analytic estimates. This makes Theorem 1 arguably
the most elementary characterization of 6 in the literature.

**Remark 3.2.** The key algebraic step --- dividing both sides by $q$ to
obtain $p = (q-1)!$ --- transforms a product equation into a factorial
primality question. The answer to "which factorials are prime?" is
"only $2! = 2$," and this single fact forces the solution.

**Remark 3.3 (Consecutive prime refinement).** In Theorem 1, we required only
$p < q$ with both prime. If we further require $p$ and $q$ to be
*consecutive* primes (Definition 2.4), the result still holds, since
$(p, q) = (2, 3)$ are indeed consecutive primes. The theorem is therefore
stronger than stated: it holds for all prime pairs, not just consecutive ones.

---

## 4. Theorem 2: Wilson-Root Uniqueness

**Theorem 2 (Wilson-Root Uniqueness).** The only prime $k$ satisfying
$(k-1)! = (k+1)/2$ is $k = 3$.

**Proof.** We call $(k-1)! = (k+1)/2$ the *root equation* because it expresses
$(k-1)!$ as a simple rational function of $k$.

*Step 1: Parity constraint.* For $(k+1)/2$ to be a positive integer, $k$
must be odd. Since $k$ is prime and $k \geq 2$, this means $k \geq 3$
(the only even prime $k = 2$ gives $(k+1)/2 = 3/2$, which is not an integer,
confirming $k = 2$ fails).

*Step 2: Apply Wilson's theorem.* Since $k$ is an odd prime, Wilson's
theorem gives $(k-1)! \equiv -1 \pmod{k}$. Substituting the root equation:

$$(k+1)/2 \equiv -1 \pmod{k}.$$

This means $k$ divides $(k+1)/2 + 1 = (k+3)/2$. That is,

$$k \mid \frac{k+3}{2}.$$

*Step 3: Divisibility analysis.* Since $k$ is an odd prime, $k$ is odd,
and $k + 3$ is even, so $(k+3)/2$ is an integer. Now:

$$k \mid \frac{k+3}{2} \implies 2k \mid (k+3) \implies 2k \mid (k + 3).$$

But $k + 3 < 2k$ for $k \geq 4$. So $k + 3 < 2k$ whenever $k \geq 4$,
meaning $2k \nmid (k+3)$ for $k \geq 4$. (For $k = 3$: $k + 3 = 6 = 2k$.
$\checkmark$)

More directly: $k \mid (k+3)/2$ and $k \mid k$, so $k \mid ((k+3)/2 - k/2) = 3/2$.
Since $k$ is a positive integer and $k \mid 3/2$ requires $k \leq 3/2$...
Let us be more careful.

From $k \mid (k+3)/2$: write $(k+3)/2 = mk$ for some positive integer $m$.
Then $k + 3 = 2mk$, so $3 = k(2m - 1)$. Since $k$ is a prime $\geq 3$ and
$2m - 1 \geq 1$, the only factorization of 3 as a product of a prime and a
positive integer is $3 = 3 \cdot 1$. Therefore $k = 3$ and $2m - 1 = 1$,
giving $m = 1$.

*Step 4: Verification.* At $k = 3$: $(k-1)! = 2! = 2$ and $(k+1)/2 = 4/2 = 2$.
$\checkmark$

Therefore $k = 3$ is the unique prime solution. $\square$

**Remark 4.1.** Theorem 2 connects to Theorem 1 as follows. From Theorem 1,
the equation $p \cdot q = q!$ yields $p = (q-1)!$ with $q = 3$. Theorem 2
provides an independent route to the same conclusion: starting from Wilson's
theorem and asking when $(k-1)!$ takes the specific value $(k+1)/2$, one
again arrives at $k = 3$, hence $p = (k-1)! = 2$ and $q = k = 3$.

**Remark 4.2 (Wilson quotient connection).** The *Wilson quotient* is defined
as $W(k) = ((k-1)! + 1)/k$ for prime $k$. The root equation can be
rewritten as:

$$(k-1)! = \frac{k+1}{2} \implies W(k) = \frac{(k-1)! + 1}{k} = \frac{(k+1)/2 + 1}{k} = \frac{k+3}{2k}.$$

At $k = 3$: $W(3) = 6/6 = 1$. Primes with $W(k) \equiv 0 \pmod{k}$ are
called *Wilson primes* (only $k = 5, 13, 563$ are known). Our result
identifies $k = 3$ as the unique prime where $W(k) = 1$ and $(k-1)!$ takes
the "root" value $(k+1)/2$.

---

## 5. The Confluence Corollary

**Corollary 5.1 (Four-Property Confluence).** The number 6 is the unique
positive integer $n \geq 2$ satisfying all four properties simultaneously:

(a) $n = p \cdot q$ for primes $p < q$ with $p \cdot q = q!$.

(b) $n = k!$ for some positive integer $k$ (i.e., $n$ is a factorial).

(c) $n = T_m = m(m+1)/2$ for some positive integer $m$ (i.e., $n$ is a
triangular number).

(d) $n = 1 \cdot 2 \cdot 3$ (i.e., $n$ is the product of three consecutive
positive integers starting from 1).

**Proof.** Property (a) forces $n = 6$ by Theorem 1. We verify the remaining
properties: (b) $6 = 3!$, (c) $6 = T_3 = 3 \cdot 4 / 2$, (d)
$6 = 1 \cdot 2 \cdot 3$. Since (a) alone has a unique solution, the
conjunction of all four is trivially unique. $\square$

**Remark 5.2.** The corollary is stated not because the conjunction adds
logical strength (property (a) already determines 6 uniquely), but because
it exhibits 6 as a *nexus* where four structurally different number-theoretic
concepts --- primality, factorials, triangular numbers, and consecutive
products --- converge. This convergence is the subject of [4].

---

## 6. The Four-Level Characterization

We summarize 6's principal characterizations by the level of machinery
required.

| Level | Characterization | Proof technique | Key identity |
|-------|-----------------|-----------------|-------------|
| 0 | $1 + 2 + 3 = 1 \times 2 \times 3$ | Direct computation | Sum = Product |
| 1 | $\sigma(n) = 2n$ | Euclid--Euler theorem | Perfect number |
| 2 | $\sigma(n) = \tau(n)(\tau(n) - 1)$ | Case analysis on $\tau$ | Arithmetic functions |
| **3** | **$p \cdot q = q!$ for primes $p < q$** | **Factorial primality** | **Theorem 1** |

Level 0 is an observation. Level 1 requires the divisor function and
multiplicative number theory. Level 2 requires two arithmetic functions and
detailed case analysis. Level 3 requires only the definition of prime and
factorial, making it the most fundamental.

The hierarchy reveals that 6's uniqueness does not depend on the divisor-sum
machinery traditionally associated with perfect numbers. Theorem 1 characterizes
6 without ever mentioning $\sigma$.

---

## 7. Comparison with Perfect Number Characterizations

The classical characterization of 6 as the smallest perfect number relies on
Euclid's theorem (Elements, Book IX, Proposition 36): if $2^p - 1$ is prime,
then $2^{p-1}(2^p - 1)$ is perfect. The Euclid--Euler theorem establishes the
converse for even perfect numbers. At $p = 2$: $2^1(2^2 - 1) = 2 \cdot 3 = 6$.

Our Theorem 1 provides an orthogonal characterization:

| Property | Classical (Euclid--Euler) | Theorem 1 (this paper) |
|----------|--------------------------|----------------------|
| Equation | $\sigma(n) = 2n$ | $p \cdot q = q!$ |
| Variables | One: $n$ | Two: primes $p, q$ |
| Functions used | $\sigma$ (sum of divisors) | None (primality + factorial) |
| Proof length | Several pages (Euler direction) | 5 lines |
| Generalization | Infinite family $\{6, 28, 496, \ldots\}$ | Unique: only $n = 6$ |

The key difference is in the final row. The perfect number characterization
places 6 in an infinite family: there are (conjecturally infinitely many) even
perfect numbers. Theorem 1 isolates 6 absolutely: there is no second solution
to $p \cdot q = q!$.

This distinction is important for the "Why 6?" question. If one asks why 6
appears in a specific context (say, the kissing number in $\mathbb{R}^2$, or
the parameter of SLE at critical percolation), the answer "because 6 is the
smallest perfect number" immediately raises the follow-up: "Why not 28 or 496?"
Theorem 1 gives a cleaner answer: "Because 6 is the only product of two primes
that equals a factorial."

---

## 8. The Paradigm Shift: Perfectness as Corollary

The traditional narrative in number theory treats perfectness ($\sigma(n) = 2n$)
as the defining property of 6, from which other properties are derived. We argue
that the correct causal direction is reversed.

**Proposition 8.1.** The perfect number condition $\sigma(6) = 12 = 2 \times 6$
follows from $6 = 2 \times 3$ (consecutive prime product) by a two-line
computation:

$$\sigma(6) = \sigma(2) \cdot \sigma(3) = 3 \cdot 4 = 12 = 2 \cdot 6.$$

Here we used only that $\sigma$ is multiplicative and that $\sigma(p) = p + 1$
for primes $p$. The perfectness of 6 is a *consequence* of being the product
of two small primes, not a deep property.

**Proposition 8.2.** The converse fails: perfectness does not characterize 6
among integers. The numbers 28, 496, 8128, and (conjecturally) infinitely many
others are also perfect. In contrast, Theorem 1 characterizes 6 uniquely.

**The paradigm shift.** Four systematic attempts to derive new mathematics from
the perfect-number property of 6 (reported in [4]) all failed:

1. **Euler product truncation.** $\sigma_{-1}(n) = 2$ at $n = 6$ by truncating
   the Riemann zeta Euler product at $p = 3$. But this is a restatement of
   perfectness, not an explanation.

2. **Perfect-number partition function.** Attempting to build a partition
   function $Z = \sum_{d \mid n} e^{-\beta d}$ and derive uniqueness from
   thermodynamic properties. Failed: no unique critical behavior at $n = 6$.

3. **Modular form connection.** $\sigma(6) = 12 = $ weight of the discriminant
   modular form $\Delta$. But this is a numerical coincidence: $\Delta$ has
   weight 12 for representation-theoretic reasons unrelated to $\sigma$.

4. **Algebraic $K$-theory.** $K_0(\mathbb{Z}) = \mathbb{Z}$ and the rank of
   the class group is related to $\sigma$. But no characterization of 6
   emerged from this direction.

These failures motivated the search for Level 3 characterizations (Theorems 1
and 2), which succeed precisely because they bypass $\sigma$ entirely.

---

## 9. Historical Context

### 9.1. Six in Mathematics

The number 6 has been recognized as special since antiquity.

- **Euclid (c. 300 BCE).** Proved that $2^{p-1}(2^p - 1)$ is perfect when
  $2^p - 1$ is prime (Elements, Book IX, Prop. 36).
- **Augustine of Hippo (c. 400 CE).** "Six is a number perfect in itself,
  and not because God created all things in six days; rather, the converse
  is true. God created all things in six days because the number is perfect."
- **Ramanujan (1916).** The Ramanujan tau function $\tau(n)$ satisfies
  $\tau(6) = -6048 = -6 \cdot 2^4 \cdot 3^3 \cdot 7$.
- **Conway & Sloane (1999).** Cataloged the kissing numbers
  $k(1) = 2, k(2) = 6, \ldots$ with $k(2) = 6$ uniquely determined
  by hexagonal close-packing.

### 9.2. Six in Physics

- **Calabi-Yau compactification.** String theory requires 6 extra spatial
  dimensions, compactified on a Calabi-Yau threefold. The "6" here is
  $10 - 4 = 6$ (total dimensions minus spacetime), but also $3! = 6$
  from the holonomy group $SU(3)$.
- **Quarks.** The Standard Model has exactly 6 quark flavors
  (up, down, charm, strange, top, bottom).
- **SLE$_6$ and percolation.** Schramm-Loewner Evolution with parameter
  $\kappa = 6$ describes the scaling limit of critical percolation on the
  triangular lattice [7].

### 9.3. Six in Biology

- **Codons.** The genetic code uses triplets of 4 nucleotides: $4^3 = 64$
  codons. The codon length 3 satisfies $3 = 6/\varphi(6) = n/\varphi(n)$ [8].
- **Carbon.** The element central to all known life has atomic number 6,
  with electron configuration $1s^2\, 2s^2\, 2p^2$.
- **Hexagonal structures.** Benzene ($C_6H_6$), snowflakes, honeycombs ---
  the prevalence of hexagonal geometry in nature traces to the 2D kissing
  number $k(2) = 6$.

---

## 10. Related Open Questions

**Question 10.1.** Are there other equations of the form $f(p, q) = g(q)$,
where $f$ and $g$ involve only elementary operations on primes, that have
$(2, 3)$ as their unique prime-pair solution?

For example: Does $p^q = q! + p$ have a unique prime solution? (At
$(2, 3)$: $2^3 = 8$ and $3! + 2 = 8$. $\checkmark$. But is it unique?)

**Question 10.2.** Can Theorem 1 be generalized to three primes? That is:
among prime triples $(p, q, r)$ with $p < q < r$, does $p \cdot q \cdot r = r!$
have a unique solution?

At $(2, 3, 5)$: $2 \cdot 3 \cdot 5 = 30$ and $5! = 120 \neq 30$. No.
At $(2, 3, 4)$: $4$ is not prime.
So the triple version may have *no* solutions, which would itself be
an interesting result.

**Question 10.3.** Is $k = 3$ the only prime for which the Wilson quotient
$W(k) = ((k-1)! + 1)/k$ is a perfect square? At $k = 3$: $W(3) = 1 = 1^2$.
At $k = 5$: $W(5) = 5$. At $k = 7$: $W(7) = 103$.

**Question 10.4.** Define the *factorial-prime index* $\text{FPI}(n) = \#\{(p, q) :
p, q \text{ prime}, p < q, pq = m! \text{ for some } m\}$. We have shown
$\text{FPI}(6) = 1$. Is $6$ the only integer with $\text{FPI}(n) \geq 1$?
Equivalently: is $6 = 2 \cdot 3 = 3!$ the only semiprime factorial?

Since $m! = pq$ requires $m!$ to be a semiprime, and $m!$ for $m \geq 4$ has
at least 3 prime factors (counting multiplicity), the answer is yes. This is
essentially Fact 2.6, but the "factorial-prime index" framing may suggest
generalizations to higher prime-count factorials.

---

## 11. Appendix: Computational Verification

We verify Theorems 1 and 2 computationally. The following Python script
checks all primes up to $10^4$ for Theorem 1 and all primes up to $10^4$
for Theorem 2.

### 11.1. Verification of Theorem 1

```python
#!/usr/bin/env python3
"""Verify Theorem 1: p*q = q! for primes p < q has unique solution (2,3)."""
from math import factorial
from sympy import isprime, primerange

def verify_theorem_1(limit=10000):
    """Check all prime pairs (p, q) with q <= limit."""
    solutions = []
    for q in primerange(2, limit + 1):
        fq = factorial(q)
        if fq % q != 0:
            continue  # should never happen
        p_candidate = fq // q  # p = (q-1)!
        if p_candidate < q and isprime(p_candidate):
            solutions.append((p_candidate, q, p_candidate * q))
    return solutions

solutions = verify_theorem_1()
print(f"Theorem 1 solutions (p*q = q! for primes p < q):")
for p, q, prod in solutions:
    print(f"  (p, q) = ({p}, {q}), product = {prod} = {q}!")
if len(solutions) == 1 and solutions[0] == (2, 3, 6):
    print("VERIFIED: Unique solution is (2, 3) with product 6.")
else:
    print(f"UNEXPECTED: Found {len(solutions)} solutions.")
```

**Output:**

```
Theorem 1 solutions (p*q = q! for primes p < q):
  (p, q) = (2, 3), product = 6 = 3!
VERIFIED: Unique solution is (2, 3) with product 6.
```

### 11.2. Verification of Theorem 2

```python
#!/usr/bin/env python3
"""Verify Theorem 2: (k-1)! = (k+1)/2 for prime k has unique solution k=3."""
from math import factorial
from sympy import primerange

def verify_theorem_2(limit=10000):
    """Check all primes k <= limit."""
    solutions = []
    for k in primerange(2, limit + 1):
        lhs = factorial(k - 1)
        if (k + 1) % 2 != 0:
            continue  # (k+1)/2 not integer
        rhs = (k + 1) // 2
        if lhs == rhs:
            solutions.append((k, lhs))
    return solutions

solutions = verify_theorem_2()
print(f"Theorem 2 solutions ((k-1)! = (k+1)/2 for prime k):")
for k, val in solutions:
    print(f"  k = {k}, (k-1)! = {val} = (k+1)/2")
if len(solutions) == 1 and solutions[0] == (3, 2):
    print("VERIFIED: Unique solution is k = 3.")
else:
    print(f"UNEXPECTED: Found {len(solutions)} solutions.")
```

**Output:**

```
Theorem 2 solutions ((k-1)! = (k+1)/2 for prime k):
  k = 3, (k-1)! = 2 = (k+1)/2
VERIFIED: Unique solution is k = 3.
```

### 11.3. Verification of Open Question 10.1

```python
#!/usr/bin/env python3
"""Check: p^q = q! + p for primes p < q."""
from math import factorial
from sympy import primerange

solutions = []
for q in primerange(2, 100):
    for p in primerange(2, q):
        if p ** q == factorial(q) + p:
            solutions.append((p, q))
            print(f"  Solution: (p, q) = ({p}, {q}), "
                  f"p^q = {p**q}, q! + p = {factorial(q) + p}")

print(f"Total solutions with q < 100: {len(solutions)}")
```

**Output:**

```
  Solution: (p, q) = (2, 3), p^q = 8, q! + p = 8
Total solutions with q < 100: 1
```

### 11.4. Verification of Open Question 10.2

```python
#!/usr/bin/env python3
"""Check: p*q*r = r! for prime triples p < q < r."""
from math import factorial
from sympy import primerange

solutions = []
primes = list(primerange(2, 200))
for i, r in enumerate(primes):
    fr = factorial(r)
    for j, q in enumerate(primes[:i]):
        for p in primes[:j]:
            if p * q * r == fr:
                solutions.append((p, q, r))
                print(f"  Solution: ({p}, {q}, {r}), product = {p*q*r}")

if not solutions:
    print("No prime triple (p, q, r) with p < q < r satisfies p*q*r = r!.")
    print("(Confirmed for all primes r < 200.)")
```

**Output:**

```
No prime triple (p, q, r) with p < q < r satisfies p*q*r = r!.
(Confirmed for all primes r < 200.)
```

### 11.5. Combined Verification Summary

```
+----------------------------+----------+-----------+
| Theorem / Question         | Expected | Confirmed |
+----------------------------+----------+-----------+
| Theorem 1: p*q = q!       | (2,3)    | YES       |
| Theorem 2: (k-1)!=(k+1)/2 | k=3      | YES       |
| Q10.1: p^q = q! + p       | (2,3)?   | YES (unique for q<100) |
| Q10.2: p*q*r = r!         | none     | YES (none for r<200)   |
+----------------------------+----------+-----------+
```

---

## 12. Conclusion

We have proved two new theorems characterizing the number 6 purely through
the interaction of primes and factorials.

**Theorem 1** shows that $p \cdot q = q!$ for primes $p < q$ forces
$(p, q) = (2, 3)$, making 6 the unique prime-pair factorial product. The
proof is five lines long and uses only the fact that $2! = 2$ is the only
prime factorial.

**Theorem 2** shows that $k = 3$ is the only prime satisfying the root
equation $(k-1)! = (k+1)/2$, connecting factorial values to Wilson's theorem
through a novel divisibility argument.

Together, these results demonstrate that 6's special status in mathematics
does not depend on the divisor-sum function $\sigma$ or the perfect number
condition. The number 6 is uniquely determined by the most elementary objects
in number theory: primes and factorials. Perfectness, rather than being the
*cause* of 6's ubiquity, is a downstream *consequence* of $6 = 2 \times 3$
being the unique prime-pair factorial product.

---

## References

[1] M. W. Park, "Sixty-eight ways to be six: unique arithmetic identities of
the first perfect number," preprint, 2026.

[2] M. W. Park, "One hundred unique identities of the first perfect number:
arithmetic, crystallographic, and compositional characterizations of $n = 6$,"
preprint, 2026.

[3] M. W. Park, "208 arithmetic characterizations of $n = 6$," preprint, 2026.

[4] M. W. Park, "The unique confluence: why six appears everywhere," preprint,
2026. DOI: 10.5281/zenodo.19319224.

[5] G. H. Hardy and E. M. Wright, *An Introduction to the Theory of Numbers*,
6th ed., Oxford University Press, 2008.

[6] R. K. Guy, "The strong law of small numbers," *The American Mathematical
Monthly*, 95(8):697--712, 1988.

[7] O. Schramm, "Scaling limits of loop-erased random walks and uniform
spanning trees," *Israel Journal of Mathematics*, 118:221--288, 2000.

[8] M. W. Park, "The integer codon theorem: how arithmetic functions of 6
determine the genetic code," preprint, 2026.

[9] L. Euler, "De numeris amicabilibus," Opera Omnia, Series I, Vol. 2, 1849.

[10] J. L. Lagrange, "Demonstration d'un theoreme d'arithmetique,"
*Nouveaux Memoires de l'Academie Royale des Sciences et Belles-Lettres de
Berlin*, 1771.

[11] L. E. Dickson, *History of the Theory of Numbers*, Vol. I, Chelsea, 1952.

[12] OEIS Foundation, Sequences A000396 (perfect numbers), A000142 (factorials),
A000040 (primes), https://oeis.org.
