--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-cb-schm.sql

--Student ID: 30632714
--Student Name: Abhiram Aroop
--Tutorial No: Tutorial 06

/* Comments for your marker:




*/

/*
Using the model and details supplied, and the supplied T1-cb-schm.sql
file, create an SQL schema file which can be used to create this database in
Oracle.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

DROP TABLE species CASCADE CONSTRAINTS purge;
DROP TABLE animal CASCADE CONSTRAINTS purge;
DROP TABLE centre CASCADE CONSTRAINTS purge;
DROP TABLE breeding_event CASCADE CONSTRAINTS purge;

CREATE TABLE species (
    spec_genus VARCHAR2(20) NOT NULL,
    spec_name VARCHAR2(20) NOT NULL,
    spec_popular_name VARCHAR2(40) NOT NULL UNIQUE,
    spec_family VARCHAR2(20) NOT NULL, 
    spec_natural_range VARCHAR2(100) NOT NULL,
    CONSTRAINT spec_pk PRIMARY KEY ( spec_genus,spec_name )    
);

COMMENT ON COLUMN species.spec_genus IS 'The species genus';
COMMENT ON COLUMN species.spec_name IS 'The species name';
COMMENT ON COLUMN species.spec_popular_name IS 'The species popular name';
COMMENT ON COLUMN species.spec_family IS 'The species family name';
COMMENT ON COLUMN species.spec_natural_range IS 'Description of the natural range of the species';

CREATE TABLE centre (
    centre_id CHAR(6) NOT NULL,
    centre_name VARCHAR(40) NOT NULL UNIQUE,
    centre_address VARCHAR(100) NOT NULL,
    centre_director VARCHAR(30) NOT NULL,
    centre_phone_no VARCHAR(20) NOT NULL,
    CONSTRAINT centre_pk PRIMARY KEY ( centre_id )
    
);

COMMENT ON COLUMN centre.centre_id IS 'The identifier for the centre';
COMMENT ON COLUMN centre.centre_name IS 'The centre name';
COMMENT ON COLUMN centre.centre_address IS 'The centre address';
COMMENT ON COLUMN centre.centre_director IS 'The name of the centres director';
COMMENT ON COLUMN centre.centre_phone_no IS 'The centres phone contact number';

CREATE TABLE animal (
    animal_id NUMERIC(6) NOT NULL,
    animal_sex CHAR(1) NOT NULL,
    centre_id CHAR(6) NOT NULL,
    brevent_id NUMERIC(6),
    spec_genus VARCHAR(20) NOT NULL,
    spec_name VARCHAR(20) NOT NULL,
    CONSTRAINT animal_pk PRIMARY KEY ( animal_id ),
    CONSTRAINT animal_centre_fk FOREIGN KEY ( centre_id ) REFERENCES centre ( centre_id ),
    CONSTRAINT animal_spec_fk FOREIGN KEY ( spec_genus, spec_name ) REFERENCES species ( spec_genus, spec_name )
);

COMMENT ON COLUMN animal.animal_id IS 'The identifier for the animal';
COMMENT ON COLUMN animal.animal_sex IS 'The animal sex (M or F)';
COMMENT ON COLUMN animal.centre_id IS 'The "home" center where the animal is normally located. Animals are sometimes located at other centres for a breeding event';
COMMENT ON COLUMN animal.brevent_id IS 'If bred in captivity (e.e. at a centre), the id of the breeding event which produced the animal. Animals which have been captured from the wild will have no brevent_id assigned';
COMMENT ON COLUMN animal.spec_genus IS 'The species genus for the animal';
COMMENT ON COLUMN animal.spec_name IS 'The species name for the animal';


CREATE TABLE breeding_event (
    brevent_id NUMERIC(6) NOT NULL,
    brevent_date DATE NOT NULL,
    mother_id NUMERIC(6) NOT NULL,
    father_id NUMERIC(6) NOT NULL,
    CONSTRAINT brevent_pk PRIMARY KEY ( brevent_id ),
    CONSTRAINT brevent_animal_fk FOREIGN KEY ( mother_id ) 
        REFERENCES animal ( animal_id ) 
            ON DELETE SET NULL,
    CONSTRAINT brevent_animal_fk2 FOREIGN KEY ( father_id ) 
        REFERENCES animal ( animal_id ) 
            ON DELETE SET NULL

);

COMMENT ON COLUMN breeding_event.brevent_id IS 'The identifier for the breeding event';
COMMENT ON COLUMN breeding_event.brevent_date IS 'The date on which the breeding event took place';
COMMENT ON COLUMN breeding_event.mother_id IS 'The animal_id of the animal who was the mother';
COMMENT ON COLUMN breeding_event.father_id IS 'The animal_id of the animal who was the father';

ALTER TABLE animal ADD CONSTRAINT animal_breeding_event_fk FOREIGN KEY ( brevent_id ) REFERENCES breeding_event ( brevent_id ) ON DELETE SET NULL; 
