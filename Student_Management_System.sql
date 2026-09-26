CREATE DATABASE CON_Student_Management;
USE CON_Student_Management;
SHOW DATABASES;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    date_of_birth DATE,
    gender VARCHAR(10),
    phone VARCHAR(15)
);
SHOW TABLES;

INSERT INTO students
(student_id, first_name, last_name, email, date_of_birth, gender, phone)
VALUES
(1, 'Aarav', 'Sharma', 'aarav@gmail.com', '2002-05-14', 'Male', '9876543210'),
(2, 'Meera', 'Reddy', 'meera@gmail.com', '2001-11-22', 'Female', '9876543211'),
(3, 'Rahul', 'Kumar', 'rahul@gmail.com', '2003-02-10', 'Male', '9876543212'),
(4, 'Ananya', 'Patel', 'ananya@gmail.com', '2002-08-19', 'Female', '9876543213'),
(5, 'Vikram', 'Singh', 'vikram@gmail.com', '2001-12-05', 'Male', '9876543214');alter
SELECT * FROM students;
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_duration INT
);
DESCRIBE courses;
INSERT INTO courses
(course_id, course_name, course_duration)
VALUES
(1, 'B.Sc Computer Science', 3),
(2, 'BCA', 3),
(3, 'B.Com', 3),
(4, 'MCA', 2),
(5, 'MBA', 2);
SELECT * FROM courses;
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
DESCRIBE enrollments;
INSERT INTO enrollments
(enrollment_id, student_id, course_id, enrollment_date)
VALUES
(1, 1, 1, '2026-06-10'),
(2, 2, 4, '2026-06-11'),
(3, 3, 2, '2026-06-12'),
(4, 4, 4, '2026-06-13'),
(5, 5, 3, '2026-06-14');
SELECT * FROM enrollments;
CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    subject VARCHAR(100),
    marks INT,
    
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
DESCRIBE marks;
INSERT INTO marks
(mark_id, student_id, course_id, subject, marks)
VALUES
(1, 1, 1, 'Database Management Systems', 85),
(2, 1, 1, 'Computer Networks', 78),
(3, 1, 1, 'Operating Systems', 82),

(4, 2, 4, 'Database Management Systems', 91),
(5, 2, 4, 'Computer Networks', 88),
(6, 2, 4, 'Operating Systems', 94),

(7, 3, 2, 'Database Management Systems', 76),
(8, 3, 2, 'Computer Networks', 81),
(9, 3, 2, 'Operating Systems', 79),

(10, 4, 4, 'Database Management Systems', 89),
(11, 4, 4, 'Computer Networks', 92),
(12, 4, 4, 'Operating Systems', 86),

(13, 5, 3, 'Database Management Systems', 72),
(14, 5, 3, 'Computer Networks', 75),
(15, 5, 3, 'Operating Systems', 70);
SELECT * FROM marks;
SELECT * FROM students;
SELECT first_name, last_name, email
FROM students;
SELECT *
FROM students
WHERE gender = 'Female';
SELECT first_name, last_name, date_of_birth
FROM students
WHERE date_of_birth > '2002-01-01';

SELECT
    students.first_name,
    students.last_name,
    courses.course_name
FROM enrollments
INNER JOIN students
    ON enrollments.student_id = students.student_id
INNER JOIN courses
    ON enrollments.course_id = courses.course_id;
    SELECT
    students.first_name,
    students.last_name,
    courses.course_name,
    marks.subject,
    marks.marks
FROM marks
INNER JOIN students
    ON marks.student_id = students.student_id
INNER JOIN courses
    ON marks.course_id = courses.course_id;
DESCRIBE marks;
SELECT * FROM marks;
SELECT
    students.first_name,
    students.last_name,
    courses.course_name,
    marks.subject,
    marks.marks
FROM marks
INNER JOIN students
    ON marks.student_id = students.student_id
INNER JOIN courses
    ON marks.course_id = courses.course_id;
SELECT
    student_id,
    ROUND(AVG(marks), 2) AS average_marks
FROM marks
GROUP BY student_id;
USE CON_Student_Management;
SELECT
    student_id,
    ROUND(AVG(marks), 2) AS average_marks
FROM marks
GROUP BY student_id;
USE CON_Student_Management;
SELECT
    students.first_name,
    students.last_name,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM marks
INNER JOIN students
    ON marks.student_id = students.student_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name;
    SELECT
    students.first_name,
    students.last_name,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM marks
