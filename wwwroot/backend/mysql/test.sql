drop procedure if exists k_neurons;
drop function if exists k_get_node_weigth;

delimiter //

create function k_get_node_weigth (node INT, user INT) returns DOUBLE
BEGIN
	declare vector,node2,len,n_owner,offset int;
	declare final,n_weight,o_weight,s_weight double;

	select node_vector into vector from nodes where node_id = node;

	set final = 1;
	/* select k from nodes into final where node_id = node;*/

	set len = length(vector);
	set offset = 1;
	WHILE offset < len DO

		/* XXX node length is hardcoded */
		set node2 = substring(node2,offset,8);
		set offset = offset + 8;
		/* weigths from user to: 
			- all nodes from node to root node
			- all node owners from node to root node
			- all nodes between themselves (safe?)
		*/
		select node_weight,node_creator into n_weight,n_owner from nodes where node_id=node2;
		select synapse_weight into s_weight from neurons where src=user and dst=node2;
		select synapse_weight into o_weight from neurons where src=user and dst=n_owner;
		
		if o_weight = NULL then set o_weight=1; end if;
		if s_weight = NULL then set s_weight=1; end if;
		if n_weight = NULL then set n_weight=1; end if;
		
		set final = final * s_weight * o_weight * n_weight;
	END WHILE;

	RETURN final;
END//

create procedure k_neurons ()
begin
	select k,node_id,node_name from nodes where k>0 
		and node_created>now()-interval 20 day order by k_get_node_weigth(node_id,904) desc;
end//

delimiter ;
