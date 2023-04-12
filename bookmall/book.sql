-- book 테이블 생성 (도서번호, 도서이름, 출판사, 도서가격)
CREATE TABLE book(
    bookid NUMBER PRIMARY KEY,
    bookname VARCHAR2(50) NOT NULL,
    publisher VARCHAR2(50) NOT NULL,
    price NUMBER NOT NULL
);
-- 이름 변경
--ALTER TABLE book COLUMN rename price to saleprice; 
-- 자료형 변경
ALTER TABLE book MODIFY bookname VARCHAR2(60); 
desc book;

-- book 자료형 입력
INSERT INTO book VALUES (1,'축구의 역사','굿스포츠',7000);
INSERT INTO book VALUES (2,'축구아는 여자','나무수',13000);
INSERT INTO book VALUES (3,'축구의 이해','대한미디어',22000);
INSERT INTO book VALUES (4,'골프 바이블','대한미디어',35000);
INSERT INTO book VALUES (5,'피겨 교본','굿스포츠',8000);
INSERT INTO book VALUES (6,'양궁의 실제','굿스포츠',6000);
INSERT INTO book VALUES (7,'야구의 추억','이상미디어',20000);
INSERT INTO book VALUES (8,'야구를 부탁해','이상미디어',13000);
INSERT INTO book VALUES (9,'올림픽 이야기','삼성당',75000);
INSERT INTO book VALUES (10,'olympic Champions','Person',13000);


-- 자료검색
select book.bookname, book.price from book;

-- 도서 테이블에 있는 모든 출판사를 검색하시오(중복제거)
select DISTINCT book.publisher from book;

-- 특정한 조건 (where 절)
-- 가격이 20000원 미만인 도서를 검색하시오
select book.bookname from book where book.price < 20000;

-- 가격이 10000원 이상 20000원 이하인 도서를 검색하시오 (BETWEEN ~ AND)
select * from book where book.price BETWEEN 10000 and 20000;

-- OR 조건, IN('a','b')
-- 출판사가 '굿스폿츠' 혹은 '대한미디어'인 도서를 검색하시오
select * from book where book.publisher in ('굿스포츠','대한미디어');

select * from book where book.publisher = '굿스포츠' or book.publisher = '대한미디어';

-- '축구의 역사'를 출간한 출판사를 검색하시오
--select * from book where book.name = '축구의 역사';

-- 도서이름에 '축구'가 포함된 출판사를 검색하시오
select * from book where bookname like '%축구%';

-- 축구에 관한 도서중 가격이 20000원 이상인 도서를 찾으시오
select * from book where bookname like '%축구%' and book.price >= 20000;

-- 도서의 총수를 구하시오
select count(*) 총도서수 from book;

-- 도서 중 최고 가격을 검색하시오
select MAX(book.price) from book;
-- 서브 쿼리(중첩Sub query)
select bookname,price from book where price = (select MAX(book.price) from book); 

-- 도서 가격이 높은 순으로 정렬하시오
select * from book order by price desc, book.publisher asc;

desc book;