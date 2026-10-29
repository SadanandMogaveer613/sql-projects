-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database
-- Insert a new user
INSERT INTO users (name) VALUES ('John');

-- Add a hotel
INSERT INTO hotels (title, location, price)
VALUES ('Taj Hotel', 'Mumbai', 5000);

-- Make a booking
INSERT INTO bookings (user_id, hotel_id, check_in, check_out)
VALUES (1, 1, '2026-05-10', '2026-05-15');

--Insert a review
INSERT INTO reviews (user_id, hotel_id, booking_id, comment, rating)
VALUES (1, 1, 1, 'Great stay!', 5);

--View bookings
SELECT * FROM bookings WHERE user_id = 1;

-- Join query (important!)
SELECT users.name, hotels.title
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN hotels ON bookings.hotel_id = hotels.id;
