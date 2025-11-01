#import "@preview/codedis:0.2.0": code
#let code_cb_train = read("cb_train.py") 

= Methods

== Study Design
// data processing, training, evaluation with sub-group analysis. for each model accuracy, f1 score and recall where evaluated withing gender sub-group analysis and age-subgroup analysis on test datasets. for accuracy differences were tested with statistical tests
While framed as a RL task, the study primarily focused on a prediction problem evaluated through RL-inspired methods. 
The whole process consisted of the following stages: 

1. data collection,
2. data processing,
3. training of DQN and contextual bandit models,
4. evaluation with sub-group analysis,
5. statistical testing.

Data collection is described in @data_collection. Details about the DQN model are provided in @dqn, and information about contextual bandits can be found in @bandits.
A description of the evaluation can be found in @evaluation.

== Data Collection and Processing <data_collection>
In this study, the UCI Heart Disease Dataset was utilized @janosi_uci_nodate. It contains both numerical and categorical patient features, as well as a target variable that indicates the degree of heart disease severity.

Preprocessing included the removal of irrelevant columns (id, dataset) and handling missing values through the deletion of columns containing too many missing values (thal, ca), replacing extraordinary zeros with null values (trestbps, chol), and imputing null values for numerical columns with the median and categorical columns with the mode. Categorical features (sex, cp, fbs, restecg, exang, slope) were one-hot encoded with the first category dropped to avoid redundancy, and numerical ones (age, trestbps, chol, thalch, oldpeak) were standardized using the StandardScaler @pedregosa_scikit-learn_2011. The data was split into training and testing sets with an 80:20 ratio and stratification to preserve class distribution. Additionally, the age bins were extracted for the age sub-group analysis. However, these were not included in the training dataset.

#pagebreak()

== Models

=== Deep Q-Network <dqn>
DQN combines Q-learning with deep neural networks to estimate the expected reward for different actions in a given state @mnih_human-level_2015. Although traditionally used for sequential decision-making tasks, in this case, it was used for classification, allowing the model to learn from an imbalanced dataset by replaying past experiences and updating its policy iteratively @mnih_human-level_2015. This approach is handy in clinical datasets where classes and subgroups are underrepresented, as it can learn from rare cases without being overwhelmed by majority-class examples. 

The DQN model was trained for 150 epochs with an experience replay buffer increasing up to 20,000 samples. 
The replay buffer is crucial for stabilizing learning and preventing the network from overfitting, as it stores previous experiences and randomly samples them.
Furthermore, this mechanism also allows the model to repeat rare cases. An exploration rate (`epsilon`) of 0.05 was used during the training to ensure the model explores more uncommon actions. It encourages exploration, strengthening the ability to generalize.

=== Contextual Bandits <bandits>
A contextual bandit algorithm was applied using the _contextualbandits_ library, available through PyPI @cortes_contextual_2025.
The code utilized for training is presented in @code_cb_train. The number of actions was defined based on the ```Python np.unique(y)```, which resulted in 5 possible actions, since the levels of heart disease severity // risk or severity?
were ranging from 0 to 4. The policy was defined as ```Python LinUCB(nchoices=n_actions, alpha=0.3)```.

#figure(
  caption: [Training contextual bandits model],
  align(left, code(code_cb_train)),
) <code_cb_train>

== Evaluation <evaluation>
For the fairness evaluation accuracy, F1-score, and recall were calculated with respect to the different genders (male/female) and age ($<=$40, 41-50, 51-60, >60) groups on the test dataset.
Accuracy was treated as the most important metric in this study due to its commonness; thus, for every difference in this metric among specific sub-groups, a two-proportion Z-test was calculated to
confirm the statistical significance.

#pagebreak()