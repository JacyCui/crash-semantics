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

#let cskip = $mono("skip")$
#let cwhile = $mono("while")$
#let cdo = $mono("do")$
#let cif = $mono("if")$
#let cthen = $mono("then")$
#let celse = $mono("else")$
#let ctrue = $mono("true")$
#let cfalse = $mono("false")$
