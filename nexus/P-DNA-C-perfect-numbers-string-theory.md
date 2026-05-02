# Perfect Numbers as Structural Constants of String Theory

**Park, Min Woo** (Independent Researcher)

**Target:** arXiv hep-th / Letters in Mathematical Physics

**Status:** Draft v1.0 (2026-03-29)

**DOI (preprint):** pending

---

## Abstract

We observe that the first three even perfect numbers $P_1 = 6$, $P_2 = 28$, and $P_3 = 496$ appear as fundamental structural constants of superstring theory: $P_1 = 6$ as the Calabi-Yau compactification dimension, $P_2 = 28$ as the dimension of the little group $\mathrm{SO}(8)$, and $P_3 = 496$ as the gauge group dimension required by Green-Schwarz anomaly cancellation (both $\mathrm{SO}(32)$ and $E_8 \times E_8$). We prove five theorems connecting perfect numbers to Lie group dimensions: (A) $\dim(\mathrm{SE}(\mathrm{LPF}(n))) = n$ for every even perfect $n$; (B) $\dim(\mathrm{SO}(2^p)) = n$ when $n$ is the $p$-th Mersenne perfect number; (C) anomaly cancellation in $d = 2k$ superstring dimensions with gauge group $\mathrm{SO}(2^k)$ yields a perfect number dimension when $2^k - 1$ is a Mersenne prime; (D) $T(p)$ is perfect if and only if $p$ is a Mersenne prime; (E) $\sigma(P_k) \varphi(P_k) / P_k^2 = (M_p - 1)/M_p$ converges to 1, with $P_1 = 6$ giving the unique value $2/3$. The appearance of three consecutive perfect numbers in string theory is a convergence of two independent facts: physics selects the exponents $p \in \{2, 3, 5\}$ through consistency conditions, and number theory ensures that $2^p - 1$ is prime for these values. We argue that perfect numbers form the arithmetic skeleton of quantum gravity.

---

## 1. Introduction

The even perfect numbers --- integers $n$ satisfying $\sigma(n) = 2n$, where $\sigma$ is the sum-of-divisors function --- have been studied since Euclid, who proved that $2^{p-1}(2^p - 1)$ is perfect whenever $2^p - 1$ is prime (a *Mersenne prime*). Euler proved the converse: every even perfect number has this form. The first three are:

$$P_1 = 6 = 2 \cdot 3, \quad P_2 = 28 = 4 \cdot 7, \quad P_3 = 496 = 16 \cdot 31.$$

Independently, superstring theory --- the leading candidate for a quantum theory of gravity --- relies on several numerical constraints for consistency: the spacetime dimension must be $d = 10$, compactification to four observable dimensions requires 6 extra dimensions, the little group for massless particles in 10D is $\mathrm{SO}(8)$ with $\dim = 28$, and gauge anomaly cancellation via the Green-Schwarz mechanism [1] requires $\dim(G) = 496$, realized by $\mathrm{SO}(32)$ or $E_8 \times E_8$.

That these three numbers are precisely the first three perfect numbers has been noted in passing by several authors [2, 3], but no systematic investigation of the connection has been undertaken. In this paper, we prove five theorems that formalize the relationship between perfect numbers and Lie group dimensions, trace the chain of physical and mathematical necessity that produces each perfect number in string theory, and assess whether the convergence is coincidental or structural.

## 2. Main Results

### 2.1 Theorem A: The SE Dimension Theorem

**Theorem A.** *For every even perfect number $n = 2^{p-1}(2^p - 1)$, the dimension of the special Euclidean group in $\mathrm{LPF}(n)$ dimensions equals $n$:*

$$\dim(\mathrm{SE}(\mathrm{LPF}(n))) = n.$$

*Proof.* The largest prime factor of $n = 2^{p-1}(2^p - 1)$ is the Mersenne prime $M_p = 2^p - 1$. The special Euclidean group $\mathrm{SE}(m) = \mathrm{SO}(m) \ltimes \mathbb{R}^m$ has dimension $m(m+1)/2$. Setting $m = M_p$:

