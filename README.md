# 365-careers-MySQL-course-Project

This project was from Udemy Course - _Microsoft Excel: Advanced Excel Formulas & Functions_

# Advanced Excel Formulas & Functions Project

## Situation
You’ve just been hired as a Business Intelligence Analyst for **Maven Recruiters**, a job placement agency based in the United States.

## Brief
Your first task is to analyze a public dataset from Glassdoor, which tracks average salaries and growth rates across a range of industries and job titles. Your goal is to use dynamic array formulas in Excel to explore the job landscape, compare salary expectations, and identify high growth opportunities for the agency.

## Objective
• Identify top industries by salary and growth rate

• Review average job salaries by job titles by Industry 

• Visualize the overall salary distribution

• Compare average job salaries across top US cities

_Raw data: Has 5 columns_

<kbd>![image](https://github.com/Sakinahcr/Maven-Analytics-Excel-Project/assets/132161850/44230e4d-ae79-486a-afb0-4168f8829da5)


### 1. Identify top industries by salary and growth rate

From the raw data, to identify the top industries by salary and growth rate, I nested the UNIQUE and SORTBY functions. Then to determine the average salary and growth by the job Industry, I use AVERAGEIFS function.

<kbd>![image](https://github.com/Sakinahcr/Maven-Analytics-Excel-Project/assets/132161850/8de509d7-c875-46b2-8cef-9af61c9cd2e6)

__Finding:_ Law is the top industry with average salary of $93,394.70 and average growth rate of 1.50%_

### 2. Review average job salaries by job titles by Industry 

To list down the average job salaries by job title by industry with dynamic view, I nested FILTER, UNIQUE and SORT functions. 

<kbd>![image](https://github.com/Sakinahcr/Maven-Analytics-Excel-Project/assets/132161850/902e954b-31f0-4f67-9749-af9d53b3f7e9)

### 3. Visualize the overall salary distribution 

To visualize salary distribution, I use SEQUENCE and FREQUENCY functions.

<kbd>![image](https://github.com/Sakinahcr/Maven-Analytics-Excel-Project/assets/132161850/d7962c77-9603-46f4-bd6a-f75633127870)

__Finding:_ Most salary are between $60,000.00 to $90,000.00_

### 4. Compare average job salaries across top US cities 

To make the pivot header, I use the TRANSPOSE function in addition to SORT function, so the cities are sorted alphabetically. The top 10 salary in Technology Industry is highlighted in blue by using CONDITIONAL FORMATTING.

<kbd>![image](https://github.com/Sakinahcr/Maven-Analytics-Excel-Project/assets/132161850/4b7b23ff-6114-4277-846e-b9c5489e8a75)

__Finding:_ Most high salary in technology Industry is mostly from San Fransisco City._


# Extra

All these objectives can be achieved easily by using pivot table as shown below:

### 1. Identify top industries by salary and growth rate


<kbd>![image](https://github.com/Sakinahcr/Maven-Analytics-Excel-Project/assets/132161850/fa63e0a7-9850-4d78-965e-3c9234ea69c3)

### 2. Review average job salaries by job titles by Industry 


<kbd>![image](https://github.com/Sakinahcr/Maven-Analytics-Excel-Project/assets/132161850/9294965e-477c-4789-a022-0a22a5b2e90e)

### 3. Visualize the overall salary distribution 


<kbd>![image](https://github.com/Sakinahcr/Maven-Analytics-Excel-Project/assets/132161850/07c7e1a9-f7f8-4537-ab3d-73e4e4234a2c)

### 4. Compare average job salaries across top US cities


<kbd>![image](https://github.com/Sakinahcr/Maven-Analytics-Excel-Project/assets/132161850/4a2cb820-f3ef-4096-9226-dd578aa68b51)


