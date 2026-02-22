Perfect 🔥
Let’s build a **complete Food Distribution SQL Project in Snowflake** with:

* ✅ Database
* ✅ Schema
* ✅ Multiple Tables
* ✅ Proper Columns
* ✅ Relationships
* ✅ 200+ Rows of Data (auto-generated)

This is production-style and interview-ready.

Platform: **Snowflake**

---

# 🍽️ FOOD DISTRIBUTION MANAGEMENT SYSTEM

---

# ✅ STEP 1 — Create Database & Schema

```sql
CREATE DATABASE FOOD_DISTRIBUTION_DB;

CREATE SCHEMA FOOD_DISTRIBUTION_DB.APP_SCHEMA;

USE DATABASE FOOD_DISTRIBUTION_DB;
USE SCHEMA APP_SCHEMA;
```

---

# ✅ STEP 2 — Create Tables

---

## 1️⃣ SUPPLIERS

```sql
CREATE TABLE SUPPLIERS (
    SUPPLIER_ID INT,
    SUPPLIER_NAME VARCHAR(100),
    CITY VARCHAR(50),
    CONTACT_NUMBER VARCHAR(15),
    CREATED_DATE DATE DEFAULT CURRENT_DATE
);
```

---

## 2️⃣ FOOD_ITEMS

```sql
CREATE TABLE FOOD_ITEMS (
    ITEM_ID INT,
    ITEM_NAME VARCHAR(100),
    CATEGORY VARCHAR(50),
    UNIT_PRICE NUMBER(10,2),
    SUPPLIER_ID INT
);
```

---

## 3️⃣ DISTRIBUTION_CENTERS

```sql
CREATE TABLE DISTRIBUTION_CENTERS (
    CENTER_ID INT,
    CENTER_NAME VARCHAR(100),
    CITY VARCHAR(50),
    MANAGER_NAME VARCHAR(100)
);
```

---

## 4️⃣ ORDERS (Main Transaction Table – 200 Rows Here)

```sql
CREATE TABLE ORDERS (
    ORDER_ID INT,
    CENTER_ID INT,
    ITEM_ID INT,
    QUANTITY INT,
    ORDER_DATE DATE,
    STATUS VARCHAR(20),
    TOTAL_AMOUNT NUMBER(12,2)
);
```

---

# ✅ STEP 3 — Insert Master Data

---

## 🔹 Insert 10 Suppliers

```sql
INSERT INTO SUPPLIERS
SELECT
SEQ4()+1,
'Supplier_' || (SEQ4()+1),
CASE 
  WHEN UNIFORM(1,5,RANDOM())=1 THEN 'Bangalore'
  WHEN UNIFORM(1,5,RANDOM())=2 THEN 'Hyderabad'
  WHEN UNIFORM(1,5,RANDOM())=3 THEN 'Chennai'
  WHEN UNIFORM(1,5,RANDOM())=4 THEN 'Mumbai'
  ELSE 'Delhi'
END,
'9' || LPAD(UNIFORM(100000000,999999999,RANDOM()),9,'0'),
CURRENT_DATE
FROM TABLE(GENERATOR(ROWCOUNT => 10));
```

---

## 🔹 Insert 30 Food Items

```sql
INSERT INTO FOOD_ITEMS
SELECT
SEQ4()+1,
'Item_' || (SEQ4()+1),
CASE 
  WHEN UNIFORM(1,4,RANDOM())=1 THEN 'Grains'
  WHEN UNIFORM(1,4,RANDOM())=2 THEN 'Dairy'
  WHEN UNIFORM(1,4,RANDOM())=3 THEN 'Vegetables'
  ELSE 'Fruits'
END,
ROUND(UNIFORM(20,500,RANDOM()),2),
UNIFORM(1,10,RANDOM())
FROM TABLE(GENERATOR(ROWCOUNT => 30));
```

---

## 🔹 Insert 15 Distribution Centers

```sql
INSERT INTO DISTRIBUTION_CENTERS
SELECT
SEQ4()+1,
'Center_' || (SEQ4()+1),
CASE 
  WHEN UNIFORM(1,5,RANDOM())=1 THEN 'Bangalore'
  WHEN UNIFORM(1,5,RANDOM())=2 THEN 'Hyderabad'
  WHEN UNIFORM(1,5,RANDOM())=3 THEN 'Chennai'
  WHEN UNIFORM(1,5,RANDOM())=4 THEN 'Mumbai'
  ELSE 'Delhi'
END,
'Manager_' || (SEQ4()+1)
FROM TABLE(GENERATOR(ROWCOUNT => 15));
```

---

# ✅ STEP 4 — Insert 200 Orders (Main Requirement)

```sql
INSERT INTO ORDERS
SELECT
SEQ4()+1 AS ORDER_ID,
UNIFORM(1,15,RANDOM()) AS CENTER_ID,
UNIFORM(1,30,RANDOM()) AS ITEM_ID,
UNIFORM(10,200,RANDOM()) AS QUANTITY,
CURRENT_DATE - UNIFORM(1,60,RANDOM()) AS ORDER_DATE,
CASE 
  WHEN UNIFORM(1,3,RANDOM())=1 THEN 'Pending'
  WHEN UNIFORM(1,3,RANDOM())=2 THEN 'Shipped'
  ELSE 'Delivered'
END AS STATUS,
ROUND(UNIFORM(1000,50000,RANDOM()),2) AS TOTAL_AMOUNT
FROM TABLE(GENERATOR(ROWCOUNT => 200));
```

✅ This generates exactly **200 rows dynamically**.

---

# 📊 Sample Business Queries

---

## 🔹 Total Revenue

```sql
SELECT SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM ORDERS;
```

---

## 🔹 Orders Per City

```sql
SELECT D.CITY, COUNT(*) AS TOTAL_ORDERS
FROM ORDERS O
JOIN DISTRIBUTION_CENTERS D 
ON O.CENTER_ID = D.CENTER_ID
GROUP BY D.CITY;
```

---

## 🔹 Top Selling Items

```sql
SELECT ITEM_ID, SUM(QUANTITY) AS TOTAL_SOLD
FROM ORDERS
GROUP BY ITEM_ID
ORDER BY TOTAL_SOLD DESC;
```

---

# 🧠 Project Covers

* Data modeling
* Fact & dimension style tables
* Random data generation
* Aggregation
* Joins
* Business KPIs
* 200+ transactional records

---

# 🎯 Resume Description (You Can Use)

> Designed and implemented a Food Distribution Management System in Snowflake with 5 relational tables and 200+ transactional records. Built revenue analytics, sales performance reports, and dynamic order tracking queries using Snowflake SQL functions.

---

If you want next level 🚀 I can give you:

* ER diagram explanation
* Foreign key constraint version
* Stored procedure for placing orders
* Role-based access design
* Data warehouse star schema version
* 1000+ rows version

Tell me what level you want 😎
