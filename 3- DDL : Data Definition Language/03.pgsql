-- DDL - Data Definition Language


-- Create Table


CREATE TABLE Users(
    ID INT,
    NAME VARCHAR(50),
    EMAIL VARCHAR(50),
    AGE INT
    PRIMARY KEY(ID)
);


-- Create View


CREATE VIEW HighSalary AS
SELECT * FROM CUSTOMERS C 
WHERE SALARY > 2000


-- Add Column

ALTER TABLE Users 
ADD COLUMN PhoneNumber VARCHAR(15);


-- Rename Column

ALTER TABLE Users 
RENAME COLUMN Email TO UserEmail;


-- Rename a table

ALTER TABLE Users 
RENAME TO AppUsers;


-- Modify a column

ALTER TABLE Users 
ALTER COLUMN Age TYPE BIGINT;


-- Delete a column

ALTER TABLE Users 
DROP COLUMN IsActive;