INNER JOIN students
    ON marks.student_id = students.student_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name
HAVING AVG(marks.marks) > 80;
SELECT MAX(marks) AS highest_marks
FROM marks;
SELECT
    students.first_name,
    students.last_name,
    marks.subject,
    marks.marks
FROM marks
INNER JOIN students
    ON marks.student_id = students.student_id
WHERE marks.marks = (
    SELECT MAX(marks)
    FROM marks
);
SELECT MIN(marks) AS lowest_marks
FROM marks;
SELECT
    students.first_name,
    students.last_name,
    marks.subject,
    marks.marks
FROM marks
INNER JOIN students
    ON marks.student_id = students.student_id
WHERE marks.marks = (
    SELECT MIN(marks)
    FROM marks
);
USE CON_Student_Management;

SELECT
    students.first_name,
    students.last_name,
    marks.subject,
    marks.marks
FROM marks
INNER JOIN students
    ON marks.student_id = students.student_id
WHERE marks.marks > 80;
USE CON_Student_Management;

SELECT
    subject,
    MAX(marks) AS highest_marks
FROM marks
GROUP BY subject;
USE CON_Student_Management;

SELECT
    students.first_name,
    students.last_name,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM marks
INNER JOIN students
    ON marks.student_id = students.student_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name
ORDER BY average_marks DESC
LIMIT 1; 
USE CON_Student_Management;

SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS total_students
FROM enrollments
INNER JOIN courses
    ON enrollments.course_id = courses.course_id
GROUP BY courses.course_id, courses.course_name;
USE CON_Student_Management;

SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS total_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;
USE CON_Student_Management;

SELECT
    students.first_name,
    students.last_name
FROM students
LEFT JOIN enrollments
    ON students.student_id = enrollments.student_id
WHERE enrollments.student_id IS NULL;
USE CON_Student_Management;

SELECT
    courses.course_name,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM marks
INNER JOIN courses
    ON marks.course_id = courses.course_id
GROUP BY
    courses.course_id,
    courses.course_name;
USE CON_Student_Management;

SELECT
    courses.course_name,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM marks
INNER JOIN courses
    ON marks.course_id = courses.course_id
GROUP BY
    courses.course_id,
    courses.course_name
ORDER BY average_marks DESC
LIMIT 1;
USE CON_Student_Management;

SELECT
    students.first_name,
    students.last_name,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM marks
INNER JOIN students
    ON marks.student_id = students.student_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name
ORDER BY average_marks ASC
LIMIT 1;
USE CON_Student_Management;

SELECT
    gender,
    COUNT(*) AS total_students
FROM students
GROUP BY gender;
USE CON_Student_Management;

SELECT
    first_name,
    last_name,
    date_of_birth
FROM students
WHERE date_of_birth = (
    SELECT MIN(date_of_birth)
    FROM students
);
USE CON_Student_Management;

SELECT
    first_name,
    last_name,
    date_of_birth
FROM students
WHERE date_of_birth = (
    SELECT MAX(date_of_birth)
    FROM students
);
USE CON_Student_Management;

SELECT
    first_name,
    last_name,
    date_of_birth
FROM students
WHERE date_of_birth > '2002-12-31';
USE CON_Student_Management;

SELECT
    first_name,
    last_name,
    date_of_birth
FROM students
WHERE date_of_birth < '2002-01-01';
USE CON_Student_Management;

SELECT
    first_name,
    last_name,
    date_of_birth
FROM students
WHERE date_of_birth BETWEEN '2002-01-01' AND '2002-12-31';
USE CON_Student_Management;

SELECT
    first_name,
    last_name
FROM students
WHERE first_name LIKE 'A%';
USE CON_Student_Management;

SELECT
    first_name,
    last_name
FROM students
WHERE first_name LIKE '%a';
USE CON_Student_Management;

SELECT
    first_name,
    last_name
FROM students
WHERE last_name LIKE '%a%';

USE CON_Student_Management;

SELECT
    first_name,
    last_name,
    email
FROM students
WHERE email LIKE '%gmail%';
USE CON_Student_Management;

SELECT
    first_name,
    last_name,
    phone
FROM students
WHERE phone LIKE '9876%';
USE CON_Student_Management;

SELECT
    first_name,
    last_name
FROM students
WHERE first_name LIKE '_____';
USE CON_Student_Management;

SELECT
    first_name,
    last_name
FROM students
WHERE first_name LIKE 'A%a';

SELECT
    first_name,
    last_name
