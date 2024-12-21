insert into faculty (FacultyID, Name) values (1, "computer science");


INSERT INTO courses (CourseID, Name, FacultyID, PrerequisiteCourseID, ClassroomNumber, Datetime, InstructorID, Grade, StudentID)
VALUES 
(110, 'Introduction to AI', 1, NULL, 'A101', '2024-12-20 10:00:00', 1001, 'A', 1);

SELECT 
    s.StudentID, 
    s.FName, 
    s.LName, 
    c.CourseID, 
    c.Name AS CourseName, 
    c.Grade
FROM 
    students s
JOIN 
    enrollments e ON s.StudentID = e.StudentID
JOIN 
    courses c ON e.CourseID = c.CourseID;
    
    
INSERT INTO fees (StudentID, TuitionFee, AmountPaid, MISCexpenses, PaymentHistory)
VALUES 
(1, 5000.00, 2000.00, 500.00, '[{"paymentDate": "2024-12-01", "amount": 2000.00}, {"paymentDate": "2024-12-10", "amount": 500.00}]');


SELECT 
    s.StudentID, 
    s.FName, 
    s.LName, 
    s.GPA, 
    s.Program, 
    f.TuitionFee, 
    f.AmountPaid, 
    f.MISCexpenses
FROM 
    students s
JOIN 
    fees f ON s.StudentID = f.StudentID;


select * from students;
select * from courses;
select * from faculty;
select * from enrollments;
select * from fees;

