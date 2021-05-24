--****PLEASE ENTER YOUR DETAILS BELOW****
--mh-triggers.sql

--Student ID: 30632714
--Student Name: Abhiram Aroop
--Tutorial No: Tutorial 06

/* Comments for your marker:




*/

/* 
    Q1 
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/

create or replace trigger origin_destination_check
    BEFORE INSERT OR UPDATE OF LOCATION_NBR_ORIGIN,LOCATION_NBR_DESTINATION ON CHARTER_LEG
    FOR EACH ROW
BEGIN
    IF (:new.LOCATION_NBR_ORIGIN = :new.LOCATION_NBR_DESTINATION)
    THEN
        RAISE_APPLICATION_ERROR(-20000,'Destination and Origin numbers cannot be the same');
    END IF;
END;
/

/* 
    Q2
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/

create or replace TRIGGER CHARTER_HELI_CHECK
    BEFORE INSERT OR UPDATE OF CHARTER_COST_PER_HOUR,CHARTER_NBR_PASSENGERS ON CHARTER
    FOR EACH ROW
DECLARE
    ht_cost NUMBER;
    ht_seats NUMBER;
BEGIN
    SELECT HT_COST_PER_HOUR,HT_NBR_SEATS
        INTO ht_cost, ht_seats
        FROM HELICOPTER H INNER JOIN CHARTER CH
            ON h.heli_callsign = ch.heli_callsign
            INNER JOIN HELICOPTER_TYPE HT ON ht.ht_nbr = H.HT_NBR
        WHERE CH.heli_callsign = :new.heli_callsign;
        
    IF (:new.CHARTER_COST_PER_HOUR < ht_cost)
    THEN RAISE_APPLICATION_ERROR(-20000, 'Charter cost cannot be lower than helicopter cost');
    END IF;
    
    IF (:new.CHARTER_NBR_PASSENGERS > ht_seats)
    THEN RAISE_APPLICATION_ERROR(-20000, 'Charter cannot has more passengers than seats in helicopter');
    END IF;
END;
/



/* 
    Q3
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/

create or replace TRIGGER HELICOPTER_FLOWN_UPDATE
    AFTER INSERT OR UPDATE OF CL_ATD,CL_ATA ON CHARTER_LEG
    FOR EACH ROW
    DECLARE
    heli_hr NUMBER;    
BEGIN
    
    SELECT HELI_HRS_FLOWN 
    FROM CHARTER_LEG CL INNER JOIN CHARTER C
        ON cl.charter_nbr = C.charter_nbr 
        INNER JOIN HELICOPTER H
        ON c.heli_callsign = h.heli_callsign
    WHERE c.heli_callsign = :new.heli_callsign;    

    IF (:new.CL_ATA IS NOT null AND :new.CL_ATD IS NOT null AND :new.CL_ATA - :new.CL_ATD > 0)
    THEN UPDATE CHARTER_LEG SET CHARTER_LEG.HELICOPTER_HRS_FLOWN = CHARTER_LEG.HELICOPTER_HRS_FLOWN + (new.CL_ATA - :new.CL_ATD);
    END IF;
    
END;
/




