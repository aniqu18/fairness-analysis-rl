= Results
With an overall accuracy of 45.1% and macro F1 of 0.32, it indicates moderate predictive performance. The steady decrease of average loss per epoch, from 0.224 to 0.0035, suggests that the DQN-model converged successfully. At the class level, the model struggles with minority classes, with almost zero recall in classes 2-4. 

Table 1 shows that female’s accuracy was higher while male’s macro F1 was better. This difference is due to class imbalance, the DQN-model mostly predict majority class (class 0), which most females belong, therefore misleadingly improving their accuracy. In contrast, males are more evenly distributed across diseases classes, exposing the model’s limitation in predicting minority classes. Confusion matrices also showcase that predictions where mostly in class 0, indicating models struggles to identify high-risk heart diseases patients.

#table(
  columns: (1fr, auto, auto, auto),
  inset: 5pt,
  align: horizon,
  table.header(
    [*Group*], [*n*], [*Accuracy*], [*Macro F1*],
  ),
  ["Female (0)"], [32], [0.625], [0.208],
  ["Male (1)"], [152], [0.414], [0.319],
)
// Caption below table
Table 1: Performance evaluation by gender


It’s important to note that the results indicates that the model does not stem for bias toward gender. Rather it is mirroring the small number of female samples and the class imbalance in the dataset. Overall, the model tends to predict majority disease class, which consist of mostly female samples, resulting in the high female accuracy. However, this does not reflect actual favoritism, rather an artifact of datasets structure. 
