CREATE DATABASE campuslink;
USE campuslink;

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL
);



CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentId INT,
    CourseID INT
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL,
    GPA DECIMAL(3, 2),
    Program VARCHAR(100),
    PersonalProfile JSON,
    NationalID INT UNIQUE NOT NULL,
    Sex VARCHAR(1),
    Password VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Bdate DATE,
    Address VARCHAR(100),
    Email VARCHAR(100),
    EnrollmentID INT,
    ScheduleID INT,
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    FacultyID INT,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL,
    PersonalProfile JSON,
    NationalID INT UNIQUE NOT NULL,
    Sex VARCHAR(1),
    Password VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Bdate DATE,
    Address VARCHAR(100),
    Email VARCHAR(100),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE Admins (
    AdminID INT PRIMARY KEY AUTO_INCREMENT,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL,
    PersonalProfile JSON,
    NationalID INT UNIQUE NOT NULL,
    Sex VARCHAR(1),
    Password VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Bdate DATE,
    Address VARCHAR(100),
    Email VARCHAR(100),
    SuperID INT
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Name VARCHAR(100),
    FacultyID INT,
    PrerequisiteCourseID INT,
    ClassroomNumber VARCHAR(20),
    Datetime DATETIME,
    InstructorID INT,
    Grade VARCHAR(2),
    StudentID INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);
CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    InstructorID INT,
    TimetableConflict BOOLEAN DEFAULT false,
    ClassroomNumber VARCHAR(20),
    Day DATETIME,
    Timeslot TIME,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
CREATE TABLE CourseTasks (
    CourseID INT,
    InstructorID INT,
    StudentID INT, 
    AssignmentID INT,
    QuizID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Date DATE,
    Status VARCHAR(10),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Feedback TEXT,
    InstructorID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Fees (
    FeeID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    TuitionFee DECIMAL(10, 2),
    AmountPaid DECIMAL(10, 2),
    MISCexpenses DECIMAL(10, 2),
    PaymentHistory JSON,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE MedicalExcuse (
    ExcuseID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    Description TEXT,
    Date DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);







