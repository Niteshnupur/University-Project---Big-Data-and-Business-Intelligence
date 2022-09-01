CREATE TABLE Movie_IMDB (
MovieID SERIAL,
MovieName VARCHAR(256),
ReleasedYear INT,
Rating DECIMAL,
Duration INT
);

select * from Movie_IMDB

--Q1.1 -The total number of movies 

select count (movieid) from movie_imdb

select count(moviename) from movie_imdb


--Q1.2 -The maximum rating of movies

select max (rating) from movie_imdb

--Q1.3 - The number of movies that have maximum rating

select count (*) rating from movie_imdb where rating = 4.5

--Q1.4 - The movies with ratings 1 and 2

-- select moviename , rating from movie_imdb where rating = 1 AND rating = 2

--SELECT * FROM movie_imdb WHERE rating = 1 AND rating = 2;

select rating,moviename from movie_imdb where Rating='1' or Rating='2'

--Q1.5 - The list of years and number of movies released each year

--select releasedyear from movie_imdb
select * from Movie_IMDB

select ReleasedYear,count(moviename) from movie_imdb
group by ReleasedYear
order by ReleasedYear desc

-- Q1.6 -The number of movies that have a runtime of two hours

select moviename from movie_imdb where Duration=7200

--select count(duration) from movie_imdb where duration = 7200
--group by(moviename)

select count (*) duration from movie_imdb where duration = 7200


---------------------------------------------------------------------

