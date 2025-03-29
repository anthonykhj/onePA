-- PAmember
create table PAmember 
(MemberID varchar(10) NOT NULL,
primary key (MemberID))

-- OnePAuser
create table OnePAuser
(MemberID    varchar(10) NOT NULL,
UserName	 varchar(30) NOT NULL,
Nationality	 varchar(30) NOT NULL,
IdentifnType varchar(30) NOT NULL,
NRIC		 varchar(15) NOT NULL,
Name		 varchar(30) NOT NULL,
Race		 varchar(15) NOT NULL,
DateOfBirth   date		 NOT NULL,
MaritalStatus char(1)    NOT NULL,
Gender		  char(1)    NOT NULL,
MobileNo varchar(15) NOT NULL,
Email         varchar(30) NOT NULL,
Blk_HseNo     varchar(30) NOT NULL,
Street        varchar(30) NOT NULL,
BuildingName  varchar(30) NOT NULL,
Flr_UnitNo	  varchar(15) NOT NULL,
Postal        varchar(10) NOT NULL,
PreferredLang varchar(15) NOT NULL,
Reminder      varchar(15) NOT NULL,
Password	  varchar(30) NOT NULL,
primary key (UserName),
foreign key (MemberID) references PAmember(MemberID))

-- InterestCat
create table InterestCat
(IntCatNo	varchar(30) NOT NULL,
Title		varchar(30) NOT NULL,
primary key (IntCatNo))

-- Interest
create table Interest
(IntCatNo   varchar(30) NOT NULL,
InterestID	varchar(30) NOT NULL,
IntDesc		varchar(30) NOT NULL,
primary key (InterestID, IntCatNo),
foreign key (IntCatNo) references InterestCat(IntCatNo))

-- OnePAuser_Int
create table OnePAuser_Int
(UserName	 varchar(30) NOT NULL,
IntCatNo	varchar(30) NOT NULL,
InterestID	varchar(30) NOT NULL,
primary key (UserName, IntCatNo, InterestID),
foreign key (UserName) references OnePAuser(UserName),
foreign key (InterestID, IntCatNo) references Interest(InterestID, IntCatNo))

-- Activity
create table Activity
(ActivityCd		varchar(30)		NOT NULL,
ActivityTitle	varchar(40)		NOT NULL,
ActivityDesc	varchar(30)		NULL,
Remark			varchar(30)		NULL,
Certification	varchar(30)		NULL,
Requirements	varchar(30)		NULL,
ActivityType	varchar(30)		NOT NULL
primary key (ActivityCd))

-- Activity_PreRequisite
create table Activity_PreRequisite
(ActivityCd varchar(30) NOT NULL,
PreRequisiteID varchar(30) NOT NULL,
primary key (PreRequisiteID, ActivityCd),
foreign key (ActivityCd) references Activity(ActivityCd))


-- CommunityCtr
create table CommunityCtr
(CCNo	varchar(30) NOT NULL,
Name	varchar(30) NOT NULL,
Blk		varchar(10) NOT NULL,
Street varchar(30) NOT NULL,
BuildingName varchar(30) NOT NULL,
Flr_UnitNo	varchar(15) NOT NULL,
Contact varchar(15) NOT NULL,
primary key (CCNo))


-- Venue
create table Venue
(CCNo  varchar(30) NOT NULL,
VenueNo varchar(30) NOT NULL,
VenueName varchar(30) NOT NULL,
VenueDesc varchar(30) NULL,
primary key (VenueNo, CCNo),
foreign key (CCNo) references CommunityCtr(CCNo))

-- Trainer
create table Trainer
(TrainerNo varchar(30) NOT NULL,
TrainerName varchar(30) NULL,
TrainerDesc varchar(30) NULL,
primary key (TrainerNo))

