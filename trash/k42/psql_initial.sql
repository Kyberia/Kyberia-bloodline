-- MySQL dump 10.13  Distrib 5.5.24, for Linux (x86_64)
--
-- Host: localhost    Database: kyberia
-- ------------------------------------------------------
-- Server version	5.5.24-log
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,POSTGRESQL' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- XXX checks keys everywhere
--

--
-- Table structure for table "mail"
--

DROP TYPE IF EXISTS "menum" CASCADE;
CREATE TYPE menum AS ENUM ('no','to','from','both');

DROP TABLE IF EXISTS "mail";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "mail" (
  "mail_id" int NOT NULL,
  "mail_from" int NOT NULL DEFAULT '0',
  "mail_to" int NOT NULL DEFAULT '0',
  "mail_timestamp" timestamp,
  "mail_read" menum DEFAULT 'no',
  "mail_deleted" menum DEFAULT 'no',
  "mail_text" text
-- CREATE UNIQUE INDEX mail_id ON mail (mail_id);
--  PRIMARY KEY ("mail_id"),
--  KEY "mail_id" ("mail_id"),
--  KEY "mail_user_from_to" ("mail_from","mail_to"),
--  KEY "mail_user_to_read" ("mail_to","mail_read")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "neurons"
--

DROP TYPE IF EXISTS "link_enum" CASCADE;
CREATE TYPE link_enum AS ENUM ('hard','soft','bookmark','synapse');

DROP TABLE IF EXISTS "neurons";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "neurons" (
--  "synapse_id" serial NOT NULL,
  "dst" int DEFAULT NULL,
  "src" int DEFAULT NULL,
  "synapse_creator" int NOT NULL DEFAULT '0',
  "synapse_weight" double precision NOT NULL DEFAULT '1',
  "link" link_enum DEFAULT 'soft',
  "last_impulse" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "synapse_created" timestamp DEFAULT NULL
--  UNIQUE KEY "relation" ("dst","src"),
--  KEY "central_link" ("dst","link"),
--  KEY "src" ("src")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "node_access"
--
DROP TYPE IF EXISTS "acc_enum" CASCADE;
CREATE TYPE acc_enum AS ENUM ('master','op','access','silence','ban','execute');

DROP TABLE IF EXISTS "node_access";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "node_access" (
  "node_id" int NOT NULL DEFAULT '0',
  "user_id" int NOT NULL DEFAULT '0',
  "node_permission" acc_enum DEFAULT NULL,
  "last_visit" timestamp DEFAULT NULL,
  "visits" int DEFAULT '0',
  "given_k" boolean DEFAULT false
--  UNIQUE KEY "node_access" ("node_id","user_id"),
);

/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table "nodes"
--

DROP TABLE IF EXISTS "nodes";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "nodes" (
  "node_id" serial NOT NULL,
  "node_template_id" int DEFAULT NULL,
  "node_parent" int NOT NULL DEFAULT '0',
  "node_creator" int NOT NULL DEFAULT '0',
  "node_external_access" boolean DEFAULT false,
  "node_created" timestamp DEFAULT NULL,
  "node_lastchild_created" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "node_lastdescendant_created" timestamp DEFAULT NULL,
  "node_updated" timestamp DEFAULT NULL,
  "node_children_count" int DEFAULT '0',
  "node_k" int DEFAULT '0',
  "node_views" int DEFAULT NULL,
  "node_descendant_count" int DEFAULT NULL,
  "node_name" varchar(128) DEFAULT NULL,
  "node_external_link" varchar(128) DEFAULT NULL,
  "node_content" text
--  PRIMARY KEY ("node_id"),
--  KEY "node_name" ("node_name"),
--  KEY "node_creator" ("node_creator"),
--  KEY "external_link" ("node_external_link"),
--  KEY "node_parent" ("node_parent")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "tiamat" (XXX sync with nodes)
--

DROP TABLE IF EXISTS "tiamat";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "tiamat" (
  "tiamat_node_id" int NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "users"
-- XXX session string
-- XXX register_hash
-- XXX header_id vs node template_id
-- XXX guild_id hardcoded 4738121
-- XXX login == select node_name from nodes where node_id=user_id ??? => sync?
-- "bookstyle" int(1) NOT NULL DEFAULT '0',
-- "password_change_period" int DEFAULT NULL,
--

DROP TYPE IF EXISTS "l_order" CASCADE;
CREATE TYPE l_order AS ENUM ('asc','desc');


DROP TABLE IF EXISTS "users";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "users" (
  "user_id" int NOT NULL DEFAULT '0',
  "login" varchar(128) DEFAULT NULL,
  "xmpp" varchar(256) DEFAULT NULL,
  "password" varchar(230) NOT NULL,
  "register_hash" varchar(128) DEFAULT NULL,
  "email" varchar(256) DEFAULT NULL,
  "user_gpg_prv" text DEFAULT NULL,
  "user_gpg_pub" text DEFAULT NULL,
  "last_action" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "session_string" varchar(64) DEFAULT NULL,
  "user_action" varchar(128) DEFAULT NULL,
  "user_action_id" int DEFAULT NULL,
  "listing_amount" int DEFAULT '32', -- XXX constant
  "listing_order" l_order DEFAULT 'desc',
  "user_k" int DEFAULT '0',
  "k_wallet" int DEFAULT '0',
  "header_id" int DEFAULT NULL,
  "mail_notify" boolean DEFAULT false,
  "acc_lockout" timestamp DEFAULT NULL,
  "moods" varchar(128) DEFAULT NULL,
  "invisible" boolean DEFAULT false,
  "login_retry" int NOT NULL DEFAULT '0',
  "date_last_login" timestamp,
  "date_password_changed" timestamp NOT NULL,
  "date_login_failed" timestamp NOT NULL,
  "user_setting_metadata" text NOT NULL,
  "guild_id" int
--  PRIMARY KEY ("user_id"),
--  UNIQUE KEY "session_string" ("session_string"),
--  UNIQUE KEY "login" ("login")
);

/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-30 15:14:05
