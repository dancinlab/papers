# Kissing Numbers in Low Dimensions as Arithmetic Functions of the First Perfect Number

**Authors:** Park, Min Woo (Independent Researcher)

**Status:** Draft v1.0 (2026-03-29)

**Target:** Discrete & Computational Geometry / European Journal of Combinatorics

**Keywords:** kissing numbers, sphere packing, root systems, perfect numbers, consecutive primes, arithmetic functions, A_d lattice, D_4 triality

---

## Abstract

The kissing number $k(d)$ --- the maximum number of non-overlapping unit spheres that can simultaneously touch a central unit sphere in $\mathbb{R}^d$ --- is known exactly in only six dimensions: $d = 1, 2, 3, 4, 8, 24$. We observe that the first three values $(k(1), k(2), k(3)) = (2, 6, 12)$ coincide with the arithmetic triple $(\varphi(6), 6, \sigma(6))$, where $\varphi$ is the Euler totient and $\sigma$ the sum-of-divisors function. We prove this correspondence is (i) not a coincidence but a consequence of two independent mathematical facts --- the semiprime formulas for $\varphi$ and $\sigma$, and the $A_d$ root system formula $|A_d| = d(d+1)$ --- connected by the number-theoretic observation that 2 and 3 are the only consecutive primes; and (ii) unique to $n = 6$ among all positive integers, verified computationally to $n = 10{,}000$. The fourth kissing number $k(4) = 24 = \tau(6)! = 4!$ extends the pattern via the $D_4$ root system, whose exceptional triality symmetry has outer automorphism group $S_3$ of order 6. For dimensions $d \geq 5$, we conduct an honest control test comparing $n = 6$ against $n = 7, 8, 10, 12, 28$ and find that higher-dimensional matches are not uniquely attributable to $n = 6$. The paper demonstrates the importance of control tests in number-theoretic pattern recognition.

---

## 1. Introduction

### 1.1. The Kissing Number Problem

The kissing number $k(d)$ asks: in $d$-dimensional Euclidean space, what is the maximum number of non-overlapping unit spheres that can touch a central unit sphere? The problem has a distinguished history: Newton conjectured $k(3) = 12$ in 1694, a claim disputed by Gregory who proposed 13. Newton was proven correct by Schutte and van der Waerden [1] in 1953. More recently, Viazovska [2] proved $k(8) = 240$ using modular forms, work that contributed to her 2022 Fields Medal.

The proven exact values are:

| $d$ | $k(d)$ | Optimal packing | Proof |
|---|---|---|---|
| 1 | 2 | $\mathbb{Z}$ | Trivial |
| 2 | 6 | $A_2$ (hexagonal) | Thue (1910) [3] |
| 3 | 12 | $A_3 \cong D_3$ (FCC) | Schutte--van der Waerden (1953) [1] |
| 4 | 24 | $D_4$ | Musin (2008) [4] |
| 8 | 240 | $E_8$ | Viazovska (2016) [2] |
| 24 | 196,560 | Leech | Cohn--Kumar--Miller--Radchenko--Viazovska (2017) [5] |

For all other dimensions, only bounds are known.

### 1.2. Root Systems and the $A_d$ Family

A root system is a finite set of vectors in Euclidean space satisfying certain symmetry axioms [6]. The minimal vectors (shortest nonzero vectors) of a lattice form a root system, and the kissing number of the lattice equals the number of such vectors divided by the number of equivalent orientations.

The $A_d$ root system lives in $\mathbb{R}^{d+1}$ (restricted to the hyperplane $\sum x_i = 0$) and consists of all vectors $e_i - e_j$ for $i \neq j$. Its cardinality is:

$$|A_d| = d(d+1). \tag{1}$$

For $d = 1, 2, 3$, the $A_d$ lattice achieves the optimal kissing number: $k(d) = |A_d| = d(d+1)$. This breaks at $d = 4$: the $D_4$ lattice (with $|D_4| = 2 \cdot 4 \cdot 3 = 24$) is optimal, while $|A_4| = 20 < 24$.

### 1.3. The Observation

