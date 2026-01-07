# Data Catalog

This catalog is auto-generated from the files in `Sample_Sets/`.
It summarizes dataset structure and is intended to support transparency,
validation, and downstream analytics.

---

## car_sales_data_sample_one.csv

**Rows:** 2,823  
**Columns:** 25  

**Columns:**
- ORDERNUMBER
- QUANTITYORDERED
- PRICEEACH
- ORDERLINENUMBER
- SALES
- ORDERDATE
- STATUS
- QTR_ID
- MONTH_ID
- YEAR_ID
- PRODUCTLINE
- MSRP
- PRODUCTCODE
- CUSTOMERNAME
- PHONE
- ADDRESSLINE1
- ADDRESSLINE2
- CITY
- STATE
- POSTALCODE
- COUNTRY
- TERRITORY
- CONTACTLASTNAME
- CONTACTFIRSTNAME
- DEALSIZE

**Notes:**
- Transaction-level sales data
- One row per order line

---

## car_sales_data_sample.xlsx

**Rows:** 2,823  
**Columns:** 26  

**Columns:**
- ORDERNUMBER
- QUANTITYORDERED
- PRICEEACH
- ORDERLINENUMBER
- SALES
- ORDERDATE
- STATUS
- Classic Cars
- QTR_ID
- MONTH_ID
- YEAR_ID
- PRODUCTLINE
- MSRP
- PRODUCTCODE
- CUSTOMERNAME
- PHONE
- ADDRESSLINE1
- ADDRESSLINE2
- CITY
- STATE
- POSTALCODE
- COUNTRY
- TERRITORY
- CONTACTLASTNAME
- CONTACTFIRSTNAME
- DEALSIZE

**Notes:**
- Excel variant of car sales data
- Includes an additional categorical column

---

## Energy data.xlsx

**Rows:** 3,472  
**Columns:** 3  

**Columns:**
- Country
- year
- Energy use (kg of oil equivalent per capita)

**Notes:**
- World Bank–style panel data
- One row per country-year

---

## gdptotal.xlsx

**Rows:** 3,472  
**Columns:** 3  

**Columns:**
- country
- year
- current GDP

**Notes:**
- Country-year GDP totals
- Intended for joins with energy and population data

---

## totalpopulation.xlsx

**Rows:** 3,472  
**Columns:** 3  

**Columns:**
- Country
- Year
- Population Total

**Notes:**
- Country-year population totals

---

## date.xlsx

**Rows:** 1  
**Columns:** 2  

**Columns:**
- Start_Date
- End_Date

**Notes:**
- Reference date range table
