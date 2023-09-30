CREATE DATABASE HOSPITAL;

CREATE TABLE Department(
dep_id int PRIMARY KEY,
dep_name varchar(256) NOT NULL
);

CREATE TABLE Person(
person_id int PRIMARY KEY,
SSN int UNIQUE NOT NULL,
lastName varchar(50) NOT NULL,
firstName varchar(50) NOT NULL,
gender varchar(10) NOT NULL,
address varchar(50),
telephone_number char(11),
email varchar(50),
dateOfBirth datetime,
dep_id int FOREIGN KEY REFERENCES Department(dep_id),
emp_id int,
p_id int,
v_id int
);

CREATE TABLE Employee(
emp_id int PRIMARY KEY,
hired_date datetime NOT NULL,
quitted_date datetime,
staff_id int,
n_id int,
ph_id int
);


CREATE TABLE Staff(
staff_id int PRIMARY KEY,
job_title varchar(50) NOT NULL
);


CREATE TABLE Nurse(
n_id int PRIMARY KEY,
status varchar(30) NOT NULL,
reception_id int
);


CREATE TABLE Physician(
ph_id int PRIMARY KEY,
position varchar(30) NOT NULL
);

CREATE TABLE Patient(
p_id int PRIMARY KEY,
ph_id int FOREIGN KEY REFERENCES Physician(ph_id),
pay_id int,
r_id int,
diag_id int
);

---------------------------------------------------------------------EXAMPLE
INSERT INTO Patient
VALUES(1901, 403, 200, 1002, 805);
---------------------------------------------------------------------------+



CREATE TABLE Volunteer(
v_id int PRIMARY KEY,
worked_hour int NOT NULL,
cost_per_hour int NOT NULL
);


CREATE TABLE Room(
room_num varchar(10)  PRIMARY KEY,
room_type varchar(20) NOT NULL,
blockfloor int NOT NULL,
available char(1) NOT NULL
);

CREATE TABLE Reception(
reception_id int PRIMARY KEY,
telephone char(5) NOT NULL,
location varchar(50) NOT NULL
);

CREATE TABLE Payment(
pay_id int PRIMARY KEY,
amount int NOT NULL,
paid char(1) NOT NULL
);

CREATE TABLE Record(
r_id int PRIMARY KEY,
n_id int FOREIGN KEY REFERENCES Nurse(n_id),
room_num varchar(10) FOREIGN KEY REFERENCES Room(room_num)
);

CREATE TABLE Diagnose(
diag_id int PRIMARY KEY,
name varchar(50) NOT NULL,
remark varchar(50) NOT NULL,
date datetime NOT NULL
);


--In some table we couldn't add our foreign key straightaway that's why we are adding them by altering the table----

ALTER TABLE Department
ADD FOREIGN KEY (emp_id) REFERENCES Employee(emp_id);

ALTER TABLE Person
ADD FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (p_id) REFERENCES Patient(p_id),
    FOREIGN KEY (v_id) REFERENCES Volunteer(v_id);

ALTER TABLE Employee
ADD FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (n_id) REFERENCES Nurse(n_id),
    FOREIGN KEY (ph_id) REFERENCES Physician(ph_id);    

ALTER TABLE Nurse
ADD FOREIGN KEY (reception_id) REFERENCES Reception(reception_id);    

ALTER TABLE Patient
ADD FOREIGN KEY (pay_id) REFERENCES Payment(pay_id),
    FOREIGN KEY (r_id) REFERENCES Record(r_id),
    FOREIGN KEY (diag_id) REFERENCES Diagnose(diag_id); 


--Inserting the value to a table
ALTER TABLE Department
ALTER COLUMN emp_id int NOT NULL;   --my mistake department head can not bu null

INSERT INTO Department
VALUES 
      (1001, 'Surgery', 101),
      (1002, 'General Medicine', 102),
      (1003, 'Pharmacy Department', 103),
      (1004, 'Physical Medicine', 104),
      (1005, 'Rehabilitation Department', 105),
      (1006, 'Psychiatry', 106),
      (1007, 'Radiology Department', 107),
      (1008, 'Dietary Department', 108),
      (1009, 'Outpatient Department', 109),
      (1010, 'Medical Department', 100);    
     