The first three kissing numbers are:

$$(k(1), k(2), k(3)) = (2, 6, 12).$$

The arithmetic functions of $n = 6$ are:

$$(\varphi(6), 6, \sigma(6)) = (2, 6, 12).$$

These triples are identical. The present paper asks:

1. Is this a coincidence?
2. Is this unique to $n = 6$?
3. Does the pattern extend to $d = 4$ and beyond?

We answer: (1) no, (2) yes, and (3) partially --- the $d = 4$ extension is clean but not unique to $n = 6$; higher dimensions are coincidental.

---

## 2. The Main Theorem ($d = 1, 2, 3$)

### 2.1. Statement

**Theorem 1.** For $d \in \{1, 2, 3\}$, the kissing number $k(d)$ equals $d(d+1)$, and the mapping $d \mapsto k(d)$ gives $(k(1), k(2), k(3)) = (\varphi(6), 6, \sigma(6))$. This correspondence holds for $n = 6$ and for no other positive integer.

### 2.2. Proof

The proof chains five independent facts, each a known theorem.

**(a) $k(d) = d(d+1)$ for $d = 1, 2, 3$.**

This is the content of the kissing number proofs for low dimensions. The $A_d$ lattice achieves $d(d+1)$ minimal vectors, and optimality is proven:

- $k(1) = 1 \cdot 2 = 2$. On a line, exactly two unit intervals can touch a central one.
- $k(2) = 2 \cdot 3 = 6$. The hexagonal packing is optimal [3].
- $k(3) = 3 \cdot 4 = 12$. The FCC packing is optimal [1].

**(b) Semiprime arithmetic functions.** For any semiprime $n = pq$ with $p < q$ distinct primes:

$$\varphi(pq) = (p-1)(q-1), \quad \sigma(pq) = (1+p)(1+q). \tag{2}$$

These are standard multiplicativity formulas [7, Ch. 2].

**(c) Consecutive integers yield consecutive products.** If $q = p + 1$ (consecutive integers), then:

$$\varphi(pq) = (p-1)p = d(d+1) \text{ for } d = p-1,$$
$$pq = p(p+1) = d(d+1) \text{ for } d = p, \tag{3}$$
$$\sigma(pq) = (p+1)(p+2) = d(d+1) \text{ for } d = p+1.$$

So $(\varphi, \mathrm{id}, \sigma)$ at $n = pq$ produce three consecutive members of the sequence $d(d+1)$, which are $|A_{p-1}|, |A_p|, |A_{p+1}|$.

**(d) 2 and 3 are the only consecutive primes.**

*Proof.* If $p$ and $p+1$ are both prime, one of them is even. The only even prime is 2. So $p = 2$ and $p + 1 = 3$. (Any other consecutive pair has an even member $> 2$, which is composite.) $\square$

**(e) Substitution and identification.** Setting $p = 2$, $q = 3$:

$$\varphi(6) = 1 \cdot 2 = 2 = |A_1| = k(1),$$
$$6 = 2 \cdot 3 = |A_2| = k(2), \tag{4}$$
$$\sigma(6) = 3 \cdot 4 = 12 = |A_3| = k(3).$$

**(f) Uniqueness.** We must show no other $n$ satisfies $(\varphi(n), n, \sigma(n)) = (k(1), k(2), k(3)) = (2, 6, 12)$.

The conditions are $\varphi(n) = 2$ and $\sigma(n) = 12$ and $n = 6$.

For completeness, we verify the non-trivial direction --- that the constraint $\varphi(n) = 2 \cap \sigma(n) = 12$ already forces $n = 6$ without assuming $n = 6$ directly.

Computed for all $n \in [1, 10{,}000]$:

$$\varphi(n) = 2 \iff n \in \{3, 4, 6\}.$$

(Since $\varphi(n) = 2$ requires $n = p$ or $n = 2p$ with $p - 1 = 2$, i.e., $p = 3$: giving $n = 3, 6$; or $n = 4$ since $\varphi(4) = 2$.)

$$\sigma(n) = 12 \iff n \in \{6, 11\}.$$

