-- Active: 1721290977041@@127.0.0.1@3306@moma_museum
USE moma_museum;

SELECT Nationality, COUNT(*) AS NumArtists
FROM artistas
GROUP BY
    Nationality
ORDER BY NumArtists DESC, Nationality;
-- Clasificación por género
SELECT Gender, COUNT(*) AS NumArtists
FROM artistas
GROUP BY
    Gender
ORDER BY Gender;

SELECT
    Nationality,
    Gender,
    COUNT(*) AS NumArtists
FROM artistas
GROUP BY
    Nationality,
    Gender
ORDER BY Nationality, Gender DESC;

USE moma;

SELECT Nationality, COUNT(*) AS NumArtists
FROM artistas
WHERE
    Gender = "Female"
GROUP BY
    Nationality
ORDER BY NumArtists DESC
LIMIT 5;

SELECT
    Nationality,
    COUNT(*) AS num_artistas_femeninas
FROM artistas
WHERE
    gender = 'Female'
    AND Nationality IN (
        'Brazilian',
        'Chilean',
        'Colombian',
        'Venezuelan',
        'Paraguayan'
    )
GROUP BY
    Nationality
ORDER BY num_artistas_femeninas DESC;

SELECT Nationality, Name
FROM artistas
WHERE
    gender = 'Female'
    AND Nationality IN (
        'Brazilian',
        'Chilean',
        'Colombian',
        'Venezuelan',
        'Paraguayan'
    )
ORDER BY Nationality;

ALTER TABLE obras
RENAME COLUMN `Acquisition Date` TO Acquisition_Date;

ALTER TABLE obras RENAME COLUMN `Artwork ID` TO Artwork_ID;

ALTER TABLE artistas RENAME COLUMN `Artist ID` TO Artist_ID;

ALTER TABLE obras RENAME COLUMN `Artist ID` TO Artist_ID;

SELECT
    Acquisition_Date AS acquisition_year,
    COUNT(*) AS num_obras
FROM obras
WHERE
    Acquisition_Date IS NOT NULL
GROUP BY
    acquisition_year
ORDER BY acquisition_year;

SELECT
    Acquisition_Date AS acquisition_year,
    COUNT(*) AS num_obras
FROM obras AS o
    JOIN artistas AS a ON o.Artist_ID = a.Artist_ID
WHERE
    a.Gender = 'Female'
    AND LENGTH(Acquisition_Date) = 4
GROUP BY
    acquisition_year
ORDER BY acquisition_year;

SELECT
    Nationality,
    COUNT(*) AS num_artistas_femeninas,
    ROUND(
        (
            COUNT(*) / (
                SELECT COUNT(*)
                FROM artistas
            ) * 100
        ),
        2
    ) AS porcentaje
FROM artistas
WHERE
    gender = 'Female'
    AND Nationality IN (
        'Brazilian',
        'Chilean',
        'Colombian',
        'Venezuelan',
        'Paraguayan'
    )
GROUP BY
    Nationality
ORDER BY num_artistas_femeninas DESC;