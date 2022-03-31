-- 1 List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
use movielens;
select title,release_date from movies
where release_date  between '1983-01-01' and '1993-01-01' order by release_date asc ;

-- 2 Without using LIMIT, list the titles of the movies with the lowest average rating.
select title, rating from movies
left join ratings
on movies.id = ratings.id
order by rating asc;

-- 3 List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.
select * from movies
left join genres_movies
on movies.id = genres_movies.movie_id
left join genres
on genres_movies.genre_id = genres.id
left join users
on movies.id = users.id
left join ratings
on genres_movies.movie_id = ratings.movie_id

where genres.name = "Sci-Fi" and users.age = 24;


-- 4 List the unique titles of each of the movies released on the most popular release day.

select release_date, count(release_date) as film_released, title from movies
group by release_date
order by count(release_date) desc;

-- 5 Find the total number of movies in each genre; list the results in ascending numeric order.
select genres.name, count(movies.id) as film_count from movies
left join genres_movies
on movies.id = genres_movies.movie_id
left join genres
on genres_movies.genre_id = genres.id
group by genres.name
having genres.name is not null
order by film_count asc ;











