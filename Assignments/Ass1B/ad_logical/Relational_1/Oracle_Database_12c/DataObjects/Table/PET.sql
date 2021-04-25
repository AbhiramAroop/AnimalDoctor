CREATE TABLE pet (
    pet_id          NUMBER(7) NOT NULL,
    owner_owner_id  NUMBER(7) NOT NULL,
    pet_gender      CHAR(50 CHAR) NOT NULL,
    pet_name        VARCHAR2(50 CHAR) NOT NULL,
    pet_type        VARCHAR2(50 CHAR) NOT NULL,
    pet_dob         DATE NOT NULL,
    pet_deceased    CHAR(1 CHAR) NOT NULL
);

COMMENT ON COLUMN pet.pet_id IS
    'The unique identifier for the pet';

COMMENT ON COLUMN pet.owner_owner_id IS
    'Unique identifier for the pet owner';

COMMENT ON COLUMN pet.pet_gender IS
    'Gender of the animal';

COMMENT ON COLUMN pet.pet_name IS
    'Name of the animal';

COMMENT ON COLUMN pet.pet_type IS
    'Species of animal';

COMMENT ON COLUMN pet.pet_dob IS
    'date of birth of pet';

COMMENT ON COLUMN pet.pet_deceased IS
    'Boolean of whether pet has been deceased';