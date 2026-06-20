-- DDL - Alter Table Statement


-- Add Column

ALTER TABLE Users 
ADD COLUMN PhoneNumber VARCHAR(15);

-- Rename Column


ALTER TABLE Users 
RENAME COLUMN Email TO UserEmail;

ALTER TABLE Users 
RENAME TO AppUsers;

ALTER TABLE Users 
ALTER COLUMN Age TYPE BIGINT;

ALTER TABLE Users 
DROP COLUMN IsActive;