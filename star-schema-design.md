# ⭐ Star Schema Design

**CodeX Marketing Analytics – India**

---

## 🌟 Grain of the Fact Table (MOST IMPORTANT)

> **One row = one survey response from one respondent**

Everything in the model respects this grain.

---

## 🟡 FACT TABLE

### `fact_survey_response`

This table stores **measurable and analyzable survey outcomes** .

```sql
fact_survey_response
--------------------
response_id              (PK)
respondent_id             (FK)
city_id                   (FK)

consume_frequency
consume_time
consume_reason

heard_before              (Yes/No)
brand_perception          (Positive/Neutral/Negative)
general_perception        (Healthy/Effective/Dangerous/Not Sure)

tried_before              (Yes/No)
taste_experience          (1–5)

reasons_preventing_trying

current_brand
reasons_for_choosing_brand

improvements_desired
ingredients_expected

health_concerns           (Yes/No)
interest_in_natural

marketing_channel
packaging_preference
limited_edition_packaging

price_range
purchase_location
typical_consumption_situation
```

📌 **Why this stays as a fact table**

- This is where **analysis happens**
- Every column answers a **business question**
- Even categorical values are _facts_ in survey analytics

---

## 🔵 DIMENSION TABLES

---

## 1️⃣ `dim_respondents`

**Who answered the survey**

```sql
dim_respondents
---------------
respondent_id   (PK)
respondent_name
age_group
gender
```

### Why this is a dimension

- Used for slicing results by:
  - Age group
  - Gender
- Slowly changing in real life
- Small, descriptive, stable

---

## 2️⃣ `dim_cities`

**Where the respondent lives**

```sql
dim_cities
----------
city_id     (PK)
city_name
city_tier
```

### Why this is a dimension

- Geography-based analysis:
  - City-wise penetration
  - Tier-wise consumption
- Enables regional marketing strategy

---

## 🔗 RELATIONSHIPS (STAR SHAPE)

```
           dim_respondents
                 |
                 |
                 |
          fact_survey_response
                 |
                 |
                 |
             dim_cities
```

✔ No dimension-to-dimension joins
✔ All joins flow through the fact table
✔ Optimized for analytics & reporting

> **_“The fact table captures survey responses at respondent level, while demographic and geographic attributes are modeled as dimensions. This allows flexible slicing of marketing insights using a clean star schema optimized for analytical queries.”_**

---

CREATE DATABASE CodeX_Marketing_Analytics;
GO

USE CodeX_Marketing_Analytics;
GO

CREATE SCHEMA staging;
GO
