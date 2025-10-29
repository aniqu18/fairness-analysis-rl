= Introduction
Reinforcement Learning is an area of Machine Learning that allows systems to make decision by interaction with environment and trough rewards or penalties. Unlike traditional supervised learning, reinforcement learning can adapt over time which makes it particularly useful in dynamic and real-world applications @sutton_reinforcement_1998. Reinforcement learning is becoming increasingly more used within human-centered areas such as healthcare, education and social services, where actions directly impact people’s lives @abdellatif_reinforcement_2023. 

// mention what RL is @niko
The models used in reinforcement learning learn themselves which action is the proper one based on the set of rewards and punishments received from the previous decisions. // Badidi and Oh
This way after the set of trials and errors they are able to understand rules governing the environment they operate in. This enables the possibility to learn for example what treatment decisions should be made in healthcare based on the huge datasets. //Badidi 2023
One example of such a models are contextual bandits, which are a powerful tool for modeling sequential decision-making, or Deep Q-Network (DQN), being a convolutional neural network // Oh for CB, add reference for DQN for example based on https://en.wikipedia.org/wiki/Q-learning#Deep_Q-learning 

Even though reinforcement learning can be powerful for decision-making, it also raises important ethical concerns @neufeld_enforcing_2022.
// TODO It can be from datasets or from algorithms themselve and it would be nice to mention it @niko
// for example: 
// At the broadest level, bias can be divided into two categories: dataset bias, caused by data that is not representative, and algorithmic bias, caused by poor design or improper implementation of algorithms (Badidi, 2023; Rahman et al., 2024).
Human-centered dataset often contains biases or underrepresentation, and the reinforcement learning models can unintentionally learn these and output results that are unfair or discriminating @yang_algorithmic_2023. 
While there is a lot of research about bias and fairness, less is known about how reinforcement learning models handles these concerns, given their complexity, structure and reward system @jui_fairness_2024. To ensure both effective and ethical reinforcement learning models in practice, it’s crucial to understand their nature and how their decisions can affect real-world contexts. 

// mention previous works @niko
Efforts where made by researches in order to explore the fairness in reinforcement learning models. 
Such a trials related to developing and improving models are especially important because progressive algorithms tends to deal with bias better than traditional techniques // Rahman 2024
For example, researchers ... // Yang et al. 2023
created a double-deep Q-network containing debiasing component in order to deal with a.o. ethnical bias in clinical studies, while still presenting decent model performance.
In a recent study ... // Xu et al. 2025
developed contextual bandits algorithm called TS-Conf that utilizes Thompson Sampling to mitigate bias being a result of herding effect. 

// how bias can be mitigated @niko
Bias mitigation requires usually primarily using data of good quality and performing evaluations of the model while being oriented on privacy. // Badidi 2023
It is also possible to utilize data augmentation techniques, carefully studying features and their impact on the model, performing sub-group analysis and using data sampling. Beyond that applying ensemble methods or simply choosing data that is representative enough can also support model designers when dealing with bias. // Baddid 2023 & Smith 2023

// what is this about @niko
In this study we aim to investigate fairness and bias in reinforcement learning models applied on human-oriented dataset. // maybe health oriented?
For this purpose we trained contextual bandits and Deep Q-Network (DQN) on UCI Heart Disease Dataset. This way we simulated reinforcement learning based decision process of classifying presence of heart disease and its severity. 

The sub-group analysis was performed by analyzing accuracy, recall and F1 metric across different genders and age groups. The results can provide insights about how different models perform on the same dataset in case of fairness and bias and provide information about fairness challenges that RL can face on health datasets.
