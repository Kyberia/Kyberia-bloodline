drop procedure if exists fix_all_vectors;
drop function if exists get_fix_vector;
delimiter //
/* compute correct vector for node */
create function get_fix_vector (node INT) returns varchar(230)
BEGIN
	declare np,mynode,safe int;
	declare vector varchar(80);

	set safe=100; /* loop detection, max tree depth*/
	set mynode=node;
	set vector='';
	REPEAT
		select node_parent into np from nodes where node_id = mynode;
		select concat(lpad(mynode,8,'00000000'),vector) into vector;
		set mynode=np;
		set safe=safe - 1;
		UNTIL np = NULL or np = 0 or safe = 0 or np = node
	END REPEAT;

	if safe = 0 then 
		return '';
	end if;
	return vector;

END//

/* fix vector for all the nodes*/
create procedure fix_all_vectors ()
begin
	update nodes set node_vector=get_fix_vector(node_id);
end//
delimiter ;
