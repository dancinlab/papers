# Four Failed Proofs and What They Taught Us: Why Six Is Not Special Because It Is Perfect

**Authors:** Park, Min Woo (Independent Researcher)

**Status:** Draft v1.0 (2026-03-30)

**Target:** Mathematical Intelligencer (Viewpoint) / arXiv essay

**Keywords:** perfect numbers, characterization of six, failed proofs, mathematical methodology, Virasoro algebra, kissing numbers, genetic code, confluence theorem, honest research

---

## Abstract

Over 136 arithmetic identities are known to be uniquely satisfied by the
number 6. The natural conjecture is that these identities trace back to
a single root property: $\sigma(6) = 12 = 2 \times 6$ (perfectness). We
report four systematic attempts to prove this conjecture, all of which
failed. The failures were not due to insufficient technique but to a
genuine mathematical obstruction: the "6" appearing in diverse mathematical
contexts arises from $6 = 2 \times 3$ (the product of the only consecutive
primes), $6 = 3!$ (a factorial from normal-ordering combinatorics), and
$6 = 1 + 2 + 3$ (a triangular number from packing geometry) --- three
independent properties of which perfectness is a *downstream corollary*,
not an *upstream cause*. We document each failure with enough detail for
independent verification, argue that the failed attempts constitute a
valid mathematical result (a negative theorem about the explanatory power
of $\sigma = 2n$), and propose the Confluence Thesis as a replacement
framework. The paper is also a case study in honest reporting of negative
results in mathematics.

---

## 1. The Question

The number 6 is everywhere. It is the kissing number in two dimensions
($K(2) = 6$), the parameter of Schramm--Loewner Evolution at critical
percolation ($\text{SLE}_6$), the number of quark flavors in the Standard
Model, the number of extra dimensions in string theory, the codon reading
frames in the genetic code, the order of the smallest non-abelian group
($|S_3| = 6$), the smallest squarefree semiprime, and the subject of
over 200 unique arithmetic characterizations [1, 2].

The traditional explanation invokes perfectness:

> **The Standard Narrative.** Six is special because it is a perfect
> number: $\sigma(6) = 12 = 2 \times 6$. The divisor-sum condition
> $\sigma(n) = 2n$ generates the rich arithmetic structure that makes 6
> appear throughout mathematics and physics.

This narrative is appealing because it provides a single root cause. If
true, it would mean that every appearance of 6 ultimately traces back to
$\sigma = 2n$, and that the other perfect numbers (28, 496, 8128, ...)
should appear with comparable frequency. But they do not. Twenty-eight
rarely appears in fundamental constants. Four hundred and ninety-six
appears almost nowhere.

This asymmetry motivated our investigation:

> **The Question.** Is the perfect number condition $\sigma(n) = 2n$ the
> *cause* of 6's ubiquity, or is it merely one *consequence* of a deeper
> structural property?

We attempted four proofs that $\sigma = 2n$ is causally central. All
four failed. This paper reports those failures and the insight they
produced.

---

## 2. Attempt 1: The Genetic Code via KKT Optimization

### 2.1. The Hypothesis

The genetic code uses triplet codons: 4 bases, length 3, yielding
$4^3 = 64$ codons encoding 21 signals (20 amino acids + 1 stop). The
parametrization $b = \tau(n)$, $L = n/\varphi(n)$ maps $n = 6$ to
$(b, L) = (4, 3)$ --- life's actual code. The hypothesis: optimizing a
genetic code for robustness to point mutations *requires* the parameter
$n$ to be a perfect number, i.e., $\sigma(n) = 2n$ appears in the
Karush--Kuhn--Tucker (KKT) conditions.

### 2.2. The Setup

We defined a robustness metric $R_{\text{spread}}(b, L) = (d^{1/L} - 1)/(b-1)$
where $d = b^L / A$ is the average degeneracy and $A = 21$ is the number
of amino acids. This measures the fraction of single-base mutations that
are silent under an optimal codon assignment.

