-- DDL - Alter Table Statement

ALTER TABLE Users 
ADD COLUMN PhoneNumber VARCHAR(15);

ALTER TABLE Users 
RENAME COLUMN Email TO UserEmail;