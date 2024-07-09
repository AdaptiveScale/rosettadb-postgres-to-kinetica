# PostgreSQL to Kinetica Synchronization
======================================

This project provides a streamlined process for synchronizing schema and data from PostgreSQL to Kinetica using GitHub Actions. The synchronization process is performed in three steps: Schema Migration using RosettaDB, Data Load using KiSQL, and Data Quality Check using RosettaDB.

## Steps Performed by the Project
------------------------------

1.  **Schema Migration**: This step identifies and applies schema changes (deltas) from PostgreSQL to Kinetica.
2.  **Data Load**: The data from PostgreSQL is loaded into Kinetica using KiSQL.
3.  **Data Quality Check**: After loading, RosettaDB is used to perform data quality checks to ensure the integrity and accuracy of the data.

How to Use This Project
-----------------------

### 1\. Fork the Project

First, fork this repository to your GitHub account.

### 2\. Update Repository Secrets and Variables

To use this project in your environment, update the repository secrets and variables in your GitHub repository settings. The following secrets and variables need to be set:

-   `POSTGRES_HOST`: The hostname of your PostgreSQL server.
-   `POSTGRES_DB`: The name of your PostgreSQL database.
-   `POSTGRES_USER`: The username for accessing your PostgreSQL database.
-   `POSTGRES_PASSWORD`: The password for accessing your PostgreSQL database.
-   `SOURCE_SCHEMA`: The schema for the PostgresDB
-   `KINETICA_URL`: The URL of your Kinetica server.
-   `KINETICA_USER`: The username for accessing your Kinetica database.
-   `KINETICA_PASSWORD`: The password for accessing your Kinetica database.
-   `KINETICA_DB`: The name of your Kinetica database.
-   `GITHUBTOKEN`: The github token that has permission to your repo.

### 3\. Run the Pipeline through GitHub Actions

Once the repository secrets and variables are set, you can run the pipeline through GitHub Actions:

1.  Go to the **Actions** tab in your GitHub repository.
2.  Select the workflow you want to run.
3.  Click on **Run workflow** to start the synchronization process.

Project Structure
-----------------

The project contains the following components:

-   **rosetta**: Contains the RosettaDB scripts and configuration.
-   **jdbc-drivers**: Directory with the required JDBC drivers for PostgreSQL and Kinetica.
-   **kisql**: Directory with KiSQL scripts for loading data into Kinetica.
-   **custom-translation-file**: Custom translation file used during the schema migration.
-   **tests**: Contains CSV files for performing data quality checks.

Prerequisites
-------------

-   GitHub account
-   PostgreSQL database
-   Kinetica database
-   RosettaDB
-   Kinetica, KiSQL
-   Basic knowledge of GitHub Actions