<?php

/**
* DomXml object
*/
class DomXml {

	var $dom;

	function DomXml($xml_data) {
		if (@is_file($xml_data)) {
			if (! $this->dom = domxml_open_file($xml_data)) {
				//echo "Error while parsing the document.\n";
				unset($this->dom);
				return FALSE;
			}
		} else {
			if (! $this->dom = domxml_open_mem($xml_data)) {
				echo "<!-- Error while parsing the document. -->\n";
				unset($this->dom);
				return FALSE;
			}
		}

		return TRUE;
	}

	/**
	* root element
	*/
	function getRoot() {
		if (empty($this->dom)) {
			return FALSE;
		} else {
			$root = new DomXmlNode($this->dom->document_element());
			$nodes = new DomXmlNodes($root);
			return $nodes;

		}
	}

	/**
	* get nodes
	*/
	function getNodes($tag_name) {
		$root = DomXml::getRoot();
		if ($root) {
			return $root->getNodes("$tag_name");

		} else {
			return FALSE;
		}
	}

	/**
	* get node
	*/
	function getNode($tag_name) {
		$nodes = DomXml::getNodes($tag_name);
		if ($nodes) {
			return $nodes->next();
		} else {
			return FALSE;
		}
	}

	/**
	* get node content
	*/
	function getNodeContent($tag_name) {
		$node = DomXml::getNode($tag_name);
		if ($node) {
			return $node->getContent();
		}
		return '';
	}

	function get($tag_name) {
		return DomXml::getNodeContent($tag_name);
	}
}

/**
* DomXmlNodes object
*/
class DomXmlNodes {
	var $nodes = array();
	var $current_node = -1;

	function DomXmlNodes($nodes) {
		if (is_array($nodes)) {
			$this->nodes = $nodes;
		} else {
			$this->nodes = array($nodes);
		}
	}

	/**
	 * next
	 */
	function next() {
		if ($this->current_node + 1 >= count($this->nodes)) {
			return FALSE;
		}
		$this->current_node += 1;
		return $this->nodes[$this->current_node];
	}

	/**
	 * rewind
	 */
	function rewind() {
		$this->current_node = -1;
	}

	/**
	 * get nodes
	 */
	function getNodes($node_name) {
		$node_names = explode("/",$node_name);
		$last_node_name = array_pop($node_names);

		$node = $this->nodes[0];
		print_r($this->nodes[1]);
		while ($node_name = array_shift($node_names)) {
			$found_node = $node->findNode($node_name);
			if (! $found_node) {
				return new DomXmlNodes(array());
			}
			$node = new DomXmlNode($found_node);
		}
		$found_node = $node->findNodes($last_node_name);
		if ($found_node) {
			return new DomXmlNodes($found_node);
		} else {
			return new DomXmlNodes(array());
		}
	}

	/**
	* get node
	*/
	function getNode($node_name) {
		$nodes = DomXmlNodes::getNodes($node_name);
		if ($nodes) {
			return $nodes->next();
		}
		return FALSE;
	}

	/**
	* get node content
	*/
	function getNodeContent($tag_name) {
		$node = DomXmlNodes::getNode();
		if ($node) {
			return $node->getContent();
		}
		return '';
	}

	function get($tag_name) {
		return DomXml::getNodeContent($tag_name);
	}

	function hasRows() {
		return DomXmlNodes::getNumRows();
	}

	function getNumRows() {
		return @count($this->nodes);
	}
}

/**
* DomXmlNode object
*/
class DomXmlNode {

	var $node;
	var $output_encoding = '';

	function DomXmlNode($node,$output_encoding = 'windows-1250') {
		$this->node = $node;
		if ($output_encoding) {
			$this->output_encoding = $output_encoding;
		}
	}

	/**
	* get node content
	*/
	function getContent() {

		if ($this->node && $this->node->has_child_nodes()) {
			$node = array_shift($this->node->child_nodes());
		} else {
			return '';
		}

		$content = $node->get_content();
		$content = str_replace("#parse_nl#","&#10;",$content);
		$content = DomXmlNode::unhtmlspecialchars($content);

		return $content;
	}

	/**
	* content of subnode specified by node name
	*/
	function getNodeContent($node_name) {
		$node_names = explode("/",$node_name);
		$last_node_name = array_pop($node_names);

		$node = $this;
		while ($node_name = array_shift($node_names)) {
			$found_node = $node->findNode($node_name);
			if (! $found_node) {
				return FALSE;
			}
			$node = new DomXmlNode($found_node);
		}

		if ($node = $node->findNode($last_node_name)) {
			$node = new DomXmlNode($node);
			return $node->getContent();
		}
		return '';
	}

	function get($node_name='') {
		if ($node_name) {
			return DomXmlNode::getNodeContent($node_name);
		} else {
			return DomXmlNode::getContent();
		}
	}

	/**
	* find node
	*/
	function findNode($node_name) {
		$node = $this->node;

		if (! ($node || $node->has_child_node()) ) {

			return FALSE;
		}

		$child = $node->first_child();

		while ($child) {
			if ($child->node_type() == XML_ELEMENT_NODE && $child->tagname() == $node_name) {
				return $child;
			}
			$child = $child->next_sibling();
		}

		return FALSE;
	}

	/**
	* find nodes
	*/
	function findNodes($node_name) {
		$nodes = array();

		$node = $this->node;

		if (! ($node || $node->has_child_node()) ) {
			return FALSE;
		}

		$child = $node->first_child();

		while ($child) {
			if ($child->node_type() == XML_ELEMENT_NODE && $child->tagname() == $node_name) {
				$nodes[] = new DomXmlNode($child);
			}
			$child = $child->next_sibling();
		}

		return $nodes;
	}

	function unhtmlspecialchars($str) {
		$html_special_chars_table = array(
			"&"  => "&amp;",
			"\"" => "&quot;",
			"'"  => "&apos;",
			"<"  => "&lt;",
			">"  => "&gt;",
			"\t" => "&#9;",
			"\n" => "&#10;",
			"\r" => "&#13;"
		);
		$html_special_chars_table = array_flip($html_special_chars_table);

		return strtr($str,$html_special_chars_table);
	}

}

?>
