-- Insert sample users
INSERT INTO Users (first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Alice', 'Smith', 'alice.smith@example.com', 'hashed_password1', '123-456-7890', 'host'),
('Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password2', '234-567-8901', 'guest'),
('Carol', 'Williams', 'carol.williams@example.com', 'hashed_password3', '345-678-9012', 'host'),
('David', 'Brown', 'david.brown@example.com', 'hashed_password4', '456-789-0123', 'guest'),
('Eve', 'Davis', 'eve.davis@example.com', 'hashed_password5', '567-890-1234', 'guest');

-- Insert sample properties (listed by hosts)
INSERT INTO Properties (host_id, name, description, location, price_per_night)
VALUES
(1, 'Cozy Cottage', 'A cozy cottage in the countryside.', 'Countryside, State', 120.00),
(3, 'City Apartment', 'Modern apartment in downtown.', 'Downtown, City', 200.00),
(1, 'Beach House', 'Beautiful beach house with sea view.', 'Seaside, Coast', 350.00);

-- Insert sample bookings
INSERT INTO Bookings (property_id, user_id, start_date, end_date, total_price, status)
VALUES
(1, 2, '2023-11-01', '2023-11-05', 4 * 120.00, 'confirmed'),
(2, 4, '2023-12-10', '2023-12-15', 6 * 200.00, 'confirmed'),
(3, 5, '2023-10-20', '2023-10-25', 5 * 350.00, 'pending');

-- Insert sample payments
INSERT INTO Payments (booking_id, amount, payment_method)
VALUES
(1, 480.00, 'Credit Card'),
(2, 1200.00, 'PayPal'),
(3, 1750.00, 'Credit Card');

-- Insert sample reviews
INSERT INTO Reviews (property_id, user_id, rating, comment)
VALUES
(1, 2, 5, 'Amazing stay! Very cozy and relaxing.'),
(2, 4, 4, 'Great location, clean apartment.'),
(3, 5, 3, 'Nice view but a bit far from city center.');

-- Insert sample messages
INSERT INTO Messages (sender_id, recipient_id, message_body)
VALUES
(2, 1, 'Hi! Is the property available for my dates?'),
(1, 2, 'Yes, it is available. Looking forward to hosting you!'),
(4, 3, 'Can I get more details about the beach house?'),
(3, 4, 'Sure! I will send you the details.');


Notes:
Password hashes are placeholders; in a real scenario, store actual hashes.
Dates and prices are for illustration; adjust as needed.
For multiple bookings or reviews, you can add more entries similarly.
Ensure your database supports the data types and syntax used.