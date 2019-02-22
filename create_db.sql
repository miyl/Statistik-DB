DROP DATABASE IF EXISTS modulopgave1;
CREATE DATABASE modulopgave1;
USE modulopgave1;
/*
author: Päivi Eversbusch
dato: 20.2.19
*/

CREATE TABLE kommune
(
    kommune_id INT PRIMARY KEY AUTO_INCREMENT,
    kommune_navn VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE indbygger_gruppe
(
    indbygger_gruppe_id INT PRIMARY KEY AUTO_INCREMENT,
    koen CHAR(1) NOT NULL,
    aldersgruppe VARCHAR(7) NOT NULL
);

CREATE TABLE udvandring
(
    udvandring_id INT PRIMARY KEY AUTO_INCREMENT,
    kommune_id INT NOT NULL,
    indbygger_gruppe_id INT NOT NULL,
    aarstal INT NOT NULL,
    udvandret_indevaerende_aar INT NOT NULL,
    udvandret_foer_indevaerende_aar INT NOT NULL,
    FOREIGN KEY (kommune_id) REFERENCES kommune(kommune_id),
    FOREIGN KEY (indbygger_gruppe_id) REFERENCES indbygger_gruppe(indbygger_gruppe_id),
    CHECK (aarstal BETWEEN 1950 AND 2100)
);

CREATE TABLE indvandring
(
    indvandring_id INT PRIMARY KEY AUTO_INCREMENT,
    kommune_id INT NOT NULL,
    indbygger_gruppe_id INT NOT NULL,
    aarstal INT NOT NULL,
    indvandret_indevaerende_aar INT NOT NULL,
    indvandret_foer_indevaerende_aar INT NOT NULL,
    FOREIGN KEY (kommune_id) REFERENCES kommune(kommune_id),
    FOREIGN KEY (indbygger_gruppe_id) REFERENCES indbygger_gruppe (indbygger_gruppe_id),
    CHECK (aarstal BETWEEN 1950 AND 2100)
);

CREATE TABLE foedsler_og_doedsfald
(
    foedsler_og_doedsfald_id INT PRIMARY KEY AUTO_INCREMENT,
    kommune_id INT NOT NULL,
    indbygger_gruppe_id INT NOT NULL,
    aarstal INT NOT NULL,
    antal_foedte INT NOT NULL,
    antal_doede INT NOT NULL,
    FOREIGN KEY (kommune_id) REFERENCES kommune (kommune_id),
    FOREIGN KEY (indbygger_gruppe_id) REFERENCES indbygger_gruppe (indbygger_gruppe_id),
    CHECK (aarstal BETWEEN 1950 AND 2100)
);

CREATE TABLE flytning
(
    flytning_id INT PRIMARY KEY AUTO_INCREMENT,
    fra_flytnings_kommune INT NOT NULL,
    til_flytnings_kommune INT NOT NULL,
    indbygger_gruppe_id INT NOT NULL,
    aarstal INT NOT NULL,
    antal_flyttede INT NOT NULL,
    FOREIGN KEY (fra_flytnings_kommune) REFERENCES kommune (kommune_id),
    FOREIGN KEY (til_flytnings_kommune) REFERENCES kommune (kommune_id),
    FOREIGN KEY (indbygger_gruppe_id) REFERENCES indbygger_gruppe (indbygger_gruppe_id),
    CHECK (aarstal BETWEEN 1950 AND 2100)
);
