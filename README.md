# Customer Churn-Prediction-Analysis


1. EXECUTIVE SUMMARY
This analysis investigates customer churn patterns using data from 1,000 customers, with 25.9% (259) having churned and 74.1% (741) remaining loyal. Our analysis compared two machine learning approaches: a pruned decision tree and a random forest model. The random forest model achieved superior accuracy at 81.6% compared to the decision tree's 79.3%, identifying 26 high-risk customers with over 70% churn probability. Agreement period emerged as the most crucial factor in predicting churn across both models. Based on these findings, we recommend targeted retention strategies focusing on contract terms and monthly charges to reduce customer attrition.

2. OBJECTIVE AND QUESTIONS

2.1. Project Purpose
2.1.1. Objective of the Project
To develop and compare predictive models for customer churn and identify key factors influencing customer retention.

2.1.2. Questions
- What are the primary factors driving customer churn?
- How effective are different machine learning models in predicting churn?
- How can we identify high-risk customers for targeted retention?
- Which model provides better accuracy and practical utility?

2.1.3. Data
The analysis utilized customer data with multiple features:
- Agreement period
- Monthly charges
- Total charges
- Technical support
- Streaming services
- Internet service type
- Marital status
- Multiple line status
- Term length

3. DATA ANALYSIS AND RESULTS

3.1. Initial Decision Tree Analysis

Full Decision Tree Findings:
- Generated 42 splits for churn prediction
- Key variables identified:
  - Total charges (highest importance)
  - Term length
  - Monthly charges
  - Agreement period
  - Technical support
  - Streaming videos

3.2. Pruned Decision Tree Results

Model Characteristics:
- Tree height: 3 levels
- Primary split variable: Agreement period
- Key features used:
  - Agreement period
  - Internet services
  - Monthly charges
- Accuracy: 79.3%
- High-risk customers identified: 24

3.3. Random Forest Model Results

Model Performance:
- Accuracy: 81.6%
- High-risk customers identified: 26
- Top predictive features:
  1. Agreement period
  2. Monthly charges
  3. Total charges
  4. Term length

4. RECOMMENDATIONS AND CONCLUSION

1. Model Selection Strategy
   - Implement random forest model for production use
   - Maintain pruned decision tree as interpretable backup
   - Regular model retraining with new data

2. Customer Retention Focus
   - Prioritize agreement period optimization
   - Review monthly charging structures
   - Enhance technical support services
   - Target high-risk customers proactively

3. Implementation Guidelines
   - Develop automated risk scoring system
   - Create tiered intervention strategies
   - Monitor model performance metrics

4. Future Improvements
   - Incorporate additional customer behavior data
   - Develop real-time churn prediction capabilities
   - Create customer segment-specific models

The analysis demonstrates that the random forest model provides superior predictive performance for customer churn. Its higher accuracy and ability to identify high-risk customers make it more suitable for practical application in retention strategies. The identification of agreement period as the top predictor across both models suggests that focusing on contract terms could be the most effective approach to reducing churn. The models provide a reliable foundation for targeted retention efforts, potentially leading to significant improvements in customer retention rates.
