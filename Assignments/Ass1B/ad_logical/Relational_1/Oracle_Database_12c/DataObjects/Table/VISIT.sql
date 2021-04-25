CREATE TABLE visit (
    pet_pet_id      NUMBER(7) NOT NULL,
    visit_datetime  DATE NOT NULL,
    total_cost      unknown 
/*  ERROR: Datatype UNKNOWN is not allowed */
    ,
    payment_method  CHAR(4 CHAR),
    vet_vet_id      NUMBER(7) NOT NULL
);

COMMENT ON COLUMN visit.pet_pet_id IS
    'The unique identifier for the pet';

COMMENT ON COLUMN visit.visit_datetime IS
    'date and time of visit';

COMMENT ON COLUMN visit.total_cost IS
    'cost of services in visit';

COMMENT ON COLUMN visit.payment_method IS
    'Method of payment of total amount';

COMMENT ON COLUMN visit.vet_vet_id IS
    'unique identifier for the vet';