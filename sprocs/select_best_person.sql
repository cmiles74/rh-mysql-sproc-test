DELIMITER ;;

drop procedure if exists select_best_person;

create procedure select_best_person ()
sql security invoker
begin
    select * from people order by rand() limit 1;
END;;

DELIMITER;