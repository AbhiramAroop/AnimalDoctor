CREATE TABLE service (
    service_code          NUMBER(7) NOT NULL,
    service_desc          VARCHAR2(100 CHAR) NOT NULL,
    service_cost          NUMBER(7) NOT NULL,
    visit_visit_datetime  DATE NOT NULL,
    visit_vet_vet_id      NUMBER(7) NOT NULL
);

COMMENT ON COLUMN service.service_code IS
    'unique service identifier';

COMMENT ON COLUMN service.service_desc IS
    'description of service';

COMMENT ON COLUMN service.visit_visit_datetime IS
    'date and time of visit';

COMMENT ON COLUMN service.visit_vet_vet_id IS
    'unique identifier for the vet';