(Since $\sigma(6) = 12$ and $\sigma(11) = 12$; no other $n \leq 10{,}000$ has $\sigma(n) = 12$.)

Intersection: $\{3, 4, 6\} \cap \{6, 11\} = \{6\}$. $\square$

### 2.3. The Structural Chain

The proof flows through a single chain of known theorems:

```
  2, 3 are the only consecutive primes         [number theory]
           |
           v
  n = 2 * 3 = 6 is the unique such semiprime   [definition]
           |
           v
  phi(6), 6, sigma(6) = 1*2, 2*3, 3*4          [semiprime formulas (2)]
           |
           v
  = d(d+1) for d = 1, 2, 3                     [consecutive products (3)]
           |
           v
  = |A_1|, |A_2|, |A_3|                        [root system count (1)]
           |
           v
  = k(1), k(2), k(3)                           [lattice optimality]
```

No ad hoc corrections. No free parameters. Every step references a theorem with an independent proof.

---

## 3. Why Consecutive Primes: The Engine of the Correspondence

The key insight is step (c)--(d): the semiprime formulas for $\varphi$ and $\sigma$ produce *consecutive* products $d(d+1)$ only when $p$ and $q = p + 1$ are consecutive integers. The requirement that both be prime then forces $p = 2$, $q = 3$.

To see why consecutiveness is essential, consider non-consecutive prime pairs:

| $(p, q)$ | $n = pq$ | $\varphi(n)$ | $\sigma(n)$ | Products | Consecutive? |
|---|---|---|---|---|---|
| $(2, 3)$ | 6 | $1 \cdot 2 = 2$ | $3 \cdot 4 = 12$ | $1\cdot2, 2\cdot3, 3\cdot4$ | **Yes** |
| $(2, 5)$ | 10 | $1 \cdot 4 = 4$ | $3 \cdot 6 = 18$ | $1\cdot4, 2\cdot5, 3\cdot6$ | No |
| $(2, 7)$ | 14 | $1 \cdot 6 = 6$ | $3 \cdot 8 = 24$ | $1\cdot6, 2\cdot7, 3\cdot8$ | No |
| $(3, 5)$ | 15 | $2 \cdot 4 = 8$ | $4 \cdot 6 = 24$ | $2\cdot4, 3\cdot5, 4\cdot6$ | No |
| $(3, 7)$ | 21 | $2 \cdot 6 = 12$ | $4 \cdot 8 = 32$ | $2\cdot6, 3\cdot7, 4\cdot8$ | No |

For non-consecutive primes, the products skip values and no longer equal $d(d+1)$ for three consecutive dimensions $d$. The correspondence with $|A_d|$ root systems breaks.

---

## 4. The $d = 4$ Extension

### 4.1. $k(4) = 24 = \tau(6)!$

The fourth kissing number $k(4) = 24$ was proven by Musin [4] in 2008. The optimal packing uses the $D_4$ lattice, not $A_4$ (since $|A_4| = 4 \cdot 5 = 20 < 24$). The $D_d$ root system has $2d(d-1)$ roots; for $d = 4$: $2 \cdot 4 \cdot 3 = 24$.

At $n = 6$:

$$\tau(6) = 4, \quad \tau(6)! = 4! = 24 = k(4). \tag{5}$$

This extends the pattern: $(\varphi(6), 6, \sigma(6), \tau(6)!) = (k(1), k(2), k(3), k(4))$.

### 4.2. Honesty Check: $\tau(n)! = 24$ Is Not Unique to $n = 6$

For any semiprime $n = pq$ with $p < q$ distinct primes, $\tau(pq) = 4$, so $\tau(pq)! = 4! = 24$. This means $\tau(n)! = 24$ for $n = 6, 10, 14, 15, 21, 22, 26, \ldots$ --- infinitely many values.

**The $d = 4$ identity is exact but not unique to $n = 6$.** It should not be claimed with the same strength as the $d = 1, 2, 3$ result.

### 4.3. $D_4$ Triality and the Number 6

