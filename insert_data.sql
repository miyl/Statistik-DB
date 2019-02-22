-- If it doesn't work:
-- Try LOAD DATA LOCAL instead.  You may need to run mysql with --local-infile=1 as well, both server and client side.
-- If run WITHOUT LOCAL the path should be on the server, while WITH LOCAL it should be on the client.
-- Alternately set my.ini's secure_file_priv=""

USE modulopgave1;

-- Disable FOREIGN KEY checks before emptying tables
SET FOREIGN_KEY_CHECKS=0;

-- Empty tables
TRUNCATE TABLE indvandring;
TRUNCATE TABLE udvandring;
TRUNCATE TABLE foedsler_og_doedsfald;
TRUNCATE TABLE flytning;
TRUNCATE TABLE kommune;
TRUNCATE TABLE indbygger_gruppe;

SET FOREIGN_KEY_CHECKS=1;

-- The path for LOAD DATA should be for the server!
-- Your INFILE path may have to be updated!
LOAD DATA
  INFILE '/var/lib/mysql/csv-filer/kommune.csv' 
  INTO TABLE kommune
  CHARACTER SET UTF8
  FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '\\'
  IGNORE 1 LINES
  (kommune_navn)
	SET kommune_id = NULL
  ;

LOAD DATA
  INFILE '/var/lib/mysql/csv-filer/indbygger_gruppe.csv' 
  INTO TABLE indbygger_gruppe
  CHARACTER SET UTF8
  FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '\\'
  IGNORE 1 LINES
  (koen,aldersgruppe)
	SET indbygger_gruppe_id = NULL
  ;

LOAD DATA
  INFILE '/var/lib/mysql/csv-filer/foedsler_og_doedsfald.csv' 
  INTO TABLE foedsler_og_doedsfald
  CHARACTER SET UTF8
  FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '\\'
  IGNORE 1 LINES
  (kommune_id,indbygger_gruppe_id,aarstal,antal_foedte,antal_doede)
	SET foedsler_og_doedsfald_id = NULL
  ;

LOAD DATA
  INFILE '/var/lib/mysql/csv-filer/indvandring.csv' 
  INTO TABLE indvandring
  CHARACTER SET UTF8
  FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '\\'
  IGNORE 1 LINES
  (kommune_id,indbygger_gruppe_id,aarstal,indvandret_indevaerende_aar,indvandret_foer_indevaerende_aar)
	SET indvandring_id = NULL
  ;

LOAD DATA
  INFILE '/var/lib/mysql/csv-filer/udvandring.csv' 
  INTO TABLE udvandring
  CHARACTER SET UTF8
  FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '\\'
  IGNORE 1 LINES
  (kommune_id, indbygger_gruppe_id, aarstal, udvandret_indevaerende_aar, udvandret_foer_indevaerende_aar)
	SET udvandring_id = NULL
  ;

LOAD DATA 
  INFILE '/var/lib/mysql/csv-filer/flytning.csv' 
	INTO TABLE flytning
  CHARACTER SET UTF8
	FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '\\'
  IGNORE 1 LINES
	(indbygger_gruppe_id, fra_flytnings_kommune, til_flytnings_kommune, aarstal, antal_flyttede)
	SET flytning_id = NULL
	;
