ALTER TABLE visit
    ADD CONSTRAINT vet_visit FOREIGN KEY ( vet_vet_id )
        REFERENCES vet ( vet_id );