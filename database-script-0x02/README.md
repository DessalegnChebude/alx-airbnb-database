# Data Manipulation Guide for AirBnB Database

This document provides instructions and examples for performing common data manipulation tasks on the AirBnB database, including inserting new data, updating existing records, deleting entries, and querying data for insights.

---

## Inserting Data

### Adding New Users
```sql
INSERT INTO Users (first_name, last_name, email, password_hash, phone_number, role)
VALUES ('John', 'Doe', 'john.doe@example.com', 'hashed_password', '555-1234', 'guest');

Adding New Property
INSERT INTO Properties (host_id, name, description, location, price_per_night)
VALUES (1, 'Mountain Cabin', 'A cozy cabin in the mountains.', 'Mountain Region', 150.00);

Creating Bookings
INSERT INTO Bookings (property_id, user_id, start_date, end_date, total_price, status)
VALUES (1, 2, '2023-12-01', '2023-12-07', 6 * 150.00, 'pending');

Updating Data
Change Property Price

UPDATE Properties
SET price_per_night = 180.00
WHERE property_id = 1;

Mark Booking as Confirmed

UPDATE Bookings
SET status = 'confirmed'
WHERE booking_id = 3;

