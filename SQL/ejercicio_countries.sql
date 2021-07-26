use world;

select * from cities;
select * from countries;
select * from languages; 

-- ¿Qué consulta harías para obtener todos los países que hablan esloveno? 
-- Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. 
-- Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente.

SELECT co.name, lg.language, lg.percentage from languages lg
JOIN countries co ON lg.country_id=co.id
where lg.language LIKE '%lovene%'
ORDER BY lg.percentage desc;

SELECT cou.name from countries cou
where cou.id in (16,96, 107,200);

select  name,language, percentage from languages
INNER JOIN countries ON languages.country_id = countries.id
where countries.id in (200,107,96,16)
order by percentage desc
;select * from cities;
select * from countries;
select * from languages; 

-- ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país?
-- Su consulta debe devolver el nombre del país y el número total de ciudades. 
-- Tu consulta debe organizar el resultado por el número de ciudades en orden descendente.

select co.name, COUNT(ci.name) AS ciudades from countries co
JOIN cities ci ON co.id = ci.country_id group by co.name order by ciudades DESC;

-- ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? 
-- Tu consulta debe organizar el resultado por población en orden descendente. (1)

SELECT co.name AS Pais, ci.name AS Ciudad, ci.population AS Poblacion FROM world.cities ci
JOIN world.countries co ON ci.country_id = co.id
WHERE co.name like '%mexico%' AND ci.population > 500000 ORDER BY ci.population desc;

-- ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? 
-- Tu consulta debe organizar el resultado por porcentaje en orden descendente. 
SELECT c.name, lg.language, lg.percentage FROM languages lg
JOIN countries c ON lg.country_id = c.id
WHERE lg.percentage > 89 ORDER BY lg.percentage DESC;

-- ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000?

select * from countries; -- surface_area, population

select * from countries
where surface_area < 501
and population > 100000
;

-- ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años?

select * from countries; -- government_form = 'Constitutional Monarchy'; capital; life_expectancy

select * from countries
where government_form = 'Constitutional Monarchy'
and capital > 200
and life_expectancy > 75
;

-- ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000? 


select * from cities;
select * from countries;

select * from countries
where name like 'Ar%' -- 9
;

select * from cities
where country_id = 9
and district = 'Buenos Aires'
and population > 500000
;
-- La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población.

select  countries.name as pais, cities.name as ciudad, cities.district as distrito, cities.population as poblacion
from cities
INNER JOIN countries ON countries.id = cities.country_id
where cities.country_id = 9
and cities.district = 'Buenos Aires'
and cities.population > 500000;

--  ¿Qué consulta harías para resumir el número de países en cada región? 
-- La consulta debe mostrar el nombre de la región y el número de países. 
-- Además, la consulta debe organizar el resultado por el número de países en orden descendente.

select * from countries;
select region from countries;
select region from countries order by region asc;
select region from countries group by region order by region asc;
select region, count(region) from countries group by region order by region asc;
-- final
select region, count(region) from countries
group by region
order by count(region) desc;


