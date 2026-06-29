-- Karate Club Database

-- Requirments:

-- 1. Membership Management:

--  The system should allow the creation and management of
-- member profiles, including personal information, contact
-- details, emergency contact information, and membership
-- status.

--  Member information (Name, Address, ContactInfo, Emergency
-- Contact)

--  Each Member can have subscription Periods and each period
-- should have (StartDate, EndDate, Fees, IsPaid).

--  Members should be able to enroll in the karate club, renew
-- their memberships, and update their information as needed.

--  The system should track membership start and end dates, as
-- well as membership status (active/inactive).


-- 2. Instructor Management:

--  The system should allow the creation and management of
-- instructor profiles, including personal information and
-- qualifications.

--  Instructor information (Name, Address, ContactInfo,
-- Qualifications).

--  Members can have many instructors.

--  Multiple instructors should be able to train a single
-- member, and each instructor should be able to train
-- multiple members.

-- 3. Belt Rank and Testing:

--  The system should support the management of different belt
-- rank tests in karate.

--  Members should be able to participate in belt rank tests
-- to advance their ranks.

--  The system should track belt test dates, results, and the
-- instructors who conducted the tests.

--  Each member's current belt rank should be recorded and
-- updated as they pass the tests and progress.

--  Belt Ranks are fixed in the system as follows:

-- 1. White Belt
-- 2. Yellow Belt
-- 3. Orange Belt
-- 4. Green Belt
-- 5. Blue Belt
-- 6. Purple Belt
-- 7. Brown Belt
-- 8. Black Belt (1st Dan)
-- 9. Black Belt (2nd Dan)
-- 10. Black Belt (3rd Dan)
-- 11. Black Belt (4th Dan)
-- 12. Black Belt (5th Dan)
-- 13. Black Belt (6th Dan)
-- 14. Black Belt (7th Dan)
-- 15. Black Belt (8th Dan)
-- 16. Black Belt (9th Dan)
-- 17. Black Belt (10th Dan)
--  Each Belt Rank has a different test Fees.


-- 4. Payment and Fee Management:

--  The system should support the management of membership
-- fees and payments as well as the test fees payments.

--  Members should be able to view their payment history and
-- make payments for membership fees.

--  The system should track payment details, such as the
-- amount, date, and payment status.

--  Member can pay for subscriptions and for test as well.


-----------------------------------------------------------------------


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