use campuslink;
ALTER TABLE Students ADD Status VARCHAR(20) DEFAULT 'Active';
ALTER TABLE Instructors ADD Status VARCHAR(20) DEFAULT 'Active';
ALTER TABLE courses ADD grade_score float;
UPDATE Courses 
SET Grade = CASE
    WHEN Grade_score >= 90 THEN 'A+'
    WHEN Grade_score >= 85 THEN 'A'
    WHEN Grade_score >= 80 THEN 'B+'
    WHEN Grade_score >= 75 THEN 'B'
    WHEN Grade_score >= 70 THEN 'C'
    WHEN Grade_score >= 65 THEN 'D'
    ELSE 'F'
END;
SET @avg_gpa = (SELECT AVG(CASE 
    WHEN grade = 'A+' THEN 4.0
    WHEN grade = 'A' THEN 4.0
    WHEN grade = 'A-' THEN 4.0
    WHEN grade = 'B+' THEN 3.7
    WHEN grade = 'B' THEN 3.333
    WHEN grade = 'B-' THEN 3.0 
    WHEN grade = 'C' THEN 2.0
    WHEN grade = 'F' THEN 0.0
    ELSE NULL
END) 
FROM courses as c, Enrollments as e WHERE c.studentid = e.studentid);
-- Notifications Table
CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Message TEXT,
    NotificationDate DATETIME DEFAULT NOW(),
    IsRead BOOLEAN DEFAULT FALSE
);

-- Conflict Resolution Requests Table
CREATE TABLE ConflictResolutionRequests (
    RequestID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ScheduleID INT,
    ConflictDetails TEXT,
    RequestDate DATETIME DEFAULT NOW(),
    Status VARCHAR(20) DEFAULT 'Pending'
);

-- Audit Log Table
CREATE TABLE AuditLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Action VARCHAR(255),
    ActionDate DATETIME DEFAULT NOW(),
    Details TEXT
);

