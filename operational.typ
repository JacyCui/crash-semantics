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

== Contextual Example

$
  cfg(x + (y - 3), {x |-> 2, y |-> 1}) \
  = cfg(cal(E)_1[x], {x |-> 2, y |-> 1}) where cal(E)_1 = [dot] + (y - 3) \
  -> cfg(2 + (y - 3), {x |-> 2, y |-> 1}) \
  = cfg(cal(E)_2[y], {x |-> 2, y |-> 1}) where cal(E)_2 = 2 + ([dot] - 3)\
  -> cfg(2 + (1 - 3), {x |-> 2, y |-> 1}) \
  = cfg(cal(E)_3[1-3], {x |-> 2, y |-> 1}) where cal(E)_3 = 2 + [dot]\
  -> cfg(2 + (-1), {x |-> 2, y |-> 1}) \
  -> cfg(1, {x |-> 2, y |-> 1}) \
$

== call/cc Example

$
  (kcallcc (lambda k. klet (k space 2) kin 3) + 1 \
    = C_1[(kcallcc (lambda k. klet (k space 2) kin 3)] where C_1 = [dot] + 1 \
      -> C_1[(lambda k. klet (k space 2) kin 3) (lambda x. C_1[x])] where C_1 = [dot] + 1 \
      -> C_1[klet ((lambda x. C_1[x]) space 2) kin 3)] where C_1 = [dot] + 1 \
    = C_2[(lambda x. C_1[x]) space 2] where C_2 = (klet [dot] kin 3)) + 1 \
  -> C_1[2] where C_1 = [dot] + 1 \
  = 2 + 1
$

#focus-slide[
  #align(center)[It spekifies an interpreter!]
]
