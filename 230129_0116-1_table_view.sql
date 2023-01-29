use tabledb;

-- 08. 테이블과 뷰(뷰)
-- create view

create view v_usertbl
as
select userid, name, email 
  from usertbl
 where email is not null;


select * from buytbl;

use sqldb;

drop view sum_buytbl;

create view sum_buytbl
as
select prodname,groupname,sum(amount) sum_amount,sum(amount*price) sum_total
  from buytbl
group by prodname,groupname;

select * from sum_buytbl;

select userid, prodname,groupname,sum(amount) sum_amount,sum(amount*price) sum_total
  from buytbl
group by userid, prodname,groupname;

drop table buytbl;
drop table usertbl;

select * from sum

desc sum_buytbl;

drop view sum_buytbl;