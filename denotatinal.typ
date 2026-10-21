#import "common.typ": *

= Denotational Semantics

== A Compiler to Lambda Calculus

$
  [|s|] : (Var -> Value) -> Var -> Value
$

$
  [|cskip|] defeq lambda sigma. sigma
$

$
  [|s_1 semi s_2|] defeq [|s_1|] compose [|s_1|]
$

$
  [|x := e|] defeq lambda sigma. sigma[x |-> n] "where" n = [|e|]_sigma
$

$
  [|cif e cthen s_1 celse s_2|] defeq cases([|s_1|] & "if" [|e|]_sigma = ctrue, [|s_2|] & "if" [|e|]_sigma = cfalse)
$

$
  [|cwhile e cdo s|] defeq [|cif e cthen (c semi cwhile e cdo s) celse cskip|]
$

== Denotational Semantics

- Readings:

  - #link("https://www.cl.cam.ac.uk/teaching/1112/DenotSem/dens-notes-bw.pdf")[Pitts' Lecture Notes]

#focus-slide[
  #align(center)[It specifies a compiler!]
]
