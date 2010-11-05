CREATE TABLE node_access (
  node_id int(13) NOT NULL default '0',
  user_id int(13) NOT NULL default '0',
  node_bookmark enum('yes','no') default 'no',
  node_permission enum('master','op','access','silence','ban') default NULL,
  node_user_subchild_count int(13) default NULL,
  node_user_subchild_types set('forum','submission','user','journaux','special','news','poll') default '',
  last_visit datetime default NULL,
  visits int(6) default 0,
  bookmark_category int(11) default NULL
) TYPE=MyIsam