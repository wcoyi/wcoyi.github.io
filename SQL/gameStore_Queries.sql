use game_store;

-- Basic-- 
-- Analyzing game pricing from highest to lowest price
SELECT game_name, genre, price
FROM games
ORDER BY price DESC;


-- Sorting each studio from developers table by which every studio from the USA is ordered alphabetically
SELECT * FROM developers 
WHERE country = 'USA'
ORDER BY studio_name;

-- Aggregates the score for each game relative to their game id as an average, rounded to the nearest hundredth of a decimal. The average score is grouped by its corresponding game_id. 
SELECT 
    re.game_id,
    ga.game_name,
    ROUND(AVG(re.game_rating), 2) AS average_score
 FROM reviews re
 JOIN games ga ON
 re.game_id = ga.game_id
GROUP BY re.game_id
ORDER BY average_score DESC;



-- Aggregates the score for each game relative to their game id as an average, rounded to the nearest hundredth of a decimal. The average score having a score that is greater than 9 is grouped by its corresponding game_id. 

SELECT 
    re.game_id,
    ga.game_name,
    ROUND(AVG(re.game_rating), 2) AS average_score
 FROM reviews re
 JOIN games ga ON
 re.game_id = ga.game_id
GROUP BY re.game_id
HAVING average_score > 9.00
ORDER BY average_score DESC;


-- WHERE-- 

-- Query for non-American game titles
SELECT 
	ga.game_id,
    ga.game_name,
    ga.release_year,
    de.studio_name,
    de.country
FROM games ga
JOIN developers de
ON ga.dev_id = de.dev_id
WHERE COUNTRY != 'USA';


-- COUNT

-- practical usage of the GROUP_CONCAT function, by which developers table is joined by dev_id, and the group by duplicate syntax error is bypassed in a GROUP_CONCAT, which concatenates the entries grouped by country seperated by a ','. 
SELECT 
    de.country,
    COUNT(ga.game_id) AS total_games,
    COUNT(DISTINCT de.dev_id) AS total_unique_studios,
    GROUP_CONCAT(DISTINCT de.studio_name SEPARATOR ', ') AS studios_in_country,
    GROUP_CONCAT(ga.game_name SEPARATOR ', ') AS games_from_country
FROM games ga
JOIN developers de ON ga.dev_id = de.dev_id
GROUP BY de.country
ORDER BY total_games DESC;

-- distinct in order to not count a studio that has been counted already, otherwise there will be as many studio entries in the correlated column as games related to them.

-- Multiple JOINs combined with aggregate functions to analyze pricing by platform
SELECT 
    pl.platform_name,
    pl.company,
    COUNT(gp.game_id) AS available_games,
    ROUND(AVG(ga.price), 2) AS average_game_cost
FROM platforms pl
JOIN game_platforms gp ON pl.platform_id = gp.platform_id
JOIN games ga ON gp.game_id = ga.game_id
GROUP BY 
    pl.platform_id,
    pl.platform_name,
    pl.company
ORDER BY average_game_cost DESC;

-- this query joins the game_platforms table to the platforms table, making use of the junction table to connect the platform tables. Then the games by are counted. An average aggregation is then executed and both results are grouped by the non-aggregated coulumns. An order by is used finally to sort the platforms by average price in descending order.

-- SUBQUERY

-- comprehensive subquery repsonsible for displaying the best games by average score. Idea is to present best performing games respective to the genre.
-- a distinct is used to prevent the reptitive count of platforms.
SELECT 
    de.studio_name,
    ga.game_name,
    ga.genre,
    ROUND(AVG(re.game_rating), 1) AS game_avg_rating,
    GROUP_CONCAT(DISTINCT pl.platform_name ORDER BY pl.platform_name ASC SEPARATOR ', ') AS playable_platforms
FROM games ga
JOIN developers de ON ga.dev_id = de.dev_id
JOIN reviews re ON ga.game_id = re.game_id
JOIN game_platforms gp ON ga.game_id = gp.game_id
JOIN platforms pl ON gp.platform_id = pl.platform_id
GROUP BY 
    ga.game_id, 
    de.studio_name, 
    ga.game_name, 
    ga.genre
HAVING AVG(re.game_rating) > (
    SELECT AVG(r2.game_rating)
    FROM games g2
    JOIN reviews r2 ON g2.game_id = r2.game_id
    WHERE g2.genre = ga.genre 
)
ORDER BY ga.genre, game_avg_rating DESC;