CREATE TABLE dbo.students(
student_id INT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
email VARCHAR(100)
);

GO

CREATE TABLE dbo.courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(100) NOT NULL,
credits INT NOT NULL
);

CREATE TABLE dbo.enrollments(
enrollment_id INT NOT NULL,
student_id INT NOT NULL,
course_id INT NOT NULL,
enroll_date DATE,
grade CHAR(2),
CONSTRAINT FK_enrollments_students FOREIGN KEY (student_id) REFERENCES dbo.students(student_id),
CONSTRAINT FK_enrollments_courses  FOREIGN KEY (course_id)  REFERENCES dbo.courses(course_id)
);
GO

INSERT INTO dbo.students (student_id, full_name, email) VALUES
(1, 'Ali Veli', 'ali.veli@example.com'),
(2, 'Ayse Demir', 'ayse.demir@example.com'),
(3, 'Mehmet Can', 'mehmet.can@example.com');
GO

-- 7. Insert courses
INSERT INTO dbo.courses (course_id, course_name, credits) VALUES
(101, 'Database Systems', 3),
(102, 'Computer Networks', 3),
(103, 'Algorithms', 4);
GO

-- 8. Insert enrollments
INSERT INTO dbo.enrollments (enrollment_id, student_id, course_id, enroll_date, grade) VALUES
(1001, 1, 101, '2025-09-01', 'A'),
(1002, 2, 101, '2025-09-02', 'B'),
(1003, 2, 103, '2025-09-03', 'A');
GO

SELECT 'TABLE 1 – STUDENTS TABLE' AS " ";
SELECT * FROM dbo.students;
GO

SELECT 'TABLE 2 – COURSES TABLE' AS " ";
SELECT * FROM dbo.courses;
GO

SELECT 'TABLE 3 – ENROLLMENTS TABLE' AS " ";
SELECT * FROM dbo.enrollments;
GO


SELECT 'TABLE 4 – INNER JOIN ' AS " ";
SELECT s.student_id, s.full_name, c.course_id, c.course_name, e.enroll_date, e.grade
FROM dbo.students s
INNER JOIN dbo.enrollments e ON s.student_id = e.student_id
INNER JOIN dbo.courses c ON e.course_id = c.course_id;
GO


SELECT 'TABLE 5 – LEFT JOIN ' AS " ";
SELECT s.student_id, s.full_name, c.course_id, c.course_name, e.enroll_date
FROM dbo.students s
LEFT JOIN dbo.enrollments e ON s.student_id = e.student_id
LEFT JOIN dbo.courses c ON e.course_id = c.course_id;
GO


SELECT 'TABLE 6 – RIGHT JOIN ' AS " ";
SELECT c.course_id, c.course_name, s.student_id AS student_id, s.full_name, e.enroll_date
FROM dbo.enrollments e
RIGHT JOIN dbo.courses c ON e.course_id = c.course_id
LEFT JOIN dbo.students s ON e.student_id = s.student_id;
GO