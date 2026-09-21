
# NSW Property Market Analysis Dashboard

## Project Overview

This project analyses property median values across cities and suburbs in New South Wales, Australia.

I built an end-to-end BI solution that takes raw property and location data through ETL, data warehousing, and reporting. The final Power BI dashboard makes it easy to compare median property values across different locations, explore property value categories, and view their geographic distribution.

## Business Objective

The aim of the project was to turn raw property and location data into useful information that could help users understand differences in property values across New South Wales.

The dashboard helps answer questions such as:

- Which cities have the highest and lowest property median values?
- How do property median values differ across suburbs?
- How are locations distributed across different property value categories?
- Where are different property value categories located geographically?

## Data

The analysis uses NSW property median value data together with Australian location data.

The final reporting dataset contains information such as:

- State
- City
- Suburb
- Postcode
- Latitude
- Longitude
- Property median value
- Property value category
- Updated year
- Updated month

The dashboard represents property median value data for **June 2017**.

## Data Engineering

I used SSIS and SQL Server to prepare the data before using it in Power BI.

The workflow included:

1. Loading the raw property and location datasets into SQL Server staging tables.
2. Exploring and validating the source data using SQL.
3. Cleaning and transforming the data.
4. Creating property value categories during the ETL process.
5. Loading the transformed data into a dimensional data warehouse.
6. Creating SQL views to prepare analysis-ready data for Power BI.
7. Connecting Power BI to the prepared reporting data.

### Property Value Categories

Property median values were grouped into four categories:

- 0–750K
- 750K–1.5M
- 1.5M–2.5M
- 2.5M+

## Data Model

The data warehouse was designed using a dimensional modelling approach.

The main components used for the property analysis include:

- **DimLocation** – stores location information such as state, city, suburb, postcode, latitude, and longitude.
- **DimCategory** – stores the property value categories.
- **FactProperty** – stores property median values together with location, category, year, and month information.
- **vw_PropertyAnalysis** – combines the required property, location, and category information into an analysis-ready dataset used in Power BI.

## Power BI Dashboard

The Power BI dashboard provides an interactive view of property median values across New South Wales.

The dashboard includes:

- Highest property median value
- Lowest property median value
- Total suburbs
- Property median value comparison by city
- Property median values across suburbs
- Property value category distribution
- Geographic mapping using latitude and longitude
- Interactive city filtering

## Dashboard

![NSW Property Market Analysis Dashboard](Property-Analysis-Dashboard.png)

## Tools & Technologies

- Power BI
- SQL Server
- SQL
- SQL Server Integration Services (SSIS)
- Visual Studio
- ETL
- Data Warehousing
- Dimensional Modelling
- Data Visualisation

## Project Workflow

```text
Raw Property & Location Data
          |
      SSIS ETL
          |
SQL Server Staging Tables
          |
Data Cleaning & Transformation
          |
Dimensional Data Warehouse
          |
SQL Reporting View
          |
       Power BI
          
Interactive Property Analysis Dashboard
```

## Key Skills Demonstrated

This project demonstrates practical experience in:

- Building ETL pipelines using SSIS
- Working with Excel-based source data
- Writing SQL for data exploration, transformation, and validation
- Designing fact and dimension tables
- Building a SQL Server data warehouse
- Creating reusable SQL views for reporting
- Connecting Power BI to prepared analytical data
- Building interactive Power BI visualisations
- Analysing data across geographic levels
- Presenting data through clear business-focused dashboards