-- Offering
create table Offering
(ActivityCd varchar(30) NOT NULL,
StartDate varchar(30) NOT NULL,
EndDate	varchar(30) NOT NULL,
TimesPerWeek varchar(15) NULL,
MinClassSize varchar(15) NOT NULL,
Language varchar(30) NOT NULL,
Vacancy	varchar(15) NOT NULL,
RegCloseDate varchar(30) NOT NULL,
NoOfSession varchar(15) NULL,
MaxClassSize varchar(15) NOT NULL,
MinFee varchar(15) NULL,
MaxFee varchar(15) NULL,
TrainerNo varchar(30) NULL,
CCNo varchar(30) NOT NULL,
primary key (ActivityCd, StartDate),
foreign key (ActivityCd) references Activity(ActivityCd),
foreign key (TrainerNo) references Trainer(TrainerNo),
foreign key (CCNo) references CommunityCtr(CCNo))


-- User_Offering
create table User_Offering
(UserName varchar(30) NOT NULL,
ActivityCd varchar(30) NOT NULL,
StartDate varchar(30) NOT NULL,
DateReg date NOT NULL,
NoOfPpts_M varchar(15) NOT NULL,
NoOfPpts_MN varchar(15) NOT NULL,
primary key (UserName, ActivityCd, StartDate),
foreign key (UserName) references OnePAuser(UserName),
foreign key (ActivityCd, StartDate) references Offering(ActivityCd, StartDate))


-- OfferPerWeek
create table OfferPerWeek
(ActivityCd varchar(30) NOT NULL,
StartDate varchar(30) NOT NULL,
OPWDay varchar(30) NOT NULL,
StartTime varchar(30) NOT NULL,
EndTime varchar(30) NOT NULL,
primary key (ActivityCd, StartDate, OPWDay, StartTime),
foreign key (ActivityCd, StartDate) references Offering(ActivityCd, StartDate))


-- OfrPWk_Venue
create table OfrPWk_Venue
(ActivityCd varchar(30) NOT NULL,
StartDate varchar(30) NOT NULL,
OPWDay varchar(30) NOT NULL,
StartTime varchar(30) NOT NULL,
CCNo  varchar(30) NOT NULL,
VenueNo varchar(30) NOT NULL,
primary key (ActivityCd, StartDate, OPWDay, StartTime, VenueNo, CCNo),
foreign key (ActivityCd, StartDate, OPWDay, StartTime) references OfferPerWeek(ActivityCd, StartDate, OPWDay, StartTime),
foreign key (VenueNo, CCNo) references Venue(VenueNo, CCNo)
on delete cascade
on update no action)



-- Experience
create table Experience
(TrainerNo varchar(30) NOT NULL,
ExpNo varchar(30) NOT NULL,
ExpDesc varchar(30) NULL,
primary key (ExpNo),
foreign key (TrainerNo) references Trainer(TrainerNo))


-- Qualification
create table Qualification
(QualifnID varchar(30) NOT NULL,
QualifnTitle varchar(30) NOT NULL,
QualifnDesc varchar(30) NULL,
primary key (QualifnID))


-- Trainer_Qualifn
create table Trainer_Qualifn
(TrainerNo varchar(30) NOT NULL,
QualifnID varchar(30) NOT NULL,
YearObtained integer NOT NULL,
primary key (TrainerNo, QualifnID),
foreign key (TrainerNo) references Trainer(TrainerNo),
foreign key (QualifnID) references Qualification(QualifnID))


-- Award
create table Award
(AwardID varchar(30) NOT NULL,
AwardName varchar(30) NOT NULL,
primary key (AwardID))


-- Trainer_Award
create table Trainer_Award
(TrainerNo varchar(30) NOT NULL,
AwardID varchar(30) NOT NULL,
YearAwarded integer NOT NULL,
primary key (TrainerNo, AwardID),
foreign key (TrainerNo) references Trainer(TrainerNo),
foreign key (AwardID) references Award(AwardID)
on delete no action
on update cascade)

