Data Cleaning Report – Hospital Performance Analytics

1. Project Overview
The hospital admission dataset was cleaned and validated before performing SQL analysis and developing the Power BI dashboard.

2. Data Cleaning Process

Removed duplicate records.
Checked missing values.
Replaced missing department IDs with `UNKNOWN`.
Identified and corrected invalid department IDs.
Validated admission and discharge dates.
Checked admission status values.
Reviewed the dataset for data quality issues.

3. Data Validation


Validation	Result
Records after duplicate removal	600
Invalid dates	0
Invalid status records 	0
Missing department IDs	Handled using `UNKNOWN`
Invalid department IDs	Corrected
Final dataset records	600


4. Final Dataset
The cleaned dataset was saved as `admissions_final.csv` with 600 records and 7 original columns.

5. Outcome
The cleaned dataset was used for MySQL database creation, SQL analysis and Power BI dashboard development.

Tools Used: Microsoft Excel, MySQL, SQL, Power BI
