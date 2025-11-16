# 📊 Netflix SQL Analysis Project

> A complete PostgreSQL project analyzing Netflix Movies & TV Shows using 15 real-world SQL queries including window functions, CTEs, date & string operations. Ideal for showcasing SQL skills for Data Analyst / Data Science roles.

A complete end-to-end SQL analysis project performed on the **Netflix Movies & TV Shows dataset**. This project includes table creation, data exploration, cleaning logic, and 15 real analytical tasks with window functions, string processing, date functions, CTEs, and pattern matching.

This project is perfect for showcasing SQL skills for **Data Analyst / Data Science internships and jobs**.


## 🎯 Project Goals

1. Understand Netflix content distribution
2. Perform analytics using SQL queries
3. Apply real-world SQL skills:

   * Window functions
   * CTEs
   * String functions
   * Date functions
   * Array & text transformation
   * Data categorization
4. Present insights in a clean, industry-ready structure

---

## 🛠️ Tech Stack

* **PostgreSQL** (Recommended)


---

## 🧱 Database Schema

The table used in this project:

```sql
CREATE TABLE netflix (
    show_id       VARCHAR(6),
    type          VARCHAR(10),
    title         VARCHAR(150),
    director      VARCHAR(210),
    casts         VARCHAR(1000),
    country       VARCHAR(500),
    date_added    VARCHAR(100),
    release_year  INT,
    rating        VARCHAR(10),
    duration      VARCHAR(20),
    listed_in     VARCHAR(100),
    description   VARCHAR(300)
);
```

---

## 📈 Key Analysis Questions

This project answers 15 real-world business questions:

### 1️⃣ Count Movies vs TV Shows

### 2️⃣ Most common rating by Type

### 3️⃣ Movies released in a given year (2020)

### 4️⃣ Top 5 countries with most content

### 5️⃣ Longest movie

### 6️⃣ Content added in last 5 years

### 7️⃣ Movies/Shows by Rajiv Chilaka

### 8️⃣ TV Shows with more than 5 seasons

### 9️⃣ Count of genres

### 🔟 Year-wise % of Indian content (Top 5)

### 1️⃣1️⃣ Documentary movies

### 1️⃣2️⃣ Content with no director

### 1️⃣3️⃣ Salman Khan movies (last 10 years)

### 1️⃣4️⃣ Top 10 Indian actors by content count

### 1️⃣5️⃣ Categorization based on violence/kill keywords

All questions solved with optimized SQL queries.

---

## 📜 Full SQL Script

The entire project script is included in `netflix.sql`. It contains **all 15 analysis queries**, ready to run in any PostgreSQL environment.

---

## 📊 Sample Insights

* Netflix has more *Movies* than *TV Shows*.
* The most common rating varies by type.
* India has contributed a significant % of content in key years.
* Some actors dominate Netflix India content.
* Many descriptions contain mild violence and are categorized accordingly.

---



---

