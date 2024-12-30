


#Question - 1

# Load the customer churn dataset
churn_data <- read.csv("customer_churn_dataset.csv")

# Display the first few rows of the dataset
head(churn_data)

# Load necessary libraries
library(caTools)
library(rpart)

# 2. Tabulate the outcome variable Churn and calculate percentage of churned customers
churn_table <- table(churn_data$Churn)
churn_percentage <- prop.table(churn_table) * 100
churn_table
churn_percentage

# 3. Set seed for reproducibility
set.seed(123)

# 4. Split the data into 70% training and 30% testing sets
sample <- sample.split(churn_data$Churn, SplitRatio = 0.70)
train_data <- subset(churn_data, sample == TRUE)
test_data <- subset(churn_data, sample == FALSE)

# 5. Estimate a full decision tree model using the training data
churn_tree <- rpart(Churn ~ ., data = train_data, method = "class", cp = -1)

# 6. Number of splits in the full decision tree
summary(churn_tree)

# 7. Variable importance in the full decision tree
churn_tree$variable.importance


#Question - 2

#install.packages('rpart.plot')
# Load necessary library for plotting
library(rpart.plot)

# 1. Estimate a pruned decision tree model using the specified parameters
pruned_tree <- rpart(Churn ~ ., data = train_data, method = "class", 
                     parms = list(split = 'information'),
                     control = rpart.control(maxdepth = 3, minsplit = 2, minbucket = 2))

# 2. Plot the pruned decision tree
rpart.plot(pruned_tree,
           type = 5,          
           extra = 104,        
           under = TRUE,       
           box.palette = "BuGn", 
           shadow.col = "gray", 
           nn = TRUE,          
           cex = 0.6,          
           faclen = 0,        
           fallen.leaves = TRUE 
)


# 3. Height of the estimated tree
tree_height <- pruned_tree$frame$var[pruned_tree$frame$var != "<leaf>"]
tree_height <- length(unique(tree_height))

# 4. Highest ranking feature used for the churn decision
highest_ranking_feature <- pruned_tree$frame$var[1]

# 5. Variables used in the tree construction
used_variables <- unique(pruned_tree$frame$var[pruned_tree$frame$var != "<leaf>"])

# Output results
tree_height
highest_ranking_feature
used_variables


#Question-3

# 1. Predict churn outcomes for the testing data set
predicted_churn <- predict(pruned_tree, test_data, type = "class")

# 2. Display the confusion matrix for the pruned model
confusion_matrix <- table(Predicted = predicted_churn, Actual = test_data$Churn)
confusion_matrix

# 3. Calculate the accuracy rate for the pruned model
accuracy_rate <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
accuracy_rate

# 4. Predict churn probabilities for the testing data set
churn_probabilities <- predict(pruned_tree, test_data, type = "prob")[, "Yes"]

# 5. Identify high-risk customers with a probability greater than 70%
high_risk_customers <- sum(churn_probabilities > 0.70)
high_risk_customers


#Question - 4

# Load the randomForest library
library(randomForest)

# 1. Estimate a random forest model for the training data with 5000 trees and mtry = 3
rf_model <- randomForest(as.factor(Churn) ~ ., data = train_data, ntree = 5000, mtry = 3, importance = TRUE)

# 2. Identify the top 4 important features based on the mean decrease in Gini index
importance_rf <- importance(rf_model)
top_features <- importance_rf[order(importance_rf[, "MeanDecreaseGini"], decreasing = TRUE), ][1:4, ]
top_features

# 3. Use the random forest model to predict churn outcomes for the testing data set
rf_predictions <- predict(rf_model, test_data, type = "class")

# 4. Display the confusion matrix for the random forest model
rf_confusion_matrix <- table(Predicted = rf_predictions, Actual = test_data$Churn)
rf_confusion_matrix

# 5. Calculate the accuracy rate for the random forest model
rf_accuracy_rate <- sum(diag(rf_confusion_matrix)) / sum(rf_confusion_matrix)
rf_accuracy_rate

# 6. Predict churn probabilities for the testing data set
rf_probabilities <- predict(rf_model, test_data, type = "prob")[, "Yes"]

# 7. Identify high-risk customers with a probability greater than 70%
rf_high_risk_customers <- sum(round(rf_probabilities, 2) > 0.70)
rf_high_risk_customers

# 8. Compare the high-risk allocation between the pruned decision tree and random forest models
high_risk_customers 
rf_high_risk_customers 


