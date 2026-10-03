-- Employee Management Database - sample data
INSERT INTO departments (dept_name, location) VALUES
 ('IT',        'Dhaka'),
 ('HR',        'Khulna'),
 ('Finance',   'Dhaka'),
 ('Marketing', 'Chattogram');

INSERT INTO employees (fname, lname, dept_id, hire_date, salary) VALUES
 ('Rahim',  'Uddin',   1, '2023-01-10', 75000),
 ('Karim',  'Hossain', 1, '2023-05-20', 62000),
 ('Nusrat', 'Jahan',   1, '2024-02-15', 55000),
 ('Tania',  'Akter',   2, '2022-07-01', 48000),
 ('Sabbir', 'Ahmed',   2, '2024-03-12', 42000),
 ('Anika',  'Rahman',  3, '2021-09-30', 80000),
 ('Imran',  'Khan',    3, '2023-11-05', 80000),
 ('Farhana','Islam',   3, '2024-06-18', 58000),
 ('Arif',   'Chowdhury',4,'2022-12-01', 46000),
 ('Mitu',   'Sultana', 4, '2025-01-20', 39000);
