#  Splendor Analytics Insurance Data Analysis
## Project Pverview
This Repository contains the Data Analysis Report gotten from the analysis of the Splendor Analytics Insurance Dataset. In the end, the aim is to help the organisation with actionable insights which inturn would help the organisation provide better services while optimizing its profit.

---

## Table of Content
1. [Introduction](#introduction)
2. [Project Overview](#project_overview)
3. [Project Brief](#project_brief)
4. [Key Questions To Answer](#key-questions-to-answer)
5. [Data Dictionary](#Data_Dictionary)
6. [Data Analysis Procedure](#Data-Analysis-Procedure)
7. DashBoard/Report

---

## Introduction
Insurance is a financial product provided by insurance companies to safeguard individuals and entities against potential financial losses. These losses can arise from various unforeseen events such as accidents, natural disasters, theft, or health issues. In exchange for a premium paid by the policyholder, the insurance company commits to covering specific types of risks, thereby providing financial security and peace of mind.

## Project Overview
Splendor Analytics Insurance is a company specializing in offering a variety of insurance products to its customers. The company's portfolio includes auto insurance, which covers losses or damages related to vehicles. The provided dataset contains anonymized information about the policyholders, their vehicles, and their claim histories. The goal of this project is to analyze this dataset to uncover insights that can help Splendor Analytics Insurance improve its services, optimize premiums, and reduce claim costs.

## Splendor Analytics Insurance aims to enhance its auto insurance division by leveraging data analysis to:
- Identify patterns in claim frequencies and amounts.
- Understand the demographics and characteristics of high-risk and low-risk policyholders.
- Optimize premium pricing models based on risk factors.
- Develop targeted marketing strategies to attract and retain customers.

## Project Brief
You are tasked with analyzing the provided dataset to help Splendor Analytics Insurance achieve the above objectives. Your analysis should be thorough and provide actionable insights. Use any data analysis tool of your choice (e.g., Python, R, Excel, Tableau, SQL, Power BI etc) to conduct this analysis. The project should be completed within one week.

## Data Dictionary
### Policyholders Information Table

| **Column Name**      | **Description**                                              |
|----------------------|--------------------------------------------------------------|
| `ID`                 | Unique identifier for the policyholder                       |
| `birthdate`          | Birthdate of the policyholder                                |
| `marital_status`     | Marital status of the policyholder (Single, Married, etc.)    |
| `car_use`            | Purpose of car use (Private, Commercial)                     |
| `gender`             | Gender of the policyholder (Male, Female)                    |
| `kids_driving`       | Number of kids of the policyholder who are driving           |
| `parent`             | Whether the policyholder is a parent (Yes, No)               |
| `education`          | Education level of the policyholder (High School, Bachelors, etc.) |
| `car_make`           | Make of the policyholder's car                               |
| `car_model`          | Model of the policyholder's car                              |
| `car_color`          | Color of the policyholder's car                              |
| `car_year`           | Year of the policyholder's car                               |
| `claim_freq`         | Frequency of claims made by the policyholder                 |
| `coverage_zone`      | Area of coverage (Highly Urban, Urban, Suburban, Rural, Highly Rural) |
| `claim_amt`          | Amount claimed by the policyholder                           |
| `household_income`   | Household income of the policyholder                         |

## Data Analysis With SQL
1. Load the Data Into the Microsoft SQL Server
2. Preview the Data and Assign Primary Key couple with assignining and verifying the datatypes
   - ID column was seen to have had a duplicate which is a conflicting character of The Primary key column, hence we would load the data, find the reoccuring ID and Delete one or replace with another unique key
     ![image](https://github.com/user-attachments/assets/e1b753e0-8e2f-4c1d-a92c-460f0475f171)
   - Select Top 1000 Rows for cross examination.
     ![image](https://github.com/user-attachments/assets/345a5df9-367c-45a2-8482-7a1325cca317)
   - Data Wrangling
     1. Maintain Distinctive property of the Primary key column.
         - Check for the reoccuring ID column
         -  ![image](https://github.com/user-attachments/assets/3aa6cd67-01fb-435c-92d2-fe4ce88252f7)
         - Delete the second row of the reoccruing ID : ![image](https://github.com/user-attachments/assets/9a5fd6ae-f83d-455d-97f7-f3107d7833a1)
         - Assign the ID as The priamry key column. :
         - ![image](https://github.com/user-attachments/assets/94e35272-5c9c-4832-84e7-18c0bdbf2e02)
         - Age Column
         - The Age Column seems to be absent but we have the date of birth column, lets get the age from the date of birth
         - ![image](https://github.com/user-attachments/assets/38b6726f-ba3b-4998-8a26-cd549abfade5)
### Key Questions to Answer
1. Claim Frequency and Amount Analysis: 
- What are the average claim frequencies and amounts for different demographic groups (e.g., age, gender, marital status)?
- ![image](https://github.com/user-attachments/assets/077b6e33-d2bb-4870-9d02-bdcba3884f76)

- Are there any specific vehicle characteristics (e.g., make, model, year) that correlate with higher claim frequencies or amounts?
- ![image](https://github.com/user-attachments/assets/8aff780f-8d57-4819-9b84-8a045cff0447)

2. Risk Assessment
- Which factors (e.g., household income, education level, coverage zone) are most indicative of high-risk policyholders?
- ![image](https://github.com/user-attachments/assets/787cb42d-9080-4a0e-a0dd-662f07428776)

- Can we identify any common characteristics among policyholders who make frequent claims?
- ![image](https://github.com/user-attachments/assets/e309c6ef-f39c-4271-bb89-69343114b8a0)

3. Premium Optimization
- Premium Calculation
- ![image](https://github.com/user-attachments/assets/0aa2c998-b354-4276-a178-f9d713b9f057)
- How do current premium amounts relate to the risk profiles of policyholders?: The Higher The RIsk Profiles The Higher The Premium Amounts
- Can we recommend adjustments to the premium pricing model to better reflect risk levels and improve profitability?
  
4. Customer Segmentation and Marketing
- What are the key characteristics of policyholders with low claim frequencies and high household incomes?
- ![image](https://github.com/user-attachments/assets/b68e5066-04bf-4f00-8630-76de7edc4530)

- How can we segment the customer base to identify high-value customers for targeted marketing campaigns?
- Segmentation By Demographics
- ![image](https://github.com/user-attachments/assets/73beabb8-d9dd-4b5b-8656-ecee9265c689)
- Segmentation By Car Model
- ![image](https://github.com/user-attachments/assets/6f716da9-fe43-4332-b439-c9daa94da211)


5. Demographic Analysis
- How does the distribution of policyholders vary across different demographic factors (age, gender, marital status)?
- ![image](https://github.com/user-attachments/assets/a623a873-179b-4203-8742-1a1911031d7f)

- Are there any noticeable trends in car usage and ownership among different demographic groups?
- ![image](https://github.com/user-attachments/assets/9519da25-3ecd-4663-a8c3-ee14791b53ae)

6. Geographical Analysis
- How do claim frequencies and amounts vary across different coverage zones?
- ![image](https://github.com/user-attachments/assets/0dcc3e34-dc28-4b16-a2f2-1a84c3d0edc0)

- Are there any regional trends or patterns that should be taken into consideration for marketing or risk assessment?
7. Customer Behavior Insights
- Are there any trends or patterns in the behavior of policyholders who have children driving?
- How does the presence of children driving affect the frequency and number of claims?
- ![image](https://github.com/user-attachments/assets/3dab6190-4bcc-4371-85d7-8a78cc2652d2)
  
----

## DashBoard And Recommendation

-  Claim Frequency and Amount Analysis:
-  ![image](https://github.com/user-attachments/assets/8d2d3be3-953c-40c3-81e9-2bd15a9f629c)
-  ![image](https://github.com/user-attachments/assets/99b8c033-a0e1-4b56-b418-2d6a0aa30fc2)
-  Risk Assessment
-  ![image](https://github.com/user-attachments/assets/09e6a72b-042c-4b87-8c1c-3a094b4bd91a)
-  Customer Segmentation and Marketing
-  Low Claims PolicyHolders With High Income i.e House Hold Income Above Average ![image](https://github.com/user-attachments/assets/aabfabd1-055f-4102-b1f5-7036f3073cb0)
-  Customer Base Segmentation ![image](https://github.com/user-attachments/assets/20fa7c45-fe5d-4eb9-b961-1eb03686558d)
-  Demographic Analysis ![image](https://github.com/user-attachments/assets/b6e67e5a-7699-4c44-abf8-e9a4284d9d48)
-  Premium Analysis
   ![image](https://github.com/user-attachments/assets/3a215f8f-8fdb-49d6-ae79-dfc9ef72b8f1)
-  Customer Behavior Insights
   ![image](https://github.com/user-attachments/assets/50ae91b5-2a00-4ae5-93f5-fcfff90af889)
-  Total Figures
  ![image](https://github.com/user-attachments/assets/63f3bf2a-735b-4048-ac81-2eb2fb98e610)

## The Visualisation Communicates:

1. The Average Claim Frequencies and Amounts for the Various Demographic Groups

2. The characteristics of vehicles that have a relationship with high claim amounts and high claim frequencies

3. The Factors that are prominent amongst high risk policy holders.

4. The Common Characteristics of the Policy Holders with the most frequent claims.

5. The relationship between the premium amount and the high risk profiles.

6. Key Features of Policy Holders with Low Claim Frequency but High House Hold Income.

7. Customer Segmentation to identify high valued policy holders to aid marketing.

8. How policy holders are shared across different demo graphs.

9. Trends of Car Usage and Ownership amongst the demo graphs

10. Variation of claim frequency and amount across coverage zones taking into consideration the trends.

11. Trends in Policyholders who have children driving and how they affect the frequency of claims.



From My Experience working as an intern at NEM Insurance PLC, I was able to understand that High Claims Amounts is a character of High Risk Policy Holders, Having Said that, we can tell that there is a positive relationship between high risk policy holders, high claim amounts and high premiums.



Recommendations:
-- Thoroughly explore the dividends of the anaylsis for better marketing strategies

-- Base Rates Adjustment: A decrease in the base rate for premium calculation would cause a significant influx of policy holders as they would not need to pay as much as they would with this present rate, just like the inverse relationship between price and demand, the lower the price the higher the demand for that commodity.

-- Identify the Car Features and Usage with Higher claims and intensify marketing.

-- Based on Customer Segmentation, channel marketing efforts at prevailing features.

-- Identify trends in coverage zones, and increase marketing strategies in low zones.










   





