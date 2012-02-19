# Dump of table tbluser
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbluser`;

CREATE TABLE `tbluser` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tbluser` WRITE;
/*!40000 ALTER TABLE `tbluser` DISABLE KEYS */;

INSERT INTO `tbluser` (`id`, `username`, `firstname`, `lastname`, `email`)
VALUES
	(4,'someuser','Some','Updated User','some@user.com'),
	(6,'someuser','Some','User','some@user.com'),
	(7,'someuser','Some','User','some@user.com'),
	(8,'someuser','Some','User','some@user.com'),
	(9,'someuser','Some','User','some@user.com'),
	(10,'someuser','Some','User','some@user.com'),
	(11,'someuser','Some','User','some@user.com'),
	(12,'someuser','Some','User','some@user.com');

/*!40000 ALTER TABLE `tbluser` ENABLE KEYS */;
UNLOCK TABLES;

