CREATE TABLE subsidis(codi VARCHAR(100) PRIMARY KEY NOT NULL,
                  denominacio VARCHAR(100) NOT NULL,
                  concedit  BOOLEAN NOT NULL,
                  tipus VARCHAR(50) NOT NULL);

INSERT INTO subsidis (codi, denominacio, concedit, tipus) VALUES ('ENFERMETAT1', 'MALALTIES DE LLARGA DURADA', TRUE, 'Enfermetat');
INSERT INTO subsidis (codi, denominacio, concedit, tipus) VALUES ('ACCIDENT1', 'ACCIDENTS DE CARRETERA', TRUE, 'accident');
INSERT INTO subsidis (codi, denominacio, concedit, tipus) VALUES ('MAJORS451', 'LLEI DE FOMENT OCUPACIO', TRUE, 'majors45');
INSERT INTO subsidis (codi, denominacio, concedit, tipus) VALUES ('ENFERMETAT2', 'MALALTIES RARES', TRUE, 'Enfermetat');
INSERT INTO subsidis (codi, denominacio, concedit, tipus) VALUES ('ACCIDENT2', 'ACCIDENTS DE TREBALL', TRUE, 'accident');
INSERT INTO subsidis (codi, denominacio, concedit, tipus) VALUES ('MAJORS452', 'LLEI IGUALTAT DE GENERE', TRUE, 'majors45');

