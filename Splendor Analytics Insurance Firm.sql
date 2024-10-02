--DATA NORMALIZATION
SELECT ID
FROM [Insurance Policies (1)]
GROUP BY ID
HAVING COUNT(ID) > 1;

WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY ID ORDER BY (SELECT NULL)) AS rn
    FROM [Insurance Policies (1)]
)
DELETE FROM CTE
WHERE rn > 1;

ALTER TABLE [Insurance Policies (1)]
ADD CONSTRAINT assigning_PK PRIMARY KEY (ID);

SELECT * FROM Insurance

--ADD AGE COLUMN
ALTER TABLE Insurance
ADD Age INT;
--CALCULATE THE POLICYHOLDERS AGE
UPDATE insurance
SET Age= DATEDIFF(YEAR, birthdate, GETDATE()) - 
    CASE 
        WHEN MONTH(birthdate) > MONTH(GETDATE()) OR 
             (MONTH(birthdate) = MONTH(GETDATE()) AND DAY(birthdate) > DAY(GETDATE())) 
        THEN 1 ELSE 0 END;
SELECT birthdate ,Age FROM Insurance


--CLAIM FREQUENCY AND AMOUNT ANALYSIS
--AVAERAGE CLAIM FREQUENCIES AND AMOUNTS FOR DIFFERENT DEMIGRAPHIC GROUPS
--AGE DEMOGRAPH
SELECT
	Age,
	AVG(claim_freq) AVERAGE_CLAIM_PERAGE_GROUP,
	AVG(claim_amt) Average_Claim_Amount
INTO
	AverageClaimPerAge
FROM
	Insurance
GROUP  BY
	Age
ORDER BY 
	Average_Claim_Amount DESC
--GENDER DEMOGRAPH
SELECT
	gender,
	AVG(claim_freq) AVERAGE_CLAIM_PERAGE_GROUP,
	AVG(claim_amt) Average_Claim_Amount
INTO
	AverageClaimPerGender
FROM
	Insurance
GROUP  BY
	gender
ORDER BY 
	Average_Claim_Amount DESC
--MARITAL STATUS DEMOGRAPH
SELECT
	marital_status,
	AVG(claim_freq) AVERAGE_CLAIM_PERAGE_GROUP,
	AVG(claim_amt) Average_Claim_Amount
INTO
	AverageClaimPerMaritalStatus
FROM
	Insurance
GROUP  BY
	marital_status
ORDER BY 
	Average_Claim_Amount DESC



--RELATIONSHIP BETWEEN VEHICLE CHARACTERITSICS AND CLAIM FREQUENCIES AN AMOUNTS
SELECT 
    car_make, 
    car_model, 
    car_year,
	SUM(claim_freq) AS TotalClaimFrequency,
    SUM(claim_amt) AS TotalClaimAmount
INTO
	VehicleFeatures_HighClaims
FROM 
    Insurance
GROUP BY 
    car_make, 
    car_model, 
    car_year
ORDER BY 
    TotalClaimAmount DESC;
--------
SELECT 
    car_make, 
    car_model, 
    car_year,
	SUM(claim_freq) AS TotalClaimFrequency,
    SUM(claim_amt) AS TotalClaimAmount
INTO
	VehicleFeatures_FrequentClaims
FROM 
    Insurance
GROUP BY 
    car_make, 
    car_model, 
    car_year
ORDER BY 
    TotalClaimFrequency DESC;


--RISK ASSESSMENT
--FACTORS THAT ARE MOST INDICATIVE OF HIGH RISK POLICY HOLDERS
SELECT 
    education,
    coverage_zone,
    SUM(household_income) AS Total_householdincome,
    SUM(claim_amt) AS Total_claim_amount
INTO
	Most_Indictive_Factors_HighRiskPolicyholders
FROM 
    Insurance
GROUP BY 
    education, coverage_zone
ORDER BY 
	Total_claim_amount DESC;
--CHARACTERISTICS WITH POLICY HOLDERS WITH FREQUUENT CLAIMS
SELECT 
	Age,
	marital_status,
	car_use,
	gender,
    car_make, 
    car_model, 
	car_color,
    car_year, 
    SUM(claim_freq) AS TotalClaimFrequency
INTO
	Characteristcs_of_FrequentClaims
FROM 
    Insurance
GROUP BY 
   Age,
	marital_status,
	car_use,
	gender,
    car_make, 
    car_model, 
	car_color,
    car_year
ORDER BY 
    TotalClaimFrequency DESC;
	

