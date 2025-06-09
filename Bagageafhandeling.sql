USE bagage_afhandeling;

CREATE TABLE klant (
    klant_id INT PRIMARY KEY AUTO_INCREMENT,
    voornaam VARCHAR(100),
    achternaam VARCHAR(100),
    paspoortnummer VARCHAR(20) UNIQUE,
    email VARCHAR(150)
);

DROP TABLE IF EXISTS vlucht;

CREATE TABLE vlucht (
    vlucht_id INT PRIMARY KEY AUTO_INCREMENT,
    vlucht_nummer VARCHAR(20) NOT NULL,
    bestemming VARCHAR(100),
    vertrekdatum DATETIME
);

CREATE TABLE medewerker (
    medewerker_id INT PRIMARY KEY AUTO_INCREMENT,
    voornaam VARCHAR(100),
    achternaam VARCHAR(100),
    functie VARCHAR(100)
);

CREATE TABLE bagage (
    bagage_id INT PRIMARY KEY AUTO_INCREMENT,
    klant_id INT,
    vlucht_id INT,
    gewicht DECIMAL(5,2),
    status VARCHAR(50),
    FOREIGN KEY (klant_id) REFERENCES klant(klant_id),
    FOREIGN KEY (vlucht_id) REFERENCES vlucht(vlucht_id)
);

CREATE TABLE afhandeling (
    afhandeling_id INT PRIMARY KEY AUTO_INCREMENT,
    bagage_id INT,
    medewerker_id INT,
    tijdstip DATETIME,
    status VARCHAR(100),
    FOREIGN KEY (bagage_id) REFERENCES bagage(bagage_id),
    FOREIGN KEY (medewerker_id) REFERENCES medewerker(medewerker_id)
);
show TABLES;
ALTER TABLE klant
ADD COLUMN paspoortnummer VARCHAR(50);
INSERT INTO klant (voornaam, achternaam,paspoortnummer, email)
VALUES ('Sophie', 'Jansen', 'XK123456', 'sophie.jansen@mail.com');
SELECT * FROM klant;
ALTER TABLE klant
ADD COLUMN geboortedatum DATE,
ADD COLUMN nationaliteit VARCHAR(100),
ADD COLUMN telefoonnummer VARCHAR(20),
ADD COLUMN frequent_flyer_id VARCHAR(50);
ALTER TABLE klant
ADD UNIQUE (paspoortnummer);

ALTER TABLE klant
ADD UNIQUE (email);
INSERT INTO klant (
    voornaam, achternaam, paspoortnummer, email,
    geboortedatum, nationaliteit, telefoonnummer, frequent_flyer_id
) VALUES (
    'Anna', 'Jansen', 'NL1122334', 'anna.jansen@mail.com',
    '1989-03-15', 'Nederlands', '+31611223344', 'FF12345'
);
INSERT INTO klant (
    voornaam, achternaam, paspoortnummer, email
) VALUES (
    'Anna', 'Jansen', 'NL1122334', 'anna.jansen@mail.com'
);
SELECT * FROM klant WHERE paspoortnummer = 'NL1122334';

USE bagage_afhandeling;
alter table klant
modify column nationaliteit VARCHAR (50)

SELECT * FROM klant;
UPDATE klant
SET geboortedatum = '1992-05-12',
    nationaliteit = 'Nederlands',
    telefoonnummer = '+31633445566',
    frequent_flyer_id = 'FF98765'
WHERE email = 'sophie.jansen@mail.com';
SELECT * FROM klant
WHERE voornaam = 'Sophie';

ALTER TABLE vlucht
ADD COLUMN vlucht_nummer VARCHAR(20) NOT NULL,
ADD COLUMN bestemming VARCHAR(100),
ADD COLUMN vertrekdatum DATETIME;

ALTER TABLE vlucht
ADD UNIQUE (vlucht_nummer);

INSERT INTO vlucht (vlucht_nummer, bestemming, vertrekdatum)
VALUES ('KL123', 'Amsterdam', '2025-06-15 09:45:00');
SELECT * FROM vlucht;
SELECT * FROM vlucht WHERE vlucht_nummer = 'KL123';

ALTER TABLE medewerker 
ADD COLUMN voornaam VARCHAR(20) NOT NULL,
ADD COLUMN achternaam VARCHAR(50) NOT NULL,
ADD COLUMN functie VARCHAR(50);
ALTER TABLE medewerker
MODIFY COLUMN voornaam VARCHAR(50);
DESCRIBE medewerker;
INSERT INTO medewerker (voornaam, achternaam, functie)
VALUES ('Benja', 'Kendrick', 'Manager Baggageclaim');
SELECT * FROM medewerker;

ALTER TABLE bagage
ADD COLUMN bagage_id VARCHAR(50) NOT NULL,
ADD COLUMN klant_id VARCHAR(50) NOT NULL,
ADD COLUMN vlucht_id VARCHAR(50) NOT NULL,
ADD COLUMN gewicht VARCHAR(50),
ADD COLUMN status VARCHAR(100);
describe bagage

insert into bagage (bagage_id, klant_id, vlucht_id, gewicht, status)
values (1,1,1,22.3, 'ingescheckt');
select*from bagage;
select*from bagage where gewicht= 22.3;

ALTER TABLE afhandeling
ADD COLUMN locatie VARCHAR(100);

UPDATE bagage
SET status = 'opgeladen'
WHERE bagage_id = 1;
select*from bagage where bagage_id=1;

SELECT status, COUNT(*) AS aantal_bagage
FROM bagage
GROUP BY status;

SELECT * FROM klant
ORDER BY achternaam ASC;

UPDATE klant
SET voornaam = 'Kenji',
    achternaam = 'Smith',
    email = 'kenjismith@gmail.com',
    geboortedatum = '1997-11-22'
WHERE klant_id = 1;
select*from klant where klant_id=1;

INSERT INTO klant (voornaam, achternaam, paspoortnummer, email, geboortedatum, nationaliteit, telefoonnummer, frequent_flyer_id)
VALUES ('Ahmed', 'Tahiri', 'YT456321', 'ahmed.tahiri@mail.com', '1962-06-15', 'Marokko', '0611122233', 'FF00987');
select*from klant where achternaam='tahiri';

update KLANT
set email = 'anna.jansen@outlook.com'
where klant_id = 2;
select*from klant where klant_id=2;

select*from klant

select*from medewerker

select*from bagage

select*from vlucht

select*from afhandeling

INSERT INTO afhandeling (bagage_id, medewerker_id, tijdstip, status)
VALUES (1, 1, NOW(), 'verwerkt');

select*from afhandeling where bagage_id=1;

INSERT INTO bagage (bagage_id, klant_id, vlucht_id, gewicht, status)
VALUES (3, 3, 1, 25, 'ingescheckt');

SELECT * FROM bagage;
SELECT * FROM bagage WHERE gewicht = 25;

INSERT INTO vlucht (vlucht_nummer, bestemming, vertrekdatum)
VALUES ('QR789', 'Dubai', '2025-08-10 22:15:00');

SELECT * FROM vlucht WHERE vlucht_nummer = 'QR789';

INSERT INTO bagage (bagage_id, klant_id, vlucht_id, gewicht, status)
VALUES (2, 2, 3, 30, 'geland');

select*from bagage

INSERT INTO bagage (bagage_id, klant_id, vlucht_id, gewicht, status)
VALUES (4, 4, 1, 25, 'ingescheckt');

select*from bagage

DELETE FROM bagage
WHERE bagage_id = 3;

select*from bagage

select*from klant

select*from vlucht

select*from bagage

USE bagage_afhandeling;
select*from afhandeling



