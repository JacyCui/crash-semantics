#import "common.typ": *

= Denotational Semantics

== A Compiler to Lambda Calculus

$
  [|s|] : (Var -> Value) -> Var -> Value
$

$
  [|kskip|] defeq lambda sigma. sigma
$

$
  [|s_1 semi s_2|] defeq [|s_1|] compose [|s_1|]
$

$
  [|x := e|] defeq lambda sigma. sigma[x |-> n] "where" n = eval(e, sigma)
$

$
  [|kif e kthen s_1 ktrue s_2|] defeq cases([|s_1|] & "if" eval(e, sigma) = ktrue, [|s_2|] & "if" eval(e, sigma) = kfalse)
$

$
  [|kwhile e kdo s|] defeq [|kif e kthen (c semi kwhile e kdo s) ktrue kskip|]
$

== Denotational Semantics

- Readings:

  - #link("https://www.cl.cam.ac.uk/teaching/1112/DenotSem/dens-notes-bw.pdf")[Pitts' Lecture Notes]

#focus-slide[
  #align(center)[It spekifies a compiler!]
]
