-- Create the dimension and fact tables 
CREATE TABLE dim_respondents (
    Respondent_ID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Age_Group NVARCHAR(10),
    Gender NVARCHAR(10),
    City_ID NVARCHAR(10)
);

CREATE TABLE dim_cities (
    City_ID NVARCHAR(10) PRIMARY KEY,
    City NVARCHAR(50),
    Tier NVARCHAR(10)
);

CREATE TABLE fact_survey_response (
    response_id INT PRIMARY KEY,
    respondent_id INT,
    city_id NVARCHAR(10),

    consume_frequency NVARCHAR(50),
    consume_time NVARCHAR(100),
    consume_reason NVARCHAR(100),

    heard_before NVARCHAR(10),
    brand_perception NVARCHAR(20),
    general_perception NVARCHAR(20),

    tried_before NVARCHAR(10),
    taste_experience INT,
    reasons_preventing_trying NVARCHAR(100),

    current_brand NVARCHAR(50),
    reasons_for_choosing_brand NVARCHAR(100),

    improvements_desired NVARCHAR(100),
    ingredients_expected NVARCHAR(50),

    health_concerns NVARCHAR(10),
    interest_in_natural NVARCHAR(20),

    marketing_channel NVARCHAR(50),
    packaging_preference NVARCHAR(50),
    limited_edition_packaging NVARCHAR(20),

    price_range NVARCHAR(20),
    purchase_location NVARCHAR(50),
    typical_consumption_situation NVARCHAR(50),

    CONSTRAINT fk_fact_respondent
        FOREIGN KEY (respondent_id) REFERENCES dim_respondents(Respondent_ID),

    CONSTRAINT fk_fact_city
        FOREIGN KEY (city_id) REFERENCES dim_cities(City_ID)
);

-- Insert data to these dimension and fact tables

INSERT INTO dim_respondents
SELECT DISTINCT
    Respondent_ID,
    Name,
    Age_Group,
    Gender
FROM staging.dim_respondents_stg;

INSERT INTO dim_cities
SELECT DISTINCT
    City_ID,
    City,
    Tier
FROM staging.dim_cities_stg;

INSERT INTO fact_survey_response
SELECT
    f.Response_ID,
    f.Respondent_ID,
    r.City_ID,

    f.Consume_frequency,
    f.Consume_time,
    f.Consume_reason,

    f.Heard_before,
    f.Brand_perception,
    f.General_perception,

    f.Tried_before,
    f.Taste_experience,
    f.Reasons_preventing_trying,

    f.Current_brands,
    f.Reasons_for_choosing_brands,

    f.Improvements_desired,
    f.Ingredients_expected,

    f.Health_concerns,
    f.Interest_in_natural_or_organic,

    f.Marketing_channels,
    f.Packaging_preference,
    f.Limited_edition_packaging,

    f.Price_range,
    f.Purchase_location,
    f.Typical_consumption_situations
FROM staging.fact_survey_responses_stg f
INNER JOIN staging.dim_respondents_stg r
    ON f.Respondent_ID = r.Respondent_ID;


-- Data Quality Checks 
-- Row count check
SELECT COUNT(*) FROM fact_survey_response;

-- Orphan check
SELECT *
FROM fact_survey_response f
LEFT JOIN dim_respondents d
    ON f.respondent_id = d.respondent_id
WHERE d.respondent_id IS NULL;
