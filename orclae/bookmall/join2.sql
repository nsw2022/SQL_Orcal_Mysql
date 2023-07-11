-- bookmall

SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- join(동등조인-EQUI JOIN) - 공동된 부분 (교집합, AND)
-- 고객의 이름과 고객의 주문에 도서의 판매가격을 구하시오
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
ORDER BY cus.name;


-- '박지성' 고객이 주문한 도서의 판매가격을 구하시오
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid 
AND cus.name='박지성';

-- '박지성' 고객이 주문한 도서의 이름, 판매가격, 주문일을 구하시오
SELECT cus.name, bookname,ord.saleprice, ord.orderdate
FROM customer cus, orders ord, book bk
WHERE cus.custid = ord.custid 
AND bk.bookid = ord.bookid
AND name='박지성';


-- 고객별로 주문한 모든 도서의 총 판매액을 구하시오(group by 절,SUM()이용)
SELECT cus.name, sum(saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;


-- '안산' 고객별로 주문한 모든 도서의 총 판매액을 구하시오(group by 절,SUM()이용)
SELECT cus.name, sum(saleprice) 판매금액
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name
HAVING cus.name='안산';

-- ANSI (American National Standards Institute) 미국표준협회에서 제시한 SQL
-- 표준(ANSI) SQL -> INNER JOIN ON~
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    
-- 표준 SQL -> '박지성' 고객이 주문한 도서의 판매가격을 구하시오
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
    ON cus.custid = ord.custid
    AND cus.name = '박지성';
    
-- 외부 조인 ('+' 연산자 사용) : join 조건에 충족하는 데이터가 아니어도 검색하는 방식
-- where 절에서 모든 행이 출력되는 테이블의 반대편 테이블에 '+'를 붙힘
-- 주문이 없는 고객을 포함하여 고객의 이름과 주문한 도서의 판매가격을 찾으시오
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+);

-- 표준 SQL - LEFT OUTER JOIN ON
SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    


    