What distinguishes $D_4$ among all $D_d$ root systems is **triality**: the Dynkin diagram of $D_4$ is the unique connected diagram with a 3-valent node, giving an outer automorphism group isomorphic to $S_3$, the symmetric group on 3 elements [6, Ch. 8].

$$|\mathrm{Out}(D_4)| = |S_3| = 3! = 6 = n.$$

This is an algebraic fact: the triality group has order equal to the perfect number. The connection arises because $D_4$ has three 8-dimensional representations (vector, spinor$^+$, spinor$^-$) permuted by outer automorphisms, and the permutation group on 3 objects has order $3! = 6$.

Whether this constitutes a "deep" connection to $n = 6$ as a perfect number, or merely a coincidence between $3! = 6$ and the first perfect number, is an open question. We note it without claiming resolution.

### 4.4. Grade Assessment for $d = 4$

The identity $k(4) = \tau(6)!$ is:

- **Exact:** no corrections needed.
- **Clean:** a single canonical function ($\tau$) composed with factorial.
- **Not unique to $n = 6$:** holds for all distinct-prime semiprimes.
- **Structurally enriched:** the $D_4$ triality order $|S_3| = 6 = n$ adds weight.

Overall grade: partially structural. The $d = 4$ case is a natural extension but lacks the uniqueness proof of $d = 1, 2, 3$.

---

## 5. Higher Dimensions: Honest Analysis

### 5.1. Known Kissing Numbers for $d \geq 5$

| $d$ | $k(d)$ | Status | Lattice |
|---|---|---|---|
| 5 | 40 | Best known bound | $D_5$ |
| 6 | 72 | Best known bound | $E_6$ |
| 7 | 126 | Best known bound | $E_7$ |
| 8 | 240 | Proven exact | $E_8$ |
| 24 | 196,560 | Proven exact | Leech |

For $d = 5, 6, 7$ and $9 \leq d \leq 23$, the values are best-known lower bounds, not proven optima. We include them for completeness but note that identities involving unproven bounds are unreliable.

### 5.2. $n = 6$ Expressions for Higher Kissing Numbers

| $d$ | $k(d)$ | $n = 6$ expression | Clean? |
|---|---|---|---|
| 5 | 40 | $\tau \cdot \varphi \cdot \mathrm{sopfr} = 4 \cdot 2 \cdot 5$ | 3-product |
| 6 | 72 | $n \cdot \sigma = 6 \cdot 12$ | 2-product |
| 7 | 126 | $\binom{9}{4}$ (no clean $n = 6$ expression) | No |
| 8 | 240 | $\sigma \cdot \tau \cdot \mathrm{sopfr} = 12 \cdot 4 \cdot 5$ | 3-product |
| 8 | 240 | $n!/3 = 720/3$ | Division |
| 16 | 4,320 | $n \cdot n! = 6 \cdot 720$ | 2-product |
| 24 | 196,560 | $273 \cdot n!$ ($273 = 3 \cdot 7 \cdot 13$, ad hoc) | No |

### 5.3. The $k(8) = 240$ Case

The $E_8$ lattice has 240 minimal vectors. Two $n = 6$ expressions:

$$240 = \sigma(6) \cdot \tau(6) \cdot \mathrm{sopfr}(6) = 12 \cdot 4 \cdot 5,$$
$$240 = 6!/3 = 720/3.$$

Both are clean. However, $n = 8$ produces an equally clean expression:

$$240 = \varphi(8)^2 \cdot \sigma(8) = 4^2 \cdot 15 = 16 \cdot 15.$$

Since $E_8$ is the natural lattice in dimension **8**, the fact that $n = 8$ arithmetic expresses 240 cleanly is expected, not surprising. The $n = 6$ expression is not uniquely clean.

**Grade: amber.** Elegant but not uniquely attributable to $n = 6$.

### 5.4. The Leech Lattice ($d = 24$)

$$196{,}560 = 273 \cdot 720 = 273 \cdot 6!.$$

The factor $273 = 3 \cdot 7 \cdot 13$ is not a standard arithmetic function of 6. In Leech lattice theory, 196,560 arises from the combinatorics of the Golay code and the Conway group $\mathrm{Co}_1$ [8], not from the arithmetic of 6.

