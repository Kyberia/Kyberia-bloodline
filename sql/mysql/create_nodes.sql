-- MySQL dump 9.08
--
-- Host: localhost    Database: kyberia2
---------------------------------------------------------
-- Server version	4.0.15a-log

--
-- Table structure for table 'nodes'
--

CREATE TABLE nodes (
  node_id int(13) NOT NULL auto_increment,
  node_name char(132) default NULL,
  node_parent int(13) NOT NULL default '0',
  node_thread_vector char(123) default '0',
  node_type int(2) default '1',
  node_template enum('default','own') default 'default',
  node_external_access enum('yes','no') default 'no',
  node_system_access enum('public','moderated','private','personal','crypto') default 'public',
  node_children_count int(11) default '0',
  node_creator int(13) default NULL,
  node_created datetime default NULL,
  lastchild_created timestamp(14) NOT NULL,
  k int(5) default 0,
  on_main enum('yes','no') default 'no',
  old_id int(11) default NULL,
  old_owner_id int(11) default NULL,
  old_id_diskuse int(11) default NULL,
  node_views int(8) default NULL,
  old_type char(20) default NULL,
  PRIMARY KEY  (node_id),
  KEY old_id (old_id),
  KEY node_parent (node_parent)
) TYPE=MyIsam;

--
-- Dumping data for table 'nodes'
--

INSERT INTO nodes VALUES (1,'main',1,';1',1,'default','no','public',0,1,NULL,20031203022433,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (2,'nodeshell',1,';1',2,'default','no','public',0,1,NULL,20031203022443,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (3,'forum',1,';1',3,'default','no','public',0,1,NULL,20031203022449,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (4,'submission',1,';1',4,'default','no','public',0,1,NULL,20031203022459,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (5,'article',1,';1',5,'default','no','public',0,1,NULL,20031203022508,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (6,'blog',1,';1',6,'default','no','public',0,1,NULL,20031203022514,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (7,'user',1,';1',7,'default','no','public',0,1,NULL,20031203022521,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (8,'friend',1,';1',8,'default','no','public',0,1,NULL,20031203022532,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (9,'threaded_forum',1,';1',9,'default','no','public',0,1,NULL,20031203022604,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (10,'bookcat',1,';1',10,'default','no','public',0,1,NULL,20031203022612,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (11,'poll',1,';1',11,'default','no','public',0,1,NULL,20031203022616,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (12,'data',1,';1',12,'default','no','public',0,1,NULL,20031203022620,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (13,'rss',1,';1',13,'default','no','public',0,1,NULL,20031203022624,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (14,'template',1,';1',14,'default','no','public',0,1,NULL,20031203022630,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (15,'k',1,';1',15,'default','no','public',0,1,NULL,20031203022634,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (16,'bazar',1,';1',16,'default','no','public',0,1,NULL,20031203022650,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (17,'chat',1,';1',17,'default','no','public',0,1,NULL,20031203022654,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (18,'literature',1,';1',18,'default','no','public',0,1,NULL,20031203022703,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (19,'bookmarks',1,';1',19,'default','no','public',0,1,NULL,20031203022703,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (20,'articles',1,';1',20,'default','no','public',0,1,NULL,20031203022703,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (21,'blogs',1,';1',21,'default','no','public',0,1,NULL,20031203022703,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (22,'offtopic',1,';1',22,'default','no','public',0,1,NULL,20031203022703,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (23,'last',1,';1',23,'default','no','public',0,1,NULL,20031203022703,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (100,'tiamat',1,';1',100,'default','no','public',0,1,NULL,20031203022913,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (101,'kyberia',1,';1',2,'default','no','public',0,1,NULL,20031203022913,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (102,'hysteria',1,';1',2,'default','no','public',0,1,NULL,20031203022913,NULL,'no',NULL,NULL,NULL,NULL,NULL);
INSERT INTO nodes VALUES (103,'camp23',1,';1',2,'default','no','public',0,1,NULL,20031203022913,NULL,'no',NULL,NULL,NULL,NULL,NULL);