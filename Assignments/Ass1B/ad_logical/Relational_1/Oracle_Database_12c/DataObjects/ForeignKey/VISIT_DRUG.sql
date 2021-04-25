ALTER TABLE drug
    ADD CONSTRAINT visit_drug FOREIGN KEY ( visit_visit_datetime,
                                            visit_vet_vet_id )
        REFERENCES visit ( visit_datetime,
                           vet_vet_id );