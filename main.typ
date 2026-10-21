#import "common.typ": *

#show: university-theme.with(
  aspect-ratio: "16-9",
  progress-bar: true,
  config-info(
    title: [Formal Program Semantics],
    subtitle: [(Crash Tutorial: An X Style)],
    author: [Jiacai Cui],
    institution: [PASCAL @ Nanjing University],
    date: datetime.today(),
  ),
  config-page(
    margin: (top: 2.5em, x: 1em, y: 1em),
  ),
)

#set par(justify: true)

#show link: it => text(fill: blue)[#underline(it)]

#show table: set text(.8em)

#show heading.where(level: 1): set heading(numbering: "1.")

#title-slide()

== Style of Program Semantics

- An *engineer's* style: _Operational Semantics_

  - It specifies an *interpreter* for a language.

- A *mathematician's* style: _Denotational Semantics_

  - It specifies a *compiler* for a language.

- A *logician's* style: _Axiomatic Semantics_

  - It specifies a *verifier* for a language.

- A *static analysis* style: _Abstract Interpretation_

  - It specifies an *analyzer* for a language.

#include "operational.typ"
#include "denotatinal.typ"
#include "axiomatic.typ"
#include "abstract.typ"

= Summary

== The Essense of Program Semantics

- An *engineer's* perspective: _Operational Semantics_
  - It specifies an *interpreter* for a language.

- A *mathematician's* perspective: _Denotational Semantics_
  - It specifies a *compiler* for a language.

- A *logician's* perspective: _Axiomatic Semantics_
  - It specifies a *verifier* for a language.

- A *static analysis* perspective: _Abstract Interpretation_
  - It specifies an *analyzer* for a language.

- What is *your* perspective?
