-- Online Store Database Code: 



CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    contact_details VARCHAR(255) NOT NULL,
    shipping_address TEXT NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    image_url TEXT,
    additional_details TEXT
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_number VARCHAR(100) UNIQUE NOT NULL,
    customer_id INT REFERENCES customers(id) ON DELETE RESTRICT,
    order_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    shipping_method VARCHAR(100) NOT NULL,
    order_status VARCHAR(50) DEFAULT 'Pending' CHECK (order_status IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled', 'Refunded'))
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id) ON DELETE CASCADE,
    product_id INT REFERENCES products(id) ON DELETE RESTRICT,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    transaction_id VARCHAR(100) UNIQUE NOT NULL,
    order_id INT REFERENCES orders(id) ON DELETE RESTRICT,
    customer_id INT REFERENCES customers(id) ON DELETE RESTRICT,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE shipments (
    id SERIAL PRIMARY KEY,
    order_id INT UNIQUE REFERENCES orders(id) ON DELETE CASCADE,
    carrier_details VARCHAR(255) NOT NULL,
    tracking_number VARCHAR(100) UNIQUE,
    shipping_status VARCHAR(50) DEFAULT 'Processing' CHECK (shipping_status IN ('Processing', 'Out for Delivery', 'Delivered', 'Return to Sender', 'On Hold', 'Delayed', 'Lost')),
    estimated_delivery_date DATE,
    actual_delivery_date DATE,
    notes TEXT
);

CREATE TABLE product_reviews (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id) ON DELETE CASCADE,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    rating_score INT NOT NULL CHECK (rating_score BETWEEN 1 AND 5),
    review_text TEXT,
    review_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_customer_product_review UNIQUE (product_id, customer_id)
);