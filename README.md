# CodeX Marketing Analytics – India 🇮🇳

## 📌 Project Overview

CodeX is a German beverage company that recently launched its energy drink in 10 Indian cities. The marketing team conducted a large-scale consumer survey (10,000 respondents) to understand customer behavior, brand awareness, preferences, and market opportunities.

This project focuses on transforming raw survey data into **actionable marketing insights** using **pure T-SQL in SQL Server Management Studio (SSMS)** .

---

## 🎯 Objective

The primary objective of this project is to:

- Analyze consumer survey data using SQL
- Design a dimensional data model for analytics
- Answer key business and marketing questions
- Enable data-driven decisions for brand growth, pricing, marketing channels, and product development

---

## 🛠️ Tools & Technologies

- **SQL Server**
- **T-SQL**
- **SQL Server Management Studio (SSMS)**
- Dimensional Modeling (Star Schema)
- Analytical SQL (CTEs, Window Functions, Aggregations)

> ⚠️ No external BI tools are used. All insights are derived directly using T-SQL queries.

---

## 📂 Dataset Description

The project uses three CSV files:

### 1️⃣ `dim_respondents`

Contains demographic details of survey participants:

- Respondent ID
- Age group
- Gender
- City ID

### 2️⃣ `dim_cities`

Contains city-level information:

- City name
- City tier

### 3️⃣ `fact_survey_responses`

Contains survey responses related to:

- Consumption habits
- Brand awareness & perception
- Competitor preferences
- Pricing, packaging & marketing channels
- Health concerns & product expectations

---

## 🏗️ Data Modeling Approach

A **star schema** is created to support analytical queries:

- **Fact Table**
  - `fact_survey_responses`
- **Dimension Tables**
  - `dim_respondents`
  - `dim_cities`

This structure enables efficient slicing of survey insights by:

- Demographics
- Geography
- Consumption behavior
- Brand perception

---

## 🔄 Project Workflow

1. Data ingestion from CSV into SQL Server
2. Data cleaning and validation using T-SQL
3. Creation of dimension and fact tables
4. Implementation of relationships and keys
5. Business-driven analytical queries
6. Insight generation aligned with marketing goals

---

## 📊 Key Business Questions Answered

### 🔹 Demographic Insights

- Which age group consumes energy drinks the most?
- Gender-wise consumption patterns
- Cities with highest energy drink adoption

### 🔹 Consumer Preferences

- Preferred ingredients and packaging
- Typical consumption situations
- Health concerns and demand for natural ingredients

### 🔹 Brand Awareness & Perception

- Brand awareness across cities
- Brand perception vs competitors
- Cities requiring higher marketing focus

### 🔹 Competition Analysis

- Current market leaders
- Reasons consumers prefer competing brands
- Key differentiators (taste, availability, effectiveness)

### 🔹 Marketing & Sales Insights

- Most effective marketing channels
- Preferred purchase locations
- Price sensitivity and willingness to pay
- Impact of limited edition packaging

---

## 📈 Insights & Recommendations

Based on SQL-driven analysis, the project derives:

- Target customer segments
- Ideal pricing range
- Marketing channel prioritization
- Product improvement opportunities
- City-level go-to-market focus areas

---

## 📁 Repository Structure

```
CodeX-Marketing-Analytics-India/
│
├── data/
│   ├── dim_respondents.csv
│   ├── dim_cities.csv
│   └── fact_survey_responses.csv
│
├── sql/
│   ├── data_ingestion.sql
│   ├── data_modeling.sql
│   ├── analysis_queries.sql
│
├── insights/
│   └── key_findings.md
│
└── README.md
```

---

## 📬 Author

**Binayak Basu**
Marketing Analytics | SQL | Data Modeling | Business Insights

---
