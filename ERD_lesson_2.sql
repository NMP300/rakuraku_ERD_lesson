CREATE TABLE Customer (
  customer_id           INTEGER NOT NULL,
  customer_name         VARCHAR(100),
  name_furigana         VARCHAR(100),
  ticket_number         INTEGER,
  PRIMARY KEY (customer_id)
);

CREATE TABLE ContactMethod (
  contact_method_id     INTEGER NOT NULL,
  contact_method_name   VARCHAR(100),
  PRIMARY KEY (contact_method_id)
);

CREATE TABLE ContactAddress (
  contact_address_id    INTEGER NOT NULL,
  customer_id           INTEGER NOT NULL,
  phone_number          INTEGER,
  PRIMARY KEY (contact_address_id),
  FOREIGN KEY (customer_id) REFERENCES Customer (customer_id) 
                            ON UPDATE RESTRICT
);

CREATE TABLE Publisher (
  publisher_id          INTEGER NOT NULL,
  publisher_name        VARCHAR(100),
  PRIMARY KEY (publisher_id)
);

CREATE TABLE Book (
  book_id               INTEGER NOT NULL,
  book_name             VARCHAR(100),
  publication_year      INTEGER,
  price                 INTEGER,
  publisher_id          INTEGER NOT NULL,
  PRIMARY KEY (book_id),
  FOREIGN KEY (publisher_id) REFERENCES Publisher (publisher_id)
                              ON UPDATE RESTRICT
);

CREATE TABLE Library (
  library_id            INTEGER NOT NULL,
  library_name          VARCHAR(100),
  PRIMARY KEY (library_id)
);

CREATE TABLE Know (
  know_id                   INTEGER NOT NULL,
  customer_id               INTEGER NOT NULL,
  book_id                   INTEGER NOT NULL,
  new_arrivals_books_number INTEGER,
  newspaper_name            VARCHAR(100),
  newapaper_data            DATE,
  oher                      VARCHAR(100),
  PRIMARY KEY (know_id),
  FOREIGN KEY (customer_id) REFERENCES Customer (customer_id)
                            ON UPDATE RESTRICT,
  FOREIGN KEY (book_id)     REFERENCES Book     (book_id)
                            ON UPDATE RESTRICT
);

CREATE TABLE Reservation (
  reservation_id            INTEGER NOT NULL,
  application_date          DATE,
  book_title_transmission   INTEGER,
  contact_unnecessary       INTEGER,
  book_id                   INTEGER NOT NULL,
  contact_address_id        INTEGER NOT NULL,
  library_id                INTEGER NOT NULL,
  PRIMARY KEY (reservation_id),
  FOREIGN KEY (book_id)            REFERENCES  Book           (book_id)
                                    ON UPDATE RESTRICT,
  FOREIGN KEY (contact_address_id) REFERENCES  ContactAddress (contact_address_id)
                                    ON UPDATE RESTRICT,
  FOREIGN KEY (library_id)         REFERENCES  Library        (library_id)
                                    ON UPDATE RESTRICT
);





