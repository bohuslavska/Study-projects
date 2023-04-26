# NLP Techniques and Classification Models for Disaster Tweet Analysis

### About the Project

The main goal of this project is to predict which Tweets are about real disasters and which ones aren’t
The dataset used in this project is taken from Kaggle's "Natural Language Processing with Disaster Tweets" competition. 
The dataset contains 7,613 tweets with binary labels (0 or 1), indicating whether the tweet is about a real disaster or not.

### Project Overview

- In the first step of the project, the dataset was preprocessed to remove unnecessary columns, missing values, and duplicates.

- Next, the tweets were preprocessed to remove stop words, punctuation, links, and usernames. Additionally, lemmatization was applied to convert words to their base forms. After that tweets were ready to be used in the model.

- Then, the data was split into train and test datasets with a ratio of 80:20. In the following step, CountVectorizer, TfidfVectorizer, Logistic Regression, Multinomial Naive Bayes classifier, and Random Forest Classifier models were used to predict whether a tweet indicates a disaster or not. 
For each model, GridSearchCV was used to find the best parameters for the model.

- Finally, the performance of each model was evaluated using the classification report.

To conclude, we have identified the most effective combinations for this classification task:

- CountVectorizer with LogisticRegression
- TfidfVectorizer with LogisticRegression
- TfidfVectorizer with MultinomialNB

All of these combinations have an accuracy score of 0.8. LogisticRegression is a strong performer with both CountVectorizer and TfidfVectorizer.
