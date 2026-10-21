#import "common.typ": *

= Operational Semantics

== A Small-step Interpreter

$eval(e, sigma) defeq$ evaluates expression $e : Exp$ against $sigma : (Var -> Value)$

- Assignment:

#prooftree(rule(
  name: smallcaps[Assign],
  $eval(e, sigma) = n$,
  $cfg(x := e, sigma) -> cfg(cskip, sigma[x |-> n])$,
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
    $cfg(cskip semi s, sigma) -> cfg(s, sigma)$,
  )),
)

#pagebreak()

- Branch Control:

#rule-set(
  prooftree(rule(
    name: smallcaps[If-True],
    $eval(e, sigma) = ctrue$,
    $cfg(cif e cthen s_1 celse s_2, sigma) -> cfg(s_1, sigma)$,
  )),
  prooftree(rule(
    name: smallcaps[If-False],
    $eval(e, sigma) = cfalse$,
    $cfg(cif e cthen s_1 celse s_2, sigma) -> cfg(s_2, sigma)$,
  )),
)

- Loop Control:

#rule-set(
  prooftree(rule(
    name: smallcaps[While],
    $cfg(cwhile e cdo s, sigma) -> cfg(cif e cthen (s semi cwhile e cdo s) celse cskip, sigma)$,
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
  #align(center)[It specifies an interpreter!]
]
