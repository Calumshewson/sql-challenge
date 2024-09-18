--Title Table
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

--Employees Table
CREATE TABLE Employees (
    emp_no SERIAL PRIMARY KEY,
    emp_title_id VARCHAR(10) REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

--Departments Table
CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

--Department Manager Table
CREATE TABLE dept_manager (
    dept_no VARCHAR(10) REFERENCES departments(dept_no),
    emp_no INT REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no, emp_no)
);

--Junction Table
CREATE TABLE dept_emp (
    emp_no INT REFERENCES employees(emp_no),
    dept_no VARCHAR(10) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

--Salaries Table
CREATE TABLE salaries (
    emp_no INT REFERENCES employees(emp_no),
    salary DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (emp_no)
);
