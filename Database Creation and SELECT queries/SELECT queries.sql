--This project was completed during EPAM Data Analytics Engineering Program (summer 2022). 

--Let's look at all my texts in 2021 and 2022

SELECT Title AS All_Texts 
FROM Articles_2021
UNION
SELECT Title AS All_Texts 
FROM Articles_2022

--Let's see how much money I earned in September 2021

SELECT SUM(Price) AS Payment_September
FROM Articles_2021
WHERE Publication = 'september'

--Let's look at my average payment for a native ad

SELECT AVG(Price) AS Native_ad_avg
FROM Articles_2022
WHERE Article_type = 5

--Let's look at the most and the least expensive texts for two years

SELECT MAX(Prices_texts.Price) AS Max_Price, MIN(Prices_texts.Price) AS Min_Price
FROM (SELECT Title, Price 
FROM Articles_2021
UNION
SELECT Title, Price
FROM Articles_2022) AS Prices_texts

--Let's analyze how much money I have earned for two years writing each type of the text

SELECT SUM(A.Price) AS Payment, T.Text_type
FROM Articles_2022 AS A
LEFT JOIN Text_type_features AS T
ON A.Article_type = T.TypeID
GROUP BY T.Text_type
UNION ALL
SELECT SUM(A.Price) AS Payment, T.Text_type
FROM Articles_2021 AS A
LEFT JOIN Text_type_features AS T
ON A.Article_type = T.TypeID
GROUP BY T.Text_type
ORDER BY Payment

--Let's gather all the contact information about the clients 

SELECT Media_Outlet, Editor_in_chief, Contacts, Editor_full_name, EditorContacts
FROM Clients
JOIN Edits
ON Clients.MediaID=Edits.MediaOutlet;

--Let's look at an editor who worked with more than two texts during the last two years 

SELECT Ed.Editor_full_name, SUM(A.AmountTextEdit)
FROM (SELECT COUNT(Title) AS AmountTextEdit, Editor FROM Articles_2021
GROUP BY Editor
UNION ALL
SELECT COUNT(Title) AS AmountTextEdit, Editor FROM Articles_2022
GROUP BY Editor) AS A
FULL JOIN Edits AS Ed
ON A.Editor = Ed.EditorID
GROUP BY Ed.Editor_full_name
HAVING SUM(A.AmountTextEdit)>2