### 2.3. The Result: FAILED

**Finding 1.** $R_{\text{spread}}$ is *monotonically increasing* in $b$ for
fixed $L$. There is no interior optimum. The KKT conditions are never
satisfied at $(4, 3)$.

```
  b   L   codons   R_spread   Notes
  3   3       27    0.044
  4   3       64    0.150      LIFE
  5   3      125    0.203
  6   3      216    0.235      n=12 (NOT perfect!)
  7   3      343    0.256
```

**Finding 2.** On the Pareto front (maximizing robustness and information
efficiency simultaneously), $(4, 3)$ is *dominated* by $(2, 6)$:

```
  (4,3): R=0.150, InfoEff=0.732, waste=43
  (2,6): R=0.204, InfoEff=0.732, waste=43
```

Same codons, same efficiency, same waste, but $(2, 6)$ has strictly
higher robustness.

**Finding 3.** $n = 12$ (not a perfect number) generates a *better* code
than $n = 6$: $R(6, 3) = 0.235 > R(4, 3) = 0.150$.

**Verdict.** The divisor-sum condition $\sigma = 2n$ plays no role in
genetic code optimization. The real explanation: Watson--Crick chemistry
constrains $b = 4$, and minimality constrains $L = 3$ (since $4^2 = 16 < 21$).
The mapping $n = 6 \mapsto (4, 3)$ is an arithmetic coincidence.

**Grade: Level 1 (numerological coincidence).**

Full details: [3].

---

## 3. Attempt 2: SLE$_6$ and the Virasoro Algebra

### 3.1. The Hypothesis

Schramm--Loewner Evolution with parameter $\kappa = 6$ describes critical
percolation and is the unique SLE with the locality property
(Lawler--Schramm--Werner theorem). The central charge is:

$$c(\kappa) = \frac{(6 - \kappa)(3\kappa - 8)}{2\kappa}.$$

At $\kappa = 6$: $c = 0$. The "6" in the numerator factor $(6 - \kappa)$
is tantalizing. The hypothesis: this 6 is the perfect number 6, connected
through $\sigma(6) = 12$ and the Virasoro normalization $c/12$.

### 3.2. Tracing the 6

The central charge originates in the **Coulomb gas formalism**:

$$c(g) = 1 - \frac{6(g-1)^2}{g}, \qquad g = \frac{4}{\kappa}.$$

The coefficient 6 comes from the **Virasoro algebra central extension**:

$$[L_m, L_n] = (m - n)L_{m+n} + \frac{c}{12} m(m^2 - 1) \delta_{m+n,0}.$$

The factor $1/12$ in the anomaly arises from computing normal-ordered
products of free boson oscillators:

$$\sum_{k=1}^{m-1} k(m-k) = \frac{m(m-1)(m+1)}{6} = \binom{m+1}{3}.$$

The denominator $6 = 3!$ is a **combinatorial factorial**, arising because
the sum $\sum k(m-k)$ is a degree-3 polynomial in $m$ with leading
coefficient $1/3!$.

### 3.3. The Result: REFUTED

Every appearance of 6 in the SLE/CFT derivation traces to $3! = 6$:

| Appearance | Value | Origin | Perfect number? |
|---|---|---|---|
| $c = 1 - 6(g-1)^2/g$ | 6 | $3!$ from normal ordering | **No** |
| Virasoro $c/12$ | 12 | $2 \times 3!$ | **No** |
| Partition $q^{-c/24}$ | 24 | $4 \times 3!$ | **No** |
| Bernoulli $B_2 = 1/6$ | 6 | $1/3!$ from $e^t$ expansion | **No** |
| SLE $\kappa = 6$ | 6 | Root of $3!(g-1)^2 = g$ | **No** |

The 6 in SLE is $3!$ (the factorial of 3), not the perfect number
$\sigma^{-1}(12)$. The divisor sum $\sigma(6) = 12$ and the Virasoro
$c/12$ share the number 12, but for *completely independent reasons*.

