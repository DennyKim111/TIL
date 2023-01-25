-- 3.Join
-- 1) inner join
select * from usertbl;

select * from buytbl;

-- 기본 inner join 문장
select b.userid,b.prodname, b.price, b.amount,
	   a.name, a.birthyear, a.addr, a.mobile1, a.mobile2
  from buytbl b
  	inner join usertbl a
  	on a.userid = b.userid;

-- 조건 추가 : 구매건당 구매수량이 2건이상인 데이타만 조회
-- 조건 추가2 : 사는 곳이 서울인 사람만
select b.userid,b.prodname, b.price, b.amount,
	   a.name, a.birthyear, a.addr, a.mobile1, a.mobile2
  from buytbl b
  	inner join usertbl a
  	on a.userid = b.userid
  where b.amount >= 2
    and a.addr = '서울' ;
   
-- group by : 회원아이디, 이름, 생년, 주소별 구매수량의 합 구하기 (회원아이디, 이름, 생년, 주소, 구매수량의합)
select a.name, a.birthyear, a.addr, sum(b.amount)
  from buytbl b
  	inner join usertbl a
  	on a.userid = b.userid
  where b.amount >= 2
    and a.addr = '서울' 
  group by a.userid, a.name, a.birthyear, a.addr;
  
 -- 2) outer join
 -- left join
select a.name, a.birthyear, a.addr, a.mobile1, a.mobile2,
   		b.userid,b.prodname, b.price, b.amount	   
  from usertbl a
  	left join buytbl b
  	on a.userid = b.userid
  order by a.userid;
 
 -- right join
 select a.name, a.birthyear, a.addr, a.mobile1, a.mobile2,
   		b.userid,b.prodname, b.price, b.amount	   
  from buytbl b
  	right join usertbl a
  	on a.userid = b.userid
  order by a.userid;

-- 3) cross join
 select *
   from buytbl
   		cross join usertbl;
  	
 select *
   from usertbl
   		cross join buytbl;

-- 4) self join
create table emptbl(
	empid	char(3) primary key,
	empname	varchar(10),
	managerid	char(3),
	emptel	varchar(20)
);

INSERT INTO emptbl VALUES('101', '나사장', '101', '0000');
INSERT INTO emptbl VALUES('201', '김재무', '101', '2222');
INSERT INTO emptbl VALUES('202', '김부장', '201', '2222-1');
INSERT INTO emptbl VALUES('203', '이부장', '201', '2222-2');
INSERT INTO emptbl VALUES('204', '우대리', '203', '2222-2-1');
INSERT INTO emptbl VALUES('205', '지사원', '203', '2222-2-2');
INSERT INTO emptbl VALUES('206', '이영업', '101', '1111');
INSERT INTO emptbl VALUES('207', '한과장', '206', '1111-1');
INSERT INTO emptbl VALUES('208', '최정보', '101', '3333');
INSERT INTO emptbl VALUES('209', '윤차장', '208', '3333-1');
INSERT INTO emptbl VALUES('210', '이주임', '209', '3333-1-1');

select * from emptbl;

-- 사원id, 사원이름, 사원연락처, 상관id, 상관이름, 상관연락처
select	a.empid, a.empname, a.emptel, 
		a.managerid, b.empname, b.emptel
  from	emptbl a
  	inner join emptbl b
  	on a.managerid = b.empid;
  	
-- 5) union / union all
select userid, name from usertbl
union all
select empid, empname from emptbl;

-- 6) in / not in

select * 
  from usertbl
 where addr in ('서울', '경기');

select * 
  from usertbl
 where addr not in ('서울', '경기');
 
-- 7) inline view

select a.*
  from (select userid from usertbl where addr = '서울') a
  
select a.*
  from (select userid from usertbl where addr = '서울') a
  inner join (select * from buytbl where amount > 2) b
  on a.userid=b.userid;