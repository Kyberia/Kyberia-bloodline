<?php

class result extends PDOStatement {
	//All functions in this class are deprecated!
	//Please use only native PDOStatement functions!

	var $_numRows = 0;
	var $_numFields = 0;
	var $_currentRow = -1;
	var $_currentRecord = array();
	var $_queryId = false;
	var $_sql = "";

	public $dbh;
	protected function __construct($dbh) {
		$this->dbh = $dbh;

		$this->_numRows = @$this->rowCount();
		//$this->_numFields = @mysql_num_fields($this->_queryId);
		$this->_currentRow = -1;
		$this->_currentRecord = array();
	}

	function next() {	//DEPRECATED!!! Use $this->fetch(); instead!!!
		if ($this->_currentRow + 1 >= $this->_numRows) {
			return false;
		} else {
			$this->_currentRecord = @$this->fetch();
			$this->_currentRow++;
			return true;
		}
	}

	function getRecord() {	//DEPRECATED!!! Use $this->fetch(); instead!!!
		return $this->_currentRecord;
	}

	function getString($column) {	//DEPRECATED!!! Use $this->fetch(); instead!!!
		if (is_int($column) == true) {
			return (string) $this->_currentRecord[$column - 1];
		} else {
			return (string) $this->_currentRecord["$column"];
		}
	}

	function getInt($column) {	//DEPRECATED!!! Use $this->fetch(); instead!!!
		return $this->getString($column); //Dynamic typing OMG...
	}

	function getNumRows() {	//DEPRECATED!!! Use $this->rowCount(); instead!!!
		return $this->_numRows;
	}

}