INSERT INTO Person
VALUES 		
(2020190, 10334, 'Abakova',	'Aruzhan', 'female', 'Zhakupov 5',	'870723456', 'abakovaa@gmail.com', '2002-09-09', 1010, 100, NULL, NULL),
(2020191, 10434, 'Kabdibek', 'Arunaz', 'female', 'Botkina 6', '870723448', 'kabdibeka@gmail.com', '1978-09-16', 1001, 101, NULL, NULL),
(2020192, 10634, 'Yerlankyzy', 'Dana', 'female', 'Akmeshit 45',	'870723156', 'yerlankyzyd@gmail.com' ,'1972-01-09',1010, 102, NULL,	NULL),
(2020193, 12334, 'Mausimbaev', 'Dastan', 'male', 'Kurmangazy 15', '874723466', 'mausimbaevd@mail.com',	'1995-09-09', 1006, NULL, 603, NULL),
(2020194, 17334, 'Adilzhanov', 'Alnur', 'male', 'Satbayev 5', '870729056', 'adilzhanova@mail.com', '1983-04-07', 1004, NULL, 604, NULL),
(2020195, 18374, 'Konarova', 'Saule', 'female', 'Kunanbaev 10',	'870726756', 'konarovas@mail.com', '2003-09-19', 1010, NULL, 605, NULL),
(2020196, 15634, 'Dumanova', 'Dina', 'female',	'Kopesov 89', '870893456',	'dumanovad@mail.com',	'1976-11-23', 1004, NULL, 606, NULL),
(2020197, 11564, 'Yermekuly', 'Asylzhan', 'male', 'Zhunusbay 6', '874723478', 'yermekulya@mail.com' ,'1993-09-09', 1004, NULL, NULL, 32),
(2020198, 20345, 'Asylzhanov', 'Serik',	'male',	'Satbayev 49',	'870724579', 'asylzhanovs@mail.com', '1991-09-29', 1004, NULL,	NULL, 33),
(2020199, 10874, 'Gaziz', 'Alnur', 'male',	'Zhakupov 89', '870776586',	'gaziza@mail.com' ,'2001-12-13', 1002, NULL, NULL, 34);



--Need to start inserting the value from the subtypes on order to escape some mistakes
INSERT INTO Reception
VALUES 
      (900, '72735', 'first floor'),
      (901, '31454', 'second floor'),
      (902, '84394', 'third floor'),
      (903, '32343', 'fourth floor'),
      (904, '71734', 'fifth floor'),
      (905, '73519', 'first floor'),
      (906, '48384', 'second floor'),
      (907, '32434', 'fifth floor'),
      (908, '72134', 'ninth floor'),
      (909, '34597', 'first floor');          


INSERT INTO Room
VALUES 
      ('101A', 'single', 3,  '1'),
      ('102A', 'single', 8,  '0'),
      ('103A', 'double', 6,  '1'),
      ('104A', 'triple', 9,  '0'),
      ('105A', 'single', 10,  '1'),
      ('201A', 'double', 5,  '1'),
      ('202A', 'triple', 1,  '0'),
      ('203A', 'quad', 2,  '0'),
      ('204A', 'triple', 4,  '1'),
      ('205A', 'single', 7,  '1');


INSERT INTO Staff
VALUES 
      (300, 'cleaner'), 
      (301, 'watchman'), 
      (302, 'cleaner'),        
      (303, 'chef'), 
      (304, 'security_guard'), 
      (305, 'cleaner'), 
      (306, 'security_guard'), 
      (307, 'watchman'), 
      (308, 'cleaner'), 
      (309, 'security_guard');


INSERT INTO Physician
VALUES 
      (400, 'Staff Internist'), 
      (401, 'Attending Physician'), 
      (402, 'Surgical Attending Physician'),        
      (403, 'Senior Attending Physician'), 
      (404, 'Head Chief of Medicine'), 
      (405, 'Surgical Attending Physician'), 
      (406, 'Surgical Attending Physician'), 
      (407, 'MD Resident'), 
      (408, 'MD Resident'), 
      (409, 'Staff Internist');


INSERT INTO Payment
VALUES
    (200, 10000, '1'),
    (201, 80000, '0'),
    (202, 150000, '1'),
    (203, 23000, '1'),
    (204, 5000, '0'),
    (205, 60000, '0'),
    (206, 40000, '1'),
    (207, 40000, '0'),
    (208, 50000, '1'),
    (209, 80000, '1');


INSERT INTO Record
VALUES 
    (1000, 500, '101A'),
    (1001, 500, '102A'),
    (1002, 501, '101A'),
    (1003, 503, '102A'),
    (1004, 503, '101A'),
    (1005, 504, '105A'),
    (1006, 500, '201A'),
    (1007, 502, '202A'),
    (1008, 502, '203A'),
    (1009, 505, '101A');


INSERT INTO Diagnose
VALUES 
    (800, 'hypertension', 'undetermined', '2019-09-23'),
    (801, 'hyperlipidemia', 'serious', '2020-06-19'),
    (802, 'diabetes', 'critical', '2011-01-27'),
    (803, 'back pain', 'stable', '2016-09-30'),
    (804, 'anxiety', 'undetermined', '2015-10-12'),
    (805, 'obesity', 'serious', '2019-04-28'),
    (806, 'allergic rhinitis', 'undetermined', '2018-07-07'),
    (807, 'reflux esophagitis', 'critical', '2009-12-18'),
    (808, 'pain in joint', 'serious', '2018-11-30'),
    (809, 'asthma', 'critical', '2018-11-30'); 



