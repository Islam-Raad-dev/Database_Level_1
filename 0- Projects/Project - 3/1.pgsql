-- Karate Club Database Code: 


CREATE TABLE belt_ranks (
    id SERIAL PRIMARY KEY,
    rank_name VARCHAR(50) UNIQUE NOT NULL,
    test_fee DECIMAL(10, 2) NOT NULL
);

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    address TEXT,
    contact_info VARCHAR(255),
    emergency_contact VARCHAR(255),
    current_belt_rank_id INT REFERENCES belt_ranks(id),
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE instructors (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    address TEXT,
    contact_info VARCHAR(255),
    qualifications TEXT
);

CREATE TABLE member_instructors (
    member_id INT REFERENCES members(id) ON DELETE CASCADE,
    instructor_id INT REFERENCES instructors(id) ON DELETE CASCADE,
    PRIMARY KEY (member_id, instructor_id)
);

CREATE TABLE subscriptions (
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    fee DECIMAL(10, 2) NOT NULL,
    is_paid BOOLEAN DEFAULT FALSE
);

CREATE TABLE belt_tests (
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(id) ON DELETE CASCADE,
    instructor_id INT REFERENCES instructors(id) ON DELETE RESTRICT,
    rank_id INT REFERENCES belt_ranks(id) ON DELETE RESTRICT,
    test_date DATE NOT NULL,
    is_passed BOOLEAN DEFAULT FALSE
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(id) ON DELETE CASCADE,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_type VARCHAR(20) CHECK (payment_type IN ('SUBSCRIPTION', 'TEST')),
    subscription_id INT REFERENCES subscriptions(id) ON DELETE CASCADE,
    belt_test_id INT REFERENCES belt_tests(id) ON DELETE CASCADE,
    CONSTRAINT valid_payment_reference CHECK (
        (payment_type = 'SUBSCRIPTION' AND subscription_id IS NOT NULL AND belt_test_id IS NULL) OR
        (payment_type = 'TEST' AND belt_test_id IS NOT NULL AND subscription_id IS NULL)
    )
);

INSERT INTO belt_ranks (rank_name, test_fee) VALUES
('White Belt', 0.00),
('Yellow Belt', 50.00),
('Orange Belt', 60.00),
('Green Belt', 70.00),
('Blue Belt', 80.00),
('Purple Belt', 90.00),
('Brown Belt', 100.00),
('Black Belt (1st Dan)', 150.00),
('Black Belt (2nd Dan)', 200.00),
('Black Belt (3rd Dan)', 250.00),
('Black Belt (4th Dan)', 300.00),
('Black Belt (5th Dan)', 350.00),
('Black Belt (6th Dan)', 400.00),
('Black Belt (7th Dan)', 450.00),
('Black Belt (8th Dan)', 500.00),
('Black Belt (9th Dan)', 550.00),
('Black Belt (10th Dan)', 600.00);