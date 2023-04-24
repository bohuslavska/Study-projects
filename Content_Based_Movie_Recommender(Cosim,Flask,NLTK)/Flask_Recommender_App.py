#Let's create a simple visual interface for our recommender with the help of Flask.

import requests
import pandas as pd
from flask import Flask, request, render_template
import jaro

app = Flask(__name__)

@app.route('/')
def index():
   return render_template('movie_title.html')

@app.route('/recommendations', methods = ['GET', 'POST'])

#Let's read user input from the movie title template and make a list of recommendations using our dataset.

def recommend_movie():
    movie_title = request.form['shortcode']
    print('this is movie title', movie_title)
    df = pd.read_csv('movie_recommendations.csv')
    df['recommendations'] = df['recommendations'].apply(lambda x: eval(x))

    #Let's use Jaro-Winkler Distance for fuzzy matching.
    #If the score is higher than 0.8, we assume light typo and offer recommendations.
    #If the score is lower than 0.8, we offer recommendations and also try to clarify what the user means.

    list_titles = df['title'].tolist()
    biggest_metr = 0
    d = {}

    for i in list_titles:
        metr = jaro.jaro_winkler_metric(movie_title, i)
        if metr > biggest_metr:
            d.clear()
            biggest_metr = metr
            d[i] = biggest_metr

    for k,v in d.items():
        if v >= 0.8:
            recs = df.loc[df['title'] == k, 'recommendations']
            recs = recs.values[0]
            result = "<p>" + "Your list of recommendations:" + "</p>"
            result += "<ul>"
                    
            for key,value in recs.items():
                
                result += "<li><a href=https://www.imdb.com/title/" + str(value) + ">" + str(key) + "</a></li>"
                    
            result += "</ul>"
            return result
        
        if v < 0.8:

            recs = df.loc[df['title'] == k, 'recommendations']
            recs = recs.values[0]

            result = "<p>" + f"Perhaps you mean {k}?" + "</p>"
            result += "<p>" + "Your list of recommendations:" + "</p>"
            result += "<ul>"
                    
            for key,value in recs.items():
                
                result += "<li><a href=https://www.imdb.com/title/" + str(value) + ">" + str(key) + "</a></li>"
                    
            result += "</ul>"
            return result

if __name__ == '__main__':
   app.run(debug = True)
