= Methods
This study deployed DQN and contextual bandits on the UCI Heart Disease-dataset // provide source of the dataset @niko
to compare their predictive performance, bias and fairness between different patient groups @huang_scoping_2024@janosi_uci_nodate. Both models can learn from sequential experiences, but they differ in how they balance exploration and exploitation and their approaches for policy optimization. The purpose of using the same dataset is to evaluate not only the overall predictive accuracy but also models perform with different categories and groups, particularly focusing on the sex-related differences. // age-related too @niko
This comparative method gives insight into the trade-offs between model complexity, predictive power, and fairness. 

== Study Design
// data processing, training, evaluation with sub-group analysis. for each model accuracy, f1 score and recall where evaluated withing gender sub-group analysis and age-subgroup analysis on test datasets. for accuracy differences were tested with statistical tests. additionaly gender sub-group analysis with statistical testing was performed on SMOTE test dataset @niko
Study was designed taking into account common practices in machine learning.
The whole process consisted of the following stages: 

1. data collection,
2. data processing,
3. training of Deep Q-Network and contextual bandits modes,
4. evaluation with the use of sub-group analysis,
5. statistical testing.

Data collection is described in the #ref(<data_collection>, form: "normal"). Details about DQN model are provided in the #ref(<dqn>, form: "normal") and about contextual bandits in the #ref(<bandits>, form: "normal"). DQN and contextual bandits were trained on the train dataset. 
//Then two iterations of evaluation were performed. The first one on the original dataset and the second one on the dataset resampled using SMOTE technique. 

//During the first iteration for each model 
Accuracy, F1-score, and recall were calculated with the respect to the different gender (male/female) and age (\<41, 41-50, 51-60, >60) groups on the test dataset.
Accuracy was treated as the most important metric in this study due to its commonness, thus for every difference in this metric among specific sub-group two-proportion Z-test was performed. The aim of performing statistical testing was to confirm the statistical significance of differences in accuracy.
More details regarding evaluation can be found in the #ref(<evaluation>, form:"normal").

//In the second iteration the accuracy, F1-score, and recall were calculated for the gender sub-group analysis on the resampled dataset. Two-proportion Z-test was applied to confirm the statistical significance of the accuracy difference. Then the results were compared with the ones from the first iteration.

== Data Collection and Processing <data_collection>
The dataset used was UCI Heart Disease-data, which contains both numerical and categorical patient features as well as a target variable, which indicates the degree of heart disease severity. Preprocessing included removal of irrelevant columns and handling missing values trough imputing numerical values with median and categorical with mode. Categorical values were one-hot encoded with first category dropped to avoid redundancy and numeric features were standardized using `StandardScaler` @pedregosa_scikit-learn_2011. Data was split into training and testing sets with a 80:20 split and stratification to preserve class distribution. // add info that SMOTE was additional dataset, information about age bins were extracted for age sub-group analysis, more details about what was deleted and why, which 0 values were replaced with NaN-s @niko
// mention that in SMOTE resampling we are interested in balanced target class, not necesarily sex (however it there is time, it would be nice to do such an experiment)

== Models

=== Deep Q-Network <dqn>
We used a deep reinforcement learning model for DQN to predict heart dieses from patient features. DQN combines Q-learning with deep neural networks to estimate the expected reward for different actions in a given state @mnih_human-level_2015. Although traditionally used for sequential decision-making tasks, in this case it was used for classification, allowing model to learn from imbalanced dataset by replaying past experiences and updating its policy iteratively @mnih_human-level_2015. This approach is especially useful in clinical datasets where classes and subgroups are underrepresented, because it can learn from rare cases without being overwhelmed by majority-class examples. 

DQN-model was trained for 150 epochs with an experience relay buffer increasing up to 20 000 samples. To stabilize learning and prevent network form overfitting, the relay buffer is important as it stores previous experiences and samples them randomly. Furthermore, this mechanism also allows the model to repeat rare cases. An exploration rate (`epsilon`) of 0,05 was used during training to ensure the model explores more uncommon actions. This encourages exploration of underexplored classes, which strengthens ability to generalize. The steady decrease of average loss per epoch suggestes that the DQN-model converged successfully. 

=== Contextual Bandits <bandits>
Contextual bandits algorithm was applied with the use of the _contextualbandits_ library available through PyPI. // source 
The code used for training is presented in the #ref(<code>). The number of actions was defined based on the ```Python np.unique(y)```, which resulted in 5 possible actions, since the levels of heart disease severity // risk or severity?
were ranging from 0 to 4. The policy was defined as ```Python LinUCB(nchoices=n_actions, alpha=0.3)```.

#figure(
  caption: [Training contextual bandits model],
  ```python
  for i in range(len(X)):
      x_i = X[i].reshape(1, -1) 
      true_label = y[i]
  
      chosen_action = policy.predict(x_i)[0]
      
      reward = int(chosen_action == true_label)
  
      policy.partial_fit(x_i, np.array([chosen_action]), np.array([reward]))
      
      preds.append(chosen_action)
      rewards.append(reward)
  ```) <code>


== Evaluation <evaluation>
Model performance was evaluated with accuracy and macro F1 score to give indication of predictive abilities @saito_precision-recall_2015. In addition, sex-based evaluation metrics and confusion matrices were computed to assess possible female and male differences. This analysis helped quantify both DQN-models predictive ability and its fairness, providing solid ground for comparison of other reinforcement learning model @yang_algorithmic_2023. // provide information about contextual bandits, age evaluation and recall. replace confusion matrices with sub-group analysis (?). add information about statistical testing @niko
