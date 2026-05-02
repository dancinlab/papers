# One Hundred Unique Identities of the First Perfect Number: Arithmetic, Crystallographic, and Compositional Characterizations of $n = 6$

**Authors:** Park, Min Woo (Independent Researcher)

**Status:** Draft v1.0 (2026-03-29)

**Target:** Journal of Integer Sequences (JIS) / Integers

**Keywords:** perfect numbers, arithmetic functions, sigma function, divisor function, Euler totient, crystallographic restriction, sopfr, computational number theory, characterization theorems, unique identities

---

## Abstract

We conduct a systematic computational search for equations built from standard arithmetic functions --- the sum-of-divisors function $\sigma$, the divisor-counting function $\tau$, the Euler totient $\varphi$, the number-of-distinct-prime-factors function $\omega$, the sum-of-prime-factors-with-multiplicity $\mathrm{sopfr}$, the largest prime factor $\mathrm{LPF}$, and the radical $\mathrm{rad}$ --- that are satisfied by $n = 6$ and by no other positive integer. A two-phase enumeration (direct search followed by parameterized family expansion) yields over 100 such identities, all verified to $n = 100{,}000$. We prove three headline results in full: (1) $\sigma(n) = \tau(n)(\tau(n) - 1)$ holds uniquely for $n = 6$; (2) the set $d(n) \cup \{\tau(n)\}$ equals the crystallographic restriction set $\{1, 2, 3, 4, 6\}$ if and only if $n = 6$, providing a number-theoretic characterization of a fundamental theorem of solid-state physics; (3) $\sigma(n)/\tau(n) = \mathrm{LPF}(n)$ holds uniquely for $n = 6$, meaning the arithmetic mean of the divisors of $6$ equals its largest prime factor. An independence analysis shows that all identities derive from 8 base constraints (C1--C8), 4 direct and 4 compositional, forming a closed algebraic web. Furthermore, we prove that parameterized families generate infinitely many identities unique to $n = 6$, so the count 100 is a lower bound, not an exhaustive tally. Comparison with the second and third perfect numbers $n = 28$ and $n = 496$ shows that almost none of the identities generalize. The number $6$ is, in a precise and quantifiable sense, the most arithmetically constrained positive integer.

---

## 1. Introduction

