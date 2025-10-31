# fairness-analysis-rl
Fairness and bias analysis in offline RL models (for RTDS course at SU)

From Introduction:
    This study aims to investigate fairness and bias in reinforcement learning models applied to predictions on UCI Heart Disease Dataset.
    For this purpose contextual bandits and DQN models are trained to emulate reinforcement-learning-style decision-making for predicting the presence and severity of heart disease.
    Then, the sub-group analysis is performed by analyzing accuracy, recall and F1 metric across different genders and age groups. The results can provide insights about how fairly different models perform on the same dataset and present the challenges that RL can face.

From conclusion:
    This study compared a Deep Q-Network and contextual bandits on the UCI Heart Disease dataset to assess fairness across gender and age groups. 
    Both models achieved limited predictive performance, especially for minority  classes. This resulted in low recall and F1-scores.

    The fairness analysis revealed significantly higher accuracy for female and younger patients, which could be related to a higher number of majority-class samples in these groups. 
    The results suggest that the observed fairness differences were caused mostly by dataset imbalance rather than model complexity
    and that model complexity did not influence the way models replicated bias from the dataset. 
    Future work should focus on incorporating bias mitigation strategies to better support decision-making in healthcare-related reinforcement learning settings.

Dataset reference: https://www.kaggle.com/datasets/redwankarimsony/heart-disease-data/discussion?sort=undefined