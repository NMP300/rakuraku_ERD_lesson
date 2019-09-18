CREATE TABLE ProductCategory  (
        product_category_id INTEGER NOT NULL,
        product_category    VARCHAR(100),
        PRIMARY KEY (product_category_id)
);


CREATE TABLE Product  (
        product_id          INTEGER NOT NULL,
        product_name        VARCHAR(100),
        product_division    VARCHAR(100),
        unit_price          INTEGER,
        tax_in_price        INTEGER,
        product_category_id INTEGER NOT NULL,
        PRIMARY KEY (product_id),
        FOREIGN KEY (product_category_id) REFERENCES ProductCategory (product_category_id)
);


CREATE TABLE Producut_division  (
        product_division_id INTEGER NOT NULL,
        product_division    VARCHAR(100),
        PRIMARY KEY (product_division_id)
);

CREATE TABLE Customer (
        customer_id         INTEGER NOT NULL,
        custrmer_name       VARCHAR(100),
        phone_number        INTEGER,
        PRIMARY KEY (customer_id)
);


CREATE TABLE "Order"  (
        order_id            INTEGER NOT NULL,
        order_quantity      INTEGER,
        customer_id         INTEGER NOT NULL,
        product_id          INTEGER NOt NULL,
        order_time          date,
        PRIMARY KEY (order_id),
        FOREIGN KEY (customer_id)  REFERENCES Customer (customer_id),
        FOREIGN KEY (product_id)   REFERENCES Product(product_id)
);


