= Problems and Questions
While reinforcement learning has been studied in many technical applications, fewer applications for human-centered contexts with real-world consequences have been presented @jayaraman_primer_2024. 
Compared to supervised learning models that have been systematically analyzed regarding bias and fairness, reinforcement learning introduces some unique challenges @mehrabi_survey_2021.
For example, sequential decision-making and feedback loops can influence the output and performance of model @abhivardhan_data_2025.

The impact of model complexity on bias is unclear. Complex models such as DQN, that learn through multi-step decision policies, can behave differently than one-step models such as contextual bandits @cannelli_hedging_2023. A comparative analysis of reinforcement models in human-centered datasets is motivated by the existing knowledge gap, with the goal of better understanding where fairness issues originate @huang_scoping_2024.

The key question in this study is whether the model structure influences the fairness outcome. Specifically, whether more complex DQN leads to different fairness behavior in comparison to simpler contextual bandits. This study also investigates if sensitive attributes --- age and gender --- can cause differences in prediction performance across patient subgroups.
