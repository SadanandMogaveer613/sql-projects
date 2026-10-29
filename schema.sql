-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
CREATE TABLE "users"(
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "hotels"(
    "id" INTEGER PRIMARY KEY,
    "title" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "price" INTEGER NOT NULL
);

CREATE TABLE "bookings"(
    "id" INTEGER PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "hotel_id" INTEGER NOT NULL,
    "check_in" DATE NOT NULL,
    "check_out" DATE NOT NULL CHECK("check_out" > "check_in"),
    FOREIGN KEY("user_id") REFERENCES users("id"),
    FOREIGN KEY("hotel_id") REFERENCES hotels("id")
);

CREATE TABLE "reviews"(
    "id" INTEGER PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "hotel_id" INTEGER NOT NULL,
    "booking_id" INTEGER NOT NULL,
    "comment" TEXT,
    "rating" INTEGER CHECK("rating" BETWEEN 1 AND 5),
    FOREIGN KEY("user_id") REFERENCES users("id"),
    FOREIGN KEY("hotel_id") REFERENCES hotels("id"),
    FOREIGN KEY("booking_id") REFERENCES bookings("id")
);

-- Index to quickly find bookings by user
CREATE INDEX idx_bookings_user_id
ON bookings(user_id);

-- Index to quickly find bookings by hotel
CREATE INDEX idx_bookings_hotel_id
ON bookings(hotel_id);

-- Index to quickly find reviews for a hotel
CREATE INDEX idx_reviews_hotel_id
ON reviews(hotel_id);
