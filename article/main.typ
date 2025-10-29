#import "template.typ": *

#show: project.with(
  title: "Evaluating Fairness and Bias in Reinforcement Learning Models on Human-Centered Datasets", // maybe just evaluating fairness? and also since we just use one dataset and two models we can use them in the title. so the final title can be: Evaluating Fairness in contextual bandits and DQN on UCI Heart Disease-dataset. but i am not sure which title is better @niko
  authors: (
    (name: "Ella Forss", email: "elfo3556@student.su.se"),
    (name: "Nikodem Kaczmarek", email: "nika5442@student.su.se"),
  ),
  date: "October 15, 2025",
)

#include "intro.typ"

#include "problems.typ"

#include "methods.typ"

#include "results.typ"

#include "conclusion.typ"

#pagebreak()

#bibliography("bibliography.bib", style: "apa")