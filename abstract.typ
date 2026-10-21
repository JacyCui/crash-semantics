#import "common.typ": *

= Abstract Interpretation

== Galois Connection

$
  cfg(X, subset.eq) galois() cfg(X^hash, subset.eq.sq) defeq forall x in X, x^hash in L: alpha(x) subset.eq.sq x^hash <=> x subset.eq gamma(x^hash)
$

Properties:

- $alpha$ is monoton: $forall x, y in X. x subset.eq y => alpha(x) subset.eq.sq alpha(y)$

- $beta$ is monoton: $forall x^hash, y^hash in X^hash: x^hash subset.eq.sq y^hash => gamma(x^hash) subset.eq gamma(y^hash)$

- $gamma compose alpha$ is extensive: $forall x in X: x subset.eq gamma(alpha(x))$

- $alpha compose gamma$ is regressive: $forall x^hash in X^hash: alpha(gamma(x^hash)) subset.eq.sq x^hash$

== Abstract Semantics Example

- Concrete: $sigma : X$

  $
    [|cif e cthen s_1 celse s_2|](sigma) defeq cases(
      [|s_1|](sigma) & "if" [|e|]_sigma = ctrue,
      [|s_2|](sigma) & "if" [|e|]_sigma = cfalse
    )
  $

- Abstract: $Sigma : X^hash$

  $
    [|cif e cthen s_1 celse s_2|]^hash (Sigma) defeq [|s_1|]^hash(Sigma) union.sq [|s_2|]^hash(Sigma)
  $

== Abstract Interpretation

Readings: #link("https://pcousot.github.io/talks/Cousot-tutorial-ICTAC-2019.pdf")[Cousot's Tutorial Slides]

#focus-slide[
  #align(center)[It specifies an analyzer!]
]
