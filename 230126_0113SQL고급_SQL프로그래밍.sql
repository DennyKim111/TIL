-- 4. SQL 프로그래밍
-- 1) if 구문 예제

drop procedure if exists ifproc;

delimiter $$

create procedure ifproc()
begin

	declare var1 int;
	set var1 = 100;

	if var1 = 100 then
		select '100과 일치합니다.';
	else
		select '100이 아닙니다.';
	end if;
	
end $$

delimiter ;

call ifproc();


-- 2) case 구문 예제
drop procedure if exists caseproc;

delimiter $$
create procedure caseproc()
begin
	
	declare point int;
	declare grade char(1);
	set point = 75;
	
	case
		when point >= 90 then set grade = 'A';
		when point >= 80 then set grade = 'B';
		when point >= 70 then set grade = 'C';
		when point >= 60 then set grade = 'D';
		else	set grade = 'F';
	end case;

	select point, grade;

end $$
delimiter ;

call caseproc();

-- 3) 반복문(while)
-- 기본구문
drop procedure if exists whileproc;

delimiter $$
create procedure whileproc()
begin
	
	declare i int;
	declare hap int;

	set i = 0;
	set hap = 0;

	while i < 100 do
		set i = i + 1;
		set hap = hap + i;
	end while;
	
	select i, hap;

end $$
delimiter ;

call whileproc();

-- iterate, leave 구문
drop procedure if exists whileproc2;

delimiter $$
create procedure whileproc2()
begin
	
	declare i int;
	declare hap int;

	set i = 0;
	set hap = 0;

	mywhile: while i < 100 do
		set i = i + 1;
	
		if (i%2 = 0) then
			iterate mywhile;
		end if;

		set hap = hap + i;
		
		if hap > 1000 then
			leave mywhile;
		end if;
	end while;
	
	select i, hap;

end $$
delimiter ;

call whileproc2();

-- 4) 오류 처리
drop procedure if exists errproc;

delimiter $$

create procedure errproc()
begin

	declare continue handler for sqlexception
	begin
		show errors;
		rollback;
	end;
	
-- insert into usertbl(userid, name, birthyear, addr)
-- values('BBK', 'LEE', 1990,'서울');

	insert into usertbl
	values('BBK');	

end $$

delimiter ;

call errproc();

-- 5) 동적 sql문
-- 기본문
prepare myQuery from 'select * from usertbl where userid="BBK"';
execute myQuery;

deallocate prepare myQuery;

-- userid, mobile1의 조건값을 변수로 대입
set @userid = 'EJW';
set @mobile1 = '011';

prepare myQuery from 'select * from usertbl where userid = ? and mobile1 = ?';
execute myQuery using @userid, @mobile1;

deallocate prepare myQuery;









