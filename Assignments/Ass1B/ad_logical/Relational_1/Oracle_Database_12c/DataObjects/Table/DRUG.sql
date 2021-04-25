CREATE TABLE drug (
    drug_id               NUMBER(7) NOT NULL,
    drug_name             VARCHAR2(50 BYTE) NOT NULL,
    drug_qty              NUMBER(7) NOT NULL,
    drug_cost             NUMBER(7) NOT NULL,
    visit_visit_datetime  DATE NOT NULL,
    visit_vet_vet_id      NUMBER(7) NOT NULL
);

COMMENT ON COLUMN drug.drug_id IS
    'unique drug identifier';

COMMENT ON COLUMN drug.drug_name IS
    'name of drug';

COMMENT ON COLUMN drug.drug_qty IS
    'Quantity of drug';

COMMENT ON COLUMN drug.drug_cost IS
    'cost of the drug';

COMMENT ON COLUMN drug.visit_visit_datetime IS
    'date and time of visit';

COMMENT ON COLUMN drug.visit_vet_vet_id IS
    'unique identifier for the vet';