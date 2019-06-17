DROP TABLE IF EXISTS env;
DROP TABLE IF EXISTS area;
DROP TABLE IF EXISTS field;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS plant;
DROP TABLE IF EXISTS unit;
DROP TABLE IF EXISTS sensor;


CREATE TABLE `user` (
	`email` VARCHAR(20) NOT NULL,
	`password` VARBINARY(64) NOT NULL,
	`name` VARCHAR(20) NOT NULL,
	PRIMARY KEY (`email`)
) ENGINE=InnoDB;

CREATE TABLE `plant` (
	`id` INT unsigned NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,
	`fase1` INT unsigned NOT NULL,
	`fase2` INT unsigned NOT NULL,
	`fase3` INT unsigned NOT NULL,
	`fase4` INT unsigned NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `unit` (
	`id` INT unsigned NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL UNIQUE,
	`symbol` VARCHAR(20) NOT NULL,
	`highest` INT,
	`lowest` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `sensor` (
	`id` INT unsigned NOT NULL AUTO_INCREMENT,
	`model` VARCHAR(20) NOT NULL,
	`description` VARCHAR(40),
	`unit` INT NOT NULL REFERENCES unit (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `field` (
	`id` INT unsigned NOT NULL AUTO_INCREMENT,
	`user` VARCHAR(20) NOT NULL REFERENCES user (`email`) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `area` (
	`id` INT unsigned NOT NULL AUTO_INCREMENT,
	`field` INT NOT NULL REFERENCES field (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
	`sensor_hum` INT NOT NULL REFERENCES sensor (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
	`sensor_tem` INT NOT NULL REFERENCES sensor (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
	`sensor_moi` INT NOT NULL REFERENCES sensor (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
	`lon` INT,
	`lat` INT,
	PRIMARY KEY (`id`)	
) ENGINE=InnoDB;

CREATE TABLE `env` (
	`id` INT unsigned NOT NULL AUTO_INCREMENT,
	`area` INT NOT NULL REFERENCES area (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
	`dat` DATETIME NOT NULL,
	`humidity` FLOAT NOT NULL,
	`temperature` FLOAT NOT NULL,
	`moisture` FLOAT NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;