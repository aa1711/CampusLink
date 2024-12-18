use campuslink;


insert into enrollments values(1,1, 110);



INSERT INTO students (
    FName, LName, GPA, Program, PersonalProfile, NationalID, 
    Sex, Password, PhoneNumber, Bdate, Address, Email, 
    EnrollmentID, ScheduleID
) 
VALUES (
    'Mohamed', 'Ahmed', 3.73, 'Computer Science', 
    '{"hobbies": ["coding", "reading"]}', 123456789, 
    'M', 'hashed_password', '123-456-7890', '2000-05-15', 
    '123 Main St, City, Country', 'Mohamed@gmail.com', 
    1, 2
);

INSERT INTO students (
    FName, LName, GPA, Program, PersonalProfile, NationalID, 
    Sex, Password, PhoneNumber, Bdate, Address, Email, 
    EnrollmentID, ScheduleID
) 
VALUES (
    'Mohamed', 'Ahmed', 3.71, 'Computer Science', 
    '{"hobbies": ["coding", "reading"]}', 1298333, 
    'M', 'hashed_password', '123-456-7890', '2000-05-15', 
    '123 Main St, City, Country', 'Mohamed@gmail.com', 
    1, 2
);

INSERT INTO students (
    FName, LName, GPA, Program, PersonalProfile, NationalID, 
    Sex, Password, PhoneNumber, Bdate, Address, Email, 
    EnrollmentID, ScheduleID
) 
VALUES (
    'Hamed', 'mahmoud', 2.71, 'Computer Science', 
    '{"hobbies": ["coding", "reading"]}', 1298322, 
    'M', 'hashed_password', '123-456-7890', '2000-05-15', 
    '123 Main St, City, Country', 'hamed@gmail.com', 
    1, 2
);

UPDATE students
SET GPA = 3.80
WHERE NationalID = 123456789;

DELETE FROM students
WHERE Email = 'hamed@gmail.com';



select * From students;





