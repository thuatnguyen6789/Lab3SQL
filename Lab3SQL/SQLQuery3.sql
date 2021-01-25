IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'ThuvienSach')
DROP DATABASE ThuVienSach

CREATE DATABASE ThuVienSach
GO

USE ThuVienSach
GO
CREATE TABLE Book(
BookCode INT  IDENTITY,
BookTitle VARCHAR(100),
Author VARCHAR(50),
Edition INT,
BookPrice MONEY CHECK (BookPrice >0 AND BookPrice <200),
Copies INT,
)
GO
ALTER TABLE Book
ADD CONSTRAINT PK_BOOK
PRIMARY KEY (BookCode)
GO

INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Toi yeu em','Xuan Dieu',2,30,3);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Song','Xuan Quynh',4,10,2);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Cha giau cha ngheo','James Bond',5,70,4);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Lao Hac','Nam Cao',11,32,3);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Vo Nhat','Kim Lan',3,30,2);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Vuot len so phan','Emily Do',2,45,6);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Nguoi thanh cong','William',2,6,9);
INSERT INTO Book(BookTitle,Author,Edition,BookPrice,Copies) VALUES('Hanh phuc mong manh','Alex Nguyen',4,50,1);
GO
SELECT* FROM Book
GO

USE ThuVienSach
GO

CREATE TABLE Member(
MemberCode INT IDENTITY,
Name VARCHAR(50),
Address VARCHAR(100),
PhoneNumber INT,
)
GO

ALTER TABLE Member
ADD CONSTRAINT PK_MEMBER
PRIMARY KEY (MemberCode)
GO


INSERT INTO Member(Name,Address,PhoneNumber)VALUES('Nguyen Huy Thuat','159 Phung Khoang - HA NOI',0987995271);
INSERT INTO Member(Name,Address,PhoneNumber)VALUES('Thao Ngo',' Trung Van - HA NOI',0961770326);
INSERT INTO Member(Name,Address,PhoneNumber)VALUES('James St', 'NGUYEN Trai - HA NOI',028568903);
INSERT INTO Member(Name,Address,PhoneNumber)VALUES('Steve Job','American',01000999888);
INSERT INTO Member(Name,Address,PhoneNumber)VALUES('Mark','England',099910002);
GO
SELECT*FROM Member
GO

USE ThuVienSach
GO

CREATE TABLE IssueDetails(
BookCode INT NOT NULL,
MemberCode INT NOT NULL,
IssueDate DATETIME,
ReturnDate DATETIME,
CONSTRAINT mk FOREIGN KEY (BookCode) REFERENCES Book(BookCode),
CONSTRAINT sk FOREIGN KEY (MemberCode) REFERENCES Member(MemberCode),
)
GO
INSERT INTO IssueDetails(BookCode,MemberCode,IssueDate,ReturnDate) VALUES(4,1,'01-01-2021','03-01-2021');
INSERT INTO IssueDetails(BookCode,MemberCode,IssueDate,ReturnDate) VALUES(8,2,'05-02-2021','09-02-2021');
INSERT INTO IssueDetails(BookCode,MemberCode,IssueDate,ReturnDate) VALUES(5,4,'03-04-2021','03-05-2021');
INSERT INTO IssueDetails(BookCode,MemberCode,IssueDate,ReturnDate) VALUES(1,3,'05-04-2021','06-04-2021');
INSERT INTO IssueDetails(BookCode,MemberCode,IssueDate,ReturnDate) VALUES(6,5,'02-01-2021','09-01-2021');
GO
SELECT*FROM IssueDetails
GO


