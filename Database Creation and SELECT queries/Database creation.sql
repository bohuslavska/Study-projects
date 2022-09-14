--This project was completed during EPAM Data Analytics Engineering Program (summer 2022). 

CREATE DATABASE Freelance_texts

CREATE TABLE Text_type_features (TypeID int IDENTITY(1,1) PRIMARY KEY, Text_type varchar(255) NOT NULL, Requirements varchar(255) NOT NULL)

CREATE TABLE Clients (MediaID int IDENTITY(1,1) PRIMARY KEY, Media_Outlet varchar(255) NOT NULL, Editor_in_chief varchar(255), Contacts int)

CREATE TABLE Edits (EditorID int IDENTITY(1,1) PRIMARY KEY, Editor_full_name varchar(255) NOT NULL, MediaOutlet int, EditorContacts varchar(255))

CREATE TABLE Articles_2021 (ArticleID int IDENTITY(1,1) PRIMARY KEY, Title varchar(255) NOT NULL, Publication varchar(255) NOT NULL, Price int NOT NULL, Article_type int NOT NULL, Editor int NOT NULL);

CREATE TABLE Articles_2022 (ArticleID int IDENTITY(1,1) PRIMARY KEY, Title varchar(255) NOT NULL, Publication varchar(255) NOT NULL, Price int NOT NULL, Article_type int NOT NULL, Editor int NOT NULL);

ALTER TABLE Articles_2021
ADD FOREIGN KEY (Article_type)
REFERENCES Text_type_features(TypeID);

ALTER TABLE Articles_2022
ADD FOREIGN KEY (Article_type)
REFERENCES Text_type_features(TypeID);

ALTER TABLE Articles_2021
ADD FOREIGN KEY (Editor)
REFERENCES Edits(EditorID);

ALTER TABLE Articles_2022
ADD FOREIGN KEY (Editor)
REFERENCES Edits(EditorID);

ALTER TABLE Edits
ADD FOREIGN KEY (MediaOutlet)
REFERENCES Clients(MediaID);

INSERT INTO Text_type_features (Text_type, Requirements)
VALUES ('article', '1000-2500 words'),
('interview', '5000-7000 words'),
('opinion', '500-1000 words'),
('adapted translation', '1000-2500 words'),
('native ad', '4000-6000 words'),
('selector', '2000-3000 words')

INSERT INTO Clients (Media_Outlet, Editor_in_chief, Contacts)
VALUES ('Vector', 'Liza Bordunova', 3809545),
('development.ua', 'Stas Kurasov', 38095456),
('Bubble gum', 'Bill Gates', 38092456),
('Ukrainian TechCrunch', 'Mark Drukerberg', 38095456),
('Business Insider', 'Timothy Clooney', 38095456)

INSERT INTO Edits (Editor_full_name, MediaOutlet, EditorContacts)
VALUES ('Dmitro Koshelnik', 4, 'dmitrokoshelnik@vector.com'),
('Dasha Trapeznikova', 1, 'dasha_trapeznikova@vector.com'),
('Anna Soha', 3, 'a_soha@vector.com'),
('Whitney Wolfe Herd', 2, 'wolfeherd@gmail.com'),
('Luke Skywalker', 5, 'skywalker@gmail.com')

INSERT INTO Articles_2022 (Title, Publication, Price, Article_type, Editor)
VALUES ('The future of the Internet or hype? How Web3 works and what to expect from it', 'february', 5000, 1, 1),
('Business education for children in Tik-Tok format. How the Ukrainian startup mbakids.online works', 'january', 3000, 5, 3),
('How Ukrainian AI-platform Wantent analyzes viewers reactions to video content', 'january', 7000, 5, 3),
('12 cases of festive advertising', 'january', 5000, 6, 2),
('How the Atmosphere startup works', 'february', 8000, 5, 3),
('Who are Anonymous and why are they helping Ukraine defeat Russia', 'march', 3000, 1, 4)

INSERT INTO Articles_2021 (Title, Publication, Price, Article_type, Editor)
VALUES ('Millions for digital art. What are NFTs', 'march', 7000, 2, 4),
('Public speaking guide from top managers of MEGOGO, Reface and FFFACE.ME', 'october', 10000, 2, 5),
('How IOON failed its Kickstarter campaign', 'august', 6000, 3, 2),
('How I canceled my wedding, but remained a digital bride', 'september', 4000, 4, 1),
('How I tried to unsubscribe from the Words Booster application', 'september', 5000, 3, 5)