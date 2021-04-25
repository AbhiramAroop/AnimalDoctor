CREATE TABLE vet (
    vet_id    NUMBER(7) NOT NULL,
    vet_name  VARCHAR2(50 CHAR) NOT NULL
);

COMMENT ON COLUMN vet.vet_id IS
    'unique identifier for the vet';

COMMENT ON COLUMN vet.vet_name IS
    'name of the vet';