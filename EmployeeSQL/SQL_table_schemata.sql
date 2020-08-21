
CREATE TABLE Departments (
    dept_num varchar(35)   NOT NULL,
    dept_name varchar(35)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (dept_num)
);

CREATE TABLE Dept_employ (
    employ_num int   NOT NULL,
    dept_num varchar(35)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

CREATE TABLE Dept_manager (
    dept_num varchar(35)   NOT NULL,
    employ_num int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

CREATE TABLE Salaries (
    employ_num int   NOT NULL,
    salary int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

CREATE TABLE Titles (
    employ_num int   NOT NULL,
    title varchar(35)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

CREATE TABLE Employees (
    employ_num int   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(35)   NOT NULL,
    last_name varchar(35)   NOT NULL,
    gender varchar(1)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (employ_num)
);

ALTER TABLE Dept_employ ADD CONSTRAINT fk_Dept_employ_num FOREIGN KEY(employ_num)
REFERENCES Employees (employ_num);

ALTER TABLE Dept_employ ADD CONSTRAINT fk_Dept_employ_dept_num FOREIGN KEY(dept_num)
REFERENCES Departments (dept_num);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_dept_num FOREIGN KEY(dept_num)
REFERENCES Departments (dept_num);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_employ_num FOREIGN KEY(employ_num)
REFERENCES Employees (employ_num);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_employ_num FOREIGN KEY(employ_num)
REFERENCES Employees (employ_num);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_employ_num FOREIGN KEY(employ_num)
REFERENCES Employees (employ_num)