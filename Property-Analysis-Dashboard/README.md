# NSW Property Market Analysis

## About the Project

This project analyses property median values across New South Wales using data from June 2017.

I built an end-to-end Business Intelligence solution using **SSIS, SQL Server and Power BI**. Raw property and location data was cleaned and loaded into a dimensional data warehouse using SSIS, then analysed and visualised in Power BI.

The analysed dataset contains **3,914 location-level records covering 3,839 suburbs**.

## Dashboard

The Power BI dashboard allows users to explore:

- Property median values across NSW
- Highest and lowest median values
- Property value categories
- Differences between suburbs
- Minimum and maximum values by city/location area
- Geographic distribution of property values
- Locations using an interactive map

## Key Numbers

- **3,914** location-level records analysed
- **3,839** suburbs represented
- **$3.21M** highest property median value
- **$95.5K** lowest property median value
- **4** property value categories

## Key Findings

Property values varied significantly across the locations in the dataset.

- **3,245 locations (82.9%)** had median values below **$750K**.
- **578 locations (14.8%)** were between **$750K and $1.5M**.
- **86 locations (2.2%)** were between **$1.5M and $2.5M**.
- Only **5 locations (0.13%)** had median values above **$2.5M**.
- Around **97.7%** of the analysed locations had median values below **$1.5M**.
- **Northbridge** had the highest median value in the dataset at approximately **$3.21M**.
- Other high-value suburbs included **Seaforth, Castle Cove, Roseville, Roseville Chase and Castlecrag**.
- Higher-value locations were mainly concentrated around the **Sydney metropolitan area**.

## Data Pipeline

The project follows an end-to-end BI process:

**Raw Excel Data → SSIS ETL → SQL Server → Dimensional Data Warehouse → SQL Reporting View → Power BI**

I used SSIS to load and transform the source data, SQL Server to store and model the data, and Power BI to analyse and visualise the results.

## Data Quality

During the analysis, I identified some unexpected geographic classifications in the source data.

I traced these records from the original Excel files through **SSIS, SQL Server and Power BI** to confirm where the values originated.

This helped verify that the classifications came from the source data rather than being introduced during the ETL process.

## Tools Used

- Power BI
- SQL Server
- SSIS
- SQL
- DAX
- Power Query
- Excel
- Dimensional Modelling

## Use of the Project

This dashboard can help users quickly understand:

- How property median values differ across NSW locations
- Which suburbs have higher or lower median values
- How locations are distributed across different price ranges
- Where higher-value property areas are geographically concentrated

The project demonstrates my ability to take raw data through the complete analytics process — from **ETL and data modelling to analysis, data validation and interactive reporting**.
