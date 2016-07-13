# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: Localhost (MySQL 5.6.14-log)
# Database: iot-20160712
# Generation Time: 2016-07-13 19:37:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Attributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Attributes`;

CREATE TABLE `Attributes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attribute` varchar(64) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Attributes` WRITE;
/*!40000 ALTER TABLE `Attributes` DISABLE KEYS */;

INSERT INTO `Attributes` (`id`, `attribute`, `value`)
VALUES
	(1,'RAM','8GB'),
	(2,'RAM','16GB'),
	(3,'Storage','128GB SSD'),
	(4,'Storage','256GB SSD'),
	(5,'Storage','512GB SSD');

/*!40000 ALTER TABLE `Attributes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table OrderItems
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrderItems`;

CREATE TABLE `OrderItems` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `productID` int(11) unsigned DEFAULT NULL,
  `orderID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderid_fk` (`orderID`),
  KEY `productid_fk` (`productID`),
  CONSTRAINT `orderid_fk` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`id`),
  CONSTRAINT `productid_fk` FOREIGN KEY (`productID`) REFERENCES `Products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `OrderItems` WRITE;
/*!40000 ALTER TABLE `OrderItems` DISABLE KEYS */;

INSERT INTO `OrderItems` (`id`, `productID`, `orderID`)
VALUES
	(1,1,1),
	(2,2,1);

/*!40000 ALTER TABLE `OrderItems` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) unsigned DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_fk` (`userID`),
  CONSTRAINT `userid_fk` FOREIGN KEY (`userID`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;

INSERT INTO `Orders` (`id`, `userID`, `order_date`)
VALUES
	(1,1,'2016-07-11 11:33:33'),
	(2,1,'2016-07-12 18:03:11'),
	(3,3,'2016-07-13 05:33:22');

/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table productAttributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `productAttributes`;

CREATE TABLE `productAttributes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `productID` int(10) unsigned DEFAULT NULL,
  `attributesID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aattributesid_fk` (`attributesID`),
  KEY `pproductid_fk` (`productID`),
  CONSTRAINT `aattributesid_fk` FOREIGN KEY (`attributesID`) REFERENCES `Attributes` (`id`),
  CONSTRAINT `pproductid_fk` FOREIGN KEY (`productID`) REFERENCES `Products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `productAttributes` WRITE;
/*!40000 ALTER TABLE `productAttributes` DISABLE KEYS */;

INSERT INTO `productAttributes` (`id`, `productID`, `attributesID`)
VALUES
	(1,1,1),
	(2,1,2),
	(3,1,3),
	(4,1,4),
	(5,2,2),
	(6,2,3),
	(8,2,5),
	(9,2,4);

/*!40000 ALTER TABLE `productAttributes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Products`;

CREATE TABLE `Products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;

INSERT INTO `Products` (`id`, `Name`, `price`, `description`)
VALUES
	(1,'Macbook Air 13\"',999.00,'2015 Macbook Air\n2.4Ghz\n8GB RAM\n256GB SSD'),
	(2,'Dell XPS 13',799.00,'2016 Dell XPS 13');

/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(64) DEFAULT '',
  `lastname` varchar(64) DEFAULT '',
  `email` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;

INSERT INTO `Users` (`id`, `firstname`, `lastname`, `email`)
VALUES
	(1,'Bart','Simpson','bart@simpson.com'),
	(2,'Bruce','Wayne','i.am.batman@dc.com'),
	(3,'John','Doe','john@doe.com'),
	(4,'Ben','Dover','ben@dover.com'),
	(5,'Eileen','Dover','eileen@dover.com');

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
