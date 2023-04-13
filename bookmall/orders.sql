-- orders 테이블(주문번호, 고객번호, 도서번호, 판매가격, 주문일)
create TABLE orders(
    orderid NUMBER PRIMARY KEY,
    custid NUMBER NOT NULL,
    bookid NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate DATE,
    --외래키 설정
    CONSTRAINT cus_fk FOREIGN KEY(custid)
    REFERENCES customer(custid),
    CONSTRAINT book_fk FOREIGN KEY(bookid)
    REFERENCES book(bookid)
);

-- orders 자료 삽입
INSERT INTO orders VALUES (1,1,1,6000,TO_DATE('2016-07-01','YYYY-MM_DD'));
INSERT INTO orders VALUES (2,1,3,21000,TO_DATE('2018-07-03','YYYY-MM_DD'));
INSERT INTO orders VALUES (3,2,5,8000,TO_DATE('2018-07-03','YYYY-MM_DD'));
INSERT INTO orders VALUES (4,3,6,6000,TO_DATE('2018-07-04','YYYY-MM_DD'));
INSERT INTO orders VALUES (5,4,7,20000,TO_DATE('2018-07-05','YYYY-MM_DD'));
INSERT INTO orders VALUES (6,2,2,12000,TO_DATE('2018-07-07','YYYY-MM_DD'));
INSERT INTO orders VALUES (7,4,8,13000,TO_DATE('2018-07-08','YYYY-MM_DD'));
INSERT INTO orders VALUES (8,3,10,12000,TO_DATE('2018-07-08','YYYY-MM_DD'));
INSERT INTO orders VALUES (9,2,10,7000,TO_DATE('2018-07-09','YYYY-MM_DD'));
INSERT INTO orders VALUES (10,3,8,13000,TO_DATE('2018-07-10','YYYY-MM_DD'));

select * from orders;

-- 고객이 주문한 도서의 총 판매액을 구하시오
select sum(saleprice) 총판매액, AVG(saleprice) 평균금액
from orders;

-- 서점의 도서 판매 건수를 구하시오
select count(*) 총판매건수
from orders;

-- 2번 고객 (김연아)이 주문한 도서의 총 판매액을 구하시오
select *
from orders
where custid = 2;

select sum(saleprice) 총매출
from orders
where custid = 2;

-- 가격이 8000원 이상이 도서를 구매한 고객별 주문도서의 총 수량을 구하시오
-- 단, 2권 이상 구매한 고객만 찾으시오.
select count(*) 총수량
from orders
where saleprice >= 8000
group by custid
having count(*) >= 2;


-- 조인(1개 테이블 이상 연결하는 기법)
select cus.name,cus.phone,ord.saleprice,ord.orderdate
from orders ord, customer cus
where cus.custid = cus.custid
and cus.name='김연아';

-- 고객 이름별로 주문한 도서의 총 판매액을 구하시오
select cus.name, SUM(ord.saleprice)
from orders ord, customer cus
where cus.custid = cus.custid
and cus.name='김연아'
group by cus.name;

-- 고객 이름별로 주문한 도서의 총 판매액을 구하시오
-- 집계를 구할때는 CROUP BY절을 사용, 조건은 HAVING절 사용
select cus.name, SUM(ord.saleprice)
from orders ord, customer cus
where cus.custid = cus.custid
group by cus.name
having cus.name = '박지성';

commit;