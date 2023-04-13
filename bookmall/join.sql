-- join과 서브쿼리

 select * from customer;
 select * from book;
 select * from orders;
 
-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오
select cus.custid, cus.name, ord.saleprice, ord.orderdate
from customer cus, orders ord
where cus.custid = ord.custid 
--and cus.name='김연아'      -- 김연아 고객의 주문내역
--and saleprice >=20000     -- 판매가격이 20000원 이상인 주문 내역
and orderdate = '2018-7-8'; -- 주문일이 2018-7-8 주문 내역

-- 고객별로 주문한 모든 도서의 총 판매애을 구하시오
select cus.name, sum(saleprice) 판매금액,
       rank() over(order by sum(saleprice) desc) 순위
from customer cus, orders ord
where cus.custid = ord.custid
group by cus.name;

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