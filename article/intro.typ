= Introduction
Reinforcement learning (RL) is an area of Machine Learning that allows systems to make decision by interaction with environment. Unlike traditional supervised learning, reinforcement learning can adapt over time which makes it particularly useful in dynamic and real-world applications @sutton_reinforcement_1998. 
Reinforcement learning is becoming increasingly more used within human-centered areas such as healthcare, education and social services, where actions directly impact people’s lives @abdellatif_reinforcement_2023. 

// mentions what RL is 
Models used in RL learn themselves which action is the proper one based on the set of rewards and punishments received from the previous decisions. @badidi_edge_2023@oh_reinforcement_2022
In this way, after a series of trials-and-errors, the agents learn the rules of the environment they operate in. This allows them to determine, for example, appropriate treatment decisions in healthcare @badidi_edge_2023.
One example of such a models are contextual bandits or Deep Q-Network (DQN) @oh_reinforcement_2022.

Even though RL can be powerful for decision-making, it also raises important ethical concerns @neufeld_enforcing_2022.
Human-centered datasets often contain biases or underrepresentation, and the RL models can unintentionally learn these and output results that are unfair or discriminating @yang_algorithmic_2023. 
While many research papers are dedicated to subjects of bias and fairness in general, less is known about how RL models handle these concerns, given their complexity, structure and reward system @jui_fairness_2024. To ensure both effective and ethical RL in practice, it is crucial to understand their nature and how their decisions can affect real-world contexts. 

// mentions previous works
Efforts have been made by researches in order to explore the fairness in RL models. 
Such a trials related to developing and improving models are especially important because progressive algorithms tend to deal with bias better than traditional techniques @rahman_data_2024.
For example, researchers #cite(<yang_algorithmic_2023>, form:"prose")
created a double-deep Q-network containing debiasing component in order to deal with, a.o., ethnical bias in clinical studies, while still presenting decent model performance.
In other recent study #cite(<xu_contextual_2025>, form:"prose") 
developed contextual bandits algorithm called TS-Conf that utilizes Thompson Sampling to mitigate bias resulting from herding effect. 

// what is the study about 
This study aims to investigate fairness and bias in reinforcement learning models applied to predictions on UCI Heart Disease Dataset.
For this purpose contextual bandits and DQN models are trained to emulate reinforcement-learning-style decision-making for predicting the presence and severity of heart disease.
Then, the sub-group analysis is performed by analyzing accuracy, recall and F1 metric across different genders and age groups. The results can provide insights about how fairly different models perform on the same dataset and present the challenges that RL can face.