# AirBnB Database Schema

This document provides the SQL statements to create the database schema for an AirBnB-like application. The schema includes tables for users, properties, bookings, payments, reviews, and messages, with proper data types, primary keys, foreign keys, constraints, and indexes for optimal performance.

---

## Schema Overview

### Tables

- **Users**: Stores user information, including roles (guest, host, admin).
- **Properties**: Details of properties listed by hosts.
- **Bookings**: Records of reservations made by guests.
- **Payments**: Payment transactions associated with bookings.
- **Reviews**: Feedback provided by users for properties.
- **Messages**: Communication messages between users.

---

## SQL Statements

### Users Table

```sql
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
Properties Table

CREATE TABLE Properties (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    host_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_host FOREIGN KEY (host_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

Bookings Table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES Properties(property_id) ON DELETE CASCADE,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50),
    CONSTRAINT fk_booking FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE
);
Reviews Table
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES Properties(property_id) ON DELETE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
Messages Table
CREATE TABLE Messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sender FOREIGN KEY (sender_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_recipient FOREIGN KEY (recipient_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE INDEX idx_property_host ON Properties(host_id);
CREATE INDEX idx_booking_property ON Bookings(property_id);
CREATE INDEX idx_booking_user ON Bookings(user_id);
CREATE INDEX idx_payment_booking ON Payments(booking_id);
CREATE INDEX idx_review_property ON Reviews(property_id);
CREATE INDEX idx_review_user ON Reviews(user_id);
CREATE INDEX idx_message_sender ON Messages(sender_id);
CREATE INDEX idx_message_recipient ON Messages(recipient_id);