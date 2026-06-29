-- Car Rental Database Code: 


CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255) NOT NULL,
    driver_license_number VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE vehicle_categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE vehicles (
    id SERIAL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    manufacture_year INT NOT NULL,
    current_mileage INT NOT NULL,
    daily_rental_rate DECIMAL(10, 2) NOT NULL,
    fuel_type VARCHAR(50) CHECK (fuel_type IN ('Gasoline', 'Diesel', 'Electric', 'Hybrid')),
    plate_number VARCHAR(50) UNIQUE NOT NULL,
    category_id INT REFERENCES vehicle_categories(id) ON DELETE RESTRICT
);

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE RESTRICT,
    vehicle_id INT REFERENCES vehicles(id) ON DELETE RESTRICT,
    rental_start_date DATE NOT NULL,
    rental_end_date DATE NOT NULL,
    pickup_location VARCHAR(255) NOT NULL,
    dropoff_location VARCHAR(255) NOT NULL,
    initial_rental_days INT NOT NULL,
    initial_total_due DECIMAL(10, 2) NOT NULL,
    initial_check_notes TEXT,
    start_mileage INT NOT NULL,
    actual_return_date DATE,
    actual_rental_days INT,
    final_check_notes TEXT,
    additional_charges DECIMAL(10, 2) DEFAULT 0.00,
    end_mileage INT,
    consumed_mileage INT
);

CREATE TABLE rental_transactions (
    id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES bookings(id) ON DELETE RESTRICT,
    payment_details VARCHAR(255) NOT NULL,
    initial_paid_amount DECIMAL(10, 2) NOT NULL,
    actual_final_amount_due DECIMAL(10, 2),
    remaining_balance DECIMAL(10, 2)
);