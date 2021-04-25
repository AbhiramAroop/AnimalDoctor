CREATE TABLE owner (
    owner_id        NUMBER(7) NOT NULL,
    owner_gname     VARCHAR2(50 CHAR) NOT NULL,
    owner_fname     VARCHAR2(50 CHAR) NOT NULL,
    owner_street    VARCHAR2(50 CHAR) NOT NULL,
    owner_town      CHAR(50 CHAR) NOT NULL,
    owner_postcode  NUMBER(7) NOT NULL,
    vet_vet_id      NUMBER(7)
);

COMMENT ON COLUMN owner.owner_id IS
    'Unique identifier for the pet owner';

COMMENT ON COLUMN owner.owner_gname IS
    'Given/First name of the owner';

COMMENT ON COLUMN owner.owner_fname IS
    'family/last name of the owner';

COMMENT ON COLUMN owner.owner_street IS
    'Street where owner lives';

COMMENT ON COLUMN owner.owner_town IS
    'Town where owner is located';

COMMENT ON COLUMN owner.owner_postcode IS
    'Post code of owner''s location';

COMMENT ON COLUMN owner.vet_vet_id IS
    'unique identifier for the vet';

CREATE UNIQUE INDEX owner__idx ON
    owner (
        vet_vet_id
    ASC );