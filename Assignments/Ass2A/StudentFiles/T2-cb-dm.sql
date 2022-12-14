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

INSERT into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values (animal_id_seq.nextval,
                                                                                            'F',
                                                                                            (SELECT centre.centre_id FROM centre WHERE centre.centre_name = 'Australia Zoo'),
                                                                                            NULL,
                                                                                            (SELECT species.spec_genus FROM species WHERE species.spec_popular_name = 'Tasmanian Devil'),
                                                                                            (SELECT species.spec_name FROM species WHERE species.spec_popular_name = 'Tasmanian Devil'));

INSERT into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values (animal_id_seq.nextval,
                                                                                            'M',
                                                                                            (SELECT centre.centre_id FROM centre WHERE centre.centre_name = 'Werribee Open Range Zoo'),
                                                                                            NULL,
                                                                                            (SELECT species.spec_genus FROM species WHERE species.spec_popular_name = 'Tasmanian Devil'),
                                                                                            (SELECT species.spec_name FROM species WHERE species.spec_popular_name = 'Tasmanian Devil'));

-- (iv)

Insert into BREEDING_EVENT (BREVENT_ID,BREVENT_DATE,MOTHER_ID,FATHER_ID) values (brevent_id_seq.nextval,

                                                                                TO_DATE('10-Feb-2021'),
                                                                                
                                                                                (SELECT animal.animal_id FROM animal WHERE animal.centre_id = (SELECT centre.centre_id FROM centre WHERE centre.centre_name = 'Australia Zoo')
                                                                                AND animal.spec_genus = (SELECT species.spec_genus FROM species WHERE species.spec_popular_name = 'Tasmanian Devil')
                                                                                AND animal.spec_name = (SELECT species.spec_name FROM species WHERE species.spec_popular_name = 'Tasmanian Devil')),
                                                                                
                                                                                (SELECT animal.animal_id FROM animal WHERE animal.centre_id = (SELECT centre.centre_id FROM centre WHERE centre.centre_name = 'Werribee Open Range Zoo')
                                                                                AND animal.spec_genus = (SELECT species.spec_genus FROM species WHERE species.spec_popular_name = 'Tasmanian Devil')
                                                                                AND animal.spec_name = (SELECT species.spec_name FROM species WHERE species.spec_popular_name = 'Tasmanian Devil')));

Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values (animal_id_seq.nextval,
                                                                                            'F',
                                                                                            (SELECT centre.centre_id FROM centre WHERE centre.centre_name = 'Australia Zoo'),
                                                                                            (SELECT breeding_event.brevent_id FROM breeding_event WHERE breeding_event.brevent_date = '10-Feb-2021'
                                                                                                AND breeding_event.mother_id = (SELECT animal.animal_id FROM animal WHERE animal.spec_genus = (SELECT species.spec_genus FROM species WHERE species.spec_popular_name = 'Tasmanian Devil') 
                                                                                                    AND animal.centre_id = (SELECT centre.centre_id FROM centre WHERE centre.centre_name = 'Australia Zoo')
                                                                                                    AND animal.spec_name = (SELECT species.spec_genus FROM species WHERE species.spec_popular_name = 'Tasmanian Devil'))),
                                                                                            (SELECT species.spec_genus FROM species WHERE species.spec_popular_name = 'Tasmanian Devil'),
                                                                                            (SELECT species.spec_name FROM species WHERE species.spec_popular_name = 'Tasmanian Devil'));

Insert into ANIMAL (ANIMAL_ID,ANIMAL_SEX,CENTRE_ID,BREVENT_ID,SPEC_GENUS,SPEC_NAME) values (animal_id_seq.nextval,
                                                                                            'M',
                                                                                            (SELECT centre.centre_id FROM centre WHERE centre.centre_name = 'Australia Zoo'),
                                                                                            (SELECT breeding_event.brevent_id FROM breeding_event WHERE breeding_event.brevent_date = '10-Feb-2021'
                                                                                                AND breeding_event.father_id = (SELECT animal.animal_id FROM animal WHERE animal.spec_genus = (SELECT species.spec_genus FROM species WHERE species.spec_popular_name = 'Tasmanian Devil') 
                                                                                                    AND animal.centre_id = (SELECT centre.centre_id FROM centre WHERE centre.centre_name = 'Werribee Open Range Zoo')
                                                                                                    AND animal.spec_name = (SELECT species.spec_genus FROM species WHERE species.spec_popular_name = 'Tasmanian Devil'))),
                                                                                            (SELECT species.spec_genus FROM species WHERE species.spec_popular_name = 'Tasmanian Devil'),
                                                                                            (SELECT species.spec_name FROM species WHERE species.spec_popular_name = 'Tasmanian Devil'));
                                                                                            
                                                                                            