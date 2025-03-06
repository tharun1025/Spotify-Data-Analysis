-- Importing the Data 

SELECT * FROM spotify_db.spotify;

GRANT FILE ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

SET GLOBAL max_allowed_packet = 64 * 1024 * 1024; -- 64 MB

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cleaned_dataset_.csv'
INTO TABLE spotify
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'secure_file_priv';

DESCRIBE spotify;

ALTER TABLE spotify MODIFY COLUMN duration_min BIGINT;
ALTER TABLE spotify MODIFY COLUMN energy_liveness FLOAT;