FROM students
WHERE first_name LIKE '%a%a%';

SELECT DISTINCT gender
FROM students;

SELECT
    first_name,
    last_name,
    gender
FROM students
WHERE gender IN ('Male', 'Female');

USE CON_Student_Management;

SELECT
    first_name,
    last_name,
    gender
FROM students
WHERE gender NOT IN ('Male');
USE CON_Student_Management;

SELECT
    first_name,
    last_name,
    gender,
    date_of_birth
FROM students
WHERE gender = 'Male'
  AND date_of_birth > '2002-01-01';
  USE CON_Student_Management;

SELECT
    first_name,
    last_name,
    gender,
    date_of_birth
FROM students
WHERE gender = 'Female'
   OR date_of_birth < '2002-01-01';
USE CON_Student_Management;

SELECT
    students.first_name,
    students.last_name,
    marks.subject,
    marks.marks,
    CASE
        WHEN marks.marks >= 90 THEN 'Excellent'
        WHEN marks.marks >= 80 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance
FROM marks
INNER JOIN students
    ON marks.student_id = students.student_id;
USE CON_Student_Management;

SELECT
    students.first_name,
    students.last_name,
    ROUND(AVG(marks.marks), 2) AS average_marks,
    CASE
        WHEN AVG(marks.marks) >= 90 THEN 'Excellent'
        WHEN AVG(marks.marks) >= 80 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance
FROM students
INNER JOIN marks
    ON students.student_id = marks.student_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name;
USE CON_Student_Management;

SELECT
    courses.course_name,
    COALESCE(ROUND(AVG(marks.marks), 2), 0) AS average_marks
FROM courses
LEFT JOIN marks
    ON courses.course_id = marks.course_id
GROUP BY
    courses.course_id,
    courses.course_name;
USE CON_Student_Management;

SELECT
    courses.course_name,
    IFNULL(ROUND(AVG(marks.marks), 2), 0) AS average_marks
FROM courses
LEFT JOIN marks
    ON courses.course_id = marks.course_id
GROUP BY
    courses.course_id,
    courses.course_name;
SELECT
    courses.course_name,
    IFNULL(ROUND(AVG(marks.marks), 2), 'No Marks') AS average_marks
FROM courses
LEFT JOIN marks
    ON courses.course_id = marks.course_id
GROUP BY courses.course_id, courses.course_name;
SELECT students.student_name, marks.subject, marks.marks
FROM students
JOIN marks
    ON students.student_id = marks.student_id
WHERE marks.marks > 70
AND (
    students.student_name LIKE 'A%'
    OR students.student_name LIKE 'R%'
);
SELECT
    students.first_name,
    students.last_name,
    marks.subject,
    marks.marks
FROM students
JOIN marks
    ON students.student_id = marks.student_id
WHERE marks.marks > 70
AND (
    students.first_name LIKE 'A%'
    OR students.first_name LIKE 'R%'
);
USE CON_Student_Management;
SELECT
    courses.course_name,
    COALESCE(ROUND(AVG(marks.marks), 2), 'No Marks') AS average_marks
FROM courses
LEFT JOIN marks
    ON courses.course_id = marks.course_id
GROUP BY courses.course_id, courses.course_name;
SELECT
    students.student_id,
    students.first_name,
    students.last_name,
    courses.course_name
FROM students
LEFT JOIN enrollments
    ON students.student_id = enrollments.student_id
LEFT JOIN courses
    ON enrollments.course_id = courses.course_id;
    SELECT
    students.first_name,
    students.last_name,
    courses.course_name,
    marks.subject,
    marks.marks
FROM students
JOIN enrollments
    ON students.student_id = enrollments.student_id
JOIN courses
    ON enrollments.course_id = courses.course_id
JOIN marks
    ON students.student_id = marks.student_id
   AND courses.course_id = marks.course_id;
SELECT
    students.student_id,
    students.first_name,
    students.last_name
FROM students
LEFT JOIN marks
    ON students.student_id = marks.student_id
WHERE marks.mark_id IS NULL;
SELECT
    courses.course_id,
    courses.course_name
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
WHERE enrollments.enrollment_id IS NULL;
SELECT
    students.first_name,
    students.last_name,
    marks.subject,
    marks.marks
FROM students
JOIN marks
    ON students.student_id = marks.student_id
WHERE marks.marks > (
    SELECT AVG(marks)
    FROM marks
);
SELECT
    students.student_id,
    students.first_name,
    students.last_name
