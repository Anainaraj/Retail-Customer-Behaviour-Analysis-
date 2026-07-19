# Retail-Customer-Behaviour-Analysis-
End-to-end retail customer behavior analysis with data cleaning in Python, business-question analysis in SQL (PostgreSQL), and an interactive Power BI dashboard to uncover what drives purchases, loyalty, and engagement.

# Retail Customer Behaviour Analysis

End-to-end analysis of a retail company's customer shopping behavior dataset — from raw data cleaning through business-question analysis to an interactive dashboard — built to answer one question: **how can the company use shopping data to identify trends, improve customer engagement, and optimize marketing and product strategy?**

## Overview

Management noticed shifts in purchasing patterns across demographics, product categories, and shopping preferences, and wanted to know which factors — discounts, reviews, seasonality, payment method — actually drive purchase decisions and repeat business. This project works through that question using a three-stage pipeline:

1. **Python** — clean and transform the raw dataset
2. **SQL** — model the data relationally and answer ten specific business questions
3. **Power BI** — an interactive dashboard for stakeholders to explore the results



## Dataset

3,900 transaction records across 18 fields, covering customer demographics (age, gender, location), product details (item, category, size, color), transaction data (purchase amount, season, payment method), engagement (review rating, subscription status, previous purchases), and fulfilment (shipping type, purchase frequency).

## Methodology

### 1. Data Preparation (Python)
- Standardized column names for consistent, query-safe naming
- Imputed missing review ratings using the **median rating per category** (not a global average)
- Engineered `purchase-frequency-days` from the categorical purchase-frequency field
- Engineered `age-group` using quartile binning (young-adult / adult / middle-aged / senior)
- Dropped `promo-code-used`, found to be a perfect duplicate of `discount-applied`
- Loaded the cleaned table into PostgreSQL via SQLAlchemy

### 2. Data Analysis (SQL)
Ten queries against the cleaned `customer` table covering: revenue extraction, above-average discounted spenders, lowest-rated items, shipping-type preferences, subscriber value comparison, discount rate by item, customer loyalty segmentation (NEW / RETURNING / LOYAL), top items per category (window functions), high-frequency repeat buyers, and revenue by age group.

### 3. Visualization (Power BI)
A single-page **Customer Behaviour Dashboard** with KPI cards (customer count, average spend, average rating), a subscription-status donut, revenue and order-volume by category, and customer count and revenue by age group — all filterable by shipping type, subscription status, gender, and category.

## Key Findings

- **Revenue is concentrated**: Clothing ($104K) and Accessories ($74K) drive ~82% of total revenue, tracking order volume rather than higher prices.
- **The customer base is loyalty-heavy**: 80% of customers are LOYAL (10+ prior purchases); only 2% are NEW — acquisition, not retention, looks like the bigger growth lever.
- **Subscription isn't a spend driver**: only 27% of customers subscribe, and they spend about the same per transaction as non-subscribers ($59.49 vs. $59.87).
- **Discounting is broad** (~40% of transactions) but not clearly linked to satisfaction — the lowest-rated items aren't the most discounted.
- **Age and season have only modest effects** on spend; no single payment method or shipping type dominates.

Full findings and recommendations are in [`report/project_report.docx`](./report/project_report.docx).

## Tech Stack

`Python (pandas)` · `PostgreSQL` · `SQLAlchemy` · `Power BI`

## Author

Anainaraj