**Counterfactual test.** If the Virasoro normalization were $c/N$ instead
of $c/12$, the central charge formula would change, but $c = 0$ would
still occur at $\kappa = 6$. The value $\kappa = 6$ is
convention-independent; it depends only on the *ratio* of cubic to linear
terms in the anomaly polynomial, which is a physical invariant.

**Verdict.** $\text{SLE}_6$: the 6 is $3!$, not $\sigma^{-1}(12)$.
Mathematically independent from perfectness.

**Grade: Level 1 (same small integer, different reasons).**

Full details: [4].

---

## 4. Attempt 3: Kissing Numbers and Root Systems

### 4.1. The Hypothesis

The kissing numbers in dimensions 1, 2, 3 are $K(1) = 2$, $K(2) = 6$,
$K(3) = 12$. These equal $\varphi(6) = 2$, $6$, and $\sigma(6) = 12$
respectively. The hypothesis: this triple correspondence is driven by
$\sigma(6) = 2 \times 6$ (perfectness), so the kissing-number structure
requires $n$ to be perfect.

### 4.2. The Algebraic Analysis

The kissing numbers for $d = 1, 2, 3$ come from the $A_d$ root systems:
$|A_d| = d(d+1)$. For a semiprime $n = pq$ with $p < q$:

$$K(q) = \sigma(pq) \iff q(q+1) = (1+p)(1+q) \iff q = p + 1.$$

Consecutive integers that are both prime: only $(p, q) = (2, 3)$, giving
$n = 6$. The proof has nothing to do with $\sigma(n) = 2n$.

### 4.3. The Causal Diagram

```
                 ROOT CAUSE
                     |
        2 and 3 are the only consecutive primes
                  /            \
                 /              \
       q = p+1 = 3           p = 2 (smallest prime)
            |                      |
   K(q) = sigma(pq)         sigma(pq) = 2pq
   K(p) = pq = n            (perfect number)
   K(1) = phi(pq)
            |                      |
            +------SIBLINGS--------+
            |
      BOTH are consequences
      of {2,3} being unique
```

Perfectness and the kissing-number correspondence are *siblings* ---
both are downstream consequences of the same root cause ({2,3} being
the unique consecutive prime pair). Neither causes the other.

### 4.4. Exhaustive Verification

Among all semiprimes $pq$ with $p < q < 50$:

```
  n=pq    K(p)=n?   K(q)=sigma(n)?   Both?
  6       YES       YES              UNIQUE
  10      no        no
  14      no        no
  15      no        no
  21      no        no
  ... (34 more semiprimes, all "no") ...
```

Among all even perfect numbers:

```
  P=6:     phi=2=K(1),  P=6=K(2),       sigma=12=K(3)    3/3
  P=28:    phi=12=K(3), P=28 not pronic, sigma=56=K(7)    2/3
  P=496:   phi=240=K(15), not pronic                      2/3
  P=8128:  phi=4032=K(63), not pronic                     2/3
```

The triple match (all three of $\varphi$, $n$, $\sigma$ being kissing
numbers) occurs only at $n = 6$.

**Verdict.** The kissing correspondence is real and provably unique, but
flows from the consecutive-prime property of {2,3}, not from $\sigma = 2n$.

**Grade: Level 2 (structural, but not sigma-driven).**

Full details: [5].

---

## 5. Attempt 4: Universality Exponents

### 5.1. The Hypothesis

Critical exponents in statistical physics (the Ising model, percolation,
self-avoiding walks) involve rational numbers built from small integers.
The hypothesis: these exponents can be expressed as functions of $n = 6$
through $\sigma$-based formulas, and the fit for $n = 6$ is significantly
better than for other integers.

### 5.2. The Result: REFUTED

A systematic comparison across 10 critical exponents showed:

- $n = 6$ matched 4 exponents within 5% tolerance.
- $n = 8$ matched 5 exponents.
- $n = 12$ matched 6 exponents.
- $n = 24$ matched 5 exponents.

