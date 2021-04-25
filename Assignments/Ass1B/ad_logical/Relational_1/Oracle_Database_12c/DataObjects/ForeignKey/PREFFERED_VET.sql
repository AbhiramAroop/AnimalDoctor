ALTER TABLE owner
    ADD CONSTRAINT preffered_vet FOREIGN KEY ( vet_vet_id )
        REFERENCES vet ( vet_id );