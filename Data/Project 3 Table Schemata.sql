-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/sKlOlU
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.



CREATE TABLE "aroma_list" (
    "tier_1" VARCHAR(50),
    "tier_2" VARCHAR(50),
	"tier_3" VARCHAR(50),
	"alt_name" VARCHAR(50)
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
);

CREATE TABLE "wine_words" (
	"ID" FLOAT,
    "wine" VARCHAR(100),
    "attribute" VARCHAR(50),
    "score" FLOAT,
    "price" FLOAT

);

CREATE TABLE "wine_count" (
    "attribute" VARCHAR(50),
    "tally" FLOAT
);

CREATE TABLE "wine_avg" (
    "attribute" VARCHAR(50),
    "avg_score" FLOAT,
    "avg_price" FLOAT
);


ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

