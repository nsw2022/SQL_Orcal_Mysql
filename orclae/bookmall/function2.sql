-- function
-- null 값 처리하기

select * from customer where phone is null;

--nvl(칼럼이름, 값) : 칼럼이름 null인 경우는 값을 출력, null이 아니면 칼럼값 출력
SELECT custid, name, address, NVL(phone, '010-1234-5678') phone
from customer;

create table k1(
    ID  VARCHAR2(3),
    CNT NUMBER(2)
);

insert into k1 values('가',5);
insert into k1 values('나',null);
insert into k1 values('다',5);
insert into k1 values('라',null);
insert into k1 values('마',10);

select * from k1;

-- 전체 개수, 합계, 평균, 최솟값
select count(cnt) from k1; --3개
-- null을 0으로 바꿈
select count(nvl(cnt,0)) count from k1; -- 5

select sum(nvl(cnt,0))/4 sum from k1; -- 5

select avg(nvl(cnt,0)) average from k1; --4
-- null을 5로 변경
select min(nvl(cnt,5)) average from k1; --5

commit;

--rank() 함수
desc employee;

select ename,
       sal,
       rank() over(order by sal desc) 급여_RANK,
       dense_rank() over(order by sal desc) 급여_DENSE_RANK
from employee;