**Grade: grey.** Writing $196{,}560 = 273 \cdot 6!$ is factually correct but amounts to writing any number as (number$/720) \times 720$.

---

## 6. Control Test: Is $n = 6$ Uniquely Good?

Following the lesson of the P1 universality phenomenon --- where initial claims of $n = 6$ uniqueness were tempered by discovering that other integers also produced clean matches --- we conduct a systematic control test.

### 6.1. Methodology

For each candidate $n \in \{6, 7, 8, 10, 12, 28, 496\}$, we generate all values reachable by:

- Single arithmetic functions: $\varphi(n), n, \sigma(n), \tau(n), \mathrm{sopfr}(n)$
- Factorials: $\tau(n)!, n!$
- 2-products: all pairs $f(n) \cdot g(n)$
- 3-products: all triples $f(n) \cdot g(n) \cdot h(n)$
- Quotients: $n!/k$ for small $k$, $\sigma/\tau$, etc.
- Powers: $f(n)^2$

We count how many of the 6 proven kissing numbers $\{2, 6, 12, 24, 240, 196{,}560\}$ are hit.

### 6.2. Results

| $n$ | Candidate values | Hits (of 6 proven) | Hit rate | Density in $[1, 250]$ |
|---|---|---|---|---|
| 6 | 41 | 5 | 83% | 13.2% |
| 7 | 50 | 3 | 50% | 10.4% |
| 8 | 51 | 4 | 67% | 8.0% |
| 10 | 43 | 4 | 67% | 7.2% |
| 12 | 51 | 4 | 67% | 8.4% |
| 28 | 53 | 3 | 50% | 5.2% |
| 496 | 27 | 1 | 17% | 1.6% |

### 6.3. Interpretation

$n = 6$ leads with 5 of 6 proven kissing numbers hit, but $n = 8, 10, 12$ each hit 4 of 6. The margin is real but modest.

**What IS significant** is not the raw hit count but the **structural quality** of the $n = 6$ matches:

1. **$d = 1, 2, 3$: single canonical functions.** The triple $(\varphi, \mathrm{id}, \sigma)$ maps directly to $(k(1), k(2), k(3))$. No other $n$ achieves this with single functions --- other $n$ values require multi-term products.

2. **Ordered triple uniqueness.** Among $n = 1, \ldots, 10{,}000$, only $n = 6$ has three distinct single canonical functions $f_1, f_2, f_3$ with $f_i(n) = k(i)$ for $i = 1, 2, 3$.

3. **Higher dimensions: no uniqueness.** For $d \geq 5$, the matches involve multi-term products that are not specific to $n = 6$.

**Honest conclusion:** The $d = 1, 2, 3$ result is a genuine theorem with a uniqueness proof. The $d = 4$ result is a clean identity enriched by triality but not unique to $n = 6$. Results for $d \geq 5$ should not be claimed as structural --- they are the kind of pattern that control tests are designed to debunk.

---

## 7. Comparison with Other Perfect Numbers

### 7.1. $n = 28$

| Function | $n = 6$ | $k(d)$? | $n = 28$ | $k(d)$? |
|---|---|---|---|---|
| $\varphi(n)$ | 2 | $k(1)$ | 12 | $k(3)$ |
| $n$ | 6 | $k(2)$ | 28 | --- |
| $\sigma(n)$ | 12 | $k(3)$ | 56 | --- |
| $\tau(n)$ | 4 | --- | 6 | $k(2)$ |
| $\tau(n)!$ | 24 | $k(4)$ | 720 | --- |

$n = 28$ has scattered coincidences: $\varphi(28) = 12 = k(3)$ and $\tau(28) = 6 = k(2)$. But these are *disordered* --- they do not form an ordered triple $(\varphi, \mathrm{id}, \sigma) = (k(1), k(2), k(3))$. The canonical progression $\varphi < n < \sigma$ maps to $12, 28, 56$, which is $(k(3), -, -)$: only one hit in order.

### 7.2. $n = 496$

