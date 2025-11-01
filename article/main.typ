#import "template.typ": *

#show: project.with(
  title: "Evaluating Fairness in Deep Q-Network and Contextual Bandits on the UCI Heart Disease Dataset",
  authors: (
    (name: "Ella Forss", email: "elfo3556@student.su.se"),
    (name: "Nikodem Kaczmarek", email: "nika5442@student.su.se"),
  ),
  date: "November 1, 2025",
)

#include "intro.typ"

#include "problems.typ"

#include "methods.typ"

#include "results.typ"

#include "conclusion.typ"

#pagebreak()

#bibliography("bibliography.bib", style: "apa")