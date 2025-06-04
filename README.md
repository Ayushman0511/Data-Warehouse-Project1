# 📊Data-Warehouse-Project1

Welcome to the Data Warehouse and Analytics Project repository! 🚀
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it also highlights industry best practices in data engineering and analytics that I have learnt so far.


---
## 🏗️ Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:
![Data Architecture of DataWarehouse](docs/Architecture of DWH.png)

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

---
## 📖 Project Overview

This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

🎯 This repository is an excellent resource for professionals and students looking to showcase expertise in:
- SQL Development
- Data Architect
- Data Engineering  
- ETL Pipeline Developer  
- Data Modeling  
- Data Analytics  

---

## 🛠️ Important Links & Tools:

Everything is for Free!
- **[Datasets](dataset/):** Access to the project dataset (csv files).
- **[SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads):** Lightweight server for hosting your SQL database.
- **[SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16):** GUI for managing and interacting with databases.
- **[Git Repository](https://github.com/):** Set up a GitHub account and repository to manage, version, and collaborate on your code efficiently.
- **[DrawIO](https://www.drawio.com/):** Design data architecture, models, flows, and diagrams.
- **[Notion](https://www.notion.com/templates/sql-data-warehouse-project):** Get the Project Template from Notion
- **[Notion Project Steps]([https://thankful-pangolin-2ca.notion.site/SQL-Data-Warehouse-Project-16ed041640ef80489667cfe2f380b269?pvs=4](https://www.notion.so/Data-Warehouse-Project-20091951d87b8040a337ec3dfdcd0282?source=copy_link)):** Access to All Project Phases and Tasks.

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### BI: Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

## 📂 Repository Structure
```
data-warehouse-project/
│
├── dataset/                            # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── ETL.png                         # Draw.io file shows all different techniquies and methods of ETL
│   ├── Architecture of DWH.png         # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── Data_Flow.png                   # Draw.io file for the data flow diagram
│   ├── data_models.png                 # Draw.io file for data models (star schema)
│   ├── naming_conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
|   ├── init_database.sql               # Script to initialize the bronze, silver and gold schemas & database (`datawarehouse`).
│   ├── bronze/                         # Scripts for extracting and loading raw data
|       ├── ddl_bronze.sql              # Script that defimes the metadata(schema) for loading the files.
|       ├── procedure_load_bronze.sql   # Script that bulk-loads the data from the local device & provides debugging assist and execution time informations. 
│   ├── silver/                         # Scripts for cleaning and transforming data
|       ├── ddl_silver.sql              # Script that defimes the metadata(schema) for loading the files.
|       ├── procedure_load_silver.sql   # Script that transforms & cleans the data, then loads it from the bronze layer in to silver layer. Also provides debugging assist and execution time informations. 
│   ├── gold/                           # Scripts for creating analytical models
│       ├── ddl_gold.sql                # Script for creating views and provide analytical abilities for the data from silver layer.
|
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
```
---


## 🌟 About Me
Hi there! I'm Ayushman Bhargav. My field of interest include Internet of Things(IoT), Data Science and Machine Learning(AI/ML) , working towards upgrading my skills and knowledge through a combined learning of Theoretical Concepts as well as using practical projects to advance my learning.

Let's stay in touch! Feel free to connect with me via LinkedIn:
<p align="center">
  <a href="https://www.linkedin.com/in/yourprofile](https://www.linkedin.com/in/ayushman-bhargav-94a448279"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a>
</p>
