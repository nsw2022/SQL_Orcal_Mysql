-- join과 서브쿼리 (Sbuquery)

 select * from customer;
 select * from book;
 select * from orders;
 
-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오
select cus.custid, cus.name, ord.saleprice, ord.orderdate
from customer cus, orders ord
where cus.custid = ord.custid ;
--and cus.name='김연아';      -- 김연아 고객의 주문내역
--and saleprice >=20000;     -- 판매가격이 20000원 이상인 주문 내역
--and orderdate = '2018-7-8'; -- 주문일이 2018-7-8 주문 내역

-- 고객(이름)별로 주문한 모든 도서의 총 판매액을 구하시오
SELECT cus.name, SUM(saleprice) 판매금액,
       RANK() OVER(ORDER BY SUM(saleprice) DESC) 순위
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

-- 고객의 이름과 고객이 주문한 도서의 이름을 검색하시오.
select cus.name, boo.bookname, ord.saleprice, ord.orderdate
from customer cus, orders ord, book boo
where cus.custid = ord.custid
and boo.bookid = ord.bookid
order by cus.name; -- 정렬을 하면 그룹화도 됨

-- 가장 비싼 도서의 이름을 검색하시오
--select bookname, max(price) from book; error
select Max(price) from book where price = 35000;

-- 중첩쿼리
select bookname ,price
from book
where price = (
                select 
                max(price)
                from book
                );

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
-- 1. 주문테이블에서 고객 아이디 검색
select custid from orders;
-- 2. 고객아이디가 있는 고객 이름 검색
select name from customer
where custid in(1,2,3,4);
-- 중첩쿼리 도서를 구매한 적이 있는 고객의 이름을 검색하시오
select custid, name from customer
where custid in(
                select custid 
                from orders
                );
-- 중첩쿼리 도서를 구매한 적이 없는 고객의 이름을 검색하시오
select custid, name from customer
where custid not in(
                select custid 
                from orders
                );
-- '김연아'고객의주문내역
-- 1. 김연아 고객의 아이디 검색
-- 2. 아이디로 고객의 아이디로 주문 검색
-- 서브쿼리
select *
from orders
where custid = (
                select custid 
                from customer
                where name = '김연아');
-- join
select *
from customer cus, orders ord
where cus.custid = ord.custid and cus.name = '김연아';

-- 인라인 뷰 : From 부속질의
-- 고객번호가 2이하인 고객의 판매액을 검색하시오.
SELECT cus.name, sum(ord.saleprice) total
from (select custid, name from customer where custid <= 2) cus, orders ord
where cus.custid = ord.custid
group by cus.name;

-- 뷰(View) 생성
-- 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오
-- CREATE VIEW 뷰이름 AS SELECT 문
CREATE VIEW vw_Customer
AS SELECT * from customer 
where address like '%대한민국%';
-- 뷰검색
select * from vw_Customer;
-- 뷰삭제
drop view vw_Customer;
drop view vW_Orders;

-- 고객의 이름과 주문한 도서의 이름과 가격을 검색하시오
create view vw_Orders
AS select cus.name, bo.bookname, ord.saleprice
from customer cus, orders ord, book bo
where cus.custid = ord.custid
and bo.bookid = ord.bookid;

-- 뷰로 검색
select * from vw_Orders;

-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오
select cus.name, ord.saleprice
from customer cus, orders ord
where cus.custid = ord.custid
order by cus.name;

-- STANDART JOIN (FROM 절에 INNER JPIN ~ ON : 동등조인)
select cus.name, ord.saleprice
from customer cus inner join orders ord
     on cus.custid = ord.custid
     order by cus.name;

-- OUTER JOIN : 외부 조인
-- JOIN 조건에 충족하는 데이터가 아니여도 나옴
-- LEFT OUTER JOIN, RIGHT OUTER JOIN
-- 주문이 없는 고객을 포함하여 고객의 주문에 관한 데이터를 모두 검색하시오
select cus.name, ord.saleprice
from customer cus left outer join orders ord
     on cus.custid = ord.custid
     order by cus.name;
