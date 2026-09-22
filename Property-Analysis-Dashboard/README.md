# NSW Property Market Analysis Dashboard

## Overview

An end-to-end Business Intelligence project analysing property median values across New South Wales using data from June 2017.

The project transforms raw property and location datasets through an ETL and data warehousing pipeline and presents the results in an interactive Power BI dashboard.

The analysis covers **3,914 location-level property median records** representing **3,839 suburbs**, with median values ranging from approximately **$95.5K to $3.21M**.

## Technology Stack

- Power BI
- SQL Server
- SQL Server Integration Services (SSIS)
- DAX
- Power Query
- Dimensional Modelling
- Excel

## Data Pipeline

Raw Property & Location Data  
→ SSIS ETL  
→ SQL Server Staging Tables  
→ Dimensional Data Warehouse  
→ SQL Reporting View  
→ Power BI Dashboard

Two SSIS packages were used to manage the ETL process:

- `Load_Raw_Data.dtsx` – extracts the source data and loads the staging tables.
- `Load_DW_Data.dtsx` – transforms and loads the dimensional data warehouse.

A SQL reporting view, `vw_PropertyAnalysis`, provides the analytical dataset used by Power BI.

## Data Model

The SQL Server data warehouse was designed using dimensional modelling principles.

The main components include:

- `DimLocation`
- `DimCategory`
- `FactProperty`

Location information includes suburb, postcode, city/location area, state, latitude and longitude, enabling both geographic and location-based analysis.

## Dashboard

The Power BI dashboard provides:

- Highest and lowest property median values
- Total suburbs represented
- Property median value distribution
- Geographic distribution of property-value categories
- Suburb-level property median analysis
- Minimum and maximum values by city/location area
- Interactive location filtering

## Key Findings

### Property Value Distribution

The dataset contains **3,914 location-level records** across four property median value categories:

| Property Median Value | Locations | Share |
|---|---:|---:|
| $0–$750K | 3,245 | 82.91% |
| $750K–$1.5M | 578 | 14.77% |
| $1.5M–$2.5M | 86 | 2.20% |
| $2.5M+ | 5 | 0.13% |

Approximately **97.7% of analysed locations had property median values below $1.5M**, while only about **2.3% exceeded $1.5M**.

### Property Value Range

Across the dataset:

- **Highest property median value:** $3.21M
- **Lowest property median value:** $95.5K
- **Suburbs represented:** 3,839

This demonstrates substantial variation in property median values across NSW locations.

### Highest-Value Suburbs

**Northbridge** recorded the highest median value in the dataset at **$3.21M**.

Other high-value suburbs included:

- Seaforth – $2.656M
- Castle Cove – $2.510M
- Roseville – $2.510M
- Roseville Chase – $2.510M
- Castlecrag – $2.273M

The highest-value locations were concentrated predominantly around the Sydney metropolitan area.

### Geographic Analysis

Latitude and longitude were used to map property median value categories across New South Wales.

The map shows that most analysed locations fall within the **$0–$750K** category, while higher-value locations are more geographically concentrated, particularly around Sydney.

### City / Location Area Analysis

The dashboard compares the minimum and maximum location-level property median values within each city/location-area grouping.

Sydney showed the widest range in the dataset:

- **Minimum:** $95.5K
- **Maximum:** $3.21M

This analysis highlights the substantial variation that can exist between suburbs within the same broader geographic area.

## Data Quality & Validation

Data quality checks were performed throughout the project to validate geographic classifications and ensure that values were correctly transferred through the ETL pipeline.

During validation, some NSW suburbs appeared under unexpected city/location-area classifications. These records were traced through:

**Original Excel Source -> SSIS -> Staging Tables -> Dimensional Warehouse -> Reporting View -> Power BI**

The investigation confirmed that these classifications originated in the supplied source data and were not introduced by the SSIS transformation or warehouse-loading process.

This validation helped preserve source-data integrity while ensuring that geographic fields were interpreted appropriately in the dashboard.

## Skills Demonstrated

- ETL development with SSIS
- SQL querying and data transformation
- SQL Server data warehousing
- Dimensional data modelling
- Power BI dashboard development
- DAX measures
- Power Query
- Data visualisation
- Geographic analysis
- Data quality validation
- Data lineage and root-cause analysis

## Project Outcome

Developed an end-to-end BI solution that transformed raw property and location datasets into a structured analytical model and interactive Power BI dashboard.

The project demonstrates the complete analytics workflow from **data ingestion and transformation through data modelling, validation, analysis and business-focused visualisation**.