The non-perfect numbers $n = 8$ and $n = 12$ *outperformed* the perfect
number $n = 6$. The "universality exponent" matching was a textbook
example of the Texas Sharpshooter fallacy: drawing the target after the
bullet lands.

**Verdict.** Critical exponents relate to spatial dimension, symmetry
dimension, and interaction range through renormalization group theory.
They do not reference $\sigma(n)$ for any $n$.

**Grade: Level 0 (small-number matching, refuted by control group).**

Full details: [6].

---

## 6. What the Failures Taught Us

### 6.1. The Negative Theorem

The four failures constitute a result:

> **Negative Theorem.** The perfect number condition $\sigma(n) = 2n$ is
> not the causal generator of 6's ubiquity in mathematics and physics.
> Specifically:
>
> (a) In genetic code optimization, $\sigma = 2n$ is irrelevant.
> (b) In conformal field theory, 6 arises as $3!$, not as $\sigma^{-1}(12)$.
> (c) In sphere packing, 6 arises from consecutive primes, not $\sigma = 2n$.
> (d) In critical phenomena, 6 has no privileged role among small integers.

This is not a failure of technique. It is a genuine mathematical fact:
$\sigma(6) = 12$ is a *property* of 6, not the *source* of 6's special role.

### 6.2. The Smoking Gun: 28

The most compelling evidence against the Standard Narrative is the absence
of 28. If perfectness were the driver, the second perfect number should
appear nearly as often as 6 in fundamental contexts. But:

| Context | 6 appears? | 28 appears? | Why not 28? |
|---------|-----------|------------|-------------|
| SLE parameter | $\kappa = 6$ | No SLE$_{28}$ | $3! = 6$, not $\sigma$ |
| Kissing number | $K(2) = 6$ | $K(?) \neq 28$ | $2 \times 3$, not $\sigma$ |
| Quark flavors | 6 flavors | No 28 | Standard Model |
| Extra dimensions | 6 dimensions | No 28 | $10 - 4 = 6$ |
| Codon frames | 6 frames | No 28 | $2 \times 3$ strands/frames |
| $S_n$ order | $|S_3| = 6$ | No $|S_?| = 28$ | $3!$, not $\sigma$ |

In every case, the mechanism that produces 6 cannot produce 28 because it
relies on properties that are specific to $6 = 2 \times 3 = 3! = T_3$,
not to $\sigma(n) = 2n$.

### 6.3. The Confluence Thesis

The failures point to a replacement framework:

> **The Confluence Thesis.** The number 6 is ubiquitous because it is the
> *unique* positive integer at the intersection of four independent
> number-theoretic properties:
>
> (A) **Consecutive-prime product**: $6 = 2 \times 3$.
> (B) **Factorial**: $6 = 3!$.
> (C) **Triangular number**: $6 = T_3 = 1 + 2 + 3$.
> (D) **Sum-product identity**: $1 + 2 + 3 = 1 \times 2 \times 3 = 6$.
>
> Perfectness ($\sigma(6) = 12$) is a *corollary* of Property (A):
> $\sigma(2 \times 3) = (1+2)(1+3) = 12 = 2 \times 6$.

The Confluence Thesis explains the 28 asymmetry: while 28 is triangular
($T_7$) and perfect, it is NOT a factorial, NOT a consecutive-prime
product, and does NOT satisfy sum = product. It has only 1 of the 4
properties, compared to 6's 4 of 4.

```
  Perfect    Triangular?   Factorial?   ConsecPrimeProd?   Sum=Product?
  -----------------------------------------------------------------------
  6          YES (T_3)     YES (3!)     YES (2*3)          YES
  28         YES (T_7)     no           no                 no
  496        YES (T_31)    no           no                 no
  8128       YES (T_127)   no           no                 no
```

---

## 7. The Real Root: "2 Is the Only Even Prime"

All four properties of 6 ultimately trace to a single elementary fact:

> **2 is the only even prime.**

