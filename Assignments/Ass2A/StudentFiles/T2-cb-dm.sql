--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-dm.sql

--Student ID: 30632714
--Student Name: Abhiram Aroop
--Tutorial No: Tutorial 06

/* Comments for your marker:




*/

/*
Task 2 (c):

Complete the listed DML actions
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (i)

CREATE SEQUENCE animal_id_seq START WITH 500 INCREMENT BY 1;
CREATE SEQUENCE brevent_id_seq START WITH 500 INCREMENT BY 1;

-- (ii)

UPDATE animal
SET (animal.centre_id) = (SELECT centre.centre_id
                          FROM centre
                          WHERE centre.centre_name = 'Kruger National Park')
                        
WHERE animal.centre_id = (SELECT centre.centre_id
                          FROM centre
                          WHERE centre.centre_name = 'SanWild Wildlife Sanctuary');
                          
DELETE FROM centre
WHERE centre.centre_id = (SELECT centre.centre_id
                          FROM centre
                          WHERE centre.centre_name = 'SanWild Wildlife Sanctuary');

-- (iii)




-- (iv)



