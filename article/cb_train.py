for i in range(len(X)):
      x_i = X[i].reshape(1, -1) 
      true_label = y[i]
  
      chosen_action = policy.predict(x_i)[0]
      
      reward = int(chosen_action == true_label)
  
      policy.partial_fit(x_i, np.array([chosen_action]), np.array([reward]))
      
      preds.append(chosen_action)
      rewards.append(reward)