FROM students
WHERE students.student_id IN (
    SELECT marks.student_id
    FROM marks
    WHERE marks.marks > (
        SELECT AVG(marks.marks)
        FROM marks
    )
);
SELECT
    students.first_name,
    students.last_name,
    (
        SELECT MAX(marks.marks)
        FROM marks
        WHERE marks.student_id = students.student_id
    ) AS highest_mark
FROM students;
SELECT
    courses.course_name,
    (
        SELECT MAX(marks.marks)
        FROM marks
        WHERE marks.course_id = courses.course_id
    ) AS highest_mark
FROM courses;
SELECT
    students.student_id,
    students.first_name,
    students.last_name,
    ROUND(AVG(marks.marks), 2) AS student_average
FROM students
JOIN marks
    ON students.student_id = marks.student_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name
HAVING AVG(marks.marks) > (
    SELECT AVG(marks.marks)
    FROM marks
);
SELECT
    students.first_name,
    students.last_name,
    ROUND(AVG(marks.marks), 1) AS average_marks
FROM students
JOIN marks
    ON students.student_id = marks.student_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name;
SELECT
    first_name,
    last_name,
    UPPER(first_name) AS first_name_upper,
    LOWER(last_name) AS last_name_lower
FROM students;
SELECT
    first_name,
    LENGTH(first_name) AS name_length
FROM students;
SELECT
    enrollment_id,
    enrollment_date,
    YEAR(enrollment_date) AS enrollment_year,
    MONTH(enrollment_date) AS enrollment_month,
    DAY(enrollment_date) AS enrollment_day
FROM enrollments;
SELECT
    students.student_id,
    CONCAT(students.first_name, ' ', students.last_name) AS full_name,
    COUNT(marks.mark_id) AS total_marks,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM students
JOIN marks
    ON students.student_id = marks.student_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name;
SELECT
    courses.course_id,
    courses.course_name,
    COUNT(enrollments.enrollment_id) AS total_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY
    courses.course_id,
    courses.course_name;
SELECT
    CONCAT(students.first_name, ' ', students.last_name) AS full_name,
    courses.course_name,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM students
JOIN marks
    ON students.student_id = marks.student_id
JOIN courses
    ON marks.course_id = courses.course_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name,
    courses.course_id,
    courses.course_name;
SELECT
    students.first_name,
    students.last_name,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM students
JOIN marks
    ON students.student_id = marks.student_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name
HAVING AVG(marks.marks) >= 85;
SELECT
    students.first_name,
    students.last_name,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM students
JOIN marks
    ON students.student_id = marks.student_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name
HAVING AVG(marks.marks) < 75;
SELECT
    students.student_id,
    CONCAT(students.first_name, ' ', students.last_name) AS full_name,
    courses.course_name,
    SUM(marks.marks) AS total_marks,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM students
JOIN marks
    ON students.student_id = marks.student_id
JOIN courses
    ON marks.course_id = courses.course_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name,
    courses.course_id,
    courses.course_name;
    SELECT
    courses.course_name,
    COUNT(DISTINCT marks.student_id) AS total_students,
    SUM(marks.marks) AS total_marks,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM courses
LEFT JOIN marks
    ON courses.course_id = marks.course_id
GROUP BY
    courses.course_id,
    courses.course_name;
SELECT
    CONCAT(students.first_name, ' ', students.last_name) AS full_name,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM students
JOIN marks
    ON students.student_id = marks.student_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name
ORDER BY average_marks DESC;
SELECT
    courses.course_name,
    COUNT(DISTINCT enrollments.student_id) AS total_students,
    ROUND(AVG(marks.marks), 2) AS average_marks
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
LEFT JOIN marks
    ON courses.course_id = marks.course_id
GROUP BY
    courses.course_id,
    courses.course_name;
SELECT
    CONCAT(students.first_name, ' ', students.last_name) AS full_name,
    courses.course_name,
    SUM(marks.marks) AS total_marks,
    ROUND(AVG(marks.marks), 2) AS average_marks,
    CASE
        WHEN AVG(marks.marks) >= 85 THEN 'Excellent'
        WHEN AVG(marks.marks) >= 75 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance_status
FROM students
JOIN marks
    ON students.student_id = marks.student_id
JOIN courses
    ON marks.course_id = courses.course_id
GROUP BY
    students.student_id,
    students.first_name,
    students.last_name,
    courses.course_id,
    courses.course_name
ORDER BY average_marks DESC;