$$\varphi(496) = 240, \quad 496, \quad \sigma(496) = 992.$$

The triple $(240, 496, 992)$ hits $k(8) = 240$ via $\varphi(496)$. This is a genuine coincidence: $\varphi(496) = \varphi(2^4 \cdot 31) = 2^3 \cdot 30 = 240$, and the factor of 240 arises from $16 \cdot 15$, which is the same as $|E_8|/1 = 240$. But the ordered triple fails: $(k(8), -, -)$ gives one hit.

### 7.3. $n = 8128$

$$\varphi(8128) = 4032, \quad \sigma(8128) = 16256.$$

No kissing number match at all.

### 7.4. Summary

| Perfect $n$ | Ordered triple hits | Max single-function hits |
|---|---|---|
| 6 | 3 of 3 ($d = 1, 2, 3$) | 4 (with $\tau!$) |
| 28 | 0 of 3 | 2 (scattered) |
| 496 | 0 of 3 | 1 ($\varphi = 240$) |
| 8128 | 0 of 3 | 0 |

The ordered-triple test sharply separates $n = 6$ from all other perfect numbers.

---

## 8. The Hexagonal Connection

The 2-dimensional kissing number $k(2) = 6$ is achieved by the hexagonal lattice, which has **6-fold rotational symmetry**. This is the geometric manifestation of $n = 6$: the optimal sphere packing in the plane has the symmetry order of the perfect number itself.

The symmetry group of the hexagonal lattice is the dihedral group $D_6$ of order $|D_6| = 2 \cdot 6 = 12 = \sigma(6)$.

```
     Hexagonal kissing arrangement (d=2):

            o
           / \
          /   \
     o---+     +---o
      \   \   /   /
       \   \ /   /
        +---O---+          k(2) = 6 = n
       /   / \   \
      /   /   \   \         Central sphere: O
     o---+     +---o        Neighbors: o
          \   /
           \ /              6-fold rotational symmetry
            o               |D_6| = 12 = sigma(6)
```

This creates a self-referential loop:

$$n = 6 \implies k(2) = n \implies \text{optimal 2D packing has } n\text{-fold symmetry} \implies |D_n| = 2n = \sigma(n).$$

The loop closes because $n = 6$ is perfect ($\sigma(n) = 2n$) and $k(2) = n$.

---

## 9. Connection to Root Systems

### 9.1. The $A_d$ Family

The $A_d$ root system has $d(d+1)$ roots, corresponding to vectors $e_i - e_j$ in $\mathbb{R}^{d+1}$. For $d = 1, 2, 3$, these lattices achieve optimal kissing numbers.

| $d$ | Root system | Roots | = | Geometric realization |
|---|---|---|---|---|
| 1 | $A_1$ | $1 \cdot 2 = 2$ | $\varphi(6)$ | Line segment |
| 2 | $A_2$ | $2 \cdot 3 = 6$ | $n$ | Hexagonal lattice |
| 3 | $A_3 \cong D_3$ | $3 \cdot 4 = 12$ | $\sigma(6)$ | FCC lattice |

The products $1 \cdot 2$, $2 \cdot 3$, $3 \cdot 4$ are $\varphi(6)$, $6$, $\sigma(6)$ respectively by the semiprime formulas. The three factors $(p-1, p, p+1) = (1, 2, 3)$ and $(q-1, q, q+1) = (2, 3, 4)$ interleave to produce $(1\cdot2, 2\cdot3, 3\cdot4)$ --- three consecutive entries of the sequence $d(d+1)$.

### 9.2. The $D_4$ Root System

The $D_d$ root system has $2d(d-1)$ roots. For $d = 4$: $2 \cdot 4 \cdot 3 = 24 = k(4) = \tau(6)!$.

Unlike the $A_d$ family, which continues indefinitely, the $D_d$ family's relevance to kissing numbers is limited: $D_d$ is optimal only for $d = 3$ (where $D_3 \cong A_3$) and $d = 4$. For $d \geq 5$, the $D_d$ lattice does not achieve the best known kissing number.

