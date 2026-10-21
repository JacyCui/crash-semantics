#import "common.typ": *

= Operational Semantics

== A Small-step Interpreter

$eval(e, sigma) defeq$ evaluates expression $e : Exp$ against $sigma : (Var -> Value)$

- Assignment:

#prooftree(rule(
  name: smallcaps[Assign],
  $eval(e, sigma) = n$,
  $cfg(x := e, sigma) -> cfg(kskip, sigma[x |-> n])$,
))

- Sequential Control:

#rule-set(
  prooftree(rule(
    name: smallcaps[Seq],
    $cfg(s_1, sigma) -> cfg(s'_1, sigma')$,
    $cfg(s_1 semi s_2, sigma) -> cfg(s_1^' semi s_2, sigma')$,
  )),
  prooftree(rule(
    name: smallcaps[Skip],
    $cfg(kskip semi s, sigma) -> cfg(s, sigma)$,
  )),
)

#pagebreak()

- Branch Control:

#rule-set(
  prooftree(rule(
    name: smallcaps[If-True],
    $eval(e, sigma) = ktrue$,
    $cfg(kif e kthen s_1 ktrue s_2, sigma) -> cfg(s_1, sigma)$,
  )),
  prooftree(rule(
    name: smallcaps[If-False],
    $eval(e, sigma) = kfalse$,
    $cfg(kif e kthen s_1 ktrue s_2, sigma) -> cfg(s_2, sigma)$,
  )),
)

- Loop Control:

#rule-set(
  prooftree(rule(
    name: smallcaps[While],
    $cfg(kwhile e kdo s, sigma) -> cfg(kif e kthen (s semi kwhile e kdo s) ktrue kskip, sigma)$,
  )),
)

== Operational Semantics

- Styles:

  - Small-step Semantics

    - Structural Semantics ($checkmark$)

    - Contextual Semantics

  - Big-step Semantics

- Extensions: Abort, Local Variable, Heap, etc.

- Properties: Determinism, Confluence, Normalization, Totality, etc.

- Readings: #link("https://hongjin-liang.github.io/semantics2024/07_operational.pdf")[Liang's Lecture Slides]

#focus-slide[
  #align(center)[It spekifies an interpreter!]
]
