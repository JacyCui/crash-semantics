#import "common.typ": *

= Denotational Semantics

== A Compiler to Lambda Calculus

$
  semantics(dot.op) : Stmt -> (Var -> Value) -> Var -> Value
$

$
  semantics(kskip) defeq lambda sigma. sigma
$

$
  semantics(s_1 semi s_2) defeq semantics(s_1) compose semantics(s_1)
$

$
  semantics(x := e) defeq lambda sigma. sigma[x |-> n] "where" n = eval(e, sigma)
$

$
  semantics(kif e kthen s_1 ktrue s_2) defeq cases(semantics(s_1) & "if" eval(e, sigma) = ktrue, semantics(s_2) & "if" eval(e, sigma) = kfalse)
$

$
  semantics(kwhile e kdo s) defeq semantics(kif e kthen (c semi kwhile e kdo s) ktrue kskip)
$

== Denotational Semantics

- Readings:

  - #link("https://www.cl.cam.ac.uk/teaching/1112/DenotSem/dens-notes-bw.pdf")[Pitts' Lecture Notes]

#focus-slide[
  #align(center)[It spekifies a compiler!]
]
