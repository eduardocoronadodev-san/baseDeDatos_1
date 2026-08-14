CREATE DATABASE empresa_ejemplo_2;
GO

USE empresa_ejemplo_2;
GO

CREATE TABLE employee(
    num_employee INT NOT NULL IDENTITY (1,1)
    CONSTRAINT pk_employee
    PRIMARY KEY,

    ssn VARCHAR (20) NOT NULL
    CONSTRAINT uq_employee_ssn
    UNIQUE,

    firstname VARCHAR (50) NOT NULL,

    lastname VARCHAR(50) NOT NULL,

    bdate DATE NOT NULL,

    address VARCHAR (150) NOT NULL,

    salary DECIMAL (10, 2) NOT NULL
    CONSTRAINT ck_employee_salary
    CHECK (salary > 0),

    sex CHAR (1) NOT NULL,

    number_project INT NULL,

    jefe INT NULL
);
GO

CREATE TABLE dependent (
    number_dependent INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_dependent
    PRIMARY KEY,

    name VARCHAR(100) NOT NULL,

    number_employ INT NOT NULL
    CONSTRAINT fk_dependent_employee
    REFERENCES employee (num_employee),

    sex CHAR(1) NOT NULL,

    bdate DATE NOT NULL,

    relationship VARCHAR(50) NOT NULL
);
GO

CREATE TABLE project (
    number_project INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_project
    PRIMARY KEY,

    number_dependent INT NULL
    CONSTRAINT fk_project_dependent
    REFERENCES dependent (number_dependent),

    location VARCHAR(100) NOT NULL
);
GO

ALTER TABLE employee
ADD CONSTRAINT fk_employee_project
FOREIGN KEY (number_project)
REFERENCES project (number_project);
GO

ALTER TABLE employee
ADD CONSTRAINT fk_employee_jefe
FOREIGN KEY (jefe)
REFERENCES employee (num_employee);
GO


CREATE TABLE department (
    manager INT NOT NULL,

    number INT NOT NULL,

    name VARCHAR(100) NOT NULL,

    start_date DATE NOT NULL,

    CONSTRAINT pk_department
    PRIMARY KEY (number),

    CONSTRAINT uq_department_manager
    UNIQUE (manager),

    CONSTRAINT fk_department_manager
    FOREIGN KEY (manager)
    REFERENCES employee (num_employee)
);
GO


CREATE TABLE locations (
    num_location INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_locations
    PRIMARY KEY,

    num_department INT NOT NULL
    CONSTRAINT fk_locations_department
    REFERENCES department (number),

    location VARCHAR(100) NOT NULL
);
GO

CREATE TABLE work_on (
    num_employ INT NOT NULL,

    number_project INT NOT NULL,

    hours DECIMAL(5,2) NOT NULL,

    CONSTRAINT pk_work_on
    PRIMARY KEY (num_employ, number_project),

    CONSTRAINT ck_work_on_hours
    CHECK (hours >= 0),

    CONSTRAINT fk_work_on_employee
    FOREIGN KEY (num_employ)
    REFERENCES employee (num_employee),

    CONSTRAINT fk_work_on_project
    FOREIGN KEY (number_project)
    REFERENCES project (number_project)
);
GO