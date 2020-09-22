/*Music Industry database and queries*/

/*Part 1 – Create the Databases */ 
DROP DATABASE Music;
CREATE DATABASE Music;
USE Music;

DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS streams;
DROP TABLE IF EXISTS tracks;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS ads;
 
CREATE TABLE artists (
artist_id varchar(5) NOT NULL UNIQUE,
artist_name varchar(20) NOT NULL,
registered_date varchar(20) NOT NULL,
genre varchar(20) NOT NULL,
PRIMARY KEY(artist_id))
ENGINE=INNODB;

CREATE TABLE streams (
stream_id varchar(5) NOT NULL UNIQUE,
stream_date varchar(20) NOT NULL,
track_id varchar(5) NOT NULL,
user_id varchar(5) NOT NULL,
PRIMARY KEY(stream_id))
ENGINE=INNODB;

CREATE TABLE tracks (
track_id varchar(5) NOT NULL UNIQUE,
track_name varchar(20) NOT NULL,
album_name varchar(20) NOT NULL,
artist_id varchar(5) NOT NULL,
PRIMARY KEY (track_id))
ENGINE=INNODB;

CREATE TABLE users (
user_id varchar(5) NOT NULL UNIQUE,
gender varchar(2) NOT NULL,
birth_year varchar(4) NOT NULL,
zipcode varchar(5) NOT NULL,
PRIMARY KEY (user_id))
ENGINE=INNODB;

CREATE TABLE ads (
user_id varchar(5) NOT NULL,
ad_id varchar(10) NOT NULL,
campaign_id varchar(6) NOT NULL,
ad_type varchar(10) NOT NULL,
ad_company varchar(10) NOT NULL,
ad_time INT NOT NULL,
ad_spend INT NOT NULL, 
impressions INT NOT NULL,
PRIMARY KEY (ad_id))
ENGINE=INNODB;

INSERT INTO artists
VALUES (11111, 'Nicki Minaj', 'January 2017', 'Rap'),
(22222, 'Fabulous', 'February 2017', 'Rap'),
(33333, 'Taylor Swift', 'March 2017', 'Pop'),
(44444, 'Gryffin', 'April 2017', 'House'),
(55555, 'BTS', 'December 2017', 'Pop');

INSERT INTO streams
VALUES 
(11111, 'December 2017', 't0001', 'u1111'),
(11112, 'December 2017', 't0002', 'u1111'),
(11113, 'December 2017', 't0001', 'u1111'),
(11114, 'January 2017', 't0001', 'u1111'),
(11115, 'February 2017', 't0003', 'u1112'),
(11116, 'December 2017', 't0004', 'u1112'),
(11117, 'December 2017', 't0004', 'u1113'),
(11118, 'March 2017', 't0005', 'u1114'),
(11119, 'May 2017', 't0004', 'u1113'),
(11120, 'March 2017', 't0004', 'u1113'),
(11121, 'April 2017', 't0004', 'u1113'),
(11122, 'June 2017', 't0004', 'u1113'),
(11123, 'March 2017', 't0005', 'u1114'),
(11124, 'January 2017', 't0004', 'u1113'),
(11125, 'January 2017', 't0004', 'u1113'),
(11126, 'January 2017', 't0004', 'u1113'),
(11127, 'January 2017', 't0004', 'u1113');

INSERT INTO tracks
VALUES ('t0002', 'Fake Love', 'Yourself Tears', 55555),
('t0001', 'No Limit', 'Ghetto Fab', 22222),
('t0003', 'Love story', 'Red', 33333),
('t0004', 'Chun Li', 'Single', 11111),
('t0005', 'Whole Heart', 'Heading Home', 44444);

INSERT INTO users
VALUES ('u1111', 'M', 1989, 94511),
('u1112', 'F', 1985, 94112),
('u1113', 'F', 1987, 94111),
('u1114', 'M', 1990, 94113),
('u1115', 'M', 1981, 94333);

INSERT INTO ads
VALUES 
('u1111','fb_123', 'c60000', '10 second', 'facebook', '10', '15','4'),
('u1111','gi_123', 'c50000', '10 second', 'gimlet', '10', '15','30'),
('u1111','sf_123', 'c40000', '10 second', 'salesforce', '10', '15','4'),
('u1111','fb_345', 'c60000', '60 second', 'facebook', '60', '25','2'),
('u1112','gi_456', 'c50000', '10 second', 'gimlet', '10', '15','30'),
('u1112','gi_345', 'c50000', '30 second', 'gimlet', '30', '18','30'),
('u1113','sf_345', 'c40000', '5 second', 'salesforce', '5', '13','10'),
('u1114','mi_123', 'c40000', '5 second', 'calmapp', '5', '13','4'),
('u1113','hs_123', 'c40000', '5 second', 'headspace', '5', '13','10'),
('u1113','sf_456', 'c40000', '5 second', 'salesforce', '5', '13','10'),
('u1113','fi_123', 'c40000', '5 second', 'robinhood', '5', '13','15');


/*Part 2 – Query Q&A */ 
select * from artists;
select * from streams;
select * from tracks;
select * from users;
select * from ads;

/******************* Questions ***********************/
/*How many unique users streamed the track "No Limit" in December 2017?*/
SELECT count(DISTINCT a.user_id) as num_users
FROM users a
INNER JOIN streams b ON a.user_id=b.user_id
INNER JOIN tracks c ON b.track_id=c.track_id
WHERE c.track_name="No Limit" and b.stream_date="December 2017";

/*List all unique users streamed the track "No Limit"*/
SELECT  DISTINCT a.user_id
FROM users a
INNER JOIN streams b ON a.user_id=b.user_id
INNER JOIN tracks c ON b.track_id=c.track_id
WHERE c.track_name="No Limit";

/*List the top 3 most streamed tracks this year, listed by most to least*/
/*Look at all streams and tracks*/
SELECT *
FROM streams a
INNER JOIN tracks b ON a.track_id = b.track_id;

SELECT b.track_name, count(a.stream_id) as NumStreams
FROM streams a
INNER JOIN tracks b ON a.track_id = b.track_id
GROUP BY 1
ORDER BY count(a.stream_id) DESC
LIMIT 3;

/*What is the monthly / daily streams for each artist?*/
/* STR_TO_DATE: Take a string and returns a date specified by a format mask
https://www.w3schools.com/sql/func_mysql_str_to_date.asp */
SELECT c.artist_name, monthname(str_to_date(a.stream_date, '%M %d %Y')) as Monthly, count(*)
FROM streams a
INNER JOIN tracks b ON a.track_id = b.track_id
INNER JOIN artists c ON b.artist_id=c.artist_id
GROUP BY c.artist_id, c.artist_name, a.stream_date
ORDER BY month(str_to_date(a.stream_date, '%M %d %Y')), c.artist_name;

/*Show the number of streams per user in January*/
SELECT user_id, count(stream_id)
FROM streams
WHERE monthname(str_to_date(stream_date, '%M %d %Y')) = "January"
GROUP BY 1;

/*Calcuate the average ads a person heard*/
SELECT a.user_id, avg(b.impressions)
FROM users a
INNER JOIN ads b ON a.user_id = b.user_id
GROUP BY 1;