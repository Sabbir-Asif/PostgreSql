
## Creating a Table in PostgreSQL with Real-Life Examples

Creating a table in PostgreSQL might seem simple at first glance, but it becomes more interesting and powerful when you start using different data types and constraints. In this post, we'll walk through how to create a table for a real-world use case, explore various data types, and apply constraints to keep our data accurate and reliable.

## Real-Life Example: Employee Management

Let’s imagine we're building a basic employee management system for a company. We need to store information about employees such as their name, email, date of birth, salary, and whether they’re currently active in the company.

To do that, we’ll create a table called `employees`.

## Table Structure

Here's what we want to capture:

- `id`: A unique identifier for each employee
- `full_name`: The employee’s full name
- `email`: Their email address (must be unique)
- `date_of_birth`: Their birth date
- `salary`: Their salary (should not be negative)
- `is_active`: Whether the employee is currently working at the company

## SQL to Create the Table

```sql
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    salary NUMERIC(10, 2) CHECK (salary >= 0),
    is_active BOOLEAN DEFAULT TRUE
);
````

## Explanation of Data Types and Constraints

Let’s break down what each part means:

### `id SERIAL PRIMARY KEY`

* `SERIAL` automatically generates a unique number for each row.
* `PRIMARY KEY` ensures this column uniquely identifies each employee.

### `full_name VARCHAR(100) NOT NULL`

* `VARCHAR(100)` allows names up to 100 characters.
* `NOT NULL` means the name must be provided.

### `email VARCHAR(255) UNIQUE NOT NULL`

* `UNIQUE` ensures no two employees can have the same email.
* `NOT NULL` enforces that every employee must have an email address.

### `date_of_birth DATE NOT NULL`

* `DATE` is used to store calendar dates.
* Again, `NOT NULL` ensures we must provide a birth date.

### `salary NUMERIC(10, 2) CHECK (salary >= 0)`

* `NUMERIC(10, 2)` allows up to 10 digits total, with 2 after the decimal.
* The `CHECK` constraint prevents negative salaries.

### `is_active BOOLEAN DEFAULT TRUE`

* `BOOLEAN` stores true/false values.
* `DEFAULT TRUE` assumes an employee is active unless stated otherwise.

## Inserting Sample Data

Let’s insert a few employees:

```sql
INSERT INTO employees (full_name, email, date_of_birth, salary)
VALUES
  ('Alice Johnson', 'alice@example.com', '1990-05-10', 65000.00),
  ('Bob Smith', 'bob@example.com', '1985-11-20', 72000.00);
```

Note: We didn’t include `is_active` or `id` because they’ll automatically be set (default and serial).

## Trying to Break Constraints

Let’s see what happens when we violate a constraint:

### 1. Inserting a negative salary

```sql
INSERT INTO employees (full_name, email, date_of_birth, salary)
VALUES ('Charlie Doe', 'charlie@example.com', '1992-03-15', -5000.00);
```

**Error:**

```
ERROR:  new row for relation "employees" violates check constraint "employees_salary_check"
```

### 2. Using a duplicate email

```sql
INSERT INTO employees (full_name, email, date_of_birth, salary)
VALUES ('David Lee', 'alice@example.com', '1988-08-08', 60000.00);
```

**Error:**

```
ERROR:  duplicate key value violates unique constraint "employees_email_key"
```

