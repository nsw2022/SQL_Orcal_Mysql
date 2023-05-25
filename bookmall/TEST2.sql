SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- 출판사가 '굿스포츠' 또는 '대한미디어' 인 도서 검색하시오
SELECT * 
FROM book 
WHERE publisher= '굿스포츠' or publisher= '대한미디어';

SELECT * FROM book
WHERE publisher IN('굿스포츠','대한미디어');

-- 도서 이름에 '축구'가 포함된 출판사를 검색하시오
SELECT *
FROM book
WHERE bookname LIKE '%축구%';

-- '축구'에 관한 도서 중 가격이 20000원 이상인 도서를 검색하시오
SELECT *
FROM book
WHERE bookname LIKE '%축구%' AND price > 20000;

-- 도서를 이름순으로 정렬해주세요(오름차순)
SELECT * FROM book ORDER BY bookname;

-- 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 정렬하시오
SELECT * FROM book
ORDER BY price,bookname;

-- 자료추가
-- INSERT INTO book VALUES (11, '혼자공부하는 자바', '한빛미디어', 24000);
INSERT INTO book values(11, '혼자공부하는 자바', '한빛미디어', 24000);


-- bookname을 '혼자 공부하는 파이썬으로' 변경하시오
DESC book;
UPDATE book SET book.bookname = '혼자 공부하는 파이썬'
WHERE book.bookid=11;

SELECT * FROM book;


