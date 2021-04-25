ALTER TABLE visit
    ADD CONSTRAINT pet_visit FOREIGN KEY ( pet_pet_id )
        REFERENCES pet ( pet_id );