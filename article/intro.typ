= Introduction
Reinforcement learning (RL) is an area of Machine Learning that allows systems to make decisions by interacting with the environment. In comparison to traditional supervised learning, reinforcement learning can adapt over time, making it particularly useful in dynamic and real-world applications @sutton_reinforcement_1998. 
Reinforcement learning is becoming increasingly more widely applied in human-centered areas such as healthcare, education, and social services, where actions directly impact people’s lives @abdellatif_reinforcement_2023. 

// mentions what RL is 
Models utilized in RL teach themselves which action is the best based on the set of rewards and punishments they receive from their previous decisions. @badidi_edge_2023@oh_reinforcement_2022
In this way, after a series of trials and errors, the agents learn the rules of the environment in which they operate. It enables them to make informed decisions, for example, regarding appropriate treatment choices in healthcare @badidi_edge_2023.
Examples of such models are contextual bandits or Deep Q-Network (DQN) @oh_reinforcement_2022.

Even though RL can be powerful for decision-making, it also raises important ethical concerns @neufeld_enforcing_2022.
Human-centered datasets often contain biases or underrepresentation, and RL models can unintentionally learn these biases, resulting in unfair or discriminatory outputs @yang_algorithmic_2023. 
While many research papers are dedicated to subjects of bias and fairness in general, less is known about how RL models address these concerns, given their complexity, structure, and reward system @jui_fairness_2024. To ensure both practical and ethical RL in practice, it is crucial to understand their nature and how their decisions can affect real-world contexts. 

// mentions previous works
Researchers have made efforts to explore fairness in RL models. 
Such trials related to developing and improving models are essential because progressive algorithms tend to deal with bias better than traditional techniques @rahman_data_2024.
For example, researchers #cite(<yang_algorithmic_2023>, form:"prose")
created a double-deep Q-network containing a debiasing component in order to deal with, a.o., ethnical bias in clinical studies, while still presenting decent model performance.
In other recent study #cite(<xu_contextual_2025>, form:"prose") 
developed a contextual bandits algorithm called TS-Conf that utilizes Thompson Sampling to mitigate bias resulting from the herding effect. 

// what is the study about 
This study aims to investigate fairness and bias in reinforcement learning models applied to predictions on the UCI Heart Disease Dataset.
For this purpose, contextual bandits and DQN models are trained to emulate RL-style decision-making for predicting the presence and severity of heart disease.
Then, the sub-group analysis is performed by analyzing accuracy, recall, and the F1 metric across different genders and age groups. The results can provide insights about how fairly different models perform on the same dataset and present the challenges that RL can face.