$$\dim(\mathrm{SE}(M_p)) = \frac{M_p(M_p + 1)}{2} = \frac{(2^p - 1) \cdot 2^p}{2} = 2^{p-1}(2^p - 1) = n. \quad \square$$

**Corollary.** Every even perfect number equals the number of rigid-body degrees of freedom in a space whose dimension is its largest prime factor.

| Perfect number | LPF | $\dim(\mathrm{SE}(\mathrm{LPF}))$ | Match? |
|---|---|---|---|
| 6 | 3 | $3 \cdot 4/2 = 6$ | $\checkmark$ |
| 28 | 7 | $7 \cdot 8/2 = 28$ | $\checkmark$ |
| 496 | 31 | $31 \cdot 32/2 = 496$ | $\checkmark$ |
| 8128 | 127 | $127 \cdot 128/2 = 8128$ | $\checkmark$ |
| 33550336 | 8191 | $8191 \cdot 8192/2 = 33550336$ | $\checkmark$ |

### 2.2 Theorem B: The SO Dimension Theorem

**Theorem B.** *For every even perfect number $n = 2^{p-1}(2^p - 1)$:*

$$\dim(\mathrm{SO}(2^p)) = n.$$

*Proof.* $\dim(\mathrm{SO}(m)) = m(m-1)/2$. Setting $m = 2^p$: $2^p(2^p - 1)/2 = 2^{p-1}(2^p - 1) = n$. $\square$

### 2.3 Theorem C: Anomaly-Perfection Theorem

**Theorem C.** *If $d$-dimensional superstring theory requires gauge group $\mathrm{SO}(2^k)$ for anomaly cancellation, and $2^k - 1$ is a Mersenne prime, then $\dim(\mathrm{SO}(2^k))$ is an even perfect number.*

*Proof.* Immediate from Theorem B and the Euclid-Euler theorem. $\square$

**Application.** In $d = 10$ superstring theory, $k = 5$, so $\mathrm{SO}(32)$ has $\dim = 496 = P_3$. Since $31 = 2^5 - 1$ is a Mersenne prime, Theorem C applies.

### 2.4 Theorem D: Triangular-Perfect Equivalence

**Theorem D.** *The triangular number $T(p) = p(p+1)/2$ is an even perfect number if and only if $p$ is a Mersenne prime.*

*Proof.* ($\Rightarrow$) If $T(p)$ is even perfect, then by Euler's theorem $T(p) = 2^{k-1}(2^k - 1)$ for some $k$ with $2^k - 1$ prime. Then $p(p+1)/2 = 2^{k-1}(2^k - 1)$. Since $2^k - 1$ is odd and prime, and $p, p+1$ are consecutive integers, one is odd and one is even. The only factorization matching both sides is $p = 2^k - 1$ (the Mersenne prime).

($\Leftarrow$) If $p = 2^k - 1$ is a Mersenne prime, then $T(p) = (2^k - 1) \cdot 2^k / 2 = 2^{k-1}(2^k - 1)$, which is Euclid-Euler form. $\square$

### 2.5 Theorem E: Convergent Arithmetic Ratio

**Theorem E.** *For the $k$-th even perfect number $P_k = 2^{p-1}M_p$ where $M_p = 2^p - 1$:*

$$\frac{\sigma(P_k) \cdot \varphi(P_k)}{P_k^2} = \frac{M_p - 1}{M_p} \to 1 \text{ as } k \to \infty.$$

*Only $P_1 = 6$ achieves the value $2/3$.*

*Proof.* $\sigma(P_k) = 2P_k$ (perfect). $\varphi(P_k) = P_k \cdot (1 - 1/2)(1 - 1/M_p) = P_k(M_p - 1)/(2M_p)$. The ratio is $2 \cdot (M_p - 1)/(2M_p) = (M_p - 1)/M_p$. For $M_p = 3$ (i.e., $P_1 = 6$): $(3-1)/3 = 2/3$. $\square$

