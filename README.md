#  Splendor-Analytics-Insurance-Data-Analysis-
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
### Key Questions to Answer
1. Claim Frequency and Amount Analysis: 
- What are the average claim frequencies and amounts for different demographic groups (e.g., age, gender, marital status)?
- Are there any specific vehicle characteristics (e.g., make, model, year) that correlate with higher claim frequencies or amounts?
2. Risk Assessment
- Which factors (e.g., household income, education level, coverage zone) are most indicative of high-risk policyholders?
- Can we identify any common characteristics among policyholders who make frequent claims?
3. Premium Optimization
- How do current premium amounts relate to the risk profiles of policyholders?
- Can we recommend adjustments to the premium pricing model to better reflect risk levels and improve profitability?
4. Customer Segmentation and Marketing
- What are the key characteristics of policyholders with low claim frequencies and high household incomes?
- How can we segment the customer base to identify high-value customers for targeted marketing campaigns?
5. Demographic Analysis
- How does the distribution of policyholders vary across different demographic factors (age, gender, marital status)?
- Are there any noticeable trends in car usage and ownership among different demographic groups?
6. Geographical Analysis
- How do claim frequencies and amounts vary across different coverage zones?
- Are there any regional trends or patterns that should be taken into consideration for marketing or risk assessment?
7. Customer Behavior Insights
- Are there any trends or patterns in the behavior of policyholders who have children driving?
- How does the presence of children driving affect the frequency and number of claims?

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
   - ID column
