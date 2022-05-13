USE [master]
GO

CREATE DATABASE [Weidner_School]
GO
USE [Weidner_School]
GO
SET QUOTED_IDENTIFIER ON
GO

--Instructors Table
CREATE TABLE dbo.Instructors
(
	Instructor_Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Instructor_Firstname CHAR(50),
	Instructor_Lastname CHAR(50),
	Instructor_Password VARCHAR(50),
	Instructor_Phone CHAR(12),
	Instructor_Email VARCHAR(50),
	Instructor_Address CHAR(50)
)
GO

--Students Table
CREATE TABLE dbo.Students
(
	Student_Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Student_Firstname CHAR(50),
	Student_Lastname	CHAR(50),
	Student_Password VARCHAR(50),
	Student_Phone CHAR(12),
	Student_Email VARCHAR(50),
	Student_Address CHAR(50)
)
GO

--Courses Table
CREATE TABLE dbo.Courses
(
	Course_Id INT NOT NULL IDENTITY(1,1),
	Instructor_Id INT NOT NULL,
	Course_Name CHAR(50),
	Course_Description CHAR(100),
	PRIMARY KEY(Course_Id),
	CONSTRAINT FK_Instructor_Id FOREIGN KEY (Instructor_Id) REFERENCES Instructors(Instructor_Id)
)
GO

--Assignments Table
CREATE TABLE dbo.Assignments
(
	Assignment_Id INT NOT NULL IDENTITY(1,1),
	Course_Id INT NOT NULL,
	Assignment_Name CHAR(50),
	Assignment_Description CHAR(100),
	Assignment_Due_Date DATE,
	PRIMARY KEY(Assignment_Id),
	CONSTRAINT FK_Course_Id FOREIGN KEY (Course_Id) REFERENCES Courses(Course_Id)
)
GO

--Courses_Students (Linking Table)
CREATE TABLE dbo.Courses_Students
(
	Courses_Students_Id INT NOT NULL IDENTITY(1,1),
	Course_Id INT NOT NULL,
	Student_Id INT NOT NULL,
	PRIMARY KEY (Courses_Students_Id),
	CONSTRAINT FK_Course_Id2 FOREIGN KEY (Course_Id) REFERENCES Courses(Course_Id),
	CONSTRAINT FK_Student_Id2 FOREIGN KEY (Student_Id) REFERENCES Students(Student_Id)
)
GO

--Assignments_Students (Linking Table)
CREATE TABLE dbo.Assignments_Students
(
	Assignments_Students_Id INT IDENTITY(1,1) NOT NULL,
	Assignment_Id INT NOT NULL,
	Student_Id INT NOT NULL,
	PRIMARY KEY (Assignments_Students_Id),
	CONSTRAINT FK_Student_Id FOREIGN KEY (Student_Id) REFERENCES Students(Student_Id),
	ConstraINT FK_Assignment_Id FOREIGN KEY (Assignment_Id) REFERENCES Assignments(Assignment_Id)
)
GO

--Inserts-------------------------------------
INSERT INTO Instructors(Instructor_Firstname, Instructor_Lastname,Instructor_Password, Instructor_Phone, Instructor_Email, Instructor_Address)
VALUES ('Cory', 'Kennedy','password', '320-266-7829', 'test01@gmail.com', '7187 Lincoln Ave S, Saint Cloud MN'),
('Breanna', 'Micheals', 'password','320-266-7855', 'test02@gmail.com', '7188 Lincoln Ave S, Saint Cloud MN'),
('Micheal', 'Howard','password', '320-266-7866', 'test03@gmail.com', '7189 Lincoln Ave S, Saint Cloud MN'),
('Andrew', 'Reynolds','password', '320-266-7877', 'test04@gmail.com', '7190 Lincoln Ave S, Saint Cloud MN'),
('Todd', 'Howard','password', '320-266-7866', 'test05@gmail.com', '7191 Lincoln Ave S, Saint Cloud MN'),
('Ron', 'Weasley','password', '320-266-7890', 'test06@gmail.com', '7192 Lincoln Ave S, Saint Cloud MN'),
('Paul', 'Rodrigeuz','password', '320-266-7893', 'test07@gmail.com', '7193 Lincoln Ave S, Saint Cloud MN'),
('Sarah', 'Nickelson','password', '320-266-7835', 'test08@gmail.com', '7194 Lincoln Ave S, Saint Cloud MN'),
('Victoria', 'Wednz','password', '320-266-7844', 'test09@gmail.com', '7195 Lincoln Ave S, Saint Cloud MN'),
('Macie', 'Fins','password', '320-266-7233', 'test10@gmail.com', '7196 Lincoln Ave S, Saint Cloud MN')
GO