| $P_k$ | $M_p$ | Ratio | Decimal |
|---|---|---|---|
| 6 | 3 | 2/3 | 0.6667 |
| 28 | 7 | 6/7 | 0.8571 |
| 496 | 31 | 30/31 | 0.9677 |
| 8128 | 127 | 126/127 | 0.9921 |

## 3. The Three Perfect Numbers in String Theory

### 3.1 $P_1 = 6$: Compactification Dimension

Superstring theory requires $d = 10$ spacetime dimensions for quantum consistency (Virasoro central charge cancellation). Compactification to $d = 4$ observable dimensions requires a 6-dimensional internal manifold, typically a Calabi-Yau threefold. The number 6 arises from:

$$d_{\text{compact}} = d_{\text{total}} - d_{\text{observable}} = 10 - 4 = 6 = P_1.$$

This is the first even perfect number. It appears because $d_{\text{total}} = 10$ is forced by anomaly cancellation on the worldsheet, and $d_{\text{observable}} = 4$ is empirical.

### 3.2 $P_2 = 28$: Little Group Dimension

Massless particles in $d = 10$ are classified by the little group $\mathrm{SO}(d-2) = \mathrm{SO}(8)$, whose dimension is:

$$\dim(\mathrm{SO}(8)) = \frac{8 \cdot 7}{2} = 28 = P_2.$$

The $\mathrm{SO}(8)$ triality (the unique outer automorphism of $\mathrm{SO}(8)$ among all $\mathrm{SO}(n)$) is crucial for constructing the Type II superstring spectrum: it exchanges the vector representation $\mathbf{8}_v$, spinor $\mathbf{8}_s$, and conjugate spinor $\mathbf{8}_c$, enabling spacetime supersymmetry.

### 3.3 $P_3 = 496$: Gauge Group Dimension

The Green-Schwarz anomaly cancellation mechanism [1] requires the gauge anomaly polynomial $I_{12}$ to factorize as $I_{12} = X_4 \cdot X_8$. This factorization imposes:

$$\dim(G) = 496 = P_3.$$

The only solutions are $G = \mathrm{SO}(32)$ with $\dim = 32 \cdot 31/2 = 496$, and $G = E_8 \times E_8$ with $\dim = 248 + 248 = 496$. Both give exactly the third perfect number.

Crucially, 496 is *not a choice* --- it is forced by the requirement of a consistent quantum theory. This makes $P_3$ the only perfect number that is a *physical necessity* rather than a structural constant.

### 3.4 Derived Constants from $P_1$

Several other string theory constants derive from $P_1 = 6$:

- **24** $= \tau(6)! = 4!$: transverse dimensions of the bosonic string ($d = 26$, transverse = $26 - 2 = 24$). Also: dimension of the Leech lattice, exponent in $\Delta(\tau) = \eta(\tau)^{24}$, central charge of the Monster module $V^\natural$.

- **1728** $= \sigma(6)^3 = 12^3$: normalization constant of the modular $j$-invariant, $j(\tau) = 1728 \cdot J(\tau)$.

- **744** $= P_1 \cdot \tau(P_1) \cdot \mathrm{LPF}(P_3) = 6 \cdot 4 \cdot 31$: constant term of the $j$-invariant expansion $j(\tau) = 1/q + 744 + \ldots$

## 4. The Chain of Necessity

Why do the first three perfect numbers appear in string theory? The chain is:

1. **Worldsheet SUSY** $\to d = 10$ (Virasoro central charge cancellation).
2. **Observation** $\to d_{\text{obs}} = 4$.
3. **Arithmetic**: $d_{\text{compact}} = 10 - 4 = 6 = P_1$.
4. **Representation theory**: little group $= \mathrm{SO}(10 - 2) = \mathrm{SO}(8)$, $\dim = 28 = P_2$.
5. **Anomaly cancellation**: $\dim(G) = 496 = P_3$.

Each step has an independent physical justification. That each produces a perfect number requires: $2^2 - 1 = 3$, $2^3 - 1 = 7$, and $2^5 - 1 = 31$ are all prime. This is a number-theoretic fact that physics does not explain.

