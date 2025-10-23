= Results

== Deep Q-Network
With an overall accuracy of 45.1% and macro F1 of 0.32, it indicates moderate predictive performance. The steady decrease of average loss per epoch, from 0.224 to 0.0035, suggests that the DQN-model converged successfully. At the class level, the model struggles with minority classes, with almost zero recall in classes 2-4. 

#ref(<results_dqn>) shows that female’s accuracy was higher while male’s macro F1 was better. This difference is due to class imbalance, the DQN-model mostly predict majority class (class 0), which most females belong, therefore misleadingly improving their accuracy. In contrast, males are more evenly distributed across diseases classes, exposing the model’s limitation in predicting minority classes. Confusion matrices also showcase that predictions where mostly in class 0, indicating models struggles to identify high-risk heart diseases patients. // if we wanna relate to confusion matrix it would be probably a good idea to show the raw results, but we are also running out of space, so maybe we should not relate to this at all? @niko

#figure(
  caption: [Performance evaluation by gender],
  table(
    align: (x, y) => (
    if x > 0 { center }
    else { left }
    ),
    stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
    (top: 0.7pt + black)
    }
    else if y == 2 {
       (bottom: 0.7pt + black)
    },
    columns: 4,
    [*Group*], [*n*], [*Accuracy*], [*Macro F1*],
    [*Female*], [32], [0.625], [0.208],
    [*Male*], [152], [0.414], [0.319],
  ) 
) <results_dqn>

It’s important to note that the results indicates that the model does not stem for bias toward gender. Rather it is mirroring the small number of female samples and the class imbalance in the dataset. Overall, the model tends to predict majority disease class, which consist of mostly female samples, resulting in the high female accuracy. However, this does not reflect actual favoritism, rather an artifact of datasets structure. 

== Contextual Bandits
The accuracy of the model on test dataset was about 53%, with higher accuracy for males than for females. More specifically the accuracy for female patients was around 47% and for male patients around 78%. // add information how many males and how many females @niko
The accuracy difference was found significant with $p$=0.002 at the $alpha$=0.05 level. However, the recall was around 33% for females and around 28% for males. // it would be nice to do statistical testing for that too if there is time @niko
That means that model was struggling more with identifying true positive cases for male patients than female patients, although its general performance was a lot better in case of males than females. 

The results with respect to the age group can be found in the #ref(<results_age_bandits>). // TODO: descibe statistical significane, describe results with relation to the number of training examples 

#figure(
  caption: [Performance evaluation by age group],
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
    columns: 5,
    [*Group*], [*n (test)*], [*n (train)*], [*Accuracy*], [*Recall*],
    [*$<=$40*], [18], [93], [78%], [71%],
    [*41-50*], [36], [224], [83%], [53%],
    [*51-60*], [80], [382], [51%], [33%],
    [*$>$60*], [50], [221], [24%], [21%],
  ) 
) <results_age_bandits>

== Comparison
#lorem(100) // TODO: compare results between models