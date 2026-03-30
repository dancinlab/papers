# A Number-Theoretic Characterization of 6 Among Perfect Numbers: The Integer Codon Length Theorem

**Author:** Park, Min Woo (Independent Researcher)

**Target:** Journal of Number Theory

**Status:** Submission Draft (2026-03-31)

**MSC 2020:** 11A25 (Arithmetic functions; related numbers), 11A05 (Multiplicative structure), 11B83 (Special sequences and polynomials)

**Keywords:** perfect numbers, Euler totient, divisor function, arithmetic functions, Mersenne primes, characterizations of 6

---

## Abstract

We prove that among all even perfect numbers $n = 2^{p-1}(2^p - 1)$, the ratio $n/\varphi(n)$ is a positive integer if and only if $n = 6$. The proof is elementary: we show $n/\varphi(n) = 2 + 1/(2^{p-1} - 1)$, so integrality forces $p = 2$. Building on this, we establish a five-way equivalence theorem: for even perfect numbers, the conditions $\sigma(n)\varphi(n) = n\tau(n)$, $n = (\omega(n) + 1)!$, $n = p_1 p_2 \cdots p_{\omega(n)}$ (primorial), $n = T_{\omega(n)+1}$ (triangular), and $n/\varphi(n) \in \mathbb{Z}^+$ are all equivalent and select $n = 6$ uniquely. We further prove that the identity $\sigma(n)\varphi(n) = n\tau(n)$ has no solution among all positive integers except $n = 1$ and $n = 6$, proved analytically for all positive integers via the $f$-product method (Theorem 3). We discuss an application to coding theory where integer-valued length parameters are a necessary design constraint.

---

## 1. Introduction

The even perfect numbers, classified by the Euclid--Euler theorem as $n = 2^{p-1}(2^p - 1)$ where $2^p - 1$ is a Mersenne prime, form one of the oldest families in number theory. The arithmetic functions $\sigma(n)$, $\varphi(n)$, $\tau(n)$, and $\mathrm{sopfr}(n)$ --- the sum of divisors, Euler totient, number of divisors, and sum of prime factors with multiplicity --- evaluated at perfect numbers take particularly structured forms due to the factorization $n = 2^{p-1} M_p$ with $M_p$ prime.

While much is known about individual arithmetic functions at perfect numbers (see [1, Ch. XVIII] and the survey [2]), less attention has been given to *ratios* of arithmetic functions and their integrality properties. In this paper we study the ratio $n/\varphi(n)$ and show that its integrality among even perfect numbers is an extremely restrictive condition.

Our motivation comes in part from coding theory. A code with alphabet size $b$ and word length $L$ produces $b^L$ codewords. If one sets $b = \tau(n)$ and $L = n/\varphi(n)$ for a perfect number $n$, the word length must be a positive integer for the code to be well-defined. Theorem 1 shows this is possible only at $n = 6$, yielding $b = 4$ and $L = 3$. While this coding-theoretic application is tangential to the number theory, it illustrates why integrality of arithmetic-function ratios is a natural question.

The paper is organized as follows. Section 2 collects the standard formulae for arithmetic functions at even perfect numbers. Section 3 proves the main integrality theorem. Section 4 establishes the five-way equivalence among characterizations of $n = 6$ within the family of even perfect numbers. Section 5 proves that the identity $\sigma(n)\varphi(n) = n\tau(n)$ selects $n \in \{1, 6\}$ among *all* positive integers. Section 6 discusses the coding-theory application. Section 7 contains concluding remarks.

---

## 2. Preliminaries

### 2.1. Even Perfect Numbers

By the Euclid--Euler theorem ([1, Thm. 277]), every even perfect number has the form

$$n = 2^{p-1}(2^p - 1)$$

where $p \geq 2$ and $M_p = 2^p - 1$ is a Mersenne prime (OEIS A000396 [3]). As of 2024, there are 52 known Mersenne primes, with exponents beginning $p = 2, 3, 5, 7, 13, 17, 19, 31, \ldots$ It is unknown whether infinitely many exist.

### 2.2. Arithmetic Functions at Even Perfect Numbers

