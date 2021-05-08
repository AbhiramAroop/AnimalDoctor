--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-insert.sql

--Student ID: 30632714
--Student Name: Abhiram Aroop
--Tutorial No: Tutorial 06

/* Comments for your marker:




*/

/*
Task 2 (b):

Load the ANIMAL and BREEDING_EVENT tables with your own test data using the 
supplied T2-cb-insert.sql file script file, and SQL commands which will  
insert as a minimum, the following sample data -
 - 12 animals, some of which must have been captured from the wild, i.e. 
      are not the offspring from a breeding event, and
- 4 breeding events
Your inserted rows must meet the assignment specification requirements
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- INSERTING into ANIMAL
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('12','M','AUS10',NULL,'Myrmecobius','fasciatus');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('42','F','SAF10',NULL,'Sarcophilus','harrisii');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('36','M','SAF20',NULL,'Sarcophilus','harrisii');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('5','F','AUS20',NULL,'Myrmecobius','fasciatus');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('1','M','AUS20',NULL,'Macrotis','lagotis');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('53','F','SAF10',NULL,'Macrotis','lagotis');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('78','M','AUS10',NULL,'Setonix','brachyurus');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('64','M','AUS30',NULL,'Myrmecobius','fasciatus');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('90','F','SAF30',NULL,'Setonix','brachyurus');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('92','M','SAF20',NULL,'Myrmecobius','fasciatus');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('6','F','AUS40',NULL,'Hippopotamus','amphibius');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('20','M','SAF20',NULL,'Hippopotamus','amphibius');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('18','F','SAF10',NULL,'Hippopotamus','amphibius');
Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values ('76','M','AUS20',NULL,'Panthera','leo');


-- INSERTING into BREEDING_EVENT
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values ('1','02-Apr-2020','5','12');
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values ('24','07-Jan-2020','53','1');
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values ('7','21-Jan-2021','5','64');
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values ('94','17-Oct-2020','90','78');
Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values ('67','10-Dec-2020','18','20');
