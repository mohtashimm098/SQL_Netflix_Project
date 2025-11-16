-- ================================
-- 1. CREATE TABLE
-- ================================
CREATE TABLE netflix (
    show_id       VARCHAR(6),
    type          VARCHAR(10),
    title         VARCHAR(150),
    director      VARCHAR(210),
    casts         VARCHAR(1000),
    country       VARCHAR(500),
    date_added    VARCHAR(100),
    release_year  INT,
    rating        VARCHAR(10),
    duration      VARCHAR(20),
    listed_in     VARCHAR(100),
    description   VARCHAR(300)
);

-- ================================
-- 2. BASIC CHECKS
-- ================================

-- Total rows
SELECT COUNT(*) FROM netflix;

-- Distinct type values
SELECT DISTINCT type FROM netflix;

-- ================================
-- 3. ANALYSIS QUERIES
-- ================================

-- 1. Count Movies vs TV Shows
SELECT 
    type, 
    COUNT(*) AS total_content
FROM netflix 
GROUP BY 1;

-- 2. Most common rating for Movies and TV Shows
SELECT type, rating
FROM (
    SELECT 
        type,
        rating,
        COUNT(*) AS total,
        RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
    FROM netflix
    GROUP BY 1, 2
) x
WHERE ranking = 1;

-- 3. List all movies released in 2020
SELECT *
FROM netflix
WHERE type = 'Movie'
  AND release_year = 2020;

-- 4. Top 5 countries with the most content
SELECT 
    unnest(string_to_array(country, ',')) AS country,
    COUNT(show_id) AS content_count
FROM netflix
GROUP BY 1
ORDER BY content_count DESC
LIMIT 5;

-- 5. Identify the longest movie
SELECT 
    type,
    title,
    split_part(duration, ' ', 1)::int AS minutes
FROM netflix
WHERE type = 'Movie' 
  AND duration IS NOT NULL
ORDER BY minutes DESC
LIMIT 1;

-- 6. Content added in the last 5 years
SELECT *
FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';

-- 7. All content by director Rajiv Chilaka
SELECT *
FROM netflix 
WHERE director ILIKE '%Rajiv Chilaka%';

-- 8. TV Shows with more than 5 seasons
SELECT 
    type,
    title,
    split_part(duration, ' ', 1)::int AS seasons,
    duration
FROM netflix
WHERE type = 'TV Show'
  AND split_part(duration, ' ', 1)::int > 5;

-- 9. Count number of content items in each genre
SELECT 
    unnest(string_to_array(listed_in, ',')) AS genre,
    COUNT(show_id) AS total_titles
FROM netflix
GROUP BY 1
ORDER BY total_titles DESC;

-- 10. Year-wise % of content from India, return top 5 years
SELECT
    EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD,YYYY')) AS year,
    COUNT(*) AS total_titles,
    ROUND(
        COUNT(*)::NUMERIC /
        (SELECT COUNT(*) FROM netflix WHERE country ILIKE '%India%') * 100,
        0
    ) || '%' AS avg_content
FROM netflix
WHERE country ILIKE '%India%'
GROUP BY 1
ORDER BY total_titles DESC
LIMIT 5;

-- 11. List all Movies that are Documentaries
SELECT *
FROM netflix
WHERE listed_in ILIKE '%Documentaries%'
  AND type = 'Movie';

-- 12. Content without a director
SELECT *
FROM netflix
WHERE director IS NULL;

-- 13. Movies with Salman Khan in last 10 years
SELECT *
FROM netflix
WHERE casts ILIKE '%Salman Khan%'
  AND EXTRACT(YEAR FROM CURRENT_DATE) - release_year < 11;

-- 14. Top 10 actors in Indian content
SELECT 
    unnest(string_to_array(casts, ',')) AS actor,
    COUNT(show_id) AS movie_count
FROM netflix
WHERE country ILIKE '%India%'
GROUP BY actor
ORDER BY movie_count DESC
LIMIT 10;

-- 15. Categorize content as Good or Bad based on violence/kill keywords
WITH new_table AS (
    SELECT
        description,
        CASE 
            WHEN description ILIKE '%kill%' 
              OR description ILIKE '%violence%' 
                THEN 'Bad_Film'
            ELSE 'Good_Film'
        END AS category
    FROM netflix
)
SELECT 
    category,
    COUNT(*) AS total_content
FROM new_table
GROUP BY 1;