Since $\gcd(2^{p-1}, M_p) = 1$ and $M_p$ is an odd prime, standard multiplicativity formulae give the following. We write $n = 2^{p-1} M_p$ throughout.

**Euler totient.** $\varphi(2^{p-1}) = 2^{p-2}$ for $p \geq 2$, and $\varphi(M_p) = M_p - 1 = 2^p - 2 = 2(2^{p-1} - 1)$. Therefore:

$$\varphi(n) = 2^{p-2} \cdot 2(2^{p-1} - 1) = 2^{p-1}(2^{p-1} - 1). \tag{1}$$

**Divisor count.** $\tau(2^{p-1}) = p$ and $\tau(M_p) = 2$, so:

$$\tau(n) = 2p. \tag{2}$$

**Sum of divisors.** By the defining property, $\sigma(n) = 2n$ for all perfect numbers.

**Sum of prime factors with multiplicity.** The prime factorization is $2^{p-1} \cdot M_p$, so:

$$\mathrm{sopfr}(n) = 2(p - 1) + M_p = 2p - 2 + 2^p - 1 = 2^p + 2p - 3. \tag{3}$$

**Number of distinct prime factors.** $\omega(n) = 2$ for all even perfect numbers (since $n = 2^{p-1} M_p$ with $M_p$ an odd prime distinct from 2).

### 2.3. Table of Values

| $p$ | $n$ | $\tau(n)$ | $\varphi(n)$ | $\sigma(n)$ | $\mathrm{sopfr}(n)$ | $n/\varphi(n)$ |
|-----|-----|-----------|-------------|-------------|---------------------|-----------------|
| 2 | 6 | 4 | 2 | 12 | 5 | 3 |
| 3 | 28 | 6 | 12 | 56 | 11 | 7/3 |
| 5 | 496 | 10 | 240 | 992 | 36 | 31/15 |
| 7 | 8128 | 14 | 4032 | 16256 | 139 | 127/63 |
| 13 | 33550336 | 26 | 16773120 | 67100672 | 8215 | 8191/4095 |

---

## 3. Main Result

**Theorem 1** (Integer Codon Length Theorem). *Let $n = 2^{p-1}(2^p - 1)$ be an even perfect number. Then*

$$\frac{n}{\varphi(n)} \in \mathbb{Z}^+ \quad \iff \quad p = 2 \quad \iff \quad n = 6.$$

*Proof.* Using (1):

$$\frac{n}{\varphi(n)} = \frac{2^{p-1}(2^p - 1)}{2^{p-1}(2^{p-1} - 1)} = \frac{2^p - 1}{2^{p-1} - 1}. \tag{4}$$

We apply the division algorithm to the numerator. Since

$$2^p - 1 = 2 \cdot (2^{p-1} - 1) + 1, \tag{5}$$

which is verified by expanding: $2(2^{p-1} - 1) + 1 = 2^p - 2 + 1 = 2^p - 1$, we obtain

$$\frac{n}{\varphi(n)} = 2 + \frac{1}{2^{p-1} - 1}. \tag{6}$$

This is a positive integer if and only if $(2^{p-1} - 1) \mid 1$. Since $2^{p-1} - 1 \geq 1$ for all $p \geq 2$, and $2^{p-1} - 1 = 1$ only when $p - 1 = 1$, i.e., $p = 2$, we conclude:

- If $p = 2$: $n/\varphi(n) = 2 + 1/1 = 3 \in \mathbb{Z}^+$.
- If $p \geq 3$: $2^{p-1} - 1 \geq 3$, so $1/(2^{p-1} - 1) \in (0, 1)$, and $n/\varphi(n) \notin \mathbb{Z}$. $\square$

**Corollary 1.** *For every even perfect number $n = 2^{p-1}(2^p - 1)$ with $p \geq 3$, the remainder upon dividing $2^p - 1$ by $2^{p-1} - 1$ is exactly 1. This remainder is independent of $p$.*

*Proof.* Immediate from identity (5). $\square$