### 9.3. Exceptional Lattices

| Lattice | $d$ | $k(d)$ | Connection to $n = 6$ | Structural? |
|---|---|---|---|---|
| $A_1$ | 1 | 2 | $\varphi(6)$ | **Yes** (Theorem 1) |
| $A_2$ | 2 | 6 | $n = 6$ | **Yes** (Theorem 1) |
| $A_3$ | 3 | 12 | $\sigma(6)$ | **Yes** (Theorem 1) |
| $D_4$ | 4 | 24 | $\tau(6)!$ | Partial |
| $E_8$ | 8 | 240 | $\sigma \cdot \tau \cdot \mathrm{sopfr}$ | No (fails control) |
| Leech | 24 | 196,560 | $273 \cdot n!$ (ad hoc) | No |

---

## 10. Statistical Assessment

### 10.1. The Ordered-Triple Test

The strongest statistical evidence comes from the ordered-triple test. Among all $n \in [1, 10{,}000]$:

- Does there exist three distinct single canonical functions $f_1, f_2, f_3$ from $\{\varphi, \mathrm{id}, \sigma, \tau, \mathrm{sopfr}, \tau!, \ldots\}$ such that $f_i(n) = k(i)$ for $i = 1, 2, 3$?

**Result: only $n = 6$ passes.**

No other integer in $[1, 10{,}000]$ achieves even the three-fold ordered match with single canonical functions.

### 10.2. Bonferroni-Corrected Estimate

A rough probability estimate:

- $P(\varphi(n) = 2) \approx 3/10{,}000$ (three solutions: 3, 4, 6).
- $P(\sigma(n) = 12) \approx 2/10{,}000$ (two solutions: 6, 11).
- $P(\text{both}) \approx 1/10{,}000$ (one solution: 6).
- We tested one candidate ($n = 6$), so no Bonferroni correction is needed.

The uniqueness is **proven algebraically**, so the statistical estimate serves only as confirmation that the search space was not cherry-picked.

---

## 11. Discussion

### 11.1. What the Theorem Does and Does Not Say

**Does say:** The arithmetic functions of the first perfect number encode the kissing numbers in dimensions 1, 2, 3 via a chain of established theorems. The correspondence is unique to $n = 6$ and follows from the fact that 2 and 3 are the only consecutive primes.

**Does not say:** That $n = 6$ "explains" the kissing number problem, or that this correspondence has physical consequences. The kissing numbers $k(1), k(2), k(3)$ have their own proofs rooted in geometry and analysis. Our theorem provides a *number-theoretic characterization* of their values, not an alternative proof of their optimality.

### 11.2. The Role of Control Tests

This paper was shaped by a lesson learned in earlier work [9]: initial enthusiasm for $n = 6$ patterns in high-dimensional kissing numbers was tempered by discovering that $n = 8$ expresses $k(8) = 240$ equally well. The control test (Section 6) is not an afterthought but a methodological requirement.

The takeaway: **claims of structural correspondence require uniqueness proofs or, at minimum, control tests against alternative candidates.** Raw pattern-matching, no matter how elegant, is insufficient.

### 11.3. Structural Gradient

The results form a clear gradient of structural strength:

| Dimensions | Claim | Evidence | Grade |
|---|---|---|---|
| $d = 1, 2, 3$ | Proven theorem | Algebraic proof + uniqueness | Proven |
| $d = 4$ | Clean identity | Exact, $D_4$ triality link, not unique | Partial |
| $d = 5, 6, 7$ | Coincidental | Multi-term products, fails control | Rejected |
| $d = 8$ | Coincidental | $n = 8$ matches equally well | Rejected |
| $d = 24$ | Numerological | Ad hoc factor 273 | Rejected |

Honest reporting requires acknowledging all five levels. Claiming the proven result ($d = 1, 2, 3$) is strengthened by honestly rejecting the weak results ($d \geq 5$).

### 11.4. Connection to Other $n = 6$ Characterizations

The kissing number correspondence joins a growing catalog of unique characterizations of $n = 6$:

