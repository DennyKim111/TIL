-- 4. 데이타 변경
-- 1) insert 구문
create table testtbl1 (
	id int,
	username char(3),
	age int	
);

insert into testtbl1(id, username, age)
  	 values (1, '홍길동', 25);
  	 
select * from testtbl1; 

-- auto-increment 구문
create table testtbl2 (
	id int auto_increment primary key,
	username char(3),
	age int	
);

insert into testtbl2(username, age)
	 values ('강감찬', 30);
	
select * from testtbl2;	

-- auto_increment 초기값,증가값 설정
alter table testtbl2 auto_increment = 100;

insert into testtbl2(username, age)
	 values ('을지', 30);

select * from testtbl2;

set @@auto_increment_increment = 100;

insert into testtbl2(username, age)
	 values ('세종왕', 50);

select * from testtbl2;	

-- 대용량 데이타 insert 

delete from testtbl2;

insert into testtbl2(username, age)
select name, 30 from usertbl;

select * from testtbl2;

-- 테이블생성 및 대용량 데이타 insert 
create table testtbl3
select name, 30 age from usertbl;

select * from testtbl3;

-- 조건부 데이타 입력
create table membertbl 
select userid, name, addr from usertbl limit 3;

alter table membertbl 
	add constraint pk_member primary key(userid);

select * from membertbl;

insert ignore into membertbl values('BBK', '비비코', '미국');
insert ignore into membertbl values('SJH', '서장훈', '서울');
insert ignore into membertbl values('HJY', '현주엽', '경기');

select * from membertbl;

-- ON DUPLICATE update 
insert into membertbl values('BBK', '비비코', '미국') 
on DUPLICATE key update name='비비코', addr='미국'; 

insert into membertbl values('AAA', '테스트', '한국') 
on DUPLICATE key update name='테스트', addr='한국'; 

select * from membertbl;

-- 2) update 
select * from testtbl3;

select * from testtbl3 where name='이승기';

update testtbl3
   set age=40
  where name='이승기';
 
 select * from testtbl3 where name='이승기';

-- 3) delete 
select * from testtbl3;

select * from testtbl3 where name='이승기';

delete from testtbl3 where name='이승기';

select * from testtbl3 where name='이승기';

-- 데이타 전체 삭제
create table bigtbl1 
select * from employees.employees;
create table bigtbl2 
select * from employees.employees;
create table bigtbl3 
select * from employees.employees;

select * from bigtbl1;
select count(*) from employees.employees;
select count(*) from bigtbl1;
select count(*) from bigtbl2;
select count(*) from bigtbl3;

-- autocommit 해제 ----------------------------------
show variables like 'autocommit%';

show variables;

set autocommit = false;

show variables like 'autocommit%';

-- 전체 적용
-- 설치경로\data\my.ini 파일
-- [mysqld]
-- autocommit=0 or 1 (1 : autocommit 적용, default 적용되어 있음)
-- commit, rollback 실습 --
delete from bigtbl1;
select * from bigtbl1;

rollback;
select * from bigtbl1;
select count(*) from bigtbl1;

delete from bigtbl1;
select * from bigtbl1;

commit;
select * from bigtbl1;

-- drop
drop table bigtbl2;
select * from bigtbl2;

-- truncate
truncate table bigtbl3; 
select * from bigtbl3;

-- 4. WITH절과 CTE
with cte_tbl(userid, total)
as
(
	select userid, sum(price*amount)
	  from buytbl
	 group by userid
)
select userid, total from cte_tbl;

-- userTBL에서 각 지역별로 가장 키가 큰 사람들의 평균 구하기