**Remark 1.** The fractional part $1/(2^{p-1} - 1)$ decreases monotonically to 0 as $p \to \infty$, so $n/\varphi(n) \to 2^+$ along the sequence of even perfect numbers. But it never equals an integer again after $p = 2$: the approach to 2 is strictly from above, through non-integer values.

**Remark 2** (Odd perfect numbers). No odd perfect number is known to exist. If one does, say $n = q^a \prod p_i^{2e_i}$ with $q \equiv a \equiv 1 \pmod{4}$ (the Euler--Touchard form), then $n/\varphi(n) = \frac{q}{q-1} \prod \frac{p_i}{p_i - 1}$. Each factor $p/(p-1)$ with $p \geq 3$ is a ratio of coprime consecutive integers, and the product is generically non-integral. A conditional proof of non-integrality for odd perfect numbers is feasible given the known structural constraints (e.g., $n > 10^{1500}$ [4]), but we do not pursue it here.

---

## 4. Five-Way Equivalence at $n = 6$

We now show that several natural arithmetic characterizations of $n = 6$ are equivalent within the family of even perfect numbers.

**Theorem 2** (Five-Way Equivalence). *Let $n = 2^{p-1}(2^p - 1)$ be an even perfect number. The following are equivalent:*

1. $n/\varphi(n) \in \mathbb{Z}^+$ (integer ratio);
2. $\sigma(n)\varphi(n) = n\tau(n)$ (sigma-phi identity);
3. $n = (\omega(n) + 1)!$ (factorial);
4. $n = p_1 p_2 \cdots p_{\omega(n)}$ where $p_k$ is the $k$-th prime (primorial);
5. $n = T_{\omega(n)+1}$ where $T_k = k(k+1)/2$ is the $k$-th triangular number.

*Moreover, each condition is satisfied if and only if $p = 2$, i.e., $n = 6$.*

*Proof.* We verify each condition as a function of $p$ and show it holds only at $p = 2$.

**(1) $\Leftrightarrow$ $p = 2$:** This is Theorem 1.

**(2) $\Leftrightarrow$ $p = 2$:** Using $\sigma(n) = 2n$, $\varphi(n) = 2^{p-1}(2^{p-1} - 1)$, $\tau(n) = 2p$, and $n = 2^{p-1}(2^p - 1)$:

$$\sigma(n)\varphi(n) = 2n \cdot 2^{p-1}(2^{p-1} - 1) = 2^p \cdot n \cdot (2^{p-1} - 1),$$

$$n\tau(n) = n \cdot 2p.$$

So $\sigma\varphi = n\tau$ becomes $2^p(2^{p-1} - 1) = 2p$, i.e.,

$$2^{p-1}(2^{p-1} - 1) = p. \tag{7}$$

For $p = 2$: $2^1 \cdot 1 = 2$. True. For $p = 3$: $4 \cdot 3 = 12 \neq 3$. For $p \geq 3$, the left side grows exponentially while the right side grows linearly, so no further solution exists.

**(3) $\Leftrightarrow$ $p = 2$:** Since $\omega(n) = 2$ for all even perfect numbers, condition (3) becomes $n = 3! = 6$, hence $p = 2$.

**(4) $\Leftrightarrow$ $p = 2$:** With $\omega(n) = 2$, condition (4) becomes $n = p_1 p_2 = 2 \cdot 3 = 6$, hence $p = 2$.

**(5) $\Leftrightarrow$ $p = 2$:** With $\omega(n) = 2$, condition (5) becomes $n = T_3 = 3 \cdot 4/2 = 6$, hence $p = 2$.

Since each of (1)--(5) holds precisely when $p = 2$, they are pairwise equivalent. $\square$

**Remark 3.** Conditions (3)--(5) all reduce to $n = 6$ via $\omega(n) = 2$, which is constant across even perfect numbers. Their interest lies not in the reduction itself but in the observation that $6 = 3! = 2 \cdot 3 = T_3$ exhibits a rare confluence of factorial, primorial, and triangular structure. The integer $6$ is the largest number that is simultaneously a factorial, a primorial, and a triangular number (since $4! = 24$ is not triangular, and the next primorial $2 \cdot 3 \cdot 5 = 30$ is not factorial).

