create database shivatestdb;
use shivatestdb;
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    status ENUM('Active', 'On Leave', 'Resigned') DEFAULT 'Active'
);
INSERT INTO employees (first_name, last_name, email, department, salary, hire_date, status) VALUES
('John', 'Doe', 'john.doe@company.com', 'IT', 65000.00, '2020-03-15', 'Active'),
('Jane', 'Smith', 'jane.smith@company.com', 'HR', 58000.00, '2019-07-01', 'Active'),
('Michael', 'Brown', 'michael.brown@company.com', 'Finance', 72000.00, '2018-11-20', 'On Leave'),
('Emily', 'Davis', 'emily.davis@company.com', 'Marketing', 60000.00, '2021-01-10', 'Active'),
('Robert', 'Wilson', 'robert.wilson@company.com', 'IT', 80000.00, '2017-05-05', 'Resigned'),
('Sophia', 'Taylor', 'sophia.taylor@company.com', 'Sales', 55000.00, '2022-06-18', 'Active'),
('Daniel', 'Anderson', 'daniel.anderson@company.com', 'Finance', 69000.00, '2020-09-30', 'Active'),
('Olivia', 'Thomas', 'olivia.thomas@company.com', 'HR', 57000.00, '2019-02-14', 'Active');