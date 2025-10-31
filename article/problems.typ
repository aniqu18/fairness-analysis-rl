= Problems and Questions
While reinforcement learning has been studied in many technical applications, fewer applications for human-centered contexts with real-consequence decisions were presented @jayaraman_primer_2024. 
Compared to supervised learnings models that have been systematically analyzed in regard to bias and fairness, reinforcement learning introduces some unique challenges @mehrabi_survey_2021.
For example, sequential decision-making and feedback-loops can influence the output and performance of model @abhivardhan_data_2025.

How a model complexity affects bias is unclear. Complex models such as DQN, that learn trough multi-step decision policies, can behave differently than one-step models such as Contextual Bandits @cannelli_hedging_2023. A comparative analysis of reinforcement models in human-centered datasets is motivated by the gap of knowledge, with the goal to better understand where fairness issues stem from @huang_scoping_2024.

The key question in this study is whether model structure influences fairness outcome. Specifically, whether more complex DQN leads to different fairness behavior in comparison to simpler contextual bandits. This study also investigates if sensitive attributed -- age and gender -- can cause differences in prediction performance across patient subgroups.
