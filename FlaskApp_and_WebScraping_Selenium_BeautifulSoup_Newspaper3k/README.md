# Web Scraping Russian Propaganda for Building a Fake News Dataset with BeautifulSoup, Selenium, and Newspaper3k

### About the Project
This project was completed as a part of the Fake News Detection with NLP Models course by Gathers. 
The primary goal of this project was to scrape examples of Russian propaganda collected by the authors of VoxCheck on the website https://rusdisinfo.voxukraine.org/. 

### Project Overview

The project was divided into two parts. 
- In the first part, a simple Flask app was developed, which allows the user to choose a fake news narrative and look at examples of it. 
- The second part of the project was aimed at creating a labeled fake news dataset. 
During the project, various scraping tools such as Beautiful Soup, Selenium, and Newspaper3k were used.

The project consists of the following steps:

- It started with scraping a list of narratives using the Beautiful Soup library. They were collected from the website https://rusdisinfo.voxukraine.org/. 
- Next, the Flask app was developed, which allowed the user to select a narrative and view examples of it. For this, Selenium and Newspaper3k libraries were used to scrape the news links related to the selected narrative. 
- Finally, a labeled fake news dataset was created.

Overall, this project provided a good foundation for understanding the process of data scraping and the creation of a labeled dataset. 
This dataset can be used for training and evaluating NLP models for fake news detection.
