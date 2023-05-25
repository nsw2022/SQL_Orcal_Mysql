select * from book;

DELETE from book where bookid = 11;

-- 서브 쿼리 ( 쿼리 중첩 )
SELECT count(*) 총수량 from book;

-- 가장 높은 가격 찾으시오
select max(book.price) 최고가격 from book;

-- 가장 비싼 출판사별 가격
select publisher, max(book.price) 
from book 
GROUP BY book.publisher ;

-- 가장 비싼 도서의 이름과 가격 찾으시오
select bookname, price 
from book
where price = (select max(book.price) 최고가격 from book);

-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오
SELECT * FROM customer;
SELECT * FROM orders;

SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE ord.custid = cus.custid;

-- 김연아 고객의 총 주문가격을 검색하시오
SELECT cus.name, sum(saleprice)
FROM customer cus, orders ord
WHERE ord.custid = cus.custid
GROUP BY cus.name
HAVING cus.name = '김연아';

