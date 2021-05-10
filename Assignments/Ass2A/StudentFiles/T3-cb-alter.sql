--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-cb-alter.sql

--Student ID: 30632714
--Student Name: Abhiram Aroop
--Tutorial No: Tutorial 06

/* Comments for your marker:




*/

/*
Task 3:

Make the listed changes to the "live" database
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (a)

ALTER TABLE centre ADD centre_total_offspring NUMERIC(6) DEFAULT 0;


-- (b)
/*
******* Explain here your selected approach and its advantage/s *********

An appropriate method to deal with this is adding a new attribute into the animal
table. This attribute will act as a status for the animal to determine whether the 
animal is dead or alive, that it it can be a CHAR(1) value of 'Y' or 'N', where
'Y' means the animal is alive and 'N' stands for dead. This is a simple and strightforward
approach that does not require the creation of additional unnecessary attribute types or
tables.

In this demonstration the default value of the animal will be set to alive ('Y'). I will
insert a new animal and change it's status to 'N'.
*/

ALTER TABLE animal ADD animal_alive CHAR(1) DEFAULT 'Y';

Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME,ANIMAL_ALIVE) values ('2','F','AUS20',NULL,'Panthera','leo','Y');
UPDATE ANIMAL SET animal.animal_alive = ('N') WHERE animal.animal_id = '2';


-- (c)

