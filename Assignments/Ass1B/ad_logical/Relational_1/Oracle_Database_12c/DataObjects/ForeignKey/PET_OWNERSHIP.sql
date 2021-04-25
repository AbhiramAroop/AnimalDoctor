ALTER TABLE pet
    ADD CONSTRAINT pet_ownership FOREIGN KEY ( owner_owner_id )
        REFERENCES owner ( owner_id );