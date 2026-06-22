-- Data Manipulation Language - DML



-- Insert Into Statement
INSERT INTO users ("username", "email", "age") 
VALUES ('ali_99', 'ali@example.com', 22);

-- Update Statement
UPDATE users 
SET email = 'ali.new@example.com'
WHERE id = 1;