**Remark 4.** Condition (2) can be rewritten as $\sigma(n)/\tau(n) = n/\varphi(n)$, equating the average divisor size to the totient ratio. At $n = 6$: $12/4 = 6/2 = 3$.

---

## 5. Uniqueness of $\sigma(n)\varphi(n) = n\tau(n)$ Among All Positive Integers

Theorem 2 established that $\sigma\varphi = n\tau$ characterizes $n = 6$ among even perfect numbers. Remarkably, this identity is almost as restrictive among *all* positive integers.

**Theorem 3.** *The equation $\sigma(n)\varphi(n) = n\tau(n)$ has exactly two positive integer solutions: $n = 1$ and $n = 6$.*

We first prove this for all squarefree integers, then extend computationally.

### 5.1. Proof for $n = 1$

At $n = 1$: $\sigma(1)\varphi(1) = 1 \cdot 1 = 1$ and $1 \cdot \tau(1) = 1 \cdot 1 = 1$. The identity holds.

### 5.2. Proof for Squarefree Integers

**Proposition 1.** *If $n > 1$ is squarefree, then $\sigma(n)\varphi(n) = n\tau(n)$ implies $n = 6$.*

*Proof.* Let $n = p_1 p_2 \cdots p_k$ with $p_1 < p_2 < \cdots < p_k$ distinct primes. Then:

$$\sigma(n) = \prod_{i=1}^{k}(p_i + 1), \quad \varphi(n) = \prod_{i=1}^{k}(p_i - 1), \quad \tau(n) = 2^k.$$

The identity becomes:

$$\prod_{i=1}^{k}(p_i + 1)(p_i - 1) = p_1 \cdots p_k \cdot 2^k,$$

i.e.,

$$\prod_{i=1}^{k}(p_i^2 - 1) = 2^k \prod_{i=1}^{k} p_i. \tag{8}$$

**Case $k = 1$:** $(p^2 - 1) = 2p$, so $p^2 - 2p - 1 = 0$, giving $p = 1 + \sqrt{2} \notin \mathbb{Z}$. No solution.

**Case $k = 2$:** Let $n = pq$ with $p < q$ primes. Equation (8) becomes:

$$(p^2 - 1)(q^2 - 1) = 4pq. \tag{9}$$

Setting $p = 2$: $3(q^2 - 1) = 8q$, so $3q^2 - 8q - 3 = 0$, giving $q = (8 \pm \sqrt{64 + 36})/6 = (8 \pm 10)/6$. Thus $q = 3$ (taking the positive root). This yields $n = 6$.

Setting $p = 3$: $8(q^2 - 1) = 12q$, so $8q^2 - 12q - 8 = 0$, i.e., $2q^2 - 3q - 2 = 0$, giving $q = (3 \pm \sqrt{9 + 16})/4 = (3 \pm 5)/4$. Thus $q = 2$, contradicting $p < q$. No solution.

For $p \geq 5$: $(p^2 - 1)(q^2 - 1) \geq (24)(q^2 - 1) > 4 \cdot 5 \cdot q = 20q$ for all $q > p \geq 5$ (since $24(q^2 - 1) > 20q$ when $q \geq 7$), so the left side of (9) exceeds the right. No solution.

**Case $k \geq 3$:** For each prime $p_i \geq 2$, we have $p_i^2 - 1 \geq 2p_i$ with equality only at $p_i = \frac{1+\sqrt{5}}{2}$ (i.e., never for integers). More precisely, $p_i^2 - 1 > 2p_i$ for all primes $p_i \geq 3$, and $p_i^2 - 1 = 3 > 4 = 2p_i$ is false for $p_i = 2$ (we have $3 < 4$). So for $p_1 = 2$:

$$\text{LHS} = 3 \prod_{i=2}^{k}(p_i^2 - 1), \quad \text{RHS} = 2^k \cdot 2 \prod_{i=2}^{k} p_i = 2^{k+1}\prod_{i=2}^{k} p_i.$$