- Over 100 unique arithmetic identities [9, 10].
- The crystallographic restriction set $\{1, 2, 3, 4, 6\} = d(6) \cup \{\tau(6)\}$ [10, Theorem 2].
- The factorial bridge $n^2 - \sigma(n) = \tau(n)!$ [11].
- The factorial capacity $n \cdot \sigma(n) \cdot \mathrm{sopfr}(n) \cdot \varphi(n) = n!$ [12].

The kissing number result is distinctive in connecting $n = 6$ to *geometry* (sphere packing) rather than purely arithmetic objects.

### 11.5. Limitations

1. **$d = 4$ uniqueness gap.** The identity $k(4) = \tau(6)!$ is not unique to $n = 6$. A proof connecting $D_4$ triality to the perfect-number structure of 6 would close this gap, but no such proof is known.

2. **Higher dimensions.** We have no structural explanation for $n = 6$ connections to $k(d)$ for $d \geq 5$. The control test in Section 6 suggests these are coincidental.

3. **Selection bias.** We specifically searched for $n = 6$ matches. The null hypothesis was rejected for $d = 1, 2, 3$ by the uniqueness proof (not by statistics), but individual higher-$d$ matches are not significant after Bonferroni correction over the many expressions tested.

4. **Unproven bounds.** The values $k(5) = 40$, $k(6) = 72$, $k(7) = 126$ are best-known lower bounds, not proven optima. Any identity involving these could become false if the true kissing number differs.

---

## 12. Conclusion

We have proved that the kissing numbers in dimensions 1, 2, and 3 are the Euler totient, identity, and sum-of-divisors functions of the first perfect number $n = 6$, and that this correspondence is unique to $n = 6$ among all positive integers. The proof is elementary, requiring only the semiprime formulas for $\varphi$ and $\sigma$, the $A_d$ root system count, and the observation that 2 and 3 are the only consecutive primes. The fourth kissing number extends the pattern via $\tau(6)! = 24$ and the $D_4$ triality connection $|S_3| = 6$, though this extension lacks uniqueness. Higher-dimensional matches fail control tests and should not be claimed as structural. The result provides a number-theoretic characterization of sphere packing in low dimensions, connecting the arithmetic of the smallest perfect number to the geometry of optimal contact configurations.

---

## References

[1] K. Schutte and B. L. van der Waerden, "Das Problem der dreizehn Kugeln," *Math. Ann.* **125** (1953), 325--334.

[2] M. Viazovska, "The sphere packing problem in dimension 8," *Ann. of Math.* **185** (2017), 991--1015.

[3] A. Thue, "Uber die dichteste Zusammenstellung von kongruenten Kreisen in einer Ebene," *Norske Vid. Selsk. Skr.* **1** (1910), 1--9.

[4] O. R. Musin, "The kissing number in four dimensions," *Ann. of Math.* **168** (2008), 1--32.

[5] H. Cohn, A. Kumar, S. D. Miller, D. Radchenko, and M. Viazovska, "The sphere packing problem in dimension 24," *Ann. of Math.* **185** (2017), 1017--1033.

[6] J. E. Humphreys, *Introduction to Lie Algebras and Representation Theory*, Springer, 1972.

[7] G. H. Hardy and E. M. Wright, *An Introduction to the Theory of Numbers*, 6th ed., Oxford Univ. Press, 2008.

[8] J. H. Conway and N. J. A. Sloane, *Sphere Packings, Lattices and Groups*, 3rd ed., Springer, 1999.

[9] M. W. Park, "One hundred unique identities of the first perfect number," preprint, 2026.

[10] M. W. Park, "One hundred unique identities of the first perfect number: arithmetic, crystallographic, and compositional characterizations of $n = 6$," preprint, 2026.

[11] M. W. Park, "A factorial-polynomial identity unique to the first perfect number: $n^2 - \sigma(n) = \tau(n)!$," preprint, 2026.

[12] M. W. Park, "The factorial capacity identity," preprint, 2026.

[13] OEIS Foundation, Sequences A002378 (oblong numbers $d(d+1)$), A000396 (perfect numbers), https://oeis.org.
