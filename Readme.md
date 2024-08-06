# Note

The code couldn't be able to compile in VSC So used on line SQL Server compiler successfully got output and attched the screenShot on the outputs 

# Database Schema README

## Overview

This document describes the database schema for a system managing users, courses, classes, enrollments, assignments, and submissions. The schema is designed to facilitate the management of educational content and student performance.

## Tables

### User Table

- **Description**: Stores information about users.
- **Columns**:
  - `username` (TEXT, PRIMARY KEY): Unique identifier for the user.
  - `password` (TEXT): User’s password (consider hashing for security).
  - `first_name` (TEXT): User's first name.
  - `last_name` (TEXT): User's last name.
  - `email` (TEXT): User's email address.
  - `role` (TEXT): Role of the user (e.g., 'student', 'instructor').
  - `phone_number` (TEXT): User's phone number.
  - `date_of_birth` (DATE): User's date of birth.

### Course Table

- **Description**: Stores information about courses.
- **Columns**:
  - `course_id` (INTEGER, PRIMARY KEY, AUTOINCREMENT): Unique identifier for the course.
  - `course_name` (TEXT): Name of the course.
  - `description` (TEXT): Description of the course.

### Class Table

- **Description**: Stores information about classes associated with courses.
- **Columns**:
  - `class_id` (INTEGER, PRIMARY KEY, AUTOINCREMENT): Unique identifier for the class.
  - `course_id` (INTEGER): Foreign key referencing `Course(course_id)`.
  - `instructor_id` (INTEGER): Foreign key referencing `User(username)`.
  - `start_date` (DATE): Start date of the class.
  - `end_date` (DATE): End date of the class.

### Enrollment Table

- **Description**: Stores information about students enrolled in classes.
- **Columns**:
  - `enrollment_id` (INTEGER, PRIMARY KEY, AUTOINCREMENT): Unique identifier for the enrollment.
  - `class_id` (INTEGER): Foreign key referencing `Class(class_id)`.
  - `student_id` (TEXT): Foreign key referencing `User(username)`.
  - `status` (TEXT): Status of the enrollment (e.g., 'enrolled').

### Assignment Table

- **Description**: Stores information about assignments within classes.
- **Columns**:
  - `assignment_id` (INTEGER, PRIMARY KEY, AUTOINCREMENT): Unique identifier for the assignment.
  - `class_id` (INTEGER): Foreign key referencing `Class(class_id)`.
  - `title` (TEXT): Title of the assignment.
  - `description` (TEXT): Description of the assignment.
  - `due_date` (DATE): Due date for the assignment.

### Submission Table

- **Description**: Stores information about assignment submissions by students.
- **Columns**:
  - `submission_id` (INTEGER, PRIMARY KEY, AUTOINCREMENT): Unique identifier for the submission.
  - `assignment_id` (INTEGER): Foreign key referencing `Assignment(assignment_id)`.
  - `student_id` (TEXT): Foreign key referencing `User(username)`.
  - `submission_date` (DATE): Date the assignment was submitted.
  - `grade` (TEXT): Grade received for the assignment.
  - `feedback` (TEXT): Feedback provided on the submission.

## Sample Data

### User Table
| Username | Password   | First Name | Last Name | Email                | Role       | Phone Number | Date of Birth |
|----------|------------|------------|-----------|----------------------|------------|--------------|---------------|
| jdoe     | password123 | John       | Doe       | john.doe@example.com | student    | 1234567890   | 1990-01-01    |
| asmith   | password456 | Alice      | Smith     | alice.smith@example.com | instructor | 0987654321   | 1985-05-15    |

### Course Table
| Course ID | Course Name          | Description                        |
|-----------|-----------------------|------------------------------------|
| 1         | Data Science 101      | Introduction to Data Science        |
| 2         | Machine Learning Basics | Fundamentals of Machine Learning  |

### Class Table
| Class ID | Course ID | Instructor ID | Start Date | End Date   |
|----------|-----------|---------------|------------|------------|
| 1        | 1         | asmith        | 2024-03-01 | 2024-06-01 |
| 2        | 2         | asmith        | 2024-04-01 | 2024-07-01 |

### Enrollment Table
| Enrollment ID | Class ID | Student ID | Status    |
|---------------|----------|------------|-----------|
| 1             | 1        | jdoe       | enrolled  |
| 2             | 2        | jdoe       | enrolled  |

### Assignment Table
| Assignment ID | Class ID | Title       | Description                        | Due Date   |
|---------------|----------|-------------|------------------------------------|------------|
| 1             | 1        | Assignment 1 | Complete the first assignment       | 2024-04-15 |
| 2             | 2        | Project 1    | Build a basic machine learning model | 2024-06-30 |

### Submission Table
| Submission ID | Assignment ID | Student ID | Submission Date | Grade | Feedback                          |
|---------------|---------------|------------|-----------------|-------|-----------------------------------|
| 1             | 1             | jdoe       | 2024-04-10      | A     | Great job!                         |
| 2             | 2             | jdoe       | 2024-06-28      | B+    | Good effort, but needs improvement. |

## Queries

### Display data from User Table
```sql
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
```

### Display data from Course Table
```sql
SELECT 
    course_id AS "Course ID", 
    course_name AS "Course Name", 
    description AS "Description" 
FROM Course;
```

### Display data from Class Table
```sql
SELECT 
    class_id AS "Class ID", 
    course_id AS "Course ID", 
    instructor_id AS "Instructor ID", 
    start_date AS "Start Date", 
    end_date AS "End Date" 
FROM Class;
```

### Display data from Enrollment Table
```sql
SELECT 
    enrollment_id AS "Enrollment ID", 
    class_id AS "Class ID", 
    student_id AS "Student ID", 
    status AS "Status" 
FROM Enrollment;
```

### Display data from Assignment Table
```sql
SELECT 
    assignment_id AS "Assignment ID", 
    class_id AS "Class ID", 
    title AS "Title", 
    description AS "Description", 
    due_date AS "Due Date" 
FROM Assignment;
```

### Display data from Submission Table
```sql
SELECT 
    submission_id AS "Submission ID", 
    assignment_id AS "Assignment ID", 
    student_id AS "Student ID", 
    submission_date AS "Submission Date", 
    grade AS "Grade", 
    feedback AS "Feedback" 
FROM Submission;
```

## Notes

- Ensure that foreign keys are correctly set up to maintain referential integrity between tables.
- Consider implementing password hashing for security purposes in the `User` table.
- Adjust table definitions and queries as needed based on specific requirements or use cases.

---