# Ejercicio 5

## Company Database Requirements

### 1. Departments

The company is organized into **departments**.

> **Each department has:**
>
> - A unique name
> - A unique number
> - A particular employee who manages the department
> - The start date when that employee began managing the department
> - Several possible locations

> A department may have several locations.

---

### 2. Projects

A department controls a number of **projects**.

> **Each project has:**
>
> - A unique name
> - A unique number
> - A single location

---

### 3. Employees

> **We store each employee’s:**
>
> - Name
> - Social Security number
> - Address
> - Salary
> - Sex / gender
> - Birth date

An employee is assigned to **one department**, but may work on **several projects**.

These projects are not necessarily controlled by the same department to which the employee belongs.

> **We also keep track of:**
>
> - The current number of hours per week that an employee works on each project
> - The direct supervisor of each employee

The direct supervisor is another employee.

---

### 4. Dependents

We want to keep track of the **dependents** of each employee for insurance purposes.

> **For each dependent, we keep:**
>
> - First name
> - Sex
> - Birth date
> - Relationship to the employee

![Imagen diagrama 5](../../img/ER/ejercicio5BaseDatos.drawio.png)
