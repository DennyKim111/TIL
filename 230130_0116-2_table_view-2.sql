create database tabledb;
use tabledb;

-- 1. primary key
-- 1) 테이블 생성 / primary key 생성
-- 한 개 컬럼이 primary key인 경우

drop table if exists buytbl, usertbl;

create table usertbl
(
	userid		varchar(8)	primary key,
	name		varchar(10) not null,
	birthyear	int			not null
);

alter table usetbl 
	drop primary key;

show index from usetbl;

alter table usetbl 
	add primary key (userid);

show index from usetbl;

-- 컬럼 조합하여 primary key 생성
create table prodtbl
(
	prodcode	char(3)		not null,
	prodid		char(4)		not null,
	proddate	datetime	not null,
	prodcud		char(10)	not null,
	primary key (prodcode, prodid)
);

show index from prodtbl;

alter table prodtbl 
	drop primary key;

show index from prodtbl;

alter table prodtbl 
	add primary key (prodcode, prodid);

show index from prodtbl;

-- 2) foreign key
create table buytbl
(
	num			int			auto_increment primary key,
	userid		varchar(8)	not null,
	prodname	varchar(8) 	not null,
	constraint fk_buytbl_usertbl foreign key(userid)
	references usertbl(userid)
);

alter table buytbl 
	drop constraint fk_buytbl_usertbl;

alter table buytbl 
	add constraint fk_buytbl_usertbl foreign key(userid)
	references usertbl(userid);

show index from buytbl;

-- 데이타 생성
INSERT INTO usertbl(userid, name, birthyear) VALUES('LSG', '이승기', 1987);
INSERT INTO usertbl(userid, name, birthyear) VALUES('KBS', '김범수', 1979);

INSERT INTO buytbl(num, userid, prodname) VALUES(NULL, 'LSG', '운동화');
INSERT INTO buytbl(num, userid, prodname) VALUES(NULL, 'LSG', '노트북');

select * from usertbl;
select * from buytbl;

-- 데이타 실습 : 기준테이블(usertbl) userid 컬럼에 'ABC' 데이타가 없으므로 에러 발생
insert into buytbl(num, userid, prodname) values(null, 'ABC', '노트북');
update buytbl set userid = 'ABC' where num = 1;  

-- 데이타 실습 : 기준테이블에 'ABC' DATA insert
insert into usertbl(userid, name, birthyear) values('ABC','홍길동', 1990);

select * from usertbl;

insert into buytbl(num, userid, prodname) values(null, 'ABC', '노트북');
select * from buytbl;

update buytbl set userid = 'ABC' where num = 1; 
select * from buytbl;

-- 데이타 실습 : 기준테이블 데이타 변경 / 삭제 (에러발생 : 외래키 테이블에 데이타가 존재하기때문) 
delete from usertbl where userid='ABC';
update usertbl set userid='DEF' where userid='ABC';

-- 기준테이블 변경, 삭제시 외래키테이블 자동적용
alter table buytbl 
	drop constraint fk_buytbl_usertbl;

ALTER TABLE buytbl
	ADD CONSTRAINT fk_buytbl_usertbl FOREIGN KEY(userid) 
		REFERENCES usertbl(userid)
		ON UPDATE CASCADE
		ON DELETE CASCADE;

delete from usertbl where userid='ABC';
select * from usertbl;
select * from buytbl;

update usertbl set userid='DEF' where userid='LSG';
select * from usertbl;
select * from buytbl;

-- 3) unique key
alter table usertbl 
	add email varchar(50);

select * from usertbl;

alter table usertbl 
	add constraint uk_usertbl_email
	unique key (email);

show index from usertbl;

-- 4) check
ALTER TABLE usertbl
	ADD CONSTRAINT chk_usertbl_birthyear
	CHECK ( birthyear >= 1900 );

insert into usertbl(userid, name, birthyear, email)
  values('ABC', '홍길동', 1800, NULL);
 
 -- 5) DEFAULT
 ALTER TABLE usertbl
	ALTER COLUMN birthyear SET DEFAULT 2023;

insert into usertbl(userid, name, birthyear, email)
  values('ABC', '홍길동', default, NULL);

 select * from usertbl;

insert into usertbl(userid, name, email)
  values('XYZ', '테스트', NULL);
 
 select * from usertbl;

 -- 6) NULL
alter table usertbl 
	modify column name varchar(8) null;

select * from usertbl;
insert into usertbl(userid, name, birthyear, email)
	values('AAA', null, 1990, 'test@gmail.com');

select * from usertbl;

-- null 데이타가 존재하므로 not null 변경 불가
alter table usertbl 
	modify column name varchar(8) not null;

-- null 데이타 update 후 not null 변경 가능
select * from usertbl where name is null;

update usertbl set name='강감찬' where name is null;
select * from usertbl;

alter table usertbl 
	modify column name varchar(8) not null;

desc usertbl;

-- 3. TABLE 수정 / 삭제
-- 1) 테이블 압축
CREATE TABLE 테이블명( 컬럼 설정)
	ROW_FORMAT=COMPRESSED;

-- 2) 임시테이블 생성
CREATE TEMPORARY TABLE temptbl(id int, name varchar(8));

select * from temptbl;
insert into temptbl values(1,'임시');

-- 3) 테이블 수정 / 삭제
alter table usertbl 
	add mobile varchar(20) null;

alter table usertbl 
	drop mobile;

alter table usertbl 
	modify name varchar(20) null;

alter table usertbl 
	change name korname varchar(10) not null;

select * from usertbl;

alter table usertbl 
	change korname name varchar(10) not null;







