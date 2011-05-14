<?php

require("result.inc");

function db_escape_string($str) {
	global $db;
	//This function should be used in whole project instead of *_escape_string() functions!	
	//return mysql_escape_string($str); //XXX TODO $db->quote($str), mysql_real_escape_string() or pg_escape_string() should be used here!
	return preg_replace('(^.|.$)', '', $db->quote($str)); //XXX HACK
}

class CLASS_DATABASE extends PDO {
	//All functions in this class are deprecated!
	//Please use only native PDO functions!

	var $Master = true;
	var $_linkId = false;
	var $_url = "";
	var $_user = "";
	var $_password = "";
	var $_database = "";
	var $_halt_on_error = true;

	function __construct() {
		$this->connect(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);
	}

	protected function connect($host, $user, $password, $database, $halt_on_error = true) {
		global $error;
		parent::__construct("mysql:host=$host;dbname=$database", $user,
				    $password);
		/*{
		   $error='chcipla databaza';
		   $this->exception($error); //deprecated
		   }; */
		$this->setAttribute(PDO::ATTR_STATEMENT_CLASS,
				    array('result', array($this)));

		$this->_halt_on_error = $halt_on_error;
		$this->_url = $host;
		$this->_user = $user;
		$this->_password = $password;
		/* if ($this->_linkId == false) {
		   $this->_linkId=mysql_connect($host, $user, $password);
		   if ($this->_linkId == false) {
		   $error='chcipla databaza';
		   $this->exception($error);
		   return false;
		   //die();
		   }// else {
		   //   mysql_query('set character set utf8');
		   //}
		   $this->_url=$host;
		   $this->_user=$user;
		   $this->_password=$password;

		   if ($this->_linkId == false || mysql_select_db($database, $this->_linkId) == false) {
		   $this->exception("1Database failed.");
		   return false;
		   die();
		   }
		   $this->_database=$database;
		   }
		 */
		return true;
	}

	function update($sql) {	//DEPRECATED!!! Use $db->query($sql)->rowCount(); instead!!!
		if (!$this->Master) {
			$this->_linkId = false;
			$this->connect(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);
			$this->Master = true;
		}

		$this->_queryId = $this->query($sql);
		if ($this->_queryId == false) {
			$this->exception("update failed.");
		}
		$rows = @$this->_queryId->rowCount();
		return ($rows);
	}

	function getLastInsertId() {	//DEPRECATED!!! Use $db->lastInsertId(); instead!!!
		return (@$this->lastInsertId());
	}

	protected function exception($errorMessage) {

		echo "<!-- ";
		//echo @mysql_error($this->_linkId)," (",@mysql_errno($this->_linkId),")";
		echo "-->";

		if ($this->_halt_on_error) {
			die("<pre>".$errorMessage."</pre>");
		} else {
			echo $errorMessage."<br>";
			return false;
		}
	}
}