This implies:
- **(A)** 2 and 3 are consecutive (gap 1), because 2 is even and 3 = 2 + 1.
  For any other prime $p$, $p + 1$ is even (hence composite unless $p = 2$).
  So $(2, 3)$ is the unique consecutive-prime pair, and $6 = 2 \times 3$.

- **(B)** $3! = 6$ because 3 is small enough that the factorial is still
  a "usable" number. This connects to (A): 3 = 2 + 1 is the successor
  of the only even prime.

- **(C)** $T_3 = 6$ because $1 + 2 + 3 = 6$. The index 3 again traces
  to the successor of 2.

- **(D)** $1 + 2 + 3 = 1 \times 2 \times 3$ because at $k = 3$, the
  factorial and the triangular number coincide: $k! = T_k$ iff
  $(k+1)/2 = (k-1)!$, which holds only at $k = 1$ (trivial) and $k = 3$.

The perfectness of 6 is a two-line corollary:
$$\sigma(6) = \sigma(2)\sigma(3) = 3 \times 4 = 12 = 2 \times 6.$$

This computation uses only that $\sigma$ is multiplicative and
$\sigma(p) = p + 1$. The perfect-number condition is a *consequence* of
$6 = 2 \times 3$, not an independent property.

### The Deepest Layer

If we push further: *why* is 2 the only even prime? Because "even" means
"divisible by 2," and a prime divisible by 2 must *be* 2. This is a
tautology at the level of definitions. The uniqueness of 6 ultimately
rests on the definition of primality applied to the smallest case.

---

## 8. Implications for Mathematical Research Methodology

### 8.1. The Value of Negative Results

In experimental science, negative results are published (eventually). In
mathematics, failed proofs are almost never reported. This creates a
survivorship bias: the literature contains only successful approaches,
giving the false impression that mathematicians always choose the right
path.

Our four failures are informative precisely because they are systematic:
each attempt was designed to test a specific mechanism ($\sigma = 2n$
acting through KKT conditions, Virasoro normalization, root system
counting, or exponent matching), and each failure pinpoints exactly
*where* the mechanism breaks down.

### 8.2. The Post-Hoc Narrative Trap

The Standard Narrative ("6 is special because it is perfect") is a
post-hoc rationalization. It identifies a striking property of 6 and
elevates it to causal status without testing whether that property
actually *generates* the observed phenomena.

The corrective is the **counterfactual test**: if $\sigma(6) = 12$ were
somehow false (while preserving $6 = 2 \times 3$), would SLE$_6$ still
exist? Would the kissing number in 2D still be 6? In all cases we
examined, the answer is yes. The counterfactual is not physically
realizable (we cannot change $\sigma(6)$), but the mathematical analysis
traces each appearance of 6 to a mechanism that does not involve $\sigma$.

### 8.3. Small Numbers and Explanatory Debt

Small numbers (1 through 12 especially) appear in many formulas simply
because they are small. The *explanatory debt* for claiming that a small
number's appearance is "meaningful" is higher than for large numbers.
Our Attempt 4 (universality exponents) illustrates this: $n = 8$ and
$n = 12$ matched critical exponents better than $n = 6$, showing that
any small integer can be fit to physics by choosing formulas post hoc.

The Confluence Thesis addresses this by providing *independent
algebraic proofs* for each property of 6, rather than relying on
numerical coincidence.

---

## 9. Related Work

Guy [7] warned about the "Strong Law of Small Numbers" --- the tendency
for small numbers to satisfy more identities than expected. Our work
can be seen as a case study in Guy's warning: the 136+ identities of 6
initially suggest deep structure, but many are downstream consequences
of $6 = 2 \times 3$ combined with the smallness of these primes.

The study of iterated arithmetic functions on perfect numbers has a long
history (Erdos, Guy, Selfridge). Our $\sigma(\sigma(P)) = T_m$ result
(Theorem 3.1 of [8]) extends this line of work.