Insert into CommunityCtr
values
('0001', 'Bishan CC', '111', 'Street 10', 'Bishan', '#01-10', '11111111'),
('0002', 'Bodek CC', '222', 'Street 20', 'Bodek', '#02-20', '22222222'),
('0003', 'Toa Payoh CC', '333', 'Street 30', 'Toa Payoh', '#03-30', '33333333'),
('0004', 'Geyland Bahru', '444', 'Street 40', 'Geyland Bahru', '#04-40', '44444444'),
('0005', 'Bukit Purmei RC', '555', 'Street 50', 'Bukit Purmei', '#05-50', '55555555')


Insert into Activity
values
('C02660', 'Yin Yoga', 'YYoga', NULL, NULL, NULL, 'Course'),
('C26282', 'Basic Computer Step 1 and 2', 'Learn Computer', NULL, NULL, NULL, 'Course'),
('A02659', 'Neighbourhood Celebration Night', 'Celebrate', NULL, NULL, NULL, 'Event'),
('A01691', 'Brisk Walking', 'Walk', NULL, NULL, NULL, 'Event'),
('A01669', 'Laughter Yoga', 'LYoga', NULL, NULL, NULL, 'Event')

Insert into Trainer
values
('T101', 'Mary Hoe', NULL),
('T202', 'Bob Lee', NULL),
('T303', 'Jack Wee', NULL),
('T404', 'David Tan', NULL),
('T505', NULL, NULL)

Insert into Offering
values
('C02660', '15 Nov 2017', '17 Jan 2018', '1', '15', 'English', '24', '1 Nov 2017', '10', '50', '10', '30', 'T101', '0001'),
('C26282', '24 Oct 2017', '02 Nov 2017', '2', '5', 'English', '6', '11 Oct 2017', '4', '15', '25', '40', 'T202', '0002'),
('A02659', '22 Dec 2017', '22 Dec 2017', NULL, '200', 'English', '341', '15 Dec 2017', '1', '800', NULL, NULL, 'T505', '0003'),
('A01691', '27 Mar 2011', '27 Dec 2020', NULL, '100', 'English', '50', '15 Mar 2011', NULL, '100', NULL, NULL, 'T505', '0004'),
('A01669', '01 Jul 2010', '31 Dec 2100', '2', '35', 'English', '47', '01 Jun 2010', NULL, '100', '10', '50', 'T505', '0005')
--max class size - vacancy = no. of participants
Insert into OfferPerWeek
values
('C02660', '15 Nov 2017', 'Wed', '08:30pm', '09:45pm'),
('C26282', '24 Oct 2017', 'Tue', '07:00pm', '10:00pm'),
('C26282', '24 Oct 2017', 'Thu', '07:00pm', '10:00pm'),
('A02659', '22 Dec 2017', 'Fri', '06:30pm', '09:00pm'),
('A01691', '27 Mar 2011', 'Sun', '06:30am', '08:00am'),
('A01669', '01 Jul 2010', 'Thu', '12:00am', '01:00pm'),
('A01669', '01 Jul 2010', 'Fri', '12:00am', '01:00pm')




select C.CCNo, A.ActivityCd, ActivityTitle, ActivityType, op.StartDate, EndDate, coalesce(noofsession, 'N.A.') 'NoSessions', opwday 'Day', StartTime, EndTime, (convert(int, maxclasssize) - convert(int,vacancy)) 'No Participants', coalesce(trainername, 'N.A.') 'TrainerName'
from communityctr C, activity A, offering O, offerperweek op, trainer T
where A.activitycd = o.activitycd  and op.startdate = o.startdate and c.ccno = o.ccno 
order by 1 de


--self designed query
--Create

Create view Most_Money_Loss
(CC, Activity, Loss)
As
Select name, A.activitycd, (convert(int,maxfee) * vacancy) 'Loss'
from CommunityCtr, Activity A, Offering O
where a.activitycd = o.activitycd and (select name and activitycd from 


select (convert(int,maxfee) * vacancy) from offering


EXEC sp_MSforeachtable @command1 = "DROP TABLE ?"
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"







 

