drop procedure if exists k_neurons;
drop function if exists k_get_node_weigth;
delimiter //
create function k_get_node_weigth (node INT, user INT) returns DOUBLE
BEGIN
	declare vector,node2,len,n_owner,offset int; /* vector type*/
	declare final,n_weight,o_weight,s_weight double;

	select node_vector into vector from nodes where node_id = node;
	set final = 1;
	/* select k from nodes into final where node_id = node;*/

	set len = length(vector);
	set offset = 1;
	WHILE offset < len DO
		/* XXX node length is hardcoded */
		set node2 = substring(vector,offset,8);
		set offset = offset + 8;
		/* weigths from user to: 
			- all nodes from node to root node
			- all node owners from node to root node
			- all nodes between themselves (safe?)
		*/
		select node_weight,node_creator into n_weight,n_owner from nodes where node_id=node2;
		select synapse_weight into s_weight from neurons where src=user and dst=node2;
		select synapse_weight into o_weight from neurons where src=user and dst=n_owner;
		
		if o_weight = NULL or o_weight=0 then set o_weight=1; end if;
		if s_weight = NULL or s_weight=0 then set s_weight=1; end if;
		if n_weight = NULL or n_weight=0 then set n_weight=1; end if;
		
		set final = final * s_weight * o_weight * n_weight;
	END WHILE;
	RETURN final;
END//
create procedure k_neurons ()
begin
--	select k_get_node_weigth(node_id,904) from nodes where k>0
--                and node_created>now()-interval 20 day;
	select k,node_id,node_name,k_get_node_weigth(node_id,904) from nodes where k>0
                and node_created>now()-interval 20 day;

--	select * from tmp_table order by k_weight desc;
end//

create function get_fix_vector (node INT) returns varchar(80)
BEGIN
	declare np,mynode int;

	set mynode=node;
	REPEAT
		select node_parent into np from nodes where node_id = mynode;
		/* XXX padding */
		vector=concat(node_parent,vector);
		set mynode=node_parent;
	UNTIL node_parent != NULL and node_parent > 0
	END REPEAT;
	
	return vector;

END//

create procedure fix_all_vectors ()
begin
	
end//
delimiter ;

