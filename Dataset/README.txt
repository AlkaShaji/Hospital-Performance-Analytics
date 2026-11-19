HOSPITAL PERFORMANCE ANALYTICS – BEGINNER STARTER DATASET

IMPORTANT
This is fully synthetic training data. It does not contain real patient records or real hospital information.
Reporting period: 1 January 2025 to 31 December 2025 (admission dates are in 2025).

FILES
1. patients.csv
   One row per synthetic patient.
   patient_id: unique patient key (example: P0001)
   age: patient age in years
   gender: synthetic category

2. departments.csv
   One row per hospital department.
   department_id: unique department key (example: D01)
   department_name: department label

3. admissions.csv
   One row per admission event (with a few intentional data-quality issues).
   admission_id: unique admission key (example: A00001)
   patient_id: links to patients.csv
   department_id: links to departments.csv
   admission_date: date of admission (YYYY-MM-DD)
   discharge_date: date of discharge; blank when the patient is still admitted
   admission_type: Emergency or Elective
   status: Discharged or Admitted

RELATIONSHIPS
- One patient can have multiple admissions.
- One department can be linked to many admissions.
- Each admission belongs to one patient and one department (after data cleaning).
- patient_id and department_id are linking keys; admission_id identifies an admission record.

INTENTIONAL DATA-QUALITY ISSUES IN admissions.csv
- One repeated admission row (duplicate admission_id).
- One blank department_id.
- One department_id value (D99) that is not present in departments.csv.
These are included so you can practise data-quality checks and cleaning in a later stage.
A blank discharge_date for status = Admitted is expected, not an error: the admission is ongoing.

PROJECT KPI DEFINITIONS
- Total Patients: COUNT(DISTINCT patient_id) among the admissions included in the report.
- Total Admissions: count of distinct admission_id after duplicate handling.
- Total Discharges: count of distinct admission_id where status = 'Discharged' and discharge_date is present.
- Department Performance: admissions and discharges grouped by department.
- Average Length of Stay (ALOS): average DATEDIFF(discharge_date, admission_date) for discharged admissions with valid dates.

Use this dataset for learning only. Do not interpret it as real clinical or hospital performance data.
