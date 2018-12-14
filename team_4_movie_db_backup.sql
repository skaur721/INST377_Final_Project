CREATE DATABASE  IF NOT EXISTS `team_4_movie_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `team_4_movie_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: team_4_movie_db
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `actor_role`
--

DROP TABLE IF EXISTS `actor_role`;
/*!50001 DROP VIEW IF EXISTS `actor_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `actor_role` AS SELECT 
 1 AS `movie_title`,
 1 AS `role`,
 1 AS `actor_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `actor_sci_fi`
--

DROP TABLE IF EXISTS `actor_sci_fi`;
/*!50001 DROP VIEW IF EXISTS `actor_sci_fi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `actor_sci_fi` AS SELECT 
 1 AS `movie`,
 1 AS `actor`,
 1 AS `role`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `female_actor_writer_director`
--

DROP TABLE IF EXISTS `female_actor_writer_director`;
/*!50001 DROP VIEW IF EXISTS `female_actor_writer_director`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `female_actor_writer_director` AS SELECT 
 1 AS `movie_title`,
 1 AS `person`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genre_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(45) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Drama'),(2,'Action/Adventure'),(3,'Horror'),(4,'Sci-Fi'),(5,'Comedy'),(6,'Romance'),(7,'Documentary'),(8,'Sports'),(9,'Anime'),(10,'Mystery'),(11,'Animation'),(12,'Music'),(13,'Western'),(14,'Family'),(15,'Fantasy');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_actor_join`
--

DROP TABLE IF EXISTS `movie_actor_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_actor_join` (
  `movie_id` int(10) unsigned NOT NULL,
  `actor_id` int(10) unsigned NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`movie_id`,`actor_id`),
  KEY `fk_movie_actor_join_people1_idx` (`actor_id`),
  CONSTRAINT `fk_movie-actor-join_movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_actor_join_people1` FOREIGN KEY (`actor_id`) REFERENCES `people` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_actor_join`
--

LOCK TABLES `movie_actor_join` WRITE;
/*!40000 ALTER TABLE `movie_actor_join` DISABLE KEYS */;
INSERT INTO `movie_actor_join` VALUES (1,1,'Michael Corleone'),(2,2,'Bruce Wayne'),(3,3,'Jules Winnfield'),(3,20,'Vincent Vega'),(4,4,'Renai Lambert'),(4,5,'Josh Lambert'),(5,6,'Neo'),(6,7,'Django'),(6,8,'Broomhilda von Shaft'),(7,9,'Cobb'),(8,10,'Wade Wilson'),(9,11,'Deadshot'),(10,12,'Aurora Lane'),(10,13,'Jim Preston'),(11,14,'Jake Sully'),(12,15,'Adonis Johnson'),(14,16,'Scott Lang'),(15,17,'Cedric'),(15,18,'Mya'),(15,19,'Candace'),(16,21,'Doug Macrae'),(17,49,'Silent Bob'),(18,50,'Harlen Pepper'),(19,51,'Allvy Singer'),(20,52,'Fred Friendly'),(21,53,'Karl Childers'),(22,54,'Rocky Balboa'),(23,55,'Mookie'),(24,56,'Carol'),(25,56,'Alice'),(26,57,'Mickey Fitzpatrick');
/*!40000 ALTER TABLE `movie_actor_join` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `movie_director_after_2000`
--

DROP TABLE IF EXISTS `movie_director_after_2000`;
/*!50001 DROP VIEW IF EXISTS `movie_director_after_2000`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `movie_director_after_2000` AS SELECT 
 1 AS `movie_title`,
 1 AS `movie_release_date`,
 1 AS `director_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `movie_director_join`
--

DROP TABLE IF EXISTS `movie_director_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_director_join` (
  `movie_id` int(10) unsigned NOT NULL,
  `director_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`movie_id`,`director_id`),
  KEY `fk_movie_director_join_movies1_idx` (`movie_id`),
  KEY `fk_movie_director_join_directors1_idx` (`director_id`),
  CONSTRAINT `fk_movie_director_join_directors1` FOREIGN KEY (`director_id`) REFERENCES `people` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_director_join_movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_director_join`
--

LOCK TABLES `movie_director_join` WRITE;
/*!40000 ALTER TABLE `movie_director_join` DISABLE KEYS */;
INSERT INTO `movie_director_join` VALUES (1,21),(2,22),(3,24),(4,25),(5,26),(6,24),(7,23),(8,27),(9,28),(10,29),(11,22),(12,30),(13,31),(14,32),(15,33),(16,48),(17,49),(18,50),(19,51),(20,52),(21,53),(22,54),(23,55),(24,56),(25,56),(26,57),(27,23),(28,24),(29,23),(30,24);
/*!40000 ALTER TABLE `movie_director_join` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `movie_length`
--

DROP TABLE IF EXISTS `movie_length`;
/*!50001 DROP VIEW IF EXISTS `movie_length`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `movie_length` AS SELECT 
 1 AS `AVG(movie_length)`,
 1 AS `genre_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `movie_writer_join`
--

DROP TABLE IF EXISTS `movie_writer_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_writer_join` (
  `movie_id` int(10) unsigned NOT NULL,
  `writer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`movie_id`,`writer_id`),
  KEY `fk_movie_writer_join_people1_idx` (`writer_id`),
  CONSTRAINT `fk_movie_writer_join_movies1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_writer_join_people1` FOREIGN KEY (`writer_id`) REFERENCES `people` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_writer_join`
--

LOCK TABLES `movie_writer_join` WRITE;
/*!40000 ALTER TABLE `movie_writer_join` DISABLE KEYS */;
INSERT INTO `movie_writer_join` VALUES (11,22),(7,23),(27,23),(29,23),(28,24),(30,24),(5,26),(1,36),(2,37),(3,38),(4,39),(5,40),(8,41),(9,42),(10,43),(12,44),(13,45),(14,46),(15,47),(16,48),(17,49),(18,50),(19,51),(20,52),(21,53),(22,54),(23,55),(24,56),(25,56),(26,57);
/*!40000 ALTER TABLE `movie_writer_join` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `movie_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `movie_title` varchar(45) NOT NULL,
  `movie_length` int(10) unsigned NOT NULL,
  `movie_rating` decimal(3,1) NOT NULL,
  `movie_release_date` date NOT NULL,
  `genre_id` int(10) unsigned NOT NULL,
  `prod_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `fk_movies_genres1_idx` (`genre_id`),
  KEY `fk_movies_production_co1_idx` (`prod_id`),
  CONSTRAINT `fk_movies_genres1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movies_production_co1` FOREIGN KEY (`prod_id`) REFERENCES `production_co` (`prod_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'The Godfather',178,9.2,'1972-03-24',1,1),
(2,'The Dark Knight',152,9.0,'2008-07-18',2,2),
(3,'Pulp Fiction',178,8.9,'1994-10-14',1,3),
(4,'Insidious',108,6.8,'2011-04-01',3,4),(5,'The Matrix',150,8.7,'1999-03-31',2,2),
(6,'Django Unchained',165,8.4,'2012-12-25',1,5),(7,'Inception',148,8.8,'2018-07-31',2,2),
(8,'Deadpool',108,8.0,'2016-02-12',2,6),(9,'Suicide Squad',137,6.1,'2016-08-05',2,2),
(10,'Passengers',116,7.0,'2016-12-22',4,7),(11,'Avatar',162,7.8,'2009-12-18',2,6),
(12,'Creed',133,7.6,'2015-11-19',1,8),(13,'Jurassic World',124,7.0,'2015-06-12',2,9),
(14,'Ant Man',118,7.3,'2015-06-29',2,10),(15,'Think Like A Man',123,6.6,'2012-04-20',5,11),
(16,'The Town',125,7.6,'2010-09-17',1,4),(17,'Clerks',102,7.8,'1994-10-19',1,7),
(18,'Best In Show',90,7.5,'2000-09-19',5,3),(19,'Annie Hall',93,8.1,'1977-04-20',6,5),
(20,'Good Night and Good Luck',93,7.5,'2005-10-07',1,8),(21,'Sling Blade',148,8.0,'1996-11-27',1,5),
(22,'Rocky II',119,7.2,'1979-06-15',8,11),(23,'The Right Thing',120,7.9,'1989-06-30',5,2),
(24,'In A World',133,6.7,'2013-08-09',5,6),(25,'I Do Until I Don\'t',103,4.2,'2017-09-01',5,6),
(26,'She\'s The One',96,6.0,'1996-08-23',6,2),(27,'Batman Begins',140,8.3,'2005-06-15',2,2),
(28,'The Hateful Eight',187,7.8,'2015-12-25',2,4),(29,'The Dark Knight Rises',165,8.4,'2012-07-20',2,2),
(30,'Inglorious Bastards',153,8.3,'2009-08-21',2,5),(31,'Friday the 13th',106,5.6,'2009-02-13',3,1),
(32,'13 Going on 30',96,6.1,'2004-04-04',6,9),(33,'The Conjuring',112,7.5,'2013-07-19',3,2),
(34,'A Quiet Place',90,7.6,'2018-04-06',3,1),(35,'Arrival',116,7.9,'2016-11-11',4,1),
(36,'Interstellar ',169,8.6,'2014-11-07',4,2),(37,'Crazy Rich Asians',120,7.2,'2018-08-15',6,5),
(38,'Zodiac',157,7.7,'2007-03-02',10,2),(39,'Get Out',104,7.7,'2017-02-24',10,11),
(40,'Creed',133,7.6,'2017-11-25',8,8),(41,'The Blind Side',129,7.7,'2009-11-20',8,8),
(42,'Incredibles 2',118,7.9,'2018-06-15',11,10),(43,'Sing',105,7.1,'2016-12-21',11,10),
(44,'Coco',105,8.4,'2017-11-22',11,10);

;
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `person_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gender` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Al','Pacino','male'),(2,'Christian','Bale','male'),(3,'Samuel L.','Jackson','male'),(4,'Rose ','Byrne','female'),(5,'Patrick','Wilson','male'),(6,'Keanu','Reeves','male'),(7,'Jamie','Foxx','male'),(8,'Kerry','Washington','female'),(9,'Leonardo','DiCaprio','male'),(10,'Ryan ','Reynolds','male'),(11,'Will','Smith','male'),(12,'Jennifer','Lawrence','female'),(13,'Chris','Pratt','male'),(14,'Sam ','Worthington','male'),(15,'Michael B.','Jordan','male'),(16,'Paul','Rudd','male'),(17,'Kevin','Hart','male'),(18,'Meagan ','Good','female'),(19,'Regina','Hall','female'),(20,'John','Travolta','male'),(21,'Francis','Coppola','male'),(22,'James','Cameron','male'),(23,'Christopher','Nolan','male'),(24,'Quentin ','Tarantino','male'),(25,'James','Wan','male'),(26,'Lana','Wachowski','female'),(27,'Tim ','Miller','male'),(28,'David','Ayer','male'),(29,'Morten','Tyldum','male'),(30,'Ryan ','Coogler','male'),(31,'Colin','Trevorrow','male'),(32,'Peyton','Reed','male'),(33,'Tim ','Story','male'),(34,'Steven ','Spielberg','male'),(35,'Tim ','Burton','male'),(36,'Mario','Puzo','male'),(37,'Jonathon','Nolan','male'),(38,'Roger','Avary','male'),(39,'Leigh','Whannell','male'),(40,'Lilly','Wachowski','female'),(41,'Rhett','Reese','male'),(42,'David','Ayer','male'),(43,'Jon','Spaihito','male'),(44,'Aaron','Covington','male'),(45,'Rick','Jaffa','male'),(46,'Edgar','Wright','male'),(47,'Keith','Merryman','male'),(48,'Ben ','Affleck','male'),(49,'Kevin','Smith','male'),(50,'Christopher','Guest','male'),(51,'Woody','Allen','male'),(52,'George','Clooney','male'),(53,'Bill Bob','Thornton','male'),(54,'Selvester','Stallone','male'),(55,'Spike','Lee','male'),(56,'Lake','Bell','female'),(57,'Edward','Burns','male');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_co`
--

DROP TABLE IF EXISTS `production_co`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_co` (
  `prod_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(45) NOT NULL,
  `prod_address` varchar(45) DEFAULT NULL,
  `prod_city` varchar(45) DEFAULT NULL,
  `prod_state` varchar(45) DEFAULT NULL,
  `prod_zip` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_co`
--

LOCK TABLES `production_co` WRITE;
/*!40000 ALTER TABLE `production_co` DISABLE KEYS */;
INSERT INTO `production_co` VALUES (1,'Paramount Pictures','5555 Melrose Ave','Hollywood','CA','90038'),(2,'Warner Bros. ','1325 6th Ave','New York','NY','10019'),(3,'Miramax Films','2450 Colorado Ave','Santa Monica','CA','90401'),(4,'Blumhouse Productions','2401 Beverly Blvd','Los Angeles','CA','90057'),(5,'Columbia Pictures ','10202 West Washington Blvd','Culver City','CA','90232'),(6,'20th Century Fox','33 Bloor St E','Toronto','ON','M4W3H1'),(7,'Village Roadshow Pictures','100 N Crescent Dr','Beverly Hills','CA','90210'),(8,'Metro Goldwyn Mayer','10250 Constellation Blvd','Los Angeles','CA','90067'),(9,'Universal Pictures','1000 Universal Studios Plaza','Orlando','FL','32819'),(10,'Marvel Studios','500 S Buena Vista St ','Burbank','CA','91521'),(11,'Rainforest Films','323 Edgewood Ave','Atlanta','GA','30312'),(12,'Lions Gate Entertainment','250 Howe St','Vancouver','BC','V6C'),(13,'Sony Pictures','120 Interstate North Pkwy SE','Atlanta','GA','30339'),(14,'Focus Features','5 Times Square ','New York','NY','10036'),(15,'The Weinstein Company','4455 Connecticut Ave ','Washington','DC','20008');
/*!40000 ALTER TABLE `production_co` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `total_movie_genre_lengths`
--

DROP TABLE IF EXISTS `total_movie_genre_lengths`;
/*!50001 DROP VIEW IF EXISTS `total_movie_genre_lengths`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `total_movie_genre_lengths` AS SELECT 
 1 AS `genre_name`,
 1 AS `total_movie_length`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `actor_role`
--

/*!50001 DROP VIEW IF EXISTS `actor_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `actor_role` AS select `m`.`movie_title` AS `movie_title`,`ma`.`role` AS `role`,concat(`p`.`first_name`,' ',`p`.`last_name`) AS `actor_name` from ((`movies` `m` join `movie_actor_join` `ma` on((`m`.`movie_id` = `ma`.`movie_id`))) join `people` `p` on((`p`.`person_id` = `ma`.`actor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `actor_sci_fi`
--

/*!50001 DROP VIEW IF EXISTS `actor_sci_fi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `actor_sci_fi` AS select `m`.`movie_title` AS `movie`,concat(`p`.`first_name`,' ',`p`.`last_name`) AS `actor`,`ma`.`role` AS `role` from (((`people` `p` join `movie_actor_join` `ma` on((`p`.`person_id` = `ma`.`actor_id`))) join `movies` `m` on((`m`.`movie_id` = `ma`.`movie_id`))) join `genres` `g` on((`g`.`genre_id` = `m`.`genre_id`))) where (`g`.`genre_name` = 'Sci-Fi') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `female_actor_writer_director`
--

/*!50001 DROP VIEW IF EXISTS `female_actor_writer_director`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `female_actor_writer_director` AS select `m`.`movie_title` AS `movie_title`,concat(`p`.`first_name`,' ',`p`.`last_name`) AS `person` from ((((`movies` `m` join `movie_actor_join` `ma` on((`m`.`movie_id` = `ma`.`movie_id`))) join `movie_director_join` `md` on((`m`.`movie_id` = `md`.`movie_id`))) join `movie_writer_join` `mj` on((`m`.`movie_id` = `mj`.`movie_id`))) join `people` `p` on(((`p`.`person_id` = `ma`.`actor_id`) and (`p`.`person_id` = `md`.`director_id`) and (`p`.`person_id` = `mj`.`writer_id`)))) where (`p`.`gender` = 'female') order by `m`.`movie_title` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `movie_director_after_2000`
--

/*!50001 DROP VIEW IF EXISTS `movie_director_after_2000`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movie_director_after_2000` AS select `m`.`movie_title` AS `movie_title`,`m`.`movie_release_date` AS `movie_release_date`,concat(`p`.`first_name`,' ',`p`.`last_name`) AS `director_name` from ((`movies` `m` join `movie_director_join` `md` on((`m`.`movie_id` = `md`.`movie_id`))) join `people` `p` on((`md`.`director_id` = `p`.`person_id`))) where (`m`.`movie_release_date` between '2000-01-01' and curdate()) order by `m`.`movie_release_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `movie_length`
--

/*!50001 DROP VIEW IF EXISTS `movie_length`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movie_length` AS select avg(`m`.`movie_length`) AS `AVG(movie_length)`,`g`.`genre_name` AS `genre_name` from (`movies` `m` join `genres` `g` on((`m`.`genre_id` = `g`.`genre_id`))) where (`g`.`genre_name` <> 'Comedy') group by `g`.`genre_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_movie_genre_lengths`
--

/*!50001 DROP VIEW IF EXISTS `total_movie_genre_lengths`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_movie_genre_lengths` AS select `g`.`genre_name` AS `genre_name`,sum(`m`.`movie_length`) AS `total_movie_length` from (`genres` `g` join `movies` `m` on((`g`.`genre_id` = `m`.`genre_id`))) group by `g`.`genre_name` having (`total_movie_length` > (select avg(`movies`.`movie_length`) from `movies`)) order by `total_movie_length` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-07 14:50:37