--PREMIUM OPTIMIZATION
----HOW PREMIUM AMOUNTS RELATE TO RISK PROFILES OF POLICY HOLDERS
-- Create a risk score for policyholders
-- Assume a base rate of 500
DECLARE @base_rate INT = 500;

-- Calculate risk score and suggested premium based on it
SELECT
    ID,
    claim_freq * 0.4 + claim_amt * 0.3 + (2024 - car_year) * 0.2 + kids_driving * 0.1 AS risk_score,
    (claim_freq * 0.4 + claim_amt * 0.3 + (2024 - car_year) * 0.2 + kids_driving * 0.1) * @base_rate AS suggested_premium
FROM 
    Insurance
ORDER BY 
    risk_score DESC;

SELECT
	I.ID,
	I.Age,
	I.marital_status,
	I.car_use,
	I.kids_driving,
	I.education,
	I.car_make,
	I.car_model,
	I.coverage_zone,
	P.suggested_premium
INTO
Premium_Profiling
FROM Insurance AS I
INNER JOIN Premium_calc AS P
ON I.ID = P.ID
--RECOMMENDATION ......

--CUSTOMER SEGMENTATION AND MARKETING
--KEY CHARACTERISTICS OF POICYHOLDERS WITH LOW FREQUENCIES AND HIGH HOUSEHOLD INCOME
WITH IncomeStats AS (
    SELECT AVG(household_income) AS average_income
    FROM Insurance
)

SELECT 
    Age,
    marital_status,
    car_use,
    gender,
    car_make, 
    car_model, 
    car_color,
    car_year,
    coverage_zone,
    SUM(household_income) AS total_income,
    SUM(claim_freq) AS total_claim_frequency
INTO
	Low_Claims_High_Income
FROM 
    Insurance
WHERE 
    household_income > (SELECT average_income FROM IncomeStats)
GROUP BY 
    Age,
    marital_status,
    car_use,
    gender,
    car_make, 
    car_model, 
    car_color,
    car_year,
    coverage_zone
ORDER BY 
    total_claim_frequency ASC;
--HIGH VALUED CUSTOMER SEGMENTATION
--BY DEMOGRAPHICS
SELECT
	Age,
	gender,
	marital_status,
	coverage_zone,
    SUM(claim_freq) AS TotalClaimFrequency,
	SUM(claim_amt) AS TOTALClaimAmount
INTO
	Demographic_Segment
FROM 
    Insurance
GROUP BY 
	Age,
	gender,
	marital_status,
	coverage_zone
ORDER BY 
    TotalClaimAmount DESC;
--BY CAR MODEL
SELECT
	car_model,
	car_year,
	SUM(claim_amt) TotalClaimsAmount
INTO
	Car_Segment
FROM Insurance
GROUP BY
	car_model,
	car_year
ORDER BY 
	TotalClaimsAmount DESC

--DEMOGRAPHIC ANALYSIS
SELECT 
    Age,
    marital_status,
    gender,
    SUM(claim_freq) AS total_claim_frequency,
	SUM(claim_amt) AS TotalClaims_Amount
INTO
	PolicyHoldersDistributionAcrossDemographs
FROM 
    Insurance
GROUP BY 
    Age,
    marital_status,
    gender
ORDER BY 
	 TotalClaims_Amount DESC;
----
	
	
	
    
--TRENDS IN CAR USAGE
SELECT 
    Age,
    marital_status,
	gender,
    car_use,
    coverage_zone,
    SUM(claim_freq) AS total_claim_frequency,
	SUM(claim_amt) AS TotalClaims_Amount
INTO
	Car_Segment
FROM 
    Insurance
GROUP BY 
    Age,
    marital_status,
    car_use,
    gender,
    car_make, 
    coverage_zone
ORDER BY 
   TotalClaims_Amount DESC;

--GEOGRAPHICAL ANALYSIS
SELECT
	coverage_zone,
	SUM(claim_freq) TotalClaim
INTO
	Regional_Trends
FROM Insurance
GROUP BY
	coverage_zone
ORDER BY
	TotalClaim

--CUSTOMER BEHAVIOR INSIGHTS
SELECT
	marital_status,
	COUNT(ID) NumberOfPolicyHolders,
	SUM(kids_driving) TotalKidsDriving,
	SUM(claim_freq) FrequencyOfClaims,
	SUM(claim_amt) TotalClaim
INTO
	Customer_Behavior_Insights
FROM Insurance
GROUP BY
	marital_status
ORDER BY 
	TotalClaim DESC;
	