INSERT INTO Students(Student_Firstname, Student_Lastname,Student_Password, Student_Phone, Student_Email, Student_Address)
VALUES ('Dustin', 'Massey','Password', '320-266-7829', 'test01@gmail.com', '7187 Lincoln Ave S, Saint Cloud MN'),
('Monique', 'Fox', 'Password','320-266-7855', 'test02@gmail.com', '7188 Lincoln Ave S, Saint Cloud MN'),
('Roxanne', 'Bennett','Password', '320-266-7866', 'test03@gmail.com', '7189 Lincoln Ave S, Saint Cloud MN'),
('Samuel', 'Peterson', 'Password','320-266-7877', 'test04@gmail.com', '7190 Lincoln Ave S, Saint Cloud MN'),
('Dewey', 'Myers', 'Password','320-266-7866', 'test05@gmail.com', '7191 Lincoln Ave S, Saint Cloud MN'),
('Marguerite', 'Henderson', 'Password','320-266-7890', 'test06@gmail.com', '7192 Lincoln Ave S, Saint Cloud MN'),
('Beverly', 'Meyer','Password', '320-266-7893', 'test07@gmail.com', '7193 Lincoln Ave S, Saint Cloud MN'),
('Deanna', 'Howard','Password', '320-266-7835', 'test08@gmail.com', '7194 Lincoln Ave S, Saint Cloud MN'),
('Dominick ', 'Lee','Password', '320-266-7844', 'test09@gmail.com', '7195 Lincoln Ave S, Saint Cloud MN'),
('Sophia', 'Walters','Password', '320-266-7233', 'test10@gmail.com', '7196 Lincoln Ave S, Saint Cloud MN')
GO

INSERT INTO Courses(Instructor_Id, Course_Name,Course_Description)
VALUES(1,'Art I','This class teaches the fundementals of art.'),
(1,'Art I','This class teaches the fundementals of art.'),
(1,'Art II','This class teaches the advanced art concepts.'),
(2,'Java I','This class teaches the fundementals of Java Programming.'),
(2,'Java II','This class teaches advanced Java Programming Concepts.'),
(3,'C# Programming','This class teaches the fundementals of C# Programming.'),
(4,'College Algebra','This class teaches college level algebra.'),
(5,'Stars and the Universe','Learn about astronomy concepts.'),
(6,'Art I','This class teaches the fundementals of art.'),
(7,'Art I','This class teaches the fundementals of art.'),
(8,'Art I','This class teaches the fundementals of art.'),
(9,'Art I','This class teaches the fundementals of art.'),
(9,'Art I','This class teaches the fundementals of art.')
GO

INSERT INTO Courses(Instructor_Id, Course_Name,Course_Description)
VALUES(1,'Art I','This class teaches the basic fundementals of art.'),
(1,'Art I','This class teaches the fundementals of art.'),
(1,'Art III','This class teaches the advanced art concepts.'),
(2,'Java I','This class teaches the fundementals of Java Programming.'),
(2,'Java II','This class teaches advanced Java Programming Concepts.'),
(3,'C# Programming','This class teaches the fundementals of C# Programming.'),
(4,'College Algebra','This class teaches college level algebra.'),
(5,'Stars and the Universe','Learn about astronomy concepts.'),
(6,'Database I','Basics of databases.'),
(7,'Database II','This class teaches more advanced database concepts.'),
(8,'App Design','Design apps.'),
(9,'App Dessign II','Build apps.'),
(9,'App Design III','Design and build apps.')
GO

INSERT INTO Assignments(Course_Id, Assignment_Name,Assignment_Description, Assignment_Due_Date)
VALUES(1,'Sketch Shapes','Draw the shapes posted on d2l.','2022-09-09'),
(1,'Color Wheel','Create a coloring wheel.','2022-09-17'),
(3,'Sketch Shapes','Draw the shapes posted on d2l.','2022-09-09'),
(4,'Loops','Create a program that uses all the loops we went over in todays lecture.','2022-09-17'),
(4,'Input Validation','Add input validation to the program provided on d2l.','2022-09-30'),
(4,'Array','Create a program utilizing and array.','2022-10-10'),
(8,'ERD Creation','Create an ERD for a pizza shop.','2022-09-09'),
(8,'Choose Groups','Choose groups for project.','2022-09-17'),
(8,'ERD and DB Design for APP','Create and ERD and database for your app.','2022-09-30'),
(8,'App Feedback Presentation','Present app in its current state and receive feedback.','2022-10-10')
GO

INSERT INTO Courses_Students(Course_Id, Student_Id)
VALUES(1,2),
(1,2),
(6,3),
(3,5),
(3,2),
(5,5),
(6,2),
(6,6),
(7,7),
(1,4)
GO

INSERT INTO Assignments_Students(Assignment_Id, Student_Id)
VALUES(5,2),
(5,1),
(2,2),
(3,3),
(4,4),
(2,5),
(3,2),
(2,3),
(2,4),
(2,5)
GO

