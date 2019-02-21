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
  INFILE '/var/lib/mysql/kommune.csv' 
  INTO TABLE kommune
  FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '\\'
  IGNORE 1 LINES
  ;

LOAD DATA
  INFILE '/var/lib/mysql/indbygger_gruppe.CSV' 
  INTO TABLE indbygger_gruppe;
  FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '\\'
  IGNORE 1 LINES
  ;

LOAD DATA
  INFILE '/var/lib/mysql/foedsler_og_doedsfald.CSV' 
  INTO TABLE foedsler_og_doedsfald
  FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '\\'
  IGNORE 1 LINES
  ;

LOAD DATA
  INFILE '/var/lib/mysql/indvandring.CSV' 
  INTO TABLE indvandring
  FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '\\'
  IGNORE 1 LINES
  ;

LOAD DATA
  INFILE '/var/lib/mysql/udvandring.CSV' 
  INTO TABLE udvandring
  FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '\\'
  IGNORE 1 LINES
  ;
