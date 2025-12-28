-- Create the staging tables 
CREATE TABLE staging.dim_respondents_stg (
    Respondent_ID INT,
    Name NVARCHAR(100),
    Age_Group NVARCHAR(10),
    Gender NVARCHAR(10),
    City_ID NVARCHAR(10)
);

CREATE TABLE staging.dim_cities_stg (
    City_ID NVARCHAR(10),
    City NVARCHAR(50),
    Tier NVARCHAR(10)
);

CREATE TABLE staging.fact_survey_responses_stg (
    Response_ID INT,
    Respondent_ID INT,
    Consume_frequency NVARCHAR(50),
    Consume_time NVARCHAR(100),
    Consume_reason NVARCHAR(100),
    Heard_before NVARCHAR(10),
    Brand_perception NVARCHAR(20),
    General_perception NVARCHAR(20),
    Tried_before NVARCHAR(10),
    Taste_experience INT,
    Reasons_preventing_trying NVARCHAR(100),
    Current_brands NVARCHAR(50),
    Reasons_for_choosing_brands NVARCHAR(100),
    Improvements_desired NVARCHAR(100),
    Ingredients_expected NVARCHAR(50),
    Health_concerns NVARCHAR(10),
    Interest_in_natural_or_organic NVARCHAR(20),
    Marketing_channels NVARCHAR(50),
    Packaging_preference NVARCHAR(50),
    Limited_edition_packaging NVARCHAR(20),
    Price_range NVARCHAR(20),
    Purchase_location NVARCHAR(50),
    Typical_consumption_situations NVARCHAR(50)
);

-- Bulk insert data into the staging tables 
BEGIN TRY
BEGIN TRANSACTION
    BULK INSERT staging.dim_respondents_stg
    FROM 'D:\GITHUB_RESUME\Codex-Marketing-Analytics-India\data\dim_repondents.csv'
    WITH (
        FIRSTROW = 2, -- SKIP THE HEADER
        FIELDTERMINATOR = ',' , -- CSV DELIMITER
        ROWTERMINATOR = '\n', -- NEW LINE
        TABLOCK, 
        CODEPAGE = 65001 -- UTF-8 SUPPPORT
    )

    BULK INSERT staging.dim_cities_stg
    FROM 'D:\GITHUB_RESUME\Codex-Marketing-Analytics-India\data\dim_cities.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    )

    BULK INSERT staging.fact_survey_responses_stg
    FROM 'D:\GITHUB_RESUME\Codex-Marketing-Analytics-India\data\fact_survey_responses.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    )
COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH;

