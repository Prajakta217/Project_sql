CREATE TABLE School (
    school_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    principal VARCHAR(100),
    established_year INT
);

-- Sample inserts
INSERT INTO School (name, location, principal, established_year)
VALUES
('Sunshine High School', 'Mumbai', 'Mr. Ramesh Sharma', 1995),
('Greenfield Academy', 'Bangalore', 'Ms. Anjali Mehta', 2000),
('Bright Future School', 'Pune', 'Mr. Kiran Patil', 2010);


CREATE TABLE Classes (
    class_id SERIAL PRIMARY KEY,
    school_id INT NOT NULL,
    class_name VARCHAR(50) NOT NULL,   -- e.g., Grade 1, Grade 2
    section VARCHAR(10),
    FOREIGN KEY (school_id) REFERENCES School(school_id)
);

-- Sample inserts
INSERT INTO Classes (school_id, class_name, section)
VALUES
(1, 'Grade 1', 'A'),
(1, 'Grade 2', 'B'),
(2, 'Grade 3', 'A'),
(2, 'Grade 4', 'B'),
(3, 'Grade 5', 'A');


CREATE TABLE Student (
    student_id SERIAL PRIMARY KEY,
    class_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Sample inserts
INSERT INTO Student (class_id, first_name, last_name, date_of_birth, gender)
VALUES
(1, 'Prajakta', 'Waghamare', '2012-05-10', 'Female'),
(1, 'Rohan', 'Sharma', '2012-08-15', 'Male'),
(2, 'Ananya', 'Mehta', '2011-03-20', 'Female'),
(3, 'Karan', 'Patil', '2010-07-30', 'Male');


CREATE TABLE Teachers (
    teacher_id SERIAL PRIMARY KEY,
    school_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    subject VARCHAR(50),
    FOREIGN KEY (school_id) REFERENCES School(school_id)
);

-- Sample inserts
INSERT INTO Teachers (school_id, first_name, last_name, subject)
VALUES
(1, 'Rakesh', 'Sharma', 'Mathematics'),
(1, 'Sunita', 'Patel', 'English'),
(2, 'Anil', 'Kumar', 'Science'),
(3, 'Meena', 'Joshi', 'History');

CREATE TABLE Subjects (
    subject_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO Subjects (name)
VALUES ('Mathematics'), ('English'), ('Science'), ('History'), ('Computer Science');


SELECT * FROM classes;

SELECT s.first_name, s.last_name, c.class_name, c.section
FROM Student s
INNER JOIN Classes c
ON s.class_id = c.class_id;