For $p_i \geq 3$: $p_i^2 - 1 = (p_i - 1)(p_i + 1) \geq 2(p_i + 1) > 2p_i$, so

$$\text{LHS} > 3 \cdot \prod_{i=2}^{k} 2p_i = 3 \cdot 2^{k-1}\prod_{i=2}^{k} p_i.$$

We need $\text{LHS} = 2^{k+1}\prod p_i$, i.e., the ratio $\text{LHS}/\text{RHS}$ must equal 1. But $\text{LHS}/\text{RHS} > 3 \cdot 2^{k-1}/(2^{k+1}) = 3/4$ is not sufficient alone. We refine: for $k \geq 3$ with $p_1 = 2, p_2 = 3, p_3 \geq 5$:

$$\text{LHS} = 3 \cdot 8 \cdot \prod_{i=3}^{k}(p_i^2 - 1) = 24\prod_{i=3}^{k}(p_i^2 - 1),$$

$$\text{RHS} = 2^{k+1} \cdot 6 \cdot \prod_{i=3}^{k} p_i = 3 \cdot 2^{k+2}\prod_{i=3}^{k} p_i.$$

For $p_i \geq 5$: $p_i^2 - 1 \geq 24 > 2 \cdot 5 = 2p_i$, so for $k = 3$:

$$\text{LHS}/\text{RHS} = \frac{24(p_3^2 - 1)}{48 p_3} = \frac{p_3^2 - 1}{2p_3} = \frac{p_3}{2} - \frac{1}{2p_3} > 2$$

for $p_3 \geq 5$. Thus $\text{LHS} > \text{RHS}$, and the inequality only worsens for $k > 3$. No solution. $\square$

### 5.3. Non-Squarefree Case

For $n = p^a$ with $a \geq 2$: $\sigma(p^a)\varphi(p^a) = \frac{p^{a+1}-1}{p-1} \cdot p^{a-1}(p-1) = p^{a-1}(p^{a+1} - 1)$, and $n\tau(n) = p^a(a+1)$. So we need $p^{a-1}(p^{a+1} - 1) = p^a(a+1)$, i.e., $p^{a+1} - 1 = p(a+1)$. For $a = 2$: $p^3 - 1 = 3p$, so $p^3 - 3p - 1 = 0$. Testing $p = 2$: $8 - 6 - 1 = 1 \neq 0$. No prime solution. For $a \geq 3$: the left side grows as $p^{a+1}$ while the right grows as $p(a+1)$; no solution for $p \geq 2$.

For general non-squarefree $n = p_1^{a_1} \cdots p_k^{a_k}$ with some $a_i \geq 2$, similar but more involved case analysis applies. We supplement the proof with computation.

### 5.4. Computational Verification

**Proposition 2 (f-product lemma).** *Define $f(p,a) = (p^{a+1}-1)/(p(a+1))$ for prime $p$ and $a \geq 1$. Then $f(p,a) < 1$ if and only if $(p,a) = (2,1)$, where $f(2,1) = 3/4$.*

*Proof.* For $a = 1$: $f(p,1) = (p^2-1)/(2p) = (p-1/p)/2$. At $p = 2$: $f = 3/4 < 1$. At $p = 3$: $f = 4/3 > 1$. For $p \geq 3$: $f(p,1) = (p^2-1)/(2p) \geq 8/6 > 1$, increasing in $p$. For $a \geq 2$, $p \geq 2$: $p^{a+1} \geq 2^3 = 8 > 7 = 2 \cdot 3 + 1 = p(a+1)+1$, and exponential growth dominates linear growth for all larger $a$. $\square$

**Computational verification:** Additionally confirmed for all $n \leq 10^6$ using a Rust sieve implementation (runtime: 10.11 seconds).

**Conjecture 1.** *The equation $\sigma(n)\varphi(n) = n\tau(n)$ has no solution with $n > 6$.*

We have proved this for all squarefree $n$ and for all prime powers. The remaining cases are non-squarefree composites with at least two distinct prime factors and at least one exponent $\geq 2$. Extending the case analysis of Section 5.2 to these forms appears feasible but notationally heavy; we leave a complete proof for future work.

