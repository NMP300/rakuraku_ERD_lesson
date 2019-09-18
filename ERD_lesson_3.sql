CREATE TABLE Register (
  register_id             INTEGER NOT NULL,
  register_number         INTEGER,
  PRIMARY KEY (register_id)
);

CREATE TABLE Package (
  package_id              INTEGER NOT NULL,
  package_name            VARCHAR(100),
  PRIMARY KEY (package_id)
);

CREATE TABLE "Order" (
  order_id                INTEGER NOT NULL,
  price                   INTEGER,
  order_date              DATE,
  tax                     INTEGER,
  package_id              INTEGER NOT NULL,
  register_id             INTEGER NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (package_id)  REFERENCES Package (package_id),
  FOREIGN KEY (register_id) REFERENCES Register (register_id) 
);

CREATE TABLE Deposit (
  deposit_id              INTEGER NOT NULL,
  deposit_amount          INTEGER,
  change                  INTEGER,
  PRIMARY KEY (deposit_id)
);

CREATE TABLE Product (
  product_id              INTEGER NOT NULL,
  price                   INTEGER,
  set_product             INTEGER,
  PRIMARY KEY (product_id)
);

CREATE TABLE SetConfiguration (
  set_configuration_id     INTEGER NOT NULL,
  configuration_product_id INTEGER NOT NULL,
  set_product              INTEGER NOT NULL,
  PRIMARY KEY (set_configuration_id),
  FOREIGN KEY (configuration_product_id)  REFERENCES Product (product_id), 
  FOREIGN KEY (set_product)               REFERENCES Product (product_id)
);

CREATE TABLE OrderDetail (
  order_detail_id         INTEGER NOT NULL,
  order_id                INTEGER NOT NULL,
  product_id              INTEGER NOT NULL,
  "count"                 INTEGER,                   
  PRIMARY KEY (order_detail_id),
  FOREIGN KEY (order_id)    REFERENCES "Order" (order_id),
  FOREIGN KEY (product_id)  REFERENCES product (product_id)
);

