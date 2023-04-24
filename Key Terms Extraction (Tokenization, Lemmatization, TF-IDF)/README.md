# Key Terms Extraction

### About the Project

This project is a Python script that extracts key terms from news articles in XML file. 
The goal is to identify the most relevant words in the news, which can be used for various applications, such as topic modeling or content categorization.
The project was completed as a part of the Natural Language Processing course.

### Project Overview

The script first reads an XML file with the news articles and parses it using the lxml library. 
It then extracts the headlines and the text of each article and applies natural language processing techniques to clean and tokenize the text. 
Specifically, it performs the following steps:

- **Tokenization:** breaks the text into individual words or tokens
- **Lemmatization:** reduces each word to its base form (e.g., "running" -> "run")
- **Punctuation and stopword removal**: removes non-essential words such as "the" or "and"
- **Part-of-speech tagging**: assigns a grammatical tag to each word
- **Noun extraction**: selects only the nouns in the text

After cleaning and tokenizing the text, the script applies the TfidfVectorizer class from the scikit-learn library to compute the TF-IDF score for each word in all news. This score reflects how important each word is in the context of the corpus, by balancing its frequency in the document with its frequency in the corpus.

Finally, the script loops through each news story and selects the top five words with the highest TF-IDF scores as the keywords. 
It prints the headlines and the keywords, sorted alphabetically.
