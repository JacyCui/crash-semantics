#import "@preview/touying:0.7.4": *
#import themes.university: *
#import "@preview/curryst:0.6.0": prooftree, rule, rule-set

// Notations

#let defeq = $attach(limits(=), t: "def")$
#let cfg(..args) = {
  let items = args.pos().map(x => $#x$).join([, ])
  $chevron.l #items chevron.r$
}
#let eval(exp, store) = $[|#exp|]_#store$
#let steps = $class("binary", ->)^*$
#let galois(alpha: $alpha$, gamma: $gamma$) = $attach(harpoons.ltrb, t: #gamma, b: #alpha)$

// Domains

#let Exp = $bold("Exp")$
#let Value = $bold("Value")$
#let Var = $bold("Var")$
#let Stmt = $bold("Stmt")$

// Syntax

#let kw(name) = $mono(#name)$.body
#let kskip = kw("skip")
#let kwhile = kw("while")
#let kdo = kw("do")
#let kif = kw("if")
#let kthen = kw("then")
#let ktrue = kw("else")
#let ktrue = kw("true")
#let kfalse = kw("false")
