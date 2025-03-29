# onePA
A relational database system designed to streamline online user registration, course/activity enrollment, and reporting for community centers.

## 📌 Overview  
This project designs and implements a **logically structured relational database** for a community portal (inspired by systems like Singapore’s [onePA](https://www.onepa.gov.sg/)), with a focus on:  
- Robust **logical data modelling** (ER-to-relational mapping).  
- Strict enforcement of **entity and referential integrity**.  
- Practical SQL querying for user registration, course/activity enrolment, and analytics.

## 🧩 Logical Data Model (Enhanced Entity Relationship Diagram)
![image](https://github.com/user-attachments/assets/10bc1230-73bb-414b-b1d5-87e900a24a2d)

## 🔗 Relations Derived from Logical Data Model
| No. | Relation Name       | Primary Key                     | Non-Key Attributes                                                                 | Foreign Key                          | Referenced Relation   |
|-----|---------------------|---------------------------------|-----------------------------------------------------------------------------------|--------------------------------------|-----------------------|
| 1   | PAmember            | MemberID                        | -                                                                                 | -                                    | -                     |
| 2   | OnePAuser           | UserName                        | Nationality, IdentifnType, NRIC, Name, Race, DateOfBirth, MaritalStatus, Gender, MobileNo, Email, Blk_HseNo, Street, BuildingName, Flr_UnitNo, Postal, PreferredLang, Reminder, Password | MemberID                             | PAmember              |
| 3   | InterestCat         | IntCatNo                        | Title                                                                             | -                                    | -                     |
| 4   | Interest            | InterestID, IntCatNo            | IntDesc                                                                           | IntCatNo                             | InterestCat           |
| 5   | OnePAuser_Int       | UserName, IntCatNo, InterestID  | -                                                                                 | UserName, IntCatNo, InterestID       | OnePAuser, Interest   |
| 6   | Activity            | ActivityCd                      | ActivityTitle, ActivityDesc, Remark, Certification, Requirements, ActivityType     | -                                    | -                     |
| 7   | ActivityPreRequisite| PreRequisiteID, ActivityCd      | -                                                                                 | ActivityCd                           | Activity              |
| 8   | CommunityCtr        | CCNo                            | Name, Blk, Street, Building, Flr_UnitNo, Contact                                  | -                                    | -                     |
| 9   | Venue               | VenueNo, CCNo                   | VenueName, VenueDesc                                                              | CCNo                                 | CommunityCtr          |
| 10  | Offering            | StartDate, ActivityCd           | EndDate, TimesPerWeek, MinClassSize, Language, Vacancy, RegCloseDate, NoOfSession, MaxClassSize, MinFee, MaxFee | ActivityCd, TrainerNo, CCNo          | Activity, Trainer, CommunityCtr |
| 11  | User_Offering       | UserName, ActivityCd, StartDate | DateReg, NoOfPpts_M, NoOfPpts_MN                                                  | UserName, ActivityCd, StartDate      | OnePAuser, Offering   |
| 12  | OfferPerWeek        | OPWDay, StartTime, ActivityCd, StartDate | EndTime                                                                           | ActivityCd, StartDate                | Activity, Offering    |
| 13  | OfrPWk_Venue        | OPWDay, StartTime, ActivityCd, StartDate, VenueNo, CCNo | -                                                                                 | OPWDay, StartTime, ActivityCd, StartDate, VenueNo, CCNo | OfferPerWeek, Venue  |
| 14  | Trainer             | TrainerNo                       | TrainerName, TrainerDesc                                                          | -                                    | -                     |
| 15  | Experience          | ExpNo                           | ExpDesc                                                                           | TrainerNo                            | Trainer               |
| 16  | Qualification       | QualifnID                       | QualifnTitle, QualifnDesc                                                         | -                                    | -                     |
| 17  | Trainer_Qualifn     | TrainerNo, QualifnID            | YearObtained                                                                      | TrainerNo, QualifnID                 | Trainer, Qualification |
| 18  | Award               | AwardID                         | AwardName                                                                         | -                                    | -                     |
| 19  | Trainer_Award       | TrainerNo, AwardID              | YearAwarded                                                                       | TrainerNo, AwardID                   | Trainer, Award        |

## 💻 Creation/Population of Tables
SQL database implementation codes can be found [here](https://github.com/anthonykhj/onePA/blob/main/onePA%20Database.sql).
