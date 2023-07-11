-- 대한민국에 거주하는 고객의 이름과 도서를 주문한 고객의 이름 검색
-- 조건 join을 쓰지않고 union을 사용
SELECT * 
FROM customer
WHERE address LIKE '%대한민국%';

-- 도서를 주문한 고객의 이름 검색
SELECT name
FROM customer cus, orders ord 
WHERE cus.custid = ord.custid;
-- 집합연산 union
SELECT name 
FROM customer
WHERE address LIKE '%대한민국%'
UNION
SELECT name
FROM customer cus, orders ord 
WHERE cus.custid = ord.custid;
-- 중복허용 union all
SELECT name 
FROM customer
WHERE address LIKE '%대한민국%'
UNION ALL
SELECT name
FROM customer cus, orders ord 
WHERE cus.custid = ord.custid;