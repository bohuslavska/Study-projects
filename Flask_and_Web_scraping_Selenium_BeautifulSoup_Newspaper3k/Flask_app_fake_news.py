##Let's make a simple Flask app that allows you to choose a fake news narrative and then look at examples of it. 

#Imports

import requests
from bs4 import BeautifulSoup
import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.by import By
from newspaper import Article
import newspaper
from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def index():
   return render_template ("link_form.html")
@app.route('/parse-link', methods = ['POST'])

#Let's scrape a list of narratives with the help of the Beautiful Soup library.

def scrape_links():
    URL = request.form['link']
    content = requests.get(URL).text
    soup = BeautifulSoup(content, "html.parser")
    publications = soup.find(class_='Home_container__bCOhY')
    keys = publications.find_all('h2', class_ = "FakeItem_fakeHeading__Uc0QN")
    
    values = publications.find_all('a')
    valid_links = []
    for v in values:
        link = URL + v.get('href')
        r = requests.get(link)
        if r.status_code != 404:
            valid_links.append(link)

    labeled_dict = {}

    for index, k in enumerate(keys):
        k = keys[index].text[2:]
        v = valid_links[index]      
        labeled_dict.update({k:v})

    result = "<p>" + "Choose narrative:" + "</p>"
    result += "<ul>"
            
    for k,v in labeled_dict.items():
        
        result += "<li><a href=http://127.0.0.1:5000/user_choice?redirect=" + v + ">" + k + "</a></li>"
            
    result += "</ul>"
    return (result)

@app.route('/user_choice', methods = ['GET','POST'])

#Now that we have a list of narratives 
#let's scrape all the news links inside of the narrative chosen by the user.
#We are going to do it with the help of Selenium, Beautiful Soup, and Newspaper3k libraries.

def user_choice():
    if request.method == 'POST':
        URL2 = request.form['link']
    if request.method == 'GET':
        URL2 = request.args.get("redirect")

    DRIVER_PATH = '/path/to/chromedriver'
    driver = webdriver.Chrome(executable_path=DRIVER_PATH)
    driver.get('https://google.com')

    driver.get(URL2)
    all_links = driver.find_elements(By.CLASS_NAME, 'Narrative_fakeLink___YbTe')
    for i in all_links:
        i.click()
    soup = BeautifulSoup(driver.page_source, 'html.parser')
    list_dirty = soup.find_all(class_ = 'Narrative_media__B2gNZ')
    final_list = []
    for u in list_dirty:
        link_news = u.find('a').get('href')
        final_list.append(link_news)
    
    result = ''
    result += "<p>" + "Here is a list of articles supporting this narrative" + ":" + "</p>"        
    result += "<ul>"
    
    for url in final_list:

        article = newspaper.Article(url=url)
        article.download()

        try:
            article.parse()
            result += "<li><a href=" + url + ">" + str(article.title) + "</a></li>"
        except:
            continue
        
    result += "</ul>"
    return result

if __name__ == '__main__':
   app.run(debug = True)