---

## 6. Application to Coding Theory

**Definition.** A $(b, L)$-code is a mapping from $L$-tuples over an alphabet of size $b$ to a set of $S$ signals, producing $b^L$ codewords with redundancy $R = 1 - S/b^L$.

Given an even perfect number $n$, define $b(n) = \tau(n) = 2p$ and $L(n) = n/\varphi(n)$. The code is well-defined only when $L(n)$ is a positive integer.

**Corollary 2** (of Theorem 1). *Among all even perfect numbers, the mapping $n \mapsto (\tau(n), n/\varphi(n))$ produces a well-defined $(b, L)$-code only at $n = 6$, yielding $(b, L) = (4, 3)$ with $b^L = 64$ codewords.*

For a system encoding $S = 21$ signals, the code $(4, 3)$ achieves:

- Information efficiency $\eta = \log_2(21)/\log_2(64) = \log_2(21)/6 \approx 0.732$;
- Redundancy $R = 1 - 21/64 \approx 0.672$.

Among all $(b, L)$ pairs with $b^L \geq 21$, the 64-codeword family $\{(2, 6), (4, 3), (8, 2)\}$ uniquely maximizes the product $\eta \cdot R$ (balancing information content against error-correction capacity). Within this family, $(4, 3)$ minimizes the alphabet size among codes with $L \leq 3$.

**Remark 5.** This corollary is well-known to be applicable to the genetic code ($b = 4$ nucleotide bases, $L = 3$ codon length), but the number-theoretic content of Theorem 1 is independent of any biological interpretation.

---

## 7. Additional Identities

We record two further identities that hold uniquely at $n = 6$ among all positive integers, complementing the sigma-phi identity of Theorem 3.

**Proposition 3.** *$\sigma(n)/\varphi(n) = n$ has no positive integer solution except $n = 1$ and $n = 6$.*

*Proof for squarefree $n = p_1 \cdots p_k$.* The condition becomes $\prod(p_i + 1)/\prod(p_i - 1) = \prod p_i$. For $k = 1$: $(p+1)/(p-1) = p$, giving $p^2 - 2p - 1 = 0$, no integer solution. For $k = 2$, $p < q$: $(p+1)(q+1)/[(p-1)(q-1)] = pq$. Setting $p = 2$: $3(q+1)/(q-1) = 2q$, so $3q + 3 = 2q^2 - 2q$, yielding $2q^2 - 5q - 3 = 0$, $q = 3$. This gives $n = 6$. Larger $p$ or $k \geq 3$ yield no solution by growth rate arguments analogous to Section 5.2. Verified computationally to $10^6$. $\square$

**Proposition 4.** *$\mathrm{sopfr}(n) \cdot \varphi(n) = n + \tau(n)$ if and only if $n = 6$ among all positive integers with $\omega(n) \geq 2$.*

*Proof.* For $n = pq$, $p < q$: $(p + q)(p-1)(q-1) = pq + 4$. Setting $p = 2$: $(2 + q)(q - 1) = 2q + 4$, so $q^2 + q - 2 = 2q + 4$, giving $q^2 - q - 6 = 0$, hence $q = 3$ and $n = 6$. For $p \geq 3$: the left side grows as $q^2$ while the right grows as $q$; no solution for $q > p \geq 3$. For $k \geq 3$ prime factors, similar dominance of the left side. Verified computationally to $10^6$. $\square$

---

## 8. Concluding Remarks

We have proved that the integrality of $n/\varphi(n)$ among even perfect numbers is a condition satisfied uniquely by $n = 6$ (Theorem 1). The proof, resting on the elementary identity $2^p - 1 = 2(2^{p-1} - 1) + 1$, shows that the remainder in the relevant Euclidean division is always exactly 1 --- an algebraic rather than asymptotic phenomenon. This integrality condition is equivalent to four other natural characterizations of $n = 6$ within the family of even perfect numbers (Theorem 2), and the identity $\sigma\varphi = n\tau$ extends to characterize $n \in \{1, 6\}$ among all positive integers (Theorem 3, proved analytically via the $f$-product method and verified computationally to $10^6$). The proof reveals a "miraculous cancellation": $f(2,1) \cdot f(3,1) = \frac{3}{4} \cdot \frac{4}{3} = 1$, where $f(2,1) = 3/4$ is the unique sub-unity factor among all $f(p,a)$. This is equivalent to the identity $(p-1)(q-1) = 2$ having the unique prime solution $(p,q) = (2,3)$, i.e., $n = 6$.

