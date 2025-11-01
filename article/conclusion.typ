= Conclusion

// This study shows the importance of detailed model evaluation to ensure fairness. Performing sub-group analysis, taking into account F1 score, recall, and computing value counts helps with understanding that model behaves in unfair way and what are causes of that - here very likely the dataset is cause itself. Thus, using the methods for balancing dataset or mitigating techniques may help with this issue.

This study compared a Deep Q-Network and contextual bandits on the UCI Heart Disease dataset to assess fairness across gender and age groups. 
Both models achieved limited predictive performance, especially for minority classes. It resulted in low recall and F1-score.

The fairness analysis revealed significantly higher accuracy for female and younger patients, which could be related to a higher number of majority-class samples in these groups. 
The results suggest that the observed fairness differences were primarily caused by dataset imbalance rather than models themselves
and that model complexity did not influence the way models replicated bias from the dataset. 
Future work should focus on incorporating bias mitigation strategies to enhance decision-making in healthcare-related RL settings.