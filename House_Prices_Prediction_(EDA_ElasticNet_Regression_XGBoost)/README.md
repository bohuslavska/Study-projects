# House Prices Prediction using ElasticNet and XGBoost Regressions

### About the Project

This project aims to predict the final prices of residential homes in Ames, Iowa, using ElasticNet and XGBoost regressions. 
The dataset used in this project is from the Kaggle competition "House Prices - Advanced Regression Techniques." 
It consists of 79 explanatory variables describing almost every aspect of residential homes in Ames, Iowa. 
The target variable is the final price of each home. The dataset is split into a training set and a test set. 
The training set is used to build the models, while the test set is used to evaluate the models' performance.

Project Overview

The following steps were followed to build the models:

**Exploratory Data Analysis (EDA)**: The EDA was conducted to explore the dataset, understand the target variable, and find the interdependencies between the target variable and other numerical columns. 
Some interactive visualizations were built to get better insights into the dataset.

**Data Preprocessing**: The data was preprocessed by removing outliers, handling missing values, encoding categorical variables, and scaling numerical variables.

**Modeling**: Two regression models, ElasticNet and XGBoost, were built to predict the prices of the houses. 
The models were trained on the preprocessed training set and evaluated on the preprocessed test set.

### Conclusion
To conclude, we can see that XGBoost shows better results than ElasticNet regression. 
MSE for XGBoost is 0.014 while MSE for ElasticNet regression is around 0.03. 
It means that XGBoost is more beneficial for price prediction.
