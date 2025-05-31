/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the 'silver' layer. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ====================================================================
-- Checking 'silver.crm_cust_info'
-- ====================================================================

-- Check for NULLS or Duplicates in Primary Key
-- Expectation: No Result generated from the querry

SELECT
	cst_id,
	COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 AND cst_id IS NULL;


-- Check for unwanted spaces
-- Expectation: No Result generated from the querry

SELECT 
	CST_FIRSTNAME
FROM silver.CRM_CUST_INFO
WHERE CST_FIRSTNAME != TRIM(CST_FIRSTNAME);

-- Check for Data Standardization & Consistency
-- Expectation: No Result generated from the querry

SELECT 
	DISTINCT cst_gndr
FROM silver.crm_cust_info;

SELECT * FROM silver.crm_cust_info;

--==============================================================================
-- Checking 'silver.crm_prd_info'
-- ====================================================================

-- Check for NULLS or Duplicates in Primary Key
-- Expectation: No Result generated from the querry

SELECT
	prd_id,
	COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 AND prd_id IS NULL;


-- Check for unwanted spaces
-- Expectation: No Result generated from the querry

SELECT 
	prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Check for NULLs or Negative Number
-- Expectation: No Result generated from the querry

SELECT 
	prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;


-- Check for Data Standardization & Consistency
-- Expectation: No Result generated from the querry

SELECT 
	DISTINCT prd_line
FROM silver.crm_prd_info;

-- Check for Invalid Date Orders (Start Date > End Date)
-- Expectation: No Result generated from the querry

SELECT 
	* 
FROM silver.crm_prd_info
where prd_end_dt < prd_start_dt;

SELECT * FROM silver.crm_prd_info;


--=============================================================================
-- Checking 'silver.crm_sales_details'
-- ====================================================================

-- Check for Invalid Dates
-- Expectation: No Result generated from the querry

SELECT 
	NULLIF(sls_due_dt, 0) sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0 
	OR LEN(sls_due_dt) != 8 
	OR sls_due_dt > 20500101 
	OR sls_due_dt < 19000101;


-- Check for Invalid Dates Orders (Order Date > Shipping/Due Dates)
-- Expectation: No Result generated from the querry

SELECT
	*
FROM silver.crm_sales_details
WHERE sls_order_dt>sls_ship_dt
	OR sls_order_dt> sls_due_dt;

-- Check Data Consistency: Between Sales, Quantity, and Price
-- >> Sales = Quantity * Price
-- >> Values must not be NULL, Zero, or Negative

SELECT DISTINCT
	sls_sales,
	sls_quantity ,
	sls_price
FROM bronze.crm_sales_details
WHERE sls_sales != sls_quantity*sls_price
	OR sls_sales IS NULL 
	OR sls_quantity IS NULL 
	OR sls_price IS NULL
	OR sls_sales <= 0 
	OR sls_quantity <= 0 
	OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;

SELECT * FROM silver.crm_sales_details;

--=============================================================================
-- Checking 'silver.erp_cust_az12'
-- ====================================================================

--Identifying Out-of-Rang Dates
-- Expectation: Birthdates between 1924-01-01 and Today

SELECT DISTINCT 
	bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' 
	OR bdate > GETDATE();


-- Check for Data Standardization & Consistency
-- Expectation: No Result generated from the querry

SELECT 
	DISTINCT gen
FROM silver.erp_cust_az12;

SELECT * FROM silver.erp_cust_az12;

--=============================================================================
-- Checking 'silver.erp_loc_a101'
-- ====================================================================

-- Check for Data Standardization & Consistency
-- Expectation: No Result generated from the querry

SELECT 
	DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry;

SELECT * FROM silver.erp_loc_a101;

--=============================================================================
-- Checking 'silver.erp_px_cat_g1v2'
-- ====================================================================

-- Check for unwanted spaces
-- Expectation: No Result generated from the querry

SELECT 
    * 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);


-- Check for Data Standardization & Consistency
-- Expectation: No Result generated from the querry

SELECT 
	DISTINCT maintenance
FROM bronze.erp_px_cat_g1v2;

SELECT * FROM silver.erp_px_cat_g1v2;