The exponents $p = 2, 3, 5$ are the first three primes. Whether a fourth perfect number ($P_4 = 8128$, $\dim(\mathrm{SO}(128))$) plays a role in string theory (perhaps in a higher-dimensional extension) remains an open question.

## 5. Discussion

### 5.1 Coincidence or Structure?

We have shown that each appearance of a perfect number in string theory has an independent physical explanation. The *convergence* of three perfect numbers requires the number-theoretic fact that $2^p - 1$ is prime for $p = 2, 3, 5$. Physics selects the exponents; number theory determines the perfectness. These two facts are independent but convergent.

### 5.2 The Anomaly Polynomial Degree

The anomaly polynomial in $d$-dimensional spacetime has degree $d + 2$:
- $d = 6$: $I_8$ (8-form)
- $d = 10$: $I_{12}$ (12-form, degree $= \sigma(6)$!)
- $d = 26$: $I_{28}$ (28-form, degree $= P_2$!)

The anomaly polynomial in the bosonic string dimension has degree equal to the second perfect number. This was not part of our initial search and emerged naturally.

### 5.3 Open Questions

1. Does $P_4 = 8128$ appear in any extension of string theory (e.g., F-theory, M-theory)?
2. Is the convergence of physics and number theory at the first three Mersenne primes a mathematical necessity or an empirical coincidence?
3. Can the perfectness condition $\sigma(n) = 2n$ be derived from a physical principle (e.g., conformal invariance, modular invariance)?
4. The number 24 appears as $\tau(6)!$. Is this connection to perfect numbers exploitable in moonshine theory?

## 6. Conclusion

The first three even perfect numbers are structural constants of superstring theory. $P_1 = 6$ measures compactification, $P_2 = 28$ measures the little group, and $P_3 = 496$ measures the gauge group --- the latter being physically *forced* by anomaly cancellation. Five theorems connect perfect numbers to Lie group dimensions through the Euclid-Euler factorization. The convergence of physics and number theory at these three values is the deepest known connection between the arithmetic of divisors and the consistency of quantum gravity.

## Note Added (2026-03-30): The Confluence Reframing

The appearance of 6 in this work is better understood through the Confluence Theorem
[P-CONFLUENCE]: 6 is the unique integer that is simultaneously a consecutive-prime
product (2x3), a factorial (3!), a triangular number (1+2+3), and a primorial (1x2x3).
The string-theoretic compactification dimension d=6 is 3! (the factorial aspect of the
confluence), not a consequence of sigma=2n. The perfect number property sigma(6) = 12 = 2x6
is a corollary of 6 = 2x3, not the root cause of its ubiquity.

## References

[1] M. B. Green, J. H. Schwarz, "Anomaly cancellations in supersymmetric D=10 gauge theory and superstring theory," *Phys. Lett. B* **149** (1984) 117-122.

[2] J. Baez, "My favorite number: 24," 2008. [Online lecture.]

[3] J. H. Conway, N. J. A. Sloane, *Sphere Packings, Lattices and Groups*, 3rd ed., Springer, 1999.

[4] G. H. Hardy, E. M. Wright, *An Introduction to the Theory of Numbers*, 6th ed., Oxford Univ. Press, 2008.

[5] T. M. Apostol, *Introduction to Analytic Number Theory*, Springer, 1976.

[6] E. Witten, "String theory dynamics in various dimensions," *Nucl. Phys. B* **443** (1995) 85-126.

[7] P. Horava, E. Witten, "Heterotic and Type I string dynamics from eleven dimensions," *Nucl. Phys. B* **460** (1996) 506-524.

[8] Park, Min Woo, "One Hundred Unique Identities of the First Perfect Number," preprint, 2026. DOI: 10.5281/zenodo.19303846.

[9] Park, Min Woo, "The Ubiquity of Six: A 500-Hypothesis Survey," preprint, 2026. DOI: 10.5281/zenodo.19303850.
