use master

IF EXISTS (SELECT * from sys.databases WHERE name =	'epiccinesystemDB')
BEGIN
	DROP DATABASE epiccinesystemDB;
END;
CREATE DATABASE epiccinesystemDB;

use epiccinesystemDB;

CREATE TABLE Genre (
genre_category varchar(50) NOT NULL PRIMARY KEY
);

CREATE TABLE Hall (
hall_ID int NOT NULL PRIMARY KEY,
seat_amnt tinyint NOT NULL, 
CHECK (seat_amnt <= 255)
);

CREATE TABLE Participant (
participant_ID int NOT NULL PRIMARY KEY,
participant_name varchar(32) NOT NULL,
email varchar(64) NOT NULL
);

CREATE TABLE Actor (
actor_ID int NOT NULL PRIMARY KEY,
actor_firstname varchar(32) NOT NULL,
actor_midname varchar(32),
actor_lastname varchar(32)
);

CREATE TABLE Director (
director_ID int NOT NULL PRIMARY KEY,
director_firstname varchar(32) NOT NULL,
director_midname varchar(32),
director_lastname varchar(32)
);

CREATE TABLE Movie (
movie_ID int NOT NULL PRIMARY KEY,
release_year int NOT NULL,
duration int NOT NULL,
genre varchar(50) FOREIGN KEY REFERENCES Genre(genre_category) NOT NULL,
title varchar(255) NOT NULL,
director_ID int FOREIGN KEY REFERENCES Director(director_ID) NOT NULL,
actor_ID int FOREIGN KEY REFERENCES Actor(actor_ID) NOT NULL
);
 
CREATE TABLE IMAX (
imax_ID int NOT NULL PRIMARY KEY,
imax_name varchar(32) NOT NULL,
imax_location text NOT NULL,
sales_num int,
movie_ID int FOREIGN KEY REFERENCES Movie(movie_ID) NOT NULL
);

CREATE TABLE Ticket (
ticket_ID int NOT NULL PRIMARY KEY,
price decimal(6, 2) NOT NULL,
showing_ID int,
participant_ID int FOREIGN KEY REFERENCES Participant(participant_ID) NOT NULL
);

CREATE TABLE Showing (
showing_ID int NOT NULL PRIMARY KEY,
showing_num int, --Numbers of showings
imax_ID int FOREIGN KEY REFERENCES Movie(movie_ID) NOT NULL,
hall_ID int FOREIGN KEY REFERENCES Hall(hall_ID) NOT NULL
);

CREATE TABLE Actor_In_Movie (
aim_ID int NOT NULL PRIMARY KEY,
movie_ID int FOREIGN KEY REFERENCES Movie(movie_ID) NOT NULL,
actor_ID int FOREIGN KEY REFERENCES Actor(actor_ID) NOT NULL
);

CREATE TABLE Director_Of_Movie (
dom_ID int NOT NULL PRIMARY KEY,
movie_ID int FOREIGN KEY REFERENCES Movie(movie_ID) NOT NULL,
director_ID int FOREIGN KEY REFERENCES Director(director_ID) NOT NULL
);

INSERT INTO Genre (genre_category)
VALUES ('action'), ('comedy'), ('romance'), ('horror'), ('fantasy'), ('sci-fi'); 

INSERT INTO HALL(hall_ID,seat_amnt)
VALUES(1,200),
	(2,233),
	(3,250),
	(4,100),
	(5,155);
	
INSERT INTO Participant(participant_ID,participant_name,email)
VALUES(1,'Peter','SejePeter@Gmail.com'),
	(2,'Ole','GammleOle@Gmail.com'),
	(3,'kaj','Kaj2001@Gmail.com'),
	(4,'torben','Torben@Gmail.com'),
	(5,'Lars','Larslarsen@Gmail.com');
	
INSERT INTO Actor (actor_ID, actor_firstname, actor_midname, actor_lastname)
VALUES (1 ,'Hank', '', 'Cruise'), (2, 'Arnold', '', 'Weissnegger'), (3, 'Tina', '', 'Kauffmann'),
(4, 'David', '', 'DeJoux'), (5, 'Mary', 'E.', 'Calloon');

INSERT INTO Director (director_ID, director_firstname, director_midname, director_lastname)
VALUES (1, 'Tommy', '', 'Kath'), (2, 'Stefan', '', 'Spilberg'), (3, 'John', '', 'Cameroff'),
	(4, 'Martin', '', 'Scorjulia'), (5, 'Bob', '', '');

INSERT INTO Movie (movie_ID, release_year, duration, genre, title, director_ID, actor_ID)
VALUES (1, 2003, 120, 'action', 'Attack of the Cellphones: Talk Is Cheap', 1, 2),
(2, 1992, 70, 'comedy', 'Do Not Die Laughing', 5, 3),
(3, 2017, 120, 'romance', 'Love Loving Love', 3, 4),
(4, 2020, 80, 'action', 'Kill Me Once, Die Twice', 4, 1),
(5, 1999, 120, 'action', 'The End...For You', 2, 5);

insert into IMAX (imax_id, imax_name, imax_location, sales_num, movie_ID)
values (1, 'Empire Bio', 'Noerrebro', 10000, 1),
	(2, 'Imperial', 'Indre KBH', 20000, 2),
	(3, 'Hjoerring Biocenter', 'Hjoerring', 27, 3),
	(4, 'Lyngy Drive-In Bio', 'Lynge', 113, 4),
	(5, 'Kino 1-2-3', 'Thisted', 921, 5);

insert into Ticket (ticket_id, price, showing_id, participant_id)
values (1, 100, 1, 1),
	(2, 200, 2, 2),
	(3, 300, 3, 3),
	(4, 400, 4, 4),
	(5, 500, 5, 5);

insert into Showing (showing_id, showing_num, imax_id, hall_id)
values (1, 1, 1, 1),
	(2, 2, 2, 2),
	(3, 3, 3, 3),
	(4, 4, 4, 4),
	(5, 5, 5, 5);

INSERT INTO Actor_In_Movie
VALUES (1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO Director_Of_Movie
VALUES (1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);


SELECT * from Hall
SELECT * from Participant
SELECT * from Actor
SELECT * from Director
SELECT * from Movie
SELECT * from IMAX
SELECT * from Ticket
SELECT * from Showing
SELECT * from Actor_In_Movie
SELECT * from Director_Of_Movie
select * from genre;
