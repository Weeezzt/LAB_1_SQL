-- 1
CREATE TABLE successful_mission AS
SELECT *
FROM moon_mission
WHERE outcome = 'Successful';
-- 2
ALTER TABLE successful_mission
    MODIFY mission_id INT PRIMARY KEY AUTO_INCREMENT;
-- 3
UPDATE successful_mission
SET operator = REPLACE(operator, ' ', '');

UPDATE moon_mission
SET operator = REPLACE(operator, ' ', '');
-- 4
DELETE FROM successful_mission
WHERE launch_date >= '2010-01-01';
-- 5
SELECT
    *,
    CONCAT(first_name, ' ', last_name) AS name,
    CASE
        WHEN CAST(SUBSTRING(ssn, LENGTH(ssn) - 1, 1) AS UNSIGNED) % 2 = 0
            THEN 'female'
        ELSE 'male'
        END AS gender
FROM account;
-- 6
DELETE FROM account
WHERE
    CAST(SUBSTRING(ssn, 1, 2) AS UNSIGNED) BETWEEN 6 AND 69
  AND (CAST(SUBSTRING(ssn, LENGTH(ssn) - 1, 1) AS UNSIGNED) % 2 = 0);
-- 7
SELECT
    CASE
        WHEN CAST(SUBSTRING(ssn, LENGTH(ssn) - 1, 1) AS UNSIGNED) % 2 = 0 THEN 'female'
        ELSE 'male'
        END AS gender,
    AVG(YEAR(CURDATE()) - YEAR(
            STR_TO_DATE(
                    CONCAT(
                            IF(CAST(SUBSTRING(ssn, 1, 2) AS UNSIGNED) < 6, '20', '19'),
                            SUBSTRING(ssn, 1, 2),
                            SUBSTRING(ssn, 3, 2),
                            SUBSTRING(ssn, 5, 2)
                    ), '%Y%m%d'
            )
                          )) AS average_age
FROM account
GROUP BY gender;