INSERT INTO Volunteer
VALUES 
    (30, 2000, 30),
    (31, 3000, 48),
    (32, 1500, 150),
    (33, 2600, 65),
    (34, 2500, 34),
    (35, 1300, 65),
    (36, 2000, 23),
    (37, 2500, 43),
    (38, 1200, 423),
    (39, 2000, 422);

--pay_id has to be unique--r_id has to be unique--diad_id mustbe unoque
INSERT INTO Patient
VALUES 
    (600, 400, 200, 1000, 800),  
    (601, 400, 201, 1001, 801),  
    (602, 402, 202, 1002, 802),  
    (603, 403, 203, 1003, 803),  
    (604, 403, 204, 1004, 804),  
    (605, 400, 205, 1005, 805),  
    (606, 400, 206, 1006, 806),  
    (607, 407, 207, 1007, 807),  
    (608, 402, 208, 1008, 808),  
    (609, 402, 209, 1009, 809);



INSERT INTO Employee
VALUES 
    (100, '2015-12-09', '2020-12-09', NULL, 503, NULL),
    (101, '2011-02-09', '2019-12-30', NULL, NULL, 401),
    (102, '2005-12-09', NULL, NULL, 503, NULL),
    (103, '2018-10-09', '2019-12-13', 301, NULL, NULL),
    (104, '2002-02-19', NULL, NULL, 505, NULL),
    (105, '2008-10-19', NULL, NULL, NULL, 403),
    (106, '2005-02-09', '2014-03-04', 303, NULL, NULL),
    (107, '2016-04-09', '2016-07-28', 309, NULL, NULL),
    (108, '2013-12-29', NULL, NULL, NULL, 408),
    (109, '2016-09-17', '2016-11-30', 307, NULL, NULL);


INSERT INTO Nurse
VALUES 
      (500, 'nurse', 900),
      (501, 'nurse', 900),
      (502, 'nurse', 902),
      (503, 'head nurse', 903),
      (504, 'nurse', 902),
      (505, 'nurse', 900),
      (506, 'nurse', 906),
      (507, 'head nurse', 904),
      (508, 'nurse', 904),
      (509, 'nurse', 904);  














-------------------
CREATE PROCEDURE insertPerson 
@perId int, @ssn_ int, @ln varchar(30), @fn varchar(30), @g varchar(10), @add varchar(30),  @tn varchar(20), @em varchar(30), @dob datetime, @depId int, @empid int, @pid int, @vid int
AS
insert into Person values(@perId, @ssn_, @ln, @fn, @g, @add, @tn, @em, @dob, @depId, @empid, @pid, @vid)
GO

EXEC  insertPerson @perId = 22201992, @ssn_ = 1033374, @ln = 'Gaziz', @fn =  'Alnur', @g = 'male', 
@add = 'Zhakupov 89', @tn = '870776586', @em = 'gaziza@mail.com', @dob = '09-12-2001', @depId = 1010, @empid = NULL, @pid = NULL, @vid = 34;

DELETE FROM Person 
WHERE SSN = 10374;   

DELETE FROM Department
WHERE dep_id = 453;


CREATE PROCEDURE  insertEmployee @ei int, @hd datetime , @qd datetime, @stid int, @nid int, @phid int
AS
insert into Employee values(@ei, @hd, @qd, @stid, @nid, @phid)
GO

EXEC  insertEmployee @ei = 112, @hd = '2016-09-17', @qd = '2019-11-18', @stid = 307, @nid = NULL, @phid = NULL



CREATE PROCEDURE insertDepartment @di int, @depName varchar(50) , @ei int
AS
insert into Department values(@di, @depName, @ei)
GO

EXEC insertDepartment @di = 453, @depName = 'Medical Department2', @ei = 112 


CREATE PROCEDURE deleteEmployee @id int
AS
delete from Employee where emp_id = @id
GO

EXEC deleteEmployee @id = 109



CREATE  PROCEDURE updateRoom @avail char(1), @n varchar(10)
AS
update Room set available = @avail where room_num = @n 
GO

EXEC updateRoom @avail = '0', @n = '205A'



CREATE PROCEDURE updatePayment1 @paid int , @id int
AS
update Payment set paid = @paid where pay_id = @id 
GO

EXEC updatePayment1 @paid = 1, @id = 207


CREATE PROCEDURE updateNurse @status varchar(10) , @id int
AS
update Nurse set status = @status where n_id = @id 
GO

EXEC updateNurse @status = 'head nurse', @id = 508



CREATE PROCEDURE deletePatient @id int
AS
delete from Patient where p_id = @id
GO

EXEC deletePatient @id = 609


CREATE PROCEDURE deleteVol @id int
AS
delete from Volunteer where v_id = @id
GO

EXEC deleteVol @id = 39

SELECT *
from Patient;

