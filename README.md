## Overview of the Topics covered
- nested Queries
- Advanced joins
- Functions
- Triggers
  
### average_price

- SUM
- COALESCE
- ROUND
- GROUP BY

---

<details>
  <summary><strong>📖 Average price documentation</strong></summary>

## 📄 SQL Documentation

This project includes a SQL script for tracking product prices over time and calculating the average price of sold units.

### 📂 Files
- [`average_price.sql`](./average_price.sql) - Contains the database schema, sample data, and queries.

### 🛠️ Database Schema

#### 🗂️ `Prices` Table
| Column      | Type          | Description                          |
|------------|--------------|--------------------------------------|
| product_id | INT          | Unique product identifier           |
| start_date | DATE         | Price validity start date           |
| end_date   | DATE         | Price validity end date             |
| price      | DECIMAL(10,2) | Price of the product in that period |

#### 🗂️ `UnitsSold` Table
| Column        | Type  | Description                 |
|--------------|------|-----------------------------|
| product_id   | INT  | ID of the sold product       |
| purchase_date| DATE | Date when the sale happened  |
| units        | INT  | Number of units sold         |

---