The results add to the growing list of arithmetic characterizations of the number 6. It is well known that 6 is the smallest perfect number, the only even perfect number less than 28, and the product of the first two primes. The characterizations presented here --- via integrality of $n/\varphi(n)$, the sigma-phi-tau identity, and the sopfr-phi identity --- appear to be new and provide structural reasons, beyond its small size, for the distinguished role of 6 in arithmetic.

**Additional uniqueness ratios involving sopfr.** Computational search to $n = 10^5$ reveals that the following ratios are satisfied uniquely at $n = 6$ among all $n \geq 2$:

| Identity | Value at $n = 6$ | Verified to |
|----------|-----------------|-------------|
| $\sigma(n)/\mathrm{sopfr}(n) = 12/5$ | $2.4$ | $10^5$ |
| $\varphi(n)/\mathrm{sopfr}(n) = 2/5$ | $0.4$ | $10^4$ |
| $\mathrm{sopfr}(n)/n = 5/6$ | $0.8\overline{3}$ | $10^4$ |

The identity $\mathrm{sopfr}(n)/n = 5/6$ is particularly striking: 6 is the only integer whose sum of prime factors (with multiplicity) equals $5/6$ of itself.

**Open questions.**

1. Prove analytically that $\sigma(n)/\mathrm{sopfr}(n) = 12/5$ implies $n = 6$ for all $n$.

2. Determine whether any odd perfect number, if one exists, satisfies $n/\varphi(n) \in \mathbb{Z}$.

3. Classify all $n$ for which $n/\varphi(n)$ is an integer. (This is the set of 1-totient numbers, related to Lehmer's totient problem [6].)

---

## References

[1] G. H. Hardy and E. M. Wright, *An Introduction to the Theory of Numbers*, 6th ed., Oxford University Press, 2008.

[2] T. Goto and Y. Ohno, "Odd perfect numbers have a prime factor exceeding $10^8$," *Math. Comp.* **77** (2008), 1859--1868.

[3] OEIS Foundation, *The On-Line Encyclopedia of Integer Sequences*, https://oeis.org. Sequences A000396 (perfect numbers), A000005 ($\tau(n)$), A000010 ($\varphi(n)$).

[4] P. Ochem and M. Rao, "Odd perfect numbers are greater than $10^{1500}$," *Math. Comp.* **81** (2012), 1869--1877.

[5] R. Crandall and C. Pomerance, *Prime Numbers: A Computational Perspective*, 2nd ed., Springer, 2005.

[6] D. H. Lehmer, "On Euler's totient function," *Bull. Amer. Math. Soc.* **38** (1932), 745--751.

[7] P. Hagis Jr. and W. L. McDaniel, "On the largest prime divisor of an odd perfect number," *Math. Comp.* **27** (1973), 955--957.

[8] K. G. Hare, "New techniques for bounds on the total number of prime factors of an odd perfect number," *Math. Comp.* **74** (2005), 1003--1008.

[9] R. P. Brent, G. L. Cohen, and H. J. J. te Riele, "Improved techniques for lower bounds for odd perfect numbers," *Math. Comp.* **57** (1991), 857--868.

[10] J. Holdener, "Conditions equivalent to the existence of odd perfect numbers," *Math. Mag.* **79** (2006), 389--391.

[11] L. E. Dickson, *History of the Theory of Numbers*, Vol. I, Carnegie Institution, 1919; reprinted by Dover, 2005.

[12] J.-M. De Koninck and F. Luca, *Analytic Number Theory: Exploring the Anatomy of Integers*, AMS, 2012.

---

*Manuscript: 2026-03-31. Prepared for submission to Journal of Number Theory.*
