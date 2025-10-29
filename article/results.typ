= Results

== Deep Q-Network
The model ended up with an overall accuracy of 45%, macro F1 of 0.12 and recall of 0.2. At the class level, the model struggles with minority classes, with zero recall in classes 1-4. 

In the gender sub-group analysis the female’s accuracy, recall, and F1 score were higher than male’s metrics. There were 574 male samples and 162 female samples in the train dataset, and 152 male and 32 female in test dataset.
The difference in accuracy was tested with two-proportion Z-test and was found significant with $p approx 0.0000006$ at $alpha = 0.05$.

In the age sub-group analysis it was shown that the group with the highest accuracy is $<=$40 groups, and that the accuracy was dropping with the increasing age. Thus the accuracy results were respectively 67%, 61%, 44%, and 26%. At the $alpha = 0.05$ only differences in accuracy between the group 
$<=$40 vs $>$60, 41-50 vs 60+, and 51-60 vs $>$60 were found significant with the following $p$-values: 0.002, 0.001, 0.04. 

It can be also see that the group $<=$40 with the highest accuracy was also the group with the highest recall (50%) and F1 score (40%), and that those metrics were also dropping with increasing age, being the lowest for the group $>$60 (20% and 8% respectively). The fluctuations in the metrics doesn't seem to be related to the number of instances in the train and test dataset. The detailed results can be found in the #ref(<results_age_dqn>).

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
The accuracy of the model on test dataset was about 52%, with higher accuracy for females than for males. More specifically the accuracy for male patients was around 46% and for female patients around 81%. 
The accuracy difference was found significant with $p$=0.0003 at the $alpha$=0.05 level. The recall was around 30% for males and around 29% for females. // it would be nice to do statistical testing for that too if there is time @niko
// That means that model was struggling more with identifying true positive cases for male patients than female patients, although its general performance was a lot better in case of males than females. 
F1 score was around 29% and 30% for males and females respectively.

The results with respect to the age group can be found in the #ref(<results_age_bandits>). 
// TODO: descibe statistical significane, describe results with relation to the number of training examples 
The differences in accuracy levels are significant at the level $alpha=0.05$, with exception to the difference between the groups $<=$40 and 40-50 and the groups $<=$40 and 50-60 because of $p approx 1$ and $p approx 0.05$ respectively. // perfrom the tests for all the posible combinations @niko
It can be seen from the table that the groups with the highest accuracy are the age groups $<=$40 and 41-50 while the group with the lowest accuracy is the age group >60. This level of accuracy is approximately equal to $24%$, which is close to the random model performance -- it would be 20% while having 5 possible outcome class. It can be also seen that the group with the highest accuracy is also a group with the highest recall and F1 score, while the group with the lowest accuracy is the group with the lowest recall and lowest F1. 

The age group analysis becomes even more interesting when taking into account the number of instances corresponding to the specific age group present in the train and test datasets. The group of people aged 40 or less, one of the groups with the highest accuracy, is the group with the lowest number of instances in test and train datasets. The group 41-50 is the group with the number of instances in train and test datasets similar to the group $>60$, while the group 41-50 is the one with the highest accuracy and the group $>60$ has the lowest accuracy. 

// remove smote to gain space
// In the second iteration, the overall test accuracy of the model trained on the resampled SMOTE dataset was around $36%$, being lower than accuracy of model trained on the regular dataset and tested on the same test dataset. The accuracy for females was around $30%$, while for males around $66%$. The differences are significant at the $alpha=0.05$ level with $p approx 0.0001$. The recall for female patients is around $32%$ while for male patients around $20%$. The relations between accuracy and recall seems to be similar for the model trained on the regular and the model trained on resampled data. However, the model trained on non-resampled dataset has higher overall accuracy. 

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

== Summary
// write about general predictive power of models, and compare them
The predictive power of the models seems to be questionable. The accuracy of both models is better than random assignment of classes. However, the reported macro F1 is poor in both cases. Precise classification report depicts that contextual bandits struggle with predicting correctly minority classes (especially in case of outcomes 2 and 4), while DQN is focusing only on predicting the class 0 correctly (a majority class) and ignoring all other classes.

// write about gender fairness, compare, describe possible causes
In case of gender sub-group analysis both models are more accurate for females than males. To understand this phenomena, the value counts in the train dataset were analyzed. The analysis shows that to the class 0 (which is the class with the highest recall and highest F1 score for both models) belongs 37% of all male instances and 72% of all female instances. That can eventually explain the model behavior of being more accuracy for females than males. Obviously there may be other factors that contribute to this behavior, e.g. relation between dependent and independent variables, and inspecting them would give the broader picture of this situation.

// write about age fainess, compare, describe possible cause
The statistical testing performed for both models shows that difference in accuracy between the youngest group and the oldest group is significant, thus it is not an effect of the random noise. The models perform significantly better for patients aged 40 or less than for patients older than 60. Here again the value count analysis was conducted. It shows the same relation as before. The group with the higher accuracy is the groups that contain significantly more  instances with outcome 0. In this case the group $<=$40 contains 65% of 0 instances and group $>$60 contains 27% instances with outcome 0.

// add short conclusion
// study shows that metrics are important to analyse because they may provide to such a performance
// having balanced dataset would be also important
// studies on mitigation
This study shows the importance of detailed model evaluation to ensure fairness. Performing sub-group analysis, taking into account F1 score, recall, and computing value counts helps with understanding that model behaves in unfair way and what are causes of that - here very likely the dataset is cause itself. Thus, using the methods for balancing dataset or mitigating techniques may help with this issue.