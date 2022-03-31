-- 1 Using COUNT, get the number of cities in the USA.

use World;
select count(distinct name) as City from city
where CountryCode = "USA";
-- 2 Find out the population and life expectancy for people in Argentina.

select LifeExpectancy, Population from country
where Name = "Argentina";
-- 3 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?

select name, LifeExpectancy, Population from country
where LifeExpectancy and Population is not null
order by LifeExpectancy desc, Population desc
limit 5 ;

-- 4  Using JOIN ... ON, find the capital city of Spain.
select * from country
left join city
on country.capital = city.ID
where city.CountryCode like "ESP%";
 
-- 5  Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
select language from country
left join countrylanguage
on country.code = countrylanguage.CountryCode
where  Region = "Southeast Asia"
order by language asc limit 5;

-- 6 Using a single query, list 25 cities around the world that start with the letter F.
select city.Name from country
left join city
on country.capital = city.ID
where city.Name like "F%"
limit 25;

-- 7 Using COUNT and JOIN ... ON, get the number of cities in China.
select city.Name from country
left join city
on country.Code = city.CountryCode
where country.Name = "China"
;

-- 8 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
select Name, Population from country
where Population is not null and Population != 0 
order by Population asc limit 10;

-- 9 Using aggregate functions, return the number of countries the database contains.
select count(Name) from country;

-- 10 What are the top ten largest countries by area?
select Name, SurfaceArea from country
order by SurfaceArea desc limit 10;

-- 11 List the five largest cities by population in Japan.
select Name, Population from city
where CountryCode = "JPN"
order by Population desc limit 5;

-- 12 List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
select Name, HeadOfState from country
where HeadOfState = "Elisabeth II";

-- 13 List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
select Name ,Population / SurfaceArea as PA from country
where Population / SurfaceArea != 0 order by PA asc limit 10;

-- 14 List every unique world language.
select distinct language from countrylanguage;

-- 15 List the names and GNP of the world's top 10 richest countries.
select Name, GNP from country
order by GNP DESC limit 10;

-- 16 List the names of, and number of languages spoken by, the top ten most multilingual countries.
select country.Name, count(countrylanguage.Language) as Spoken_language from country
left join countrylanguage
on country.code = countrylanguage.CountryCode
group by Name
order by Spoken_language desc limit 10;

-- 17 List every country where over 50% of its population can speak German.

select country.Name from country
left join countrylanguage
on country.code = countrylanguage.CountryCode
where countrylanguage.Language ="German" and countrylanguage.Percentage >50.0;

-- 18 Which country has the worst life expectancy? Discard zero or null values.
select Name, LifeExpectancy from country
where LifeExpectancy is not null and LifeExpectancy != 0 order by LifeExpectancy asc ;

-- 19 List the top three most common government forms.

select GovernmentForm,count(GovernmentForm) as Election from country
group by GovernmentForm
order by Election desc limit 3;

-- 20 How many countries have gained independence since records began?
select count(Name) from country
where IndepYear is not null and IndepYear > 0 
 order by IndepYear asc;


























