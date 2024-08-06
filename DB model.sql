-- Create User Table
CREATE TABLE User (
    username TEXT PRIMARY KEY,
    password TEXT,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    role TEXT,
    phone_number TEXT,
    date_of_birth DATE
);

-- Create Course Table
CREATE TABLE Course (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_name TEXT,
    description TEXT
);

-- Create Class Table
CREATE TABLE Class (
    class_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    course_id INTEGER,
    instructor_id INTEGER,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (instructor_id) REFERENCES User(username)
);

-- Create Enrollment Table
CREATE TABLE Enrollment (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER,
    student_id TEXT,
    status TEXT,
    FOREIGN KEY (class_id) REFERENCES Class(class_id),
    FOREIGN KEY (student_id) REFERENCES User(username)
);

-- Create Assignment Table
CREATE TABLE Assignment (
    assignment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER,
    title TEXT,
    description TEXT,
    due_date DATE,
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

-- Create Submission Table
CREATE TABLE Submission (
    submission_id INTEGER PRIMARY KEY AUTOINCREMENT,
    assignment_id INTEGER,
    student_id TEXT,
    submission_date DATE,
    grade TEXT,
    feedback TEXT,
    FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id),
    FOREIGN KEY (student_id) REFERENCES User(username)
);





-- Insert data into User Table
INSERT INTO User (username, password, first_name, last_name, email, role, phone_number, date_of_birth) 
VALUES 
('jdoe', 'password123', 'John', 'Doe', 'john.doe@example.com', 'student', '1234567890', '1990-01-01'),
('asmith', 'password456', 'Alice', 'Smith', 'alice.smith@example.com', 'instructor', '0987654321', '1985-05-15');

-- Insert data into Course Table
INSERT INTO Course (course_name, description) 
VALUES 
('Data Science 101', 'Introduction to Data Science'),
('Machine Learning Basics', 'Fundamentals of Machine Learning');

-- Insert data into Class Table
INSERT INTO Class (course_id, instructor_id, start_date, end_date) 
VALUES 
(1, 'asmith', '2024-03-01', '2024-06-01'),
(2, 'asmith', '2024-04-01', '2024-07-01');

-- Insert data into Enrollment Table
INSERT INTO Enrollment (class_id, student_id, status) 
VALUES 
(1, 'jdoe', 'enrolled'),
(2, 'jdoe', 'enrolled');

-- Insert data into Assignment Table
INSERT INTO Assignment (class_id, title, description, due_date) 
VALUES 
(1, 'Assignment 1', 'Complete the first assignment', '2024-04-15'),
(2, 'Project 1', 'Build a basic machine learning model', '2024-06-30');

-- Insert data into Submission Table
INSERT INTO Submission (assignment_id, student_id, submission_date, grade, feedback) 
VALUES 
(1, 'jdoe', '2024-04-10', 'A', 'Great job!'),
(2, 'jdoe', '2024-06-28', 'B+', 'Good effort, but needs improvement.');


-- Display data from User Table
SELECT 
    username AS "Username", 
    password AS "Password", 
    first_name AS "First Name", 
    last_name AS "Last Name", 
    email AS "Email", 
    role AS "Role", 
    phone_number AS "Phone Number", 
    date_of_birth AS "Date of Birth" 
FROM User;

-- Display data from Course Table
SELECT 
    course_id AS "Course ID", 
    course_name AS "Course Name", 
    description AS "Description" 
FROM Course;

-- Display data from Class Table
SELECT 
    class_id AS "Class ID", 
    course_id AS "Course ID", 
    instructor_id AS "Instructor ID", 
    start_date AS "Start Date", 
    end_date AS "End Date" 
FROM Class;

-- Display data from Enrollment Table
SELECT 
    enrollment_id AS "Enrollment ID", 
    class_id AS "Class ID", 
    student_id AS "Student ID", 
    status AS "Status" 
FROM Enrollment;

-- Display data from Assignment Table
SELECT 
    assignment_id AS "Assignment ID", 
    class_id AS "Class ID", 
    title AS "Title", 
    description AS "Description", 
    due_date AS "Due Date" 
FROM Assignment;

-- Display data from Submission Table
SELECT 
    submission_id AS "Submission ID", 
    assignment_id AS "Assignment ID", 
    student_id AS "Student ID", 
    submission_date AS "Submission Date", 
    grade AS "Grade", 
    feedback AS "Feedback" 
FROM Submission;