-- Course Segments Table
CREATE TABLE CourseSegments (
    SegmentID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID INT,
    SegmentType VARCHAR(50), -- Lecture, Lab, etc.
    SegmentDetails TEXT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Add a new student
INSERT INTO Students (FName, LName, NationalID, Password, PhoneNumber, Address, Email, Bdate, Program)
VALUES ('Wren', 'abdelal', '123456789', SHA2('hi aly', 256), '1234567890', '123 Elm St', 'johndoe@example.com', '2000-01-01', 'Computer Science');


-- Remove a student
DELETE FROM Students
WHERE StudentID = 1;

-- Suspend a student account
UPDATE Students 
SET Status = 'Suspended' 
WHERE StudentID = 1;

-- Activate a suspended account
UPDATE Students 
SET Status = 'Active' 
WHERE StudentID = 1;

-- View personal profile
SELECT * 
FROM Students 
WHERE StudentID = 1;

-- Request profile alteration
INSERT INTO AuditLog (UserID, Action, Details)
VALUES (1, 'Profile Update Request', 'Requested change of phone number to 9876543210.');

-- View student grades
SELECT Grade 
FROM Courses 
WHERE StudentID = 1;

-- Calculate GPA
SELECT AVG(GPA) AS StudentGPA 
FROM Students 
WHERE StudentID = 1;
-- Add a new faculty
INSERT INTO Faculty (Name)
VALUES ('Engineering');
-- Enroll a student in a course
INSERT INTO courses VALUES (101, 'abdelal', 1, null, '123', '2000-01-01', 1, 'A', 2, null);
INSERT INTO Enrollments (StudentId, CourseID)
VALUES (1, 101);

-- Drop a course for a student
DELETE FROM Enrollments
WHERE StudentID = 1 AND CourseID = 101;
INSERT INTO Enrollments (StudentId, CourseID)
VALUES (2, 101);

-- View current schedule
SELECT * 
FROM Schedule 
WHERE StudentID = 1;
INSERT INTO Students (FName, LName, NationalID, Password, PhoneNumber, Address, Email, Bdate, Program)
VALUES ('Wren', 'abdelal', '123456789', SHA2('hi aly', 256), '1234567890', '123 Elm St', 'johndoe@example.com', '2000-01-01', 'Computer Science');


-- Submit a medical excuse
INSERT INTO MedicalExcuse (StudentID, Description, Date)
VALUES (2, 'Flu illness', '2024-12-01');

-- Provide course feedback
INSERT INTO Feedback (StudentID, CourseID, Feedback)
VALUES (2, 101, 'Excellent course with engaging content!');

-- Report timetable conflict
INSERT INTO ConflictResolutionRequests (UserID, ScheduleID, ConflictDetails)
VALUES (2, 101, 'Course 101 and Course 102 overlap on Monday 10:00 AM.');

-- View reported timetable conflicts
SELECT * 
FROM ConflictResolutionRequests 
WHERE Status = 'Pending';

-- Resolve a reported conflict
UPDATE ConflictResolutionRequests 
SET Status = 'Resolved' 
WHERE RequestID = 1;



-- Remove a faculty
DELETE FROM Faculty
WHERE FacultyID = 10;

-- Add a new instructor
INSERT INTO Instructors (FName, LName, NationalID, Password, PhoneNumber, Address, Email, FacultyID)
VALUES ('Aly', 'Radwan', '987654321', SHA2('secure_password', 256), '0987654321', '456 Oak St', 'Alyradwan@gmail.com', 1);

-- Remove an instructor
DELETE FROM Instructors
WHERE InstructorID = 1;

-- Resolve timetable conflicts for students
SELECT s1.StudentID, s1.CourseID AS Course1, s2.CourseID AS Course2
FROM Schedule s1
JOIN Schedule s2
ON s1.StudentID = s2.StudentID AND s1.Timeslot = s2.Timeslot AND s1.Day = s2.Day
WHERE s1.CourseID <> s2.CourseID;

-- Update schedules to resolve conflicts
UPDATE Schedule 
SET TimetableConflict = FALSE 
WHERE ScheduleID = 101;



-- Add or change grades for a student
UPDATE Courses 
SET Grade = 'A' 
WHERE CourseID = 101 AND StudentID = 2;

-- Add attendance for a student
INSERT INTO Attendance (StudentID, CourseID, Date, Status)
VALUES (2, 101, '2024-12-01', 'Present');

-- Comment on students
INSERT INTO AuditLog (UserID, Action, Details)
VALUES (2, 'Commented on Student', 'Student 1 shows consistent performance in Course 101.');

-- View instructor schedule
SELECT * 
FROM Schedule 
WHERE InstructorID = 2;

-- Request schedule modification
INSERT INTO ConflictResolutionRequests (UserID, ScheduleID, ConflictDetails)
VALUES (2, 101, 'Request to move Course 101 to 2:00 PM.');



-- Add a new course
INSERT INTO Courses (courseid,Name, FacultyID, PrerequisiteCourseID, ClassroomNumber, Datetime, InstructorID, Grade)
VALUES (102,'Database Management', 1, NULL, 'B101', '2024-12-01 09:00:00', 2, NULL);

-- View course prerequisites
SELECT PrerequisiteCourseID 
FROM Courses 
WHERE CourseID = 101;

-- Add course segments
INSERT INTO CourseSegments (CourseID, SegmentType, SegmentDetails)
VALUES (101, 'Lecture', 'Lecture on database indexing.');

-- View course segments
SELECT * 
FROM CourseSegments 
WHERE CourseID = 101;



-- Update tuition fee payment
UPDATE Fees 
SET AmountPaid = AmountPaid + 1000 
WHERE StudentID = 1;

-- Export fee data for recovery
-- SELECT * 
-- FROM Fees 
-- INTO OUTFILE 'C:\Users\lenove\OneDrive\Documents\dumps\fees_backup.csv'
-- FIELDS TERMINATED BY ',' 
-- LINES TERMINATED BY '\n';



-- Add a notification
INSERT INTO Notifications (UserID, Message)
VALUES (1, 'Your timetable has been updated for Course 101.');

-- Mark a notification as read
UPDATE Notifications 
SET IsRead = TRUE 
WHERE NotificationID = 1;

-- View unread notifications
SELECT * 
FROM Notifications 
WHERE UserID = 1 AND IsRead = FALSE;



-- Store an encrypted password
INSERT INTO Students (FName, LName, NationalID, Password, PhoneNumber, Address, Email, Bdate, Program)
VALUES ('Yahya', 'el demerdash', '1234567801', SHA2('secure_password', 256), '1234567890', '123 Elm St', 'yahya@gmail.com', '2000-01-01', 'Computer Science');

-- Update password for an existing user
UPDATE Students 
SET Password = SHA2('new_secure_password', 256) 
WHERE StudentID = 1;

-- Add an action to the audit log
INSERT INTO AuditLog (UserID, Action, Details)
VALUES (1, 'Enrolled in Course', 'Enrolled in Course ID 101');

-- View all logs for a user
SELECT * 
FROM AuditLog 
WHERE UserID = 1;


SELECT s1.StudentID, s1.CourseID AS Course1, s2.CourseID AS Course2
FROM Schedule s1
JOIN Schedule s2
ON s1.StudentID = s2.StudentID AND s1.Timeslot = s2.Timeslot AND s1.Day = s2.Day
WHERE s1.CourseID <> s2.CourseID;
