CREATE DATABASE IF NOT EXISTS game_store;
USE game_store;
-- developers table construction set dev_id as primary key-- 
-- the not null values are mandatory, these values should never be empty since the structure of the database, for this design there must always exist a order of entities and a naming convention, other attributes can be empty for future insertion.
CREATE TABLE developers (
	dev_id INT NOT NULL AUTO_INCREMENT,
    studio_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    founded_year SMALLINT DEFAULT NULL,
    constraint pk_developers PRIMARY KEY (dev_id)
);
-- previous error with script as date datatype did not support a 1889 entry, the datatype, although could raise issues with non date datatype, gp_table creation will failsafe date related errors. could be datetime type but gp only houses data to the day. 


-- platforms table construction set platform_id as primary key-- 
CREATE TABLE platforms (
	platform_id INT NOT NULL AUTO_INCREMENT,
    platform_name VARCHAR(50) NOT NULL,
    launch_year YEAR DEFAULT NULL,
    company VARCHAR(50) DEFAULT NULL,
	constraint pk_platforms PRIMARY KEY (platform_id)
);
-- games table construction set game_id as primary key-- 
-- first instance of foreign key in design, referencing the dev_id from the developers
CREATE TABLE games (
	game_id INT NOT NULL AUTO_INCREMENT,
    game_name VARCHAR(100) NOT NULL,
    genre VARCHAR(50) DEFAULT NULL,
    price DECIMAL(6, 2) NOT NULL DEFAULT 0.00,
    release_year YEAR DEFAULT NULL,
    dev_id INT NOT NULL,
    constraint pk_games PRIMARY KEY (game_id),
    constraint fk_games_dev FOREIGN KEY (dev_id)
    REFERENCES developers (dev_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
    -- since games and developers share the largest relationship, for instance the domino effect would be catastrophic if the user deleted a developer entry the deletion would result in the loss of every title referencing the dev_id. I estimated that a restrict for this relationship would be the most flexible, whilst maintaining safety measures in my database design. 
    


);
-- game_platform table construction set gp_id as primary key-- 
CREATE TABLE game_platforms (
	gp_id INT NOT NULL AUTO_INCREMENT,
	game_id INT NOT NULL,
	platform_id INT NOT NULL,
	release_date DATE DEFAULT NULL,
	constraint pk_game_platforms PRIMARY KEY (gp_id),
	constraint uq_game_platform UNIQUE (game_id, platform_id),
	constraint fk_gp_game FOREIGN KEY (game_id)
	REFERENCES games (game_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    
    -- the use of the cascade for the tables that present the least amount of theoretical data loss is an attempt to achieve flexibility and greater connection.
	-- game_platforms table functions mostly as a junction table, otherwise if game releases on many platforms without the table multiple entries would have to be added for each platform, likewise if we try to add additional columns to compensate for the various platforms, the exclusive entires that only appear on one platform would house many nulls depending on our most versatile game title. (eg. game_1 is released on 5 platforms, game_2 is an exclusive, now has 4 nulls)
    
    -- unique constraint is to prevent the same game combination from appearing, for instance a count aggregation could incorrectly return  previously-counted game_id and platform_id values.
    
    
	constraint fk_gp_platform FOREIGN KEY (platform_id)
    
	REFERENCES platforms (platform_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE

);



CREATE TABLE reviews (

	review_id INT NOT NULL AUTO_INCREMENT,
    game_id INT NOT NULL      ,   
    game_rating TINYINT,
    review_date DATE DEFAULT NULL,
    review_text TEXT DEFAULT NULL,
    constraint pk_reviews PRIMARY KEY (review_id),
    constraint fk_game FOREIGN KEY (game_id)
    REFERENCES games (game_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    
    constraint chk_rating CHECK (game_rating between 1 AND 10)    
    
    -- this constraint check adds a 1-10 review rating scale to the table structure.

);




