DROP DATABASE IF EXISTS modulopgave_1;
CREATE DATABASE modulopgave_1;
USE modulopgave_1;
/*
author: Päivi Eversbusch
dato: 24.2.19
*/

CREATE TABLE kommune
(
	kommune_id INT PRIMARY KEY AUTO_INCREMENT,
    kommune_navn VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE aldersgruppe
(
	aldersgruppe_id INT PRIMARY KEY,
    aldersgruppe VARCHAR(7) NOT NULL UNIQUE
);

CREATE TABLE koen
(
	koen_id CHAR(1) PRIMARY KEY,
    koen VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE korrektion
(
	korrektion_id INT PRIMARY KEY AUTO_INCREMENT,
    kommune_id INT NOT NULL,
    koen_id CHAR(1) NOT NULL,
    aarstal INT NOT NULL,
    korrektion INT NOT NULL,
    FOREIGN KEY (kommune_id) REFERENCES kommune(kommune_id),
    FOREIGN KEY (koen_id) REFERENCES koen(koen_id),
    CHECK (aarstal BETWEEN 1950 AND 2100)
);

CREATE TABLE udvandring
(
	udvandring_id INT PRIMARY KEY AUTO_INCREMENT,
    kommune_id INT NOT NULL,
    koen_id CHAR(1) NOT NULL,
    aarstal INT NOT NULL,
    udvandret_indevaerende_aar INT NOT NULL,
    udvandret_foer_indevaerende_aar INT NOT NULL,
    FOREIGN KEY (kommune_id) REFERENCES kommune(kommune_id),
    FOREIGN KEY (koen_id) REFERENCES koen(koen_id),
    CHECK (aarstal BETWEEN 1950 AND 2100)
);

CREATE TABLE indvandring
(
	indvandring_id INT PRIMARY KEY AUTO_INCREMENT,
    kommune_id INT NOT NULL,
    koen_id CHAR(1) NOT NULL,
    aarstal INT NOT NULL,
    indvandret_indevaerende_aar INT NOT NULL,
    indvandret_foer_indevaerende_aar INT NOT NULL,
    FOREIGN KEY (kommune_id) REFERENCES kommune(kommune_id),
    FOREIGN KEY (koen_id) REFERENCES koen (koen_id),
    CHECK (aarstal BETWEEN 1950 AND 2100)
);

CREATE TABLE foedsler_og_doedsfald
(
	foedsler_og_doedsfald_id INT PRIMARY KEY AUTO_INCREMENT,
    kommune_id INT NOT NULL,
    koen_id CHAR(1) NOT NULL,
    aarstal INT NOT NULL,
    antal_foedte INT NOT NULL,
    antal_doede INT NOT NULL,
    FOREIGN KEY (kommune_id) REFERENCES kommune(kommune_id),
    FOREIGN KEY (koen_id) REFERENCES koen (koen_id),
    CHECK (aarstal BETWEEN 1950 AND 2100)
);

CREATE TABLE flytninger
(
	flytning_id INT PRIMARY KEY AUTO_INCREMENT,
    koen_id CHAR(1) NOT NULL,
    aldersgruppe_id INT NOT NULL,
    fra_flytnings_kommune INT NOT NULL,
    til_flytnings_kommune INT NOT NULL,
    aarstal INT NOT NULL,
    antal_flyttede INT NOT NULL,
    FOREIGN KEY (fra_flytnings_kommune) REFERENCES kommune (kommune_id),
    FOREIGN KEY (til_flytnings_kommune) REFERENCES kommune (kommune_id),
    FOREIGN KEY (koen_id) REFERENCES koen (koen_id),
    FOREIGN KEY (aldersgruppe_id) REFERENCES aldersgruppe (aldersgruppe_id),
    CHECK (aarstal BETWEEN 1950 AND 2100)
);
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE indvandring;
TRUNCATE TABLE udvandring;
TRUNCATE TABLE foedsler_og_doedsfald;
TRUNCATE TABLE kommune;
TRUNCATE TABLE aldersgruppe;
TRUNCATE TABLE flytninger;
TRUNCATE TABLE korrektion;
TRUNCATE TABLE koen;
SET FOREIGN_KEY_CHECKS=1;

LOAD DATA INFILE 'C:/kommune.csv'
INTO TABLE kommune
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(kommune_navn)
SET kommune_id = NULL;

LOAD DATA INFILE 'C:/aldersgruppe.csv'
INTO TABLE aldersgruppe
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(aldersgruppe_id, aldersgruppe);

LOAD DATA INFILE 'C:/koen.csv'
INTO TABLE koen
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(koen_id, koen);

LOAD DATA INFILE 'C:/indvandring.csv'
INTO TABLE indvandring
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(kommune_id,koen_id,aarstal,indvandret_indevaerende_aar,indvandret_foer_indevaerende_aar)
SET indvandring_id = NULL;

LOAD DATA INFILE 'C:/udvandring.csv'
INTO TABLE udvandring
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(kommune_id,koen_id,aarstal,udvandret_indevaerende_aar,udvandret_foer_indevaerende_aar)
SET udvandring_id = NULL;

LOAD DATA INFILE 'C:/foedsler_og_doedsfald.csv'
INTO TABLE foedsler_og_doedsfald
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(kommune_id,koen_id,aarstal,antal_foedte,antal_doede)
SET foedsler_og_doedsfald_id = NULL;

LOAD DATA INFILE 'C:/flytninger.csv'
INTO TABLE flytninger
CHARACTER SET UTF8
FIELDS TERMINATED BY ','
IGNORE 1 LINES
(koen_id, aldersgruppe_id, fra_flytnings_kommune, til_flytnings_kommune, aarstal, antal_flyttede)
SET flytning_id = NULL;

LOAD DATA INFILE 'C:/korrektion.csv'
INTO TABLE korrektion
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(kommune_id, koen_id, aarstal,korrektion)
SET korrektion_id = NULL;