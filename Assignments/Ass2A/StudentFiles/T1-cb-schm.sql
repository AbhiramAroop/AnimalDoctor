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

DROP TABLE species CASCADE CONSTRAINTS;
DROP TABLE animal CASCADE CONSTRAINTS;
DROP TABLE centre CASCADE CONSTRAINTS;
DROP TABLE breeding_event CASCADE CONSTRAINTS;

CREATE TABLE species (
    spec_genus VARCHAR2(20) NOT NULL,
    spec_name VARCHAR2(20) NOT NULL,
    spec_popular_name VARCHAR2(40) NOT NULL,
    spec_family VARCHAR2(20) NOT NULL, 
    spec_natural_range VARCHAR2(100) NOT NULL,
    CONSTRAINT spec_pk PRIMARY KEY ( spec_genus ),
    CONSTRAINT spec_pk PRIMARY KEY ( spec_name )
    
);

CREATE TABLE animal (
    animal_id NUMERIC(6) NOT NULL,
    animal_sex CHAR(1) NOT NULL,
    brevent_id NUMERIC(6),
    centre_id CHAR(6),
    spec_genus VARCHAR(20) NOT NULL,
    spec_name VARCHAR(20) NOT NULL,
    CONSTRAINT animal_pk PRIMARY KEY ( animal_id ),
    CONSTRAINT animal_brevent_fk FOREIGN KEY ( brevent_id ) REFERENCES brevent ( brevent_id ) ON DELETE SET NULL,
    CONSTRAINT animal_centre_fk FOREIGN KEY ( centre_id ) REFERENCES centre ( centre_id ) ON DELETE SET NULL,
    CONSTRAINT animal_spec_fk FOREIGN KEY ( spec_genus, spec_name ) REFERENCES species ( spec_genus, spec_name ) ON DELETE SET NULL
);

CREATE TABLE centre (
    centre_id CHAR(6) NOT NULL,
    centre_name VARCHAR(40) NOT NULL,
    centre_address VARCHAR(100) NOT NULL,
    centre_director VARCHAR(30) NOT NULL,
    centre_phone_no VARCHAR(20) NOT NULL,
    CONSTRAINT centre_pk PRIMARY KEY ( centre_id )
    
);

CREATE TABLE breeding_event (
    brevent_id NUMERIC(6) NOT NULL,
    brevent_date DATE NOT NULL,
    mother_id NUMERIC(6) NOT NULL,
    father_id NUMERIC(6) NOT NULL,
    CONSTRAINT brevent_pk PRIMARY KEY ( brevent_id ),
    CONSTRAINT brevent_animal_fk FOREIGN KEY ( mother_id , father_id ) REFERENCES centre ( animal_id ) ON DELETE SET NULL    

);
