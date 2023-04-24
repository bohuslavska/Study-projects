## Content-Based Movie Recommender

### About the Project

This is a project for building a Content-Based Movie Recommender system. The dataset used in this project is sourced from Kaggle and contains information on movies released between 1900 and 2017. The project is built using Python and several Python libraries such as pandas, numpy, nltk, and scikit-learn.

### Project Overview

The Content-Based Movie Recommender is an algorithm that recommends movies based on the cosine similarity of their descriptions. The system uses a dataset of movies that contains several text-based columns, including description and tagline.

The project consists of the following steps:

**Data collection and preprocessing**: The IMDb movie dataset is collected from Kaggle and filtered to remove missing values, duplicates, and samples with non-English descriptions. The text data is preprocessed using techniques such as tokenization, lemmatization, and stop-word removal.

**Vectorization and similarity calculation**: The preprocessed text data is vectorized using the CountVectorizer library from scikit-learn. The cosine similarity between the movies is then calculated using the cosine_similarity function.

**Recommendation generation**: A recommender function is created to generate a list of similar movies based on a user's selected movie. The function takes the movie's title and cosine similarity matrix as inputs and outputs a dictionary containing ten recommended movies. Finally, a dataset with movie recommendations based on cosine similarity is created.

**Flask web application**: A Flask web application is made to enable users to interact with the recommender system. The application allows users to enter a movie title and receive a list of 10 recommended movies with links to the IMDb. This project utilizes Jaro-Winkler distance metric for fuzzy matching of movie titles. This metric has been preferred over other distance metrics like Levenshtein or Damerau-Levenshtein as it has a significant advantage when calculating ratios or percentages for smaller strings.

<img width="440" alt="Screenshot 2023-04-22 at 18 34 01" src="https://user-images.githubusercontent.com/94128854/233793484-034cce6b-6789-4331-b745-74fa62d1f2ff.png">
<img width="574" alt="Screenshot 2023-04-22 at 18 29 25" src="https://user-images.githubusercontent.com/94128854/233793310-1e191534-d14f-4253-82a2-fe0319f91275.png">
