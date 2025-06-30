# AirBnB Database Normalization to 3NF

## Introduction

Normalization is a database design process that organizes tables to reduce redundancy and dependency. The goal is to achieve **Third Normal Form (3NF)**, which ensures that:

- The database is in **First Normal Form (1NF)**: All table columns contain atomic (indivisible) values, and each record is unique.
- The database is in **Second Normal Form (2NF)**: It is in 1NF, and all non-prime attributes are fully functionally dependent on the primary key.
- The database is in **Third Normal Form (3NF)**: It is in 2NF, and all non-prime attributes are non-transitively dependent on the primary key (i.e., no transitive dependencies).

---

## Step 1: Initial Schema Review

Your schema includes the following tables:

- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

### Potential Redundancies & Dependencies

- The attributes are mostly atomic.
- Each table's primary key uniquely identifies records.
- Foreign keys link related tables.

No immediate redundancy or transitive dependencies are evident, but let's verify and ensure all non-key attributes depend only on the primary key.

---

## Step 2: Ensuring 1NF

All tables contain atomic columns, and there are no repeating groups or multi-valued attributes. 

**Conclusion:** The schema is in **1NF**.

---

## Step 3: Ensuring 2NF

- All non-primary key attributes depend entirely on the primary key.

**Example:**

- In **Booking**, attributes like `property_id`, `user_id`, `start_date`, etc., depend on `booking_id`. No partial dependencies exist.

**Conclusion:** The schema is in **2NF**.

---

## Step 4: Ensuring 3NF

- Check for transitive dependencies (non-key attributes depending on other non-key attributes).

### Key observations:

- **User role**: The `role` attribute influences behavior but does not depend on other attributes.
- **Property host_id**: Links to User, representing ownership.
- **Review**: Depends on `property_id` and `user_id`, which are keys.
- **Payment**: Depends on `booking_id`.
- **Message**: Depends on `sender_id` and `recipient_id`.

**Potential issue:**  
Suppose we stored the **User's email** and **phone number**; these are dependent solely on the User's identity, not on other attributes. No transitive dependency is observed here.

### **Conclusion:**  
No transitive dependencies are present in the current schema; all non-key attributes depend solely on their primary key.

---

## **Final Assessment:**

**The schema as designed appears to be in 3NF**, assuming:

- No derived or stored attributes violate normalization.
- All attributes are atomic and depend solely on their primary keys.
- Foreign keys are correctly established to enforce referential integrity.

---

## **Additional Recommendations:**

- **Role-specific attributes:** If future attributes are added that are specific to roles (e.g., only hosts have `bank_account_info`), consider creating specialized tables.
- **Indexes:** Ensure indexes on foreign keys for performance.
- **Composite Keys:** Not necessary here; all tables have simple primary keys.

---

# Summary

| Step | Normalization Status | Notes |
|--------|-------------------------|--------|
| 1NF | Achieved | Atomic columns, no repeating groups |
| 2NF | Achieved | All non-key attributes depend on the full primary key |
| 3NF | Achieved | No transitive dependencies; non-key attributes depend only on primary keys |

---
