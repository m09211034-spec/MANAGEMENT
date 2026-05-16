-- Create Database (Instructional)
-- CREATE DATABASE MisurataUniDB;
-- USE MisurataUniDB;

-- Create Admins Table
CREATE TABLE Admins (
    AdminID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL
);

-- Create Colleges Table
CREATE TABLE Colleges (
    CollegeID INT PRIMARY KEY IDENTITY(1,1),
    CollegeName NVARCHAR(150) NOT NULL,
    Description NVARCHAR(MAX) NOT NULL
);

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(150) NOT NULL,
    Description NVARCHAR(MAX) NOT NULL,
    CollegeID INT NOT NULL,
    CONSTRAINT FK_Departments_Colleges FOREIGN KEY (CollegeID)
        REFERENCES Colleges(CollegeID) ON DELETE CASCADE
);

-- Insert Sample Data
INSERT INTO Admins (FullName, Email, Password) VALUES ('Super Admin', 'admin@misurata.edu.ly', 'Admin@123');

INSERT INTO Colleges (CollegeName, Description) VALUES
('College of Information Technology', 'Focuses on computer science, software engineering, and information systems.'),
('College of Engineering', 'Offers degrees in civil, electrical, and mechanical engineering.'),
('College of Economics', 'Covers business administration, accounting, and economic sciences.');

INSERT INTO Departments (DepartmentName, Description, CollegeID) VALUES
('Software Engineering', 'Study of designing, developing and maintaining software systems.', 1),
('Computer Science', 'Study of computers and computational systems.', 1),
('Civil Engineering', 'Design and maintenance of the physical and naturally built environment.', 2);
