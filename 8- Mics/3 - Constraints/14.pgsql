--   DEFAULT Constraint

CREATE TABLE Employees (
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    hiredate DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (id)
);


-- 
