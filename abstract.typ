#import "common.typ": *

= Abstract Interpretation

== Galois Connection

$
  cfg(X, subset.eq) galois() cfg(X^sharp, subset.eq.sq) defeq forall x in X, x^sharp in X^sharp: alpha(x) subset.eq.sq x^sharp <=> x subset.eq gamma(x^sharp)
$

Properties:

- $alpha$ is monoton: $forall x, y in X. x subset.eq y => alpha(x) subset.eq.sq alpha(y)$

- $gamma$ is monoton: $forall x^sharp, y^sharp in X^sharp: x^sharp subset.eq.sq y^sharp => gamma(x^sharp) subset.eq gamma(y^sharp)$

- $gamma compose alpha$ is extensive: $forall x in X: x subset.eq gamma(alpha(x))$

- $alpha compose gamma$ is regressive: $forall x^sharp in X^sharp: alpha(gamma(x^sharp)) subset.eq.sq x^sharp$

== Abstract Semantics Example

- Concrete: $sigma in X$

  $
    semantics(kif e kthen s_1 ktrue s_2)(sigma) defeq cases(
      semantics(s_1)(sigma) & "if" eval(e, sigma) = ktrue,
      semantics(s_2)(sigma) & "if" eval(e, sigma) = kfalse
    )
  $

- Abstract: $Sigma in X^sharp$

  $
    semantics(kif e kthen s_1 ktrue s_2)^sharp (Sigma) defeq semantics(s_1)^sharp (Sigma) union.sq semantics(s_2)^sharp (Sigma)
  $

- Soundness of $semantics(dot.op)^sharp$ with respect to $semantics(dot.op)$:

  $
    alpha(sigma) subset.eq.sq Sigma => alpha(semantics(s) (sigma)) subset.eq.sq semantics(s)^sharp (Sigma)
  $

== Abstract Interpretation

Readings: #link("https://pcousot.github.io/talks/Cousot-tutorial-ICTAC-2019.pdf")[Cousot's Tutorial Slides]

#focus-slide[
  #align(center)[It spekifies an analyzer!]
]
