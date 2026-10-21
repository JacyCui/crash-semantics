#import "common.typ": *

= Axiomatic Semantics

== A Hoare-stype Verifier

#rule-set(
  prooftree(rule(
    name: smallcaps[Skip],
    ${p} cskip {p}$,
  )),
  prooftree(rule(
    name: smallcaps[Seq],
    ${p} s_1 {r} quad {r} s_2 {q}$,
    ${p} s_1 semi s_2 {q}$,
  )),
  prooftree(rule(
    name: smallcaps[Assign],
    ${p[e slash x]} x := e {p}$,
  )),
  prooftree(rule(
    name: smallcaps[If],
    ${p and e} s_1 {q} quad {p and not e} s_2 {q}$,
    ${p} cif e cthen s_1 celse s_2 {q}$,
  )),
  prooftree(rule(
    name: smallcaps[WhileP],
    ${i and e} s {i}$,
    ${i} cwhile e cdo s {i and not e}$,
  )),
  prooftree(rule(
    name: smallcaps[WhileT],
    ${i and e and v = x_0} s {i and v < x_0} quad i and e => v >= 0$,
    ${i} cwhile e cdo s {i and not e}$,
  )),
)

== Axiomatic Semantics

- Seperation Logic

  - Extension of Hoare logic for reasoning about pointers

- Readings:

  - #link("https://hongjin-liang.github.io/semantics2024/08_Hoare.pdf")[Liang' Lecture Slides on Hoare Logic]

  - #link("https://hongjin-liang.github.io/semantics2024/09_Separation.pdf")[Liang' Lecture Slides on Seperation Logic]

#focus-slide[
  #align(center)[It specifies a verifier!]
]
