## Overview of the Topics Covered
- Nested Queries
- Advanced Joins
- Functions
- Triggers

---

<details>
  <summary>What is COALESCE in SQL?</summary>

  The `COALESCE` function provides a fallback in case a value doesn’t exist.

  **COALESCE is like asking:**  
  *"Give me the first thing that isn’t empty!"*

  **Example:**  
  If you say:  
  👉 `COALESCE(box1, box2, box3)`

  SQL will check:
  - Box 1: Empty ❌  
  - Box 2: Empty ❌  
  - Box 3: Teddy Bear ✅ (Takes this one!)

</details>


### **📊 Average Price Calculation**
- SUM
- COALESCE
- ROUND
- GROUP BY

<details>
  <summary><strong>📖 Average Price Documentation</strong></summary>

#### 📄 SQL Documentation

This project includes a SQL script for tracking product prices over time and calculating the average price of sold units.

#### 📂 Files
- [`average_price.sql`](./average_price.sql) - Contains the database schema, sample data, and queries.

#### 🛠️ Database Schema

##### 🗂️ `Prices` Table
| Column      | Type          | Description                          |
|------------|--------------|--------------------------------------|
| product_id | INT          | Unique product identifier           |
| start_date | DATE         | Price validity start date           |
| end_date   | DATE         | Price validity end date             |
| price      | DECIMAL(10,2) | Price of the product in that period |

##### 🗂️ `UnitsSold` Table
| Column        | Type  | Description                 |
|--------------|------|-----------------------------|
| product_id   | INT  | ID of the sold product       |
| purchase_date| DATE | Date when the sale happened  |
| units        | INT  | Number of units sold         |

</details>

---

### **📅 Date Formatting & Transaction Summary**
- DATE_FORMAT
- COUNT
- SUM
- GROUP BY
- COALESCE
- CASE WHEN

<details>
  <summary><strong>📖 Date Formatting & Transaction Summary Documentation</strong></summary>

#### 📄 SQL Documentation

This project includes a SQL script for formatting dates and generating transaction summaries.

#### 📂 Files
- [`date_formats.sql`](./date_formats.sql) - Contains the database schema, sample data, and queries for transaction processing.

#### 🛠️ Database Schema

##### 🗂️ `Transactions` Table
| Column      | Type                         | Description                              |
|------------|-----------------------------|------------------------------------------|
| id         | INT PRIMARY KEY              | Unique transaction identifier           |
| country    | VARCHAR(50) NOT NULL         | Country of the transaction              |
| state      | ENUM('approved', 'declined', 'pending') NOT NULL | Transaction status          |
| amount     | DECIMAL(10,2) NOT NULL       | Transaction amount                       |
| trans_date | DATE NOT NULL                | Date of the transaction                  |

</details>
