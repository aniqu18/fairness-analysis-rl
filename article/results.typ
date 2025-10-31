= Results

== Deep Q-Network
The model ended up with an overall accuracy of 45%, 
recall of 20%
and macro F1 of 12%.

In the gender sub-group analysis the female’s accuracy (84%), recall (33%), and F1-score (31%) were higher than male’s metrics (accuracy of 36%, recall of 20%, and F1-score of 11%). There were 574 male samples and 162 female samples in the train dataset, and 152 male and 32 female in the test dataset.
The difference in accuracy was tested with two-proportion Z-test and was found significant with $p approx 0.0000006$ at $alpha = 0.05$.

In the age sub-group analysis, the group with the highest accuracy was the #box[$<=$40] group, and accuracy decreased with increasing age. The accuracy scores were 67%, 61%, 44%, and 26% for $<=40$, 41-50, 51-60, and >60 groups, respectively. At the $alpha = 0.05$ significant differences in accuracy were found between
$<=$40 and $>$60, 41-50 and 60+, and 51-60 and $>$60 with $p$-values of 0.002, 0.001, 0.04. 

It can be seen that the $<=$40 group, which achieved the highest accuracy, also obtained the highest recall (50%) and F1-score (40%). These metrics similarly decreased with age, reaching their lowest values for the $>$60 group (20% recall and 8% F1-score). The fluctuations in the metrics do not seem to be related to the number of instances in the train and test datasets. Detailed results can be found in @results_age_dqn.

#figure(
  caption: [Performance evaluation of DQN by age group],
  table(
    align: (x, y) => (
      if x > 0 { center }
      else { left }
    ),
    stroke: (x, y) => if y == 0 {
      (bottom: 0.7pt + black)
      (top: 0.7pt + black)
    }
    else if y == 4 {
      (bottom: 0.7pt + black)
    },
    columns: 6,
    [*Group*], [*n (test)*], [*n (train)*], [*Accuracy*], [*Recall*], [*F1*],
    [*$<=$40*], [18], [93], [67%], [50%], [40%],
    [*41-50*], [36], [224], [61%], [25%], [19%],
    [*51-60*], [80], [382], [44%], [20%], [12%],
    [*$>$60*], [50], [221], [26%], [20%], [8%],
  ) 
) <results_age_dqn>

== Contextual Bandits
Accuracy of the model on the test dataset was about 52%, while recall and F1-score were equal to 31% and 29%, respectively. 

The female's group achieved higher accuracy than males. More specifically the accuracy for 
female patients was around 81%
and for
male patients around 46%.  
The difference was found significant with $p$=0.0003 at the $alpha$=0.05 level. 
Recall was around 
29% for females
and around 
30% for males .
F1-score was around 
30% and 29% for 
females and males 
respectively.

The results with respect to the age group can be found in #ref(<results_age_bandits>). 
The differences in accuracy were significant at the level $alpha=0.05$, with exception to the difference between the groups $<=$40 and 40-50 ($p = 1$), and the groups $<=$40 and 50-60 ($p approx 0.05$).
It can be seen from the table that the groups $<=$40 and 41-50 achieved the highest accuracy, while the >60 group had the lowest accuracy. The accuracy for the >60 group was approximately 24%, which was close to random performance (20% with five possible outcome classes). It can be also seen that the group $<=$40 was also the group with the highest recall and F1-score, while the group >60 was the group with the lowest recall and F1-score. 

The age group analysis became especially interesting when taking into account the number of instances corresponding to each age group in the train and test datasets.
The $<=$40 group, despite being one of the groups with the highest accuracy, had the lowest number of instances in both datasets. 
The group 41-50 had a similar number of instances to the group $>60$, but the group 41-50 was one of the groups with the highest accuracy, and the group $>60$ had the lowest accuracy.

#figure(
  caption: [Performance evaluation of contextual bandits by age group],
  table(
    align: (x, y) => (
      if x > 0 { center }
      else { left }
    ),
    stroke: (x, y) => if y == 0 {
      (bottom: 0.7pt + black)
      (top: 0.7pt + black)
    }
    else if y == 4 {
      (bottom: 0.7pt + black)
    },
    columns: 6,
    [*Group*], [*n (test)*], [*n (train)*], [*Accuracy*], [*Recall*], [*F1*],
    [*$<=$40*], [18], [93], [78%], [71%], [72%],
    [*41-50*], [36], [224], [78%], [35%], [32%],
    [*51-60*], [80], [382], [53%], [35%], [32%],
    [*$>$60*], [50], [221], [24%], [19%], [19%],
  ) 
) <results_age_bandits>

== Interpretation and Insights
// write about general predictive power of models, and compare them
The predictive power of both models seems to be questionable. Their accuracy was better than random assignment, but reported recall and F1-score were poor in both cases. 
Precise classification report depicted that contextual bandits struggled with predicting correctly the minority classes (especially in case of outcomes 2 and 4), while DQN was predicting correctly only the class 0 (a majority class), ignoring all other cases.

// write about gender fairness, compare, describe possible causes
The gender sub-group analysis revealed that both models were more accurate for females than for males. To better understand this phenomenon, the relative class distributions in the training dataset were examined. The analysis revealed that 72% of female instances belong to class 0 (the class with the highest recall and F1-score for both models), whereas only 37% of male instances is in this class. 
That can eventually explain the model being more accurate for females. However, other factors could contribute to this behavior, and inspecting them would give broader picture of the situation.

// write about age fainess, compare, describe possible cause
The statistical testing performed for both models showed that difference in accuracy between the youngest group and the oldest group was significant, thus it was not an effect of the random noise. The models performed significantly better for patients aged 40 or less than for patients older than 60. As before, the value count analysis was conducted and the similar pattern was observed: the group with the highest accuracy was the group that contained significantly more instances with outcome 0. The $<=$40 group contained 65% outcome-0 instances, and the >60 group contained only 27% of them.