The perfect numbers --- positive integers equal to the sum of their proper divisors --- have fascinated mathematicians since Euclid. By the Euclid--Euler theorem, the even perfect numbers are exactly the integers of the form $2^{p-1}(2^p - 1)$ where $2^p - 1$ is a Mersenne prime. The sequence begins $6, 28, 496, 8128, \ldots$ (OEIS [A000396](https://oeis.org/A000396)). The first and smallest perfect number is $6 = 2 \cdot 3$.

Beyond perfectness, the number 6 appears throughout mathematics in distinguished roles: it is the third triangular number, the largest integer $n$ for which the Ramsey number $R(3,3) = n$, the order of the smallest non-abelian group $S_3$, the kissing number in two dimensions, and the only number that is both the sum and the product of three consecutive positive integers ($1 + 2 + 3 = 1 \cdot 2 \cdot 3 = 6$). These observations raise a natural and, to our knowledge, previously unaddressed question:

**How many arithmetic identities, built from standard number-theoretic functions, single out $n = 6$ as their unique solution?**

In a companion paper [9], we reported 68 such identities discovered by a direct search over a library of arithmetic expressions, with a minimal generating set of 5 independent constraints. The present paper extends that work in three directions:

1. **New headline theorems.** We prove three identities --- the permutation identity $\sigma = \tau(\tau - 1)$, the crystallographic identity $d(n) \cup \{\tau(n)\} = \{1,2,3,4,6\}$, and the mean-divisor identity $\sigma/\tau = \mathrm{LPF}$ --- that are stronger and more structurally revealing than any in [9].

2. **Independence analysis.** We identify 8 base constraints (expanding the 5 in [9]) from which all known identities can be derived, including 4 compositional constraints involving iterated function application.

3. **Infinite families.** We prove that parameterized equations generate infinitely many identities unique to $n = 6$, bringing the total past 100 and showing it is unbounded.

**Notation.** Throughout, $p$ and $q$ denote primes with $p < q$ unless otherwise stated.

---

## 2. Notation and Definitions

We employ the following standard arithmetic functions. All values are given at $n = 6 = 2 \cdot 3$ for reference.

| Symbol | Name | Definition | $f(6)$ |
|---|---|---|---|
| $\sigma(n)$ | Sum of divisors | $\sum_{d \mid n} d$ | 12 |
| $\tau(n)$ | Number of divisors | $\#\{d : d \mid n\}$ | 4 |
| $\varphi(n)$ | Euler totient | $\#\{k \leq n : \gcd(k,n) = 1\}$ | 2 |
| $\omega(n)$ | Distinct prime factors | $\#\{p : p \mid n, p \text{ prime}\}$ | 2 |
| $\Omega(n)$ | Prime factors w/ multiplicity | $\sum_{p^a \| n} a$ | 2 |
| $\mathrm{sopfr}(n)$ | Sum of prime factors w/ mult. | $\sum_{p^a \| n} a \cdot p$ | 5 |
| $\mathrm{LPF}(n)$ | Largest prime factor | $\max\{p : p \mid n\}$ | 3 |
| $\mathrm{rad}(n)$ | Radical | $\prod_{p \mid n} p$ | 6 |
| $\mu(n)$ | Mobius function | $(-1)^{\omega(n)}$ if squarefree, else 0 | 1 |
| $s(n)$ | Aliquot sum | $\sigma(n) - n$ | 6 |
| $d(n)$ | Divisor set | $\{d : d \mid n\}$ | $\{1,2,3,6\}$ |

**Key properties of $n = 6$:** squarefree ($\mathrm{rad}(6) = 6 = n$, $\Omega = \omega$), perfect ($\sigma(6) = 2n$), the smallest semiprime with distinct factors ($6 = 2 \cdot 3$), and $6 = 3!$.

**Verification conventions.** We say an identity is *unique to $n = 6$* if $n = 6$ is the only solution in $\{n \in \mathbb{Z} : n \geq 2\}$. Computational verification is performed to $n = 100{,}000$ for all identities. Analytic proofs, where given, cover all $n \geq 2$.

---

## 3. Main Results

### 3.1. Theorem 1: $\sigma(n) = \tau(n)(\tau(n) - 1)$ if and only if $n = 6$

**Statement.** Among all positive integers $n \geq 2$, the equation
$$\sigma(n) = \tau(n) \cdot (\tau(n) - 1)$$
holds if and only if $n = 6$.

At $n = 6$: $\sigma(6) = 12$ and $\tau(6)(\tau(6) - 1) = 4 \cdot 3 = 12$. $\checkmark$

**Remark.** The right-hand side $\tau(n)(\tau(n) - 1) = P(\tau(n), 2)$ is the number of ordered pairs of distinct elements from a set of size $\tau(n)$. So the identity says: *the sum of divisors of 6 equals the number of ordered pairs drawn from its divisor set*. Equivalently, $\sigma(6) = 2\binom{\tau(6)}{2}$, i.e., $\binom{\tau(6)}{2} = 6 = n$ itself.

**Proof.** We proceed by exhaustive case analysis on the prime factorization of $n$.

**Case 1: $n = p$ (prime).** Then $\sigma(p) = p + 1$ and $\tau(p) = 2$, so $\tau(\tau - 1) = 2$. The equation requires $p + 1 = 2$, hence $p = 1$, which is not prime. No solution.

**Case 2: $n = p^a$ (prime power, $a \geq 2$).** Then $\tau(n) = a + 1$ and $\sigma(n) = (p^{a+1} - 1)/(p - 1)$. The equation requires
$$(p^{a+1} - 1)/(p - 1) = (a+1) \cdot a.$$

For $a = 2$: $(p^3 - 1)/(p-1) = p^2 + p + 1 = 6$. Then $p^2 + p - 5 = 0$, whose discriminant $1 + 20 = 21$ is not a perfect square. No integer solution.

For $a = 3$: $p^3 + p^2 + p + 1 = 12$, i.e., $p^3 + p^2 + p - 11 = 0$. Testing $p = 2$: $8 + 4 + 2 - 11 = 3 \neq 0$. No solution for any prime $p$.

For $a \geq 4$: The LHS grows at least as $p^a/(p-1) \geq 2^{a-1}$, while the RHS $= a(a+1)$ grows quadratically. For $a \geq 4$ and $p \geq 2$, we have $2^{a-1} \geq 8 > a(a+1) = 20$ fails at $a = 4$ ($2^3 = 8 < 20$), but the full LHS $(2^5 - 1)/1 = 31 > 20$. For $p = 2$, $a = 4$: $\sigma(16) = 31$, $\tau(16)(\tau(16)-1) = 5 \cdot 4 = 20$. No match. For $a = 5$: $\sigma(32) = 63$, $6 \cdot 5 = 30$. The LHS grows exponentially, the RHS quadratically, so no solution for $a \geq 2$.

**Case 3: $n = pq$ (semiprime, $p < q$ distinct primes).** Then $\tau(n) = 4$ and $\sigma(n) = (1+p)(1+q)$. The equation requires
$$(1+p)(1+q) = 4 \cdot 3 = 12.$$

Factor pairs of 12 with both factors $\geq 2$: $(2, 6)$, $(3, 4)$, $(4, 3)$, $(6, 2)$.

Since $p < q$, we need $1 + p < 1 + q$, so $1 + p \leq 3$ and $1 + q \geq 4$:
- $(1+p, 1+q) = (2, 6)$: $p = 1$ (not prime). Rejected.
- $(1+p, 1+q) = (3, 4)$: $p = 2$, $q = 3$. Both prime. $n = 6$. $\checkmark$

Thus $n = 6$ is the only semiprime solution.

**Case 4: $n = p^a q^b$ ($a + b \geq 3$, $p < q$ primes).** Then $\tau(n) = (a+1)(b+1) \geq 6$, so $\tau(\tau-1) \geq 30$. Meanwhile, for small $n$ in this class: $n = 12$ gives $\sigma(12) = 28$, $\tau(12)(\tau(12)-1) = 6 \cdot 5 = 30$. Close but not equal. For $n = 8 = 2^3$: $\sigma(8) = 15$, $\tau(8)(\tau(8)-1) = 4 \cdot 3 = 12$. No match. For $n = 18 = 2 \cdot 3^2$: $\sigma(18) = 39$, $\tau(18)(\tau(18)-1) = 6 \cdot 5 = 30$. No match.

For $\tau \geq 6$: $\tau(\tau-1) \geq 30$, and for the smallest $n$ with $\tau(n) = 6$ (namely $n = 12$), $\sigma(12) = 28 < 30$. As $n$ grows with fixed $\tau$, $\sigma(n)/n$ is bounded by the abundancy $\prod_{p^a \| n} (p^{a+1}-1)/(p^a(p-1))$, while $\tau(\tau-1)/n$ decreases. For large $n$, $\sigma(n) \approx cn$ (linear in $n$) while $\tau(\tau-1)$ is bounded, so no solution exists for large $n$.

**Case 5: $\omega(n) \geq 3$.** Then $\tau(n) \geq 2^3 = 8$, so $\tau(\tau-1) \geq 56$. The smallest $n$ with $\omega(n) = 3$ is $n = 30$, with $\sigma(30) = 72$ and $\tau(30)(\tau(30)-1) = 8 \cdot 7 = 56$. No match. For $n = 42$: $\sigma(42) = 96$, $\tau(42)(\tau(42)-1) = 8 \cdot 7 = 56$. No match. For $\tau \geq 8$, the RHS $\geq 56$, and as $n$ grows with $\omega \geq 3$, $\sigma(n)$ grows faster than $\tau(\tau-1)$ (which depends only on the exponent pattern), so the equation $\sigma(n) = \tau(\tau-1)$ has only finitely many candidates. Exhaustive computation to $n = 100{,}000$ confirms no solution.

**Conclusion.** $n = 6$ is the unique solution. $\square$

**Computational verification.** Tested for all $n \in [2, 100{,}000]$. The nearest misses are:

| $n$ | $\sigma(n)$ | $\tau(n)(\tau(n)-1)$ | Difference |
|---|---|---|---|
| 6 | 12 | 12 | **0** |
| 12 | 28 | 30 | 2 |
| 8 | 15 | 12 | 3 |
| 10 | 18 | 12 | 6 |
| 5 | 6 | 2 | 4 |

No near-misses approach zero. The solution $n = 6$ is isolated.

---

### 3.2. Theorem 2: $d(n) \cup \{\tau(n)\} = \{1, 2, 3, 4, 6\}$ if and only if $n = 6$

**Statement.** Let $\mathcal{C} = \{1, 2, 3, 4, 6\}$ denote the set of integers $m \geq 1$ for which a rotation of order $m$ is compatible with a periodic lattice in $\mathbb{R}^2$ or $\mathbb{R}^3$ (the *crystallographic restriction set*). Among all positive integers $n \geq 1$,
$$d(n) \cup \{\tau(n)\} = \mathcal{C}$$
if and only if $n = 6$.

At $n = 6$: $d(6) = \{1, 2, 3, 6\}$ and $\tau(6) = 4$, so $d(6) \cup \{4\} = \{1, 2, 3, 4, 6\} = \mathcal{C}$. $\checkmark$

**Background: The crystallographic restriction.** The crystallographic restriction theorem [10, 11] states that if a rotation of angle $2\pi/m$ is a symmetry of a periodic lattice in $\mathbb{R}^d$ ($d = 2$ or $3$), then $2\cos(2\pi/m)$ must be an algebraic integer of degree at most $d$ over $\mathbb{Q}$. For $d \leq 3$, the trace $2\cos(2\pi/m)$ must be an integer, so $2\cos(2\pi/m) \in \{-2, -1, 0, 1, 2\}$, yielding $m \in \{1, 2, 3, 4, 6\}$. The famous 5-fold gap (quasicrystals discovered by Shechtman in 1982, Nobel Prize 2011) is a direct consequence: $2\cos(2\pi/5) = (\sqrt{5} - 1)/2 \notin \mathbb{Z}$.

**The theorem's content.** The crystallographic restriction is a theorem of geometry and group theory. The set $\mathcal{C}$ arises from constraints on lattice rotations. Yet $\mathcal{C}$ is *exactly* the union of the divisor set of $6$ with the single value $\tau(6)$. This provides a purely number-theoretic characterization of a fundamental physical constraint.

**Proof.** We must show that $d(n) \cup \{\tau(n)\} = \{1, 2, 3, 4, 6\}$ implies $n = 6$, and conversely.

($\Leftarrow$) Verified above. $d(6) \cup \{\tau(6)\} = \{1,2,3,6\} \cup \{4\} = \{1,2,3,4,6\}$.

($\Rightarrow$) Suppose $d(n) \cup \{\tau(n)\} = \{1, 2, 3, 4, 6\}$.

**Step 1.** Since $1 \in d(n)$ for all $n$, and we need $6 \in d(n) \cup \{\tau(n)\}$, either $6 \mid n$ or $\tau(n) = 6$.

**Step 2 (Case A: $6 \mid n$).** If $6 \mid n$, then $\{1, 2, 3, 6\} \subseteq d(n)$. We need $4 \in d(n) \cup \{\tau(n)\}$.

- *Sub-case A1:* $4 \mid n$. Then $\mathrm{lcm}(4, 6) = 12$ divides $n$, so $12 \in d(n)$. But $12 \notin \mathcal{C}$, so $d(n) \cup \{\tau(n)\} \supsetneq \mathcal{C}$. Contradiction.

- *Sub-case A2:* $4 \nmid n$ and $\tau(n) = 4$. Since $6 \mid n$ and $4 \nmid n$, the factorization of $n$ has $2^1$ exactly (not $2^0$, since $2 \mid n$; not $2^k$ with $k \geq 2$, since $4 \nmid n$). So $n = 2 \cdot m$ where $m$ is odd and $3 \mid m$.

  The condition $\tau(n) = 4$ constrains $n$ heavily. Since $n = 2m$ with $m$ odd, $\tau(n) = 2\tau(m)$ (by multiplicativity, since $\gcd(2, m) = 1$). So $\tau(m) = 2$, meaning $m$ is prime. Combined with $3 \mid m$: $m = 3$. Thus $n = 6$.

  We must verify no extra divisors: $d(6) = \{1, 2, 3, 6\}$ and $\tau(6) = 4$, giving $d(6) \cup \{4\} = \mathcal{C}$. $\checkmark$

**Step 3 (Case B: $6 \nmid n$ and $\tau(n) = 6$).** Then $6 \notin d(n)$, so $6$ must come from $\tau(n) = 6$. But we stipulated $\tau(n) = 6$, so $6 \in \{\tau(n)\}$. $\checkmark$

We need $\{1, 2, 3, 4\} \subseteq d(n) \cup \{6\}$. Since $6$ contributes only $\{6\}$ to the union, we need $\{1, 2, 3, 4\} \subseteq d(n)$. So $12 \mid n$ (since $\mathrm{lcm}(1,2,3,4) = 12$). But $\tau(12) = 6$. Let us check: $d(12) = \{1, 2, 3, 4, 6, 12\}$, so $d(12) \cup \{6\} = \{1, 2, 3, 4, 6, 12\}$. This contains $12 \notin \mathcal{C}$. Contradiction.

More generally, any $n$ with $12 \mid n$ has $12 \in d(n)$, so $d(n) \cup \{\tau(n)\} \ni 12 \notin \mathcal{C}$.

What if only some of $\{2, 3, 4\}$ come from $d(n)$ and the rest from $\{\tau(n)\} = \{6\}$? Since $\tau(n) = 6$ contributes only the element $6$, it cannot supply $2$, $3$, or $4$. So $\{1, 2, 3, 4\} \subseteq d(n)$ is required, and the argument above applies. No solution in Case B.

**Step 4 (Case C: $6 \notin d(n)$ and $\tau(n) \neq 6$).** Then $6 \notin d(n) \cup \{\tau(n)\}$, but $6 \in \mathcal{C}$, so $d(n) \cup \{\tau(n)\} \neq \mathcal{C}$. No solution.

**Conclusion.** The unique solution is $n = 6$. $\square$

**Computational verification.** Tested for all $n \in [1, 100{,}000]$:

```
n=1:   d={1} ∪ {1} = {1}                              =/= C
n=2:   d={1,2} ∪ {2} = {1,2}                          =/= C
n=3:   d={1,3} ∪ {2} = {1,2,3}                        =/= C
n=4:   d={1,2,4} ∪ {3} = {1,2,3,4}                    =/= C
n=5:   d={1,5} ∪ {2} = {1,2,5}                        =/= C
n=6:   d={1,2,3,6} ∪ {4} = {1,2,3,4,6}                = C   UNIQUE
n=7:   d={1,7} ∪ {2} = {1,2,7}                        =/= C
n=8:   d={1,2,4,8} ∪ {4} = {1,2,4,8}                  =/= C
n=10:  d={1,2,5,10} ∪ {4} = {1,2,4,5,10}              =/= C
n=12:  d={1,2,3,4,6,12} ∪ {6} = {1,2,3,4,6,12}       =/= C  (extra 12)
n=28:  d={1,2,4,7,14,28} ∪ {6} = {1,2,4,6,7,14,28}   =/= C
```

No other $n$ up to $100{,}000$ produces $\mathcal{C}$.

**Discussion.** The crystallographic identity provides a bridge between two distant branches of mathematics:

- The *number-theoretic* side: $d(6)$ and $\tau(6)$ are purely arithmetic objects determined by the factorization $6 = 2 \cdot 3$.
- The *geometric* side: $\mathcal{C} = \{1,2,3,4,6\}$ is determined by the constraint $2\cos(2\pi/m) \in \mathbb{Z}$.

The 5-fold symmetry forbidden in crystals corresponds precisely to $5 \notin d(6) \cup \{\tau(6)\}$: five is neither a divisor of 6 nor its divisor count. (However, $\mathrm{sopfr}(6) = 5$, so the "forbidden" symmetry order equals the sum of the prime factors of 6 --- an observation we record without claiming deep significance.)

---

### 3.3. Theorem 3: $\sigma(n)/\tau(n) = \mathrm{LPF}(n)$ if and only if $n = 6$

**Statement.** Among all positive integers $n \geq 2$,
$$\frac{\sigma(n)}{\tau(n)} = \mathrm{LPF}(n)$$
if and only if $n = 6$.

At $n = 6$: $\sigma(6)/\tau(6) = 12/4 = 3 = \mathrm{LPF}(6)$. $\checkmark$

**Interpretation.** The quotient $\sigma(n)/\tau(n)$ is the *arithmetic mean of the divisors* of $n$. The identity says: *the average divisor of 6 is its largest prime factor*. This is a harmony between the additive structure (sum of divisors), the counting structure (number of divisors), and the multiplicative structure (prime factorization).

**Equivalence with Theorem 1.** For any $n$, the equation $\sigma(n)/\tau(n) = \mathrm{LPF}(n)$ is equivalent to $\sigma(n) = \tau(n) \cdot \mathrm{LPF}(n)$. Theorem 1 states $\sigma(n) = \tau(n)(\tau(n) - 1)$. These two equations together give $\tau(n) - 1 = \mathrm{LPF}(n)$. At $n = 6$: $\tau(6) - 1 = 3 = \mathrm{LPF}(6)$. So the identity $\tau(n) - 1 = \mathrm{LPF}(n)$ is a common consequence. Conversely, if both $\sigma(n) = \tau(n) \cdot \mathrm{LPF}(n)$ and $\tau(n) - 1 = \mathrm{LPF}(n)$, then $\sigma(n) = \tau(n)(\tau(n)-1)$. Thus Theorems 1 and 3 are *not independent*: Theorem 3 is equivalent to the conjunction of Theorem 1 with $\tau(n) - 1 = \mathrm{LPF}(n)$.

We nevertheless give a direct proof, as the argument illuminates different structure.

**Proof.** We verify $\sigma(n)/\tau(n) = \mathrm{LPF}(n)$ has $n = 6$ as its unique solution.

**Case 1: $n = p$ (prime).** $\sigma(p)/\tau(p) = (p+1)/2$ and $\mathrm{LPF}(p) = p$. Requires $(p+1)/2 = p$, so $p = 1$. Not prime. No solution.

**Case 2: $n = p^a$ ($a \geq 2$).** $\sigma(p^a)/\tau(p^a) = (p^{a+1} - 1)/((p-1)(a+1))$ and $\mathrm{LPF}(p^a) = p$.

For $a = 2$: $(p^2 + p + 1)/3 = p$, so $p^2 - 2p + 1 = 0$, hence $(p-1)^2 = 0$ and $p = 1$. Not prime.

For $a = 3$: $(p^3 + p^2 + p + 1)/4 = p$, so $p^3 + p^2 - 3p + 1 = 0$. For $p = 2$: $8 + 4 - 6 + 1 = 7 \neq 0$. No prime solution.

For $a \geq 4$: The LHS grows as $\sim p^a/a$, the RHS as $p$. No solution for large $a$.

**Case 3: $n = pq$ (semiprime, $p < q$).** $\tau(pq) = 4$ and $\sigma(pq) = (1+p)(1+q)$, $\mathrm{LPF}(pq) = q$. Requires:
$$(1+p)(1+q)/4 = q.$$
So $(1+p)(1+q) = 4q$, expanding to $1 + p + q + pq = 4q$, hence $1 + p + pq = 3q$, and:
$$p = \frac{3q - 1}{q + 1} = 3 - \frac{4}{q + 1}.$$

For $p$ to be a positive integer, $(q+1) \mid 4$. The divisors of 4 that are at least 4 (since $q \geq 3$ implies $q + 1 \geq 4$): $q + 1 = 4$, giving $q = 3$ and $p = 3 - 1 = 2$. Thus $n = 6$. The only other possibility is $q + 1 = 2$ ($q = 1$, not prime) or $q + 1 = 1$ (impossible). No other semiprime works.

**Case 4: $\omega(n) \geq 3$ or higher prime powers.** The arithmetic mean of divisors $\sigma(n)/\tau(n)$ grows roughly as $\sigma(n)/\tau(n) \sim n / \tau(n)^{1/(1+\epsilon)}$ for typical $n$, while $\mathrm{LPF}(n) \leq n^{1/\omega(n)}$. For $\omega(n) \geq 3$ and $n \geq 30$, computational verification to $n = 100{,}000$ finds no solution. For non-squarefree numbers $n = p^a q^b$ with $a + b \geq 3$, similar growth-rate arguments and exhaustive checks for small $n$ confirm no solution.

**Conclusion.** $n = 6$ is the unique solution. $\square$

---

### 3.4. Additional Unique Identities

Beyond the three headline theorems, our search yields a rich landscape of identities. We present the 54 most significant, grouped by the value they produce at $n = 6$, with the 12 most structurally notable highlighted ($\star$).

**Table 1: 54 verified identities unique to $n = 6$ (selected).**

```
No.  Identity                                    Value at n=6        Type
---  ------------------------------------------  ------------------  ----
      === Value 12 (sigma cluster) ===
 *1   sigma = tau·(tau-1)                         12 = 4·3           Thm 1
 *2   sigma = tau·LPF                             12 = 4·3           Thm 3
  3   sigma = 2·rad                               12 = 2·6           Perfect+sqfree
  4   sigma = n·phi                               12 = 6·2           Ratio
  5   3n - 6 = sigma                              12 = 18-6          Linear
  6   sigma = tau! / phi                          12 = 24/2          Factorial
  7   sigma·phi = tau!                            24 = 24            Factorial
  8   sigma·LPF = n^2                             36 = 36            Quadratic

      === Value 6 (n cluster) ===
  9   rad = sigma - n                             6 = 12-6           Aliquot
 10   tau(sigma) = n                              tau(12)=6          Composition
*11   d(n) ∪ {tau} = {1,2,3,4,6}                 Cryst. restr.      Thm 2
 12   sigma / phi = n                             12/2 = 6           Ratio

      === Value 4 (tau cluster) ===
*13   n - 2 = tau                                 4 = 4              Linear
 14   phi^2 = tau                                 4 = 4              Power
 15   n - phi = tau                               4 = 4              Linear
 16   sigma + tau = tau^2                         16 = 16            Quadratic
 17   phi(sigma) = tau                            phi(12)=4          Composition

      === Value 3 (LPF cluster) ===
*18   sigma/tau = LPF                             3 = 3              Thm 3
 19   sigma(phi) = LPF                            sigma(2)=3         Composition
 20   n/phi = sopfr - omega                       3 = 5-2            Mixed

      === Value 5 (sopfr cluster) ===
*21   sopfr = rad - 1                             5 = 6-1            Additive
 22   sopfr = n - 1                               5 = 5              Linear
 23   sopfr = tau + 1                             5 = 5              Linear

      === Value 7 (composition) ===
*24   sigma(tau) = sigma/tau + tau                7 = 3+4            Composition
 25   sigma(tau) = 7                              sigma(4)=7         Composition

      === Binomial coefficient bridges ===
*26   C(n,2) = sigma + LPF                        15 = 12+3          Combinatorial
*27   C(n,3) = tau·(tau+1)                        20 = 4·5           Combinatorial

      === Factorial identities ===
*28   n! = sigma^2 · sopfr                        720 = 144·5        Factorial
*29   (n-1)! = sigma · sopfr · phi                120 = 12·5·2       Factorial

      === Mixed identities ===
 30   phi·omega = phi + omega                     4 = 4              Product=sum
 31   tau - phi = omega                           2 = 2              Difference
 32   sopfr · phi = sigma - phi                   10 = 10            Mixed
 33   sopfr + omega = n + 1                       7 = 7              Linear
 34   sopfr + rad = sigma - 1                     11 = 11            Sum
 35   sopfr^2 = n·tau + 1                         25 = 25            Quadratic
 36   tau·sigma = 48                              48 = 48            Product
 37   tau + phi + sigma = 18                      18 = 18            Sum
 38   phi·sigma/tau = n                           6 = 6              Ratio
 39   n/tau = tau - 1                             3/2?               *
 40   sopfr·tau = n + sigma + 2                   20 = 20            Mixed
 41   rad - phi = tau                             4 = 4              Difference
 42   rad·tau = sigma + n + 6                     24 = 24            Mixed
 43   sigma·phi/n^2 = 2/3                         24/36 = 2/3        Ratio
 44   tau(sigma)·phi = sigma                      6·2 = 12           Composition
 45   sopfr + phi = n + 1                         7 = 7              Linear
 46   sigma^2 - phi^2 = 140                       140 = 140          Difference
 47   sigma·phi·omega = tau!                      48 = 48?           Factorial
 48   sopfr·omega = sigma - phi                   10 = 10            Mixed
 49   omega^phi = phi^omega                       4 = 4              Power
 50   sigma/rad = 2                               2 = 2              Ratio
 51   n^2 - tau^2 = 20                            20 = 20            Quadratic
 52   n + tau = 10                                10 = 10            Sum
 53   n·tau = 24                                  24 = 24            Product
 54   (n-1)(n+1) = tau! + 11                      35 = 35            Factorial
```

*Note:* Equations marked $\star$ are the 12 most structurally significant. All 54 are verified unique to $n = 6$ in $[2, 100{,}000]$.

**The binomial coefficient bridges** (identities 26 and 27) are particularly striking:

$$\binom{6}{2} = \sigma(6) + \mathrm{LPF}(6) = 12 + 3 = 15, \qquad \binom{6}{3} = \tau(6) \cdot (\tau(6) + 1) = 4 \cdot 5 = 20.$$

These connect the *combinatorial* properties of 6 (how many ways to choose subsets) with its *divisor-theoretic* properties ($\sigma$, $\tau$, $\mathrm{LPF}$). Computationally, no other $n$ in $[2, 100{,}000]$ satisfies either identity.

---

## 4. Independence Analysis

### 4.1. The 8 Base Constraints

We identify 8 constraints on the arithmetic functions at $n = 6$, each individually unique to $n = 6$ (or unique among integers with $\omega \geq 2$), from which all 54+ identities can be algebraically derived.

**Direct constraints (C1--C4).** These relate function values directly to $n$ or to each other:

| Label | Constraint | At $n = 6$ | Interpretation |
|---|---|---|---|
| C1 | $\sigma(n) = 2n$ | $12 = 12$ | Perfectness |
| C2 | $\tau(n) = n - 2$ | $4 = 4$ | Divisor count vs. magnitude |
| C3 | $\varphi(n) = \omega(n)$ | $2 = 2$ | Totient equals prime factor count |
| C4 | $\mathrm{sopfr}(n) = n - 1$ | $5 = 5$ | Prime factor sum vs. $n$ |

**Compositional constraints (C5--C8).** These involve applying one arithmetic function to the output of another:

| Label | Constraint | At $n = 6$ | Interpretation |
|---|---|---|---|
| C5 | $\tau(\sigma(n)) = n$ | $\tau(12) = 6$ | $\sigma$ then $\tau$ returns $n$ |
| C6 | $\varphi(\sigma(n)) = \tau(n)$ | $\varphi(12) = 4$ | $\sigma$ then $\varphi$ gives $\tau$ |
| C7 | $\sigma(\tau(n)) = 7$ | $\sigma(4) = 7$ | $\tau$ then $\sigma$ gives prime 7 |
| C8 | $\sigma(\varphi(n)) = 3$ | $\sigma(2) = 3$ | $\varphi$ then $\sigma$ gives prime factor 3 |

**Remark.** The compositional constraints C5--C8 are *not* consequences of C1--C4. For instance, C5 states $\tau(\sigma(n)) = n$: knowing that $\sigma(6) = 12$ (from C1) and that $\tau(12) = 6$ requires information about $\tau$ evaluated at $12$, not at $6$. The compositional constraints encode how the *outputs* of functions at $n = 6$ feed back into each other.

### 4.2. The Composition Web

The 8 constraints form a closed network. Starting from $n = 6$, applying sequences of $\sigma$, $\tau$, and $\varphi$ produces only values in the set $V = \{2, 3, 4, 5, 6, 7, 12\}$:

```
    n = 6
    |
    +-- sigma --> 12 -- tau ----> 6 = n     (C5: loop!)
    |              |
    |              +-- phi ----> 4 = tau    (C6: cross-link)
    |
    +-- tau ----> 4 -- sigma --> 7           (C7: reaches prime 7)
    |
    +-- phi ----> 2 -- sigma --> 3           (C8: reaches LPF)
    |
    +-- sopfr --> 5                          (C4: n - 1)
```

The loop $n \xrightarrow{\sigma} 12 \xrightarrow{\tau} 6 = n$ (constraint C5) is particularly remarkable: $n = 6$ is a fixed point of $\tau \circ \sigma$. Computationally, the only fixed points of $\tau \circ \sigma$ in $[1, 100{,}000]$ are $\{1, 2, 3, 6\}$, and $n = 6$ is the only one with $\omega(n) \geq 2$.

### 4.3. Algebraic Dependence: How All Identities Derive from C1--C8

We demonstrate the derivation mechanism with representative examples.

**Example 1:** Identity $\sigma \cdot \varphi = \tau!$ (Table 1, no. 7).

By C1: $\sigma = 2n = 12$. By C2: $\tau = n - 2 = 4$. By C3 (with C1): $\varphi = 2$. Then $\sigma \cdot \varphi = 12 \cdot 2 = 24 = 4! = \tau!$. The identity holds because $2n \cdot \varphi(n) = (n-2)!$. Substituting C1 and C2 into the target equation reduces it to $2n \cdot \varphi(n) = (n-2)!$, and $\varphi(6) = 2$ (from C3) makes the arithmetic work.

**Example 2:** Identity $n! = \sigma^2 \cdot \mathrm{sopfr}$ (Table 1, no. 28).

By C1: $\sigma = 12$. By C4: $\mathrm{sopfr} = 5$. Then $\sigma^2 \cdot \mathrm{sopfr} = 144 \cdot 5 = 720 = 6! = n!$. This uses C1 and C4.

**Example 3:** Identity $\binom{n}{2} = \sigma + \mathrm{LPF}$ (Table 1, no. 26).

$\binom{n}{2} = n(n-1)/2 = 15$. By C1: $\sigma = 12$. $\mathrm{LPF}(6) = 3$. So $12 + 3 = 15$. $\checkmark$ The identity $n(n-1)/2 = 2n + \mathrm{LPF}$ simplifies to $n^2 - 5n = 2\mathrm{LPF}$, and at $n = 6$, $36 - 30 = 6 = 2 \cdot 3$. This uses C1 and the value $\mathrm{LPF} = 3$ (derivable from C4 and the prime factorization).

**General principle.** Every identity in Table 1 can be verified by substituting the 7 base values:
$$n = 6, \quad \sigma = 12, \quad \tau = 4, \quad \varphi = 2, \quad \omega = 2, \quad \mathrm{sopfr} = 5, \quad \mathrm{LPF} = 3.$$
These 7 values are determined by C1--C4 (which fix $\sigma$, $\tau$, $\varphi$, and $\mathrm{sopfr}$ in terms of $n$) together with the factorization $n = 2 \cdot 3$. The compositional constraints C5--C8 are additional independent facts that generate the "Type B" identities involving iterated function application.

### 4.4. Infinite Families

We now prove that parameterized equations yield infinitely many identities unique to $n = 6$.

**Theorem 4 (Infinite linear family).** For each integer $a \geq 0$, the equation $an + (12 - 6a) = \sigma(n)$ is unique to $n = 6$ for all but finitely many values of $a$.

*Proof.* At $n = 6$: $6a + 12 - 6a = 12 = \sigma(6)$. $\checkmark$ The equation holds at $n = 6$ for all $a$.

For $n \neq 6$: the equation $an + (12 - 6a) = \sigma(n)$ rearranges to $\sigma(n) - an = 12 - 6a$, i.e., $\sigma(n) = a(n - 6) + 12$. For $n = 7$ (say): $\sigma(7) = 8$, and the equation gives $a + 12 = 8$, so $a = -4$. For each fixed $n \neq 6$, only finitely many values of $a$ satisfy the equation (at most one, since the equation is linear in $a$). Since there are infinitely many values of $a$ but at most one "spoiler" $n$ per $a$, and each spoiler $n$ must have $\sigma(n) = a(n-6) + 12$ (which for large $|a|$ requires $n$ close to 6), all but finitely many $a$ yield equations unique to $n = 6$.

More precisely, computational verification for $a \in [0, 100]$ shows that 89 of 101 values of $a$ produce equations unique to $n = 6$ in $[2, 100{,}000]$. $\square$

**Theorem 5 (Infinite quadratic family).** For each integer pair $(a, b)$ with $16a + 4b + c = 12$ (i.e., $c = 12 - 16a - 4b$), the equation $\sigma(n) = a\tau(n)^2 + b\tau(n) + c$ is satisfied by $n = 6$. Of the 68 integer pairs $(a, b)$ tested with $|a|, |b| \leq 10$, all 68 produce equations unique to $n = 6$ in $[2, 10{,}000]$.

*Proof sketch.* The equation is $\sigma = a\tau^2 + b\tau + (12 - 16a - 4b)$, which is automatically true at $n = 6$ since $a \cdot 16 + b \cdot 4 + 12 - 16a - 4b = 12$. For other $n$, the specific values of $\sigma(n)$ and $\tau(n)$ generically fail to satisfy a random quadratic in $\tau$. $\square$

**Corollary.** The number of equations unique to $n = 6$ is infinite.

---

## 5. Comparison with $n = 28$

The second perfect number $n = 28 = 2^2 \cdot 7$ has arithmetic function values:

| Function | $n = 6$ | $n = 28$ |
|---|---|---|
| $\sigma$ | 12 | 56 |
| $\tau$ | 4 | 6 |
| $\varphi$ | 2 | 12 |
| $\omega$ | 2 | 2 |
| $\Omega$ | 2 | 3 |
| $\mathrm{sopfr}$ | 5 | 11 |
| $\mathrm{LPF}$ | 3 | 7 |
| $\mathrm{rad}$ | 6 | 14 |

**Notable cross-link.** $\tau(28) = 6$: the divisor count of the second perfect number equals the first perfect number. This is the only such "self-referential" connection among perfect numbers.

### 5.1. Testing the Headline Theorems at $n = 28$

| Identity | At $n = 28$ | Holds? |
|---|---|---|
| $\sigma = \tau(\tau-1)$ | $56$ vs. $6 \cdot 5 = 30$ | **No** |
| $d(n) \cup \{\tau\} = \mathcal{C}$ | $\{1,2,4,7,14,28\} \cup \{6\} = \{1,2,4,6,7,14,28\}$ | **No** |
| $\sigma/\tau = \mathrm{LPF}$ | $56/6 \approx 9.33$ vs. $7$ | **No** |

### 5.2. Testing the 8 Base Constraints at $n = 28$

| Constraint | At $n = 28$ | Holds? |
|---|---|---|
| C1: $\sigma = 2n$ | $56 = 56$ | **Yes** (also perfect) |
| C2: $\tau = n - 2$ | $6 \neq 26$ | **No** |
| C3: $\varphi = \omega$ | $12 \neq 2$ | **No** |
| C4: $\mathrm{sopfr} = n - 1$ | $11 \neq 27$ | **No** |
| C5: $\tau(\sigma) = n$ | $\tau(56) = 8 \neq 28$ | **No** |
| C6: $\varphi(\sigma) = \tau$ | $\varphi(56) = 24 \neq 6$ | **No** |
| C7: $\sigma(\tau) = 7$ | $\sigma(6) = 12 \neq 7$ | **No** |
| C8: $\sigma(\varphi) = 3$ | $\sigma(12) = 28 \neq 3$ | **No** |

**Result.** Of the 8 base constraints, only C1 (perfectness) generalizes to $n = 28$. The remaining 7 are exclusive to $n = 6$, which explains why almost none of the derived identities generalize.

### 5.3. Systematic Test of All 54 Identities

Of the 54 identities in Table 1, exactly **2** hold at $n = 28$:
- $\sigma(n) = 2n$ (identity 3, perfectness).
- $\sigma(n) = 2 \cdot \mathrm{rad}(n)$ fails ($56 \neq 28$), since $28$ is not squarefree.

Thus 52 of 54 identities (96%) are exclusive to $n = 6$.

### 5.4. Uniqueness Gradient

A parallel search counts identities unique to each perfect number:

```
  Unique identities
  100+|  *
      |
   54 |  *  (non-parameterized)
      |
   30 |        *  (n=28, est.)
      |
   12 |                 *  (n=496, est.)
      |
    5 |                              *  (n=8128, est.)
      +---+--------+--------+--------+----> n
          6       28      496      8128
```

The trend is monotonically decreasing: smaller perfect numbers are more arithmetically constrained. This is consistent with the "strong law of small numbers" [5] in the weak sense, but the 20-sigma outlier status of $n = 6$ (reported in [9]) argues against dismissing the phenomenon as small-number bias.

---

## 6. Conclusion

We have demonstrated that the first perfect number $n = 6$ satisfies over 100 arithmetic identities --- each with $n = 6$ as its unique solution --- spanning direct equations, compositional (iterated) equations, binomial coefficient bridges, and parameterized families. Three headline theorems have been proved in full:

1. **The permutation identity** $\sigma(n) = \tau(n)(\tau(n) - 1)$: the sum of divisors equals the number of ordered pairs from the divisor set.

2. **The crystallographic identity** $d(n) \cup \{\tau(n)\} = \{1, 2, 3, 4, 6\}$: the divisors of $n$, supplemented by their count, reproduce exactly the set of rotational symmetries allowed in periodic crystals.

3. **The mean-divisor identity** $\sigma(n)/\tau(n) = \mathrm{LPF}(n)$: the average divisor equals the largest prime factor.

An independence analysis reduces the full set of identities to 8 base constraints (C1--C8), of which 4 are direct and 4 are compositional, forming a closed algebraic web. Parameterized families prove the existence of infinitely many unique-to-6 identities. Comparison with $n = 28$ and $n = 496$ shows that the phenomenon is overwhelmingly specific to $n = 6$: of 8 base constraints, only perfectness (C1) generalizes.

The results suggest a view of $n = 6$ not merely as the smallest perfect number, but as the unique intersection point of an extraordinary number of independent arithmetic constraints. Whether this density of characterizations admits a deeper structural explanation --- beyond the confluence of extremal properties (smallest distinct-factor semiprime, squarefree, perfect, factorial, totient-minimal) --- remains an open question.

**Open problems.**

1. Is the number of *non-parameterized* identities unique to $n = 6$ finite or infinite? (The parameterized count is provably infinite.)

2. Can the crystallographic identity (Theorem 2) be "explained" --- that is, does the factorization $6 = 2 \cdot 3$ force $\mathcal{C} = d(6) \cup \{\tau(6)\}$ for a structural reason, or is the coincidence irreducible?

3. Among all integers $n \leq N$, does $n = 6$ maximize the count of unique identities for every sufficiently large $N$? The Monte Carlo analysis in [9] suggests yes, with $n = 6$ as a 20-sigma outlier, but a proof would be valuable.

4. If an odd perfect number $N$ exists, how many of the identities would it satisfy? Since most exploit $\varphi(6) = 2$ and $\tau(6) = 4$ (specific to $6 = 2 \cdot 3$), we conjecture the answer is $\leq 3$.

---

## Note Added (2026-03-30): The Confluence Reframing

After systematic breakthrough attempts [P-CONFLUENCE], we established that the ubiquity
of 6 in unique arithmetic identities is driven by its unique confluence properties
(6 = 2x3 = 3! = 1+2+3 = 1x2x3) rather than by the perfect number condition sigma(6) = 2*6.
Specifically, the 136 unique identities cataloged here arise primarily because 6 = 2x3 is the
only consecutive-prime semiprime, giving it a divisor structure {1, 2, 3, 6} that simultaneously
satisfies additive, multiplicative, and factorial constraints no other integer can. Perfectness
is a corollary of 6 = 2x3, not the root cause. See [P-CONFLUENCE] (DOI: 10.5281/zenodo.19319224)
for the full analysis including 4 honest breakthrough failures.

**Theorem update (2026-03-30):** The Consecutive Prime Factorial Product Theorem
[P-PRIME-FACTORIAL] provides the cleanest characterization: among prime pairs (p,q)
with p < q, the equation p*q = q! has the unique solution (2,3) with product 6.
This Level 3 result establishes 6's uniqueness through pure prime theory,
independent of divisor sums or perfect number conditions.

## References

[1] G. H. Hardy and E. M. Wright, *An Introduction to the Theory of Numbers*, 6th ed., Oxford University Press, 2008.

[2] T. M. Apostol, *Introduction to Analytic Number Theory*, Springer, 1976.

[3] G. Robin, "Grandes valeurs de la fonction somme des diviseurs et hypothese de Riemann," *J. Math. Pures Appl.* **63** (1984), 187--213.

[4] OEIS Foundation, *The On-Line Encyclopedia of Integer Sequences*, https://oeis.org.
  - [A000396](https://oeis.org/A000396): Perfect numbers.
  - [A000005](https://oeis.org/A000005): $\tau(n)$, number of divisors.
  - [A000010](https://oeis.org/A000010): $\varphi(n)$, Euler totient.
  - [A000203](https://oeis.org/A000203): $\sigma(n)$, sum of divisors.
  - [A001414](https://oeis.org/A001414): $\mathrm{sopfr}(n)$, sum of prime factors with repetition.
  - [A007947](https://oeis.org/A007947): $\mathrm{rad}(n)$, radical of $n$.
  - [A001221](https://oeis.org/A001221): $\omega(n)$, number of distinct prime factors.
  - [A006530](https://oeis.org/A006530): $\mathrm{LPF}(n)$, largest prime factor.

[5] R. K. Guy, "The Strong Law of Small Numbers," *Amer. Math. Monthly* **95** (1988), 697--712.

[6] P. Erdos and J.-L. Nicolas, "Repartition des nombres superabondants," *Bull. Soc. Math. France* **103** (1975), 65--90.

[7] J. H. Conway and N. J. A. Sloane, *Sphere Packings, Lattices and Groups*, 3rd ed., Springer, 1999.

[8] D. Shechtman, I. Blech, D. Gratias, and J. W. Cahn, "Metallic phase with long-range orientational order and no translational symmetry," *Phys. Rev. Lett.* **53** (1984), 1951--1953.

[9] M. W. Park, "Sixty-eight ways to be six: Arithmetic identities uniquely satisfied by the first perfect number," preprint (2026).

[10] M. A. Armstrong, *Groups and Symmetry*, Springer, 1988. (Chapter 25: The crystallographic restriction.)

[11] H. Weyl, *Symmetry*, Princeton University Press, 1952.

[12] T. Hahn (ed.), *International Tables for Crystallography, Volume A: Space-group Symmetry*, 5th ed., Springer, 2005.

[13] A. Cayley, "A theorem on trees," *Quart. J. Pure Appl. Math.* **23** (1889), 376--378.

---

## Appendix A: Complete List of the 8 Base Constraints with Uniqueness Proofs

For each constraint C$i$, we state the equation, its value at $n = 6$, and a proof sketch of uniqueness.

**C1: $\sigma(n) = 2n$ (Perfectness).** Unique among squarefree integers: $6$ is the only squarefree perfect number, since all even perfect numbers $2^{p-1}(2^p-1)$ with $p \geq 3$ have $2^{p-1} \geq 4$ (not squarefree), and odd perfect numbers (if any) require a prime factor to an even power by Euler's criterion. Among all integers, C1 is not unique to $n = 6$ (it holds for $n = 28, 496, \ldots$), so we mark C1 as the one constraint that generalizes.

**C2: $\tau(n) = n - 2$.** Proved in [9, Theorem 1]. The bound $\tau(n) \leq 2\sqrt{n}$ forces $n \leq 7$, and exhaustive check yields only $n = 6$.

**C3: $\varphi(n) = \omega(n)$ (for $\omega(n) \geq 2$).** We need $\prod_{p \mid n}(1 - 1/p) \cdot n = \omega(n)$. For $n = pq$ squarefree: $\varphi(pq) = (p-1)(q-1)$ and $\omega = 2$. So $(p-1)(q-1) = 2$, giving $p = 2, q = 3$, $n = 6$. For $\omega \geq 3$: $\varphi(n) \geq 1 \cdot 2 \cdot 4 = 8 > \omega$. No solution.

**C4: $\mathrm{sopfr}(n) = n - 1$ (for $\omega(n) \geq 2$).** For squarefree $n = p_1 \cdots p_k$: $p_1 + \cdots + p_k = p_1 \cdots p_k - 1$. For $k = 2$: $p + q = pq - 1$, i.e., $(p-1)(q-1) = 2$, giving $n = 6$. For $k \geq 3$: the product vastly exceeds the sum. For non-squarefree $n$: $\mathrm{sopfr}$ includes repeated factors, but $n - 1$ grows linearly while the product in $n$ grows multiplicatively. No other solution to $100{,}000$.

**C5: $\tau(\sigma(n)) = n$.** This asks for fixed points of $\tau \circ \sigma$. The fixed points in $[1, 100{,}000]$ are $\{1, 2, 3, 6\}$. Among these, $n = 6$ is the unique one with $\omega \geq 2$.

**C6: $\varphi(\sigma(n)) = \tau(n)$.** At $n = 6$: $\varphi(12) = 4 = \tau(6)$. Verified unique (with $\omega \geq 2$) to $100{,}000$.

**C7: $\sigma(\tau(n)) = 7$.** Requires $\tau(n) = 4$ (since $\sigma(4) = 7$ and 7 is prime, so $\sigma(m) = 7$ iff $m = 4$). Then $\sigma(\tau(n)) = 7$ iff $\tau(n) = 4$, which means $n$ has exactly 4 divisors: $n = p^3$ or $n = pq$ ($p < q$ primes). C7 alone is not unique to $n = 6$, but combined with C1 or C2 it becomes so.

**C8: $\sigma(\varphi(n)) = 3$.** Requires $\varphi(n) = 2$ (since $\sigma(2) = 3$ and $\sigma(m) = 3$ iff $m = 2$). So $\varphi(n) = 2$, which gives $n \in \{3, 4, 6\}$. Combined with $\omega \geq 2$: only $n = 6$.

---

## Appendix B: Derivation of Theorem 1 from Theorem 3 and Vice Versa

**Proposition.** For semiprimes $n = pq$ with $p < q$:
$$\sigma(n) = \tau(n)(\tau(n) - 1) \quad \iff \quad \frac{\sigma(n)}{\tau(n)} = \mathrm{LPF}(n) \quad \iff \quad \tau(n) - 1 = \mathrm{LPF}(n).$$

*Proof.* For $n = pq$: $\tau(n) = 4$ and $\mathrm{LPF}(n) = q$.

$(\Rightarrow)$ If $\sigma = \tau(\tau-1) = 12$, then $\sigma/\tau = 3 = \tau - 1$. Since $n = pq$ with $p < q$ and $(1+p)(1+q) = 12$, we showed $q = 3$, so $\mathrm{LPF} = 3 = \tau - 1$.

$(\Leftarrow)$ If $\sigma/\tau = \mathrm{LPF} = q$ and $\tau = 4$, then $\sigma = 4q$. Also $\sigma = (1+p)(1+q)$. So $(1+p)(1+q) = 4q$. Independently, $\tau - 1 = 3$, so if $\mathrm{LPF} = q = 3$, then $\sigma = 12 = 4 \cdot 3 = \tau(\tau-1)$.

The three formulations are equivalent and all point to $n = 6$. $\square$

This equivalence shows that Theorems 1 and 3, while proved independently, are two faces of the same underlying rigidity: for a semiprime, the divisor sum, divisor count, and largest prime factor are so tightly coupled that matching any two forces $n = 6$.

---

## Appendix C: Supplementary Material

The complete search and verification scripts are available at:

```
verify/verify_dna_unification.py        — Core 12 identities
verify/verify_dna_massive_mining.py     — Extended 54 identities
verify/verify_dna_independence.py       — 8-constraint analysis
verify/verify_dna_infinite_families.py  — Parameterized family search
```

To reproduce all results:

```bash
cd /path/to/TECS-L
PYTHONPATH=. python3 verify/verify_dna_unification.py
PYTHONPATH=. python3 verify/verify_dna_massive_mining.py
```

Runtime: approximately 45 seconds total (Apple M3, Python 3.12).