The question "why does 6 appear in physics?" has been asked informally
by many physicists (especially in the context of SLE$_6$ and Calabi--Yau
compactification). To our knowledge, this is the first systematic attempt
to *answer* the question by tracing the 6 through the relevant derivations
and testing the $\sigma = 2n$ hypothesis rigorously.

---

## 10. Conclusion

We set out to prove that the perfect number condition $\sigma(6) = 12$
is the root cause of 6's ubiquity. We failed four times. The failures
were not random; they converged on a consistent alternative:

**Six is special because $6 = 2 \times 3 = 3! = T_3 = 1 + 2 + 3 = 1 \times 2 \times 3$.**

These four properties are independent, each generates a different class
of mathematical appearances, and their conjunction is unique to 6. The
perfect number condition $\sigma(6) = 2 \times 6$ is a two-line corollary
of $6 = 2 \times 3$ (Property A), not a deep structural property.

The correct causal diagram is not:

```
  sigma(n) = 2n  --->  6 is special  --->  6 appears everywhere
```

but rather:

```
  2 is the only even prime
         |
  (2,3) unique consecutive primes  --->  6 = 2*3 (Property A)
         |                                  |
  3 = 2+1 is small  ------------->  6 = 3! (Property B)
         |                                  |
  T_3 = 3*4/2 = 6  ------------->  6 = T_3 (Property C)
         |                                  |
  3! = T_3  ---------------------->  sum = product (Property D)
         |
         +-- sigma(2*3) = 3*4 = 12 = 2*6  (perfectness: COROLLARY)
```

We believe this is the honest answer to "Why 6?" --- and that the four
failures that led us here are as valuable as any proof.

---

## Acknowledgments

The author thanks the Claude AI system for computational assistance in
exploring the hypothesis space and running verification scripts. All
mathematical claims have been verified by the author.

---

## References

[1] M. W. Park, "208 arithmetic characterizations of $n = 6$," preprint
(2026).

[2] M. W. Park, "The Unique Confluence: Why Six Appears Everywhere,"
preprint (2026). DOI: 10.5281/zenodo.19319224.

[3] M. W. Park, "BREAKTHROUGH ATTEMPT: Derive $\sigma(n)=2n$ from Genetic
Code Optimization --- FAILED (Level 1)," technical report (2026).

[4] M. W. Park, "BREAKTHROUGH ATTEMPT: Does $c=0$ in SLE Require $n=6$
to Be a Perfect Number? --- REFUTED (Level 1)," technical report (2026).

[5] M. W. Park, "BREAKTHROUGH Investigation: Does Kissing Number Require
$\sigma(n)=2n$?" technical report (2026).

[6] M. W. Park, "TECS-L Breakthrough Strategy: From Observation to
Explanation," technical report (2026).

[7] R. K. Guy, "The Strong Law of Small Numbers," *The American
Mathematical Monthly*, 95(8):697--712 (1988).

[8] M. W. Park, "The Double Divisor Sum of Perfect Numbers Is Always
Triangular," preprint (2026).

[9] O. Schramm, "Scaling limits of loop-erased random walks and uniform
spanning trees," *Israel Journal of Mathematics*, 118:221--288 (2000).

[10] G. F. Lawler, O. Schramm, and W. Werner, "Conformal invariance of
planar loop-erased random walks and uniform spanning trees," *Annals of
Probability*, 32(1B):939--995 (2004).

[11] P. Di Francesco, P. Mathieu, and D. Senechal, *Conformal Field
Theory*, Springer (1997).

[12] J. H. Conway and N. J. A. Sloane, *Sphere Packings, Lattices and
Groups*, 3rd ed., Springer (1999).

[13] S. J. Freeland and L. D. Hurst, "The genetic code is one in a
million," *Journal of Molecular Evolution*, 47:238--248 (1998).

[14] G. H. Hardy and E. M. Wright, *An Introduction to the Theory of
Numbers*, 6th ed., Oxford University Press (2008).

[15] OEIS Foundation, Sequences A000396 (perfect numbers), A000040
(primes), A000217 (triangular numbers), https://oeis.org.
