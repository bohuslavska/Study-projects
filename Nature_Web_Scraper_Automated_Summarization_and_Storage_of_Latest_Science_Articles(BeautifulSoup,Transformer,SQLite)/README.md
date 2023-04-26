# Nature News Web Scraper: Automated Summarization and Storage of 2023 Science Articles

### About the Project

The Nature News Web Scraper is an automated tool that enables users to stay up-to-date with the latest scientific news from the multidisciplinary journal Nature.
It scrapes and stores 2023 news articles related to science and technology. 

### Project Overview

- The project uses the **BeautifulSoup** library to scrape 2023 news articles. 
- After that they are summarized using the **T5-Large model**, a state-of-the-art language model for summarization. 
- The summary, along with the article title and link, is stored in a **SQLite database**. 

Final dataset provides users with quick access to the latest scientific news without the need to read each article in its entirety.

Unfortunatelly, the Nature website has some articles behind a paywall, which cannot be accessed without a subscription. 
Therefore, the scraped dataset may not contain all the news articles on the website. 

This project can be useful for researchers, journalists, or anyone interested in staying up-to-date with the latest scientific news.
