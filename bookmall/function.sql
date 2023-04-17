-- 숫자 타입 함수
-- 제공된 테이블 : dual
select ABS(-10), abs(10) from dual;

-- 반올림 : ROUND(수, 자리수)
select round(3.875,2) from DUAL;

-- sal을 30일로 나눈후 소수 자리수에 반올림한 값 출력
select sal 급여, 
    sal/30 일급 ,
    ROUND( sal/30,1) 결과1,
    ROUND( sal/30,0) 결과2,
    ROUND( sal/30,-1) 결과3
from employee;

-- sal을 30일로 나눈후 소수 자리수에 따라 절삭(버림) 반올림한 값 출력
select sal 급여, 
    sal/30 일급 ,
    TRUNC(sal/30, 1) 결과1
from employee;

-- sal을 30일로 나눈후 소수 자리수에 따라 절삭(버림) 반올림한 값 출력
select sal 급여, 
    sal/30 일급 ,
    TRUNC(sal/30, 1) 결과1,
    TRUNC(sal/30, 0) 결과2,
    TRUNC(sal/30, -1) 결과3
from employee;

select * from orders;


-- 고객별 평균 주문 금액을 백원 단위로 반올림한 값을 구하시오
select custid, ROUND(AVG(saleprice),-2) 평균주문금액 
from orders
GROUP BY custid;

select custid, count(*) 주문수, sum(saleprice)
from orders
GROUP BY custid;
select * from customer;

-- 문자 타입 함수
select lower('ABCD') result from dual;

select * from dept;

-- substr(문자, 인덱스, 글자수)
SELECT substr('ABC',1,2) result from dual;

-- REPLACE(문자,이전문자,새로운문자)
select replace('ABC','A','E') result from dual;

-- concat(문자1, 문자2 - 문자 연결)
select concat('A','B') RESULT from DUAL;

-- 연결연산자 - '||'
select '안녕'||'하세요' result from dual;
-- LPAD(문자, 문자수, 기호) - 기호를 왼쪽부터 채움
select lpad('cloud',10,'*') result from dual;
select rpad('cloud',10,'*') result from dual;

select LPAD('cloud',10,'*')result from dual;

--부서이름에서 처음부터 시작해서 2개의 문자 출력
select SUBSTR(deptname,1,2) 부서명 from dept;

-- 도서 제목에 '야구'가 포함된 도서를 '농구'로 변경하여 검색
select bookid,
    REPLACE(bookname, '야구','농구') bookname
from book;

-- 굿스포츠에서 출판한 도서의 제목과 제목의 문자 수, 바이트 수를 검색
-- 한글 3Byte, 영어, 특수기호 - 1Byte
select bookname,
       length(bookname),
       lengthb(bookname) 바이트수
from book
where publisher = '굿스포츠';

-- 날짜 함수
select sysdate + 10 from dual;
-- 20일전의 날짜 출력
select sysdate - 20 from dual;

-- 특정한 날짜 ex) 4월 1일에서 10일 후
-- 문자형--> 날짜형 to_date()함수를 쓰면 가능
SELECT to_date('2023/04/01') + 20 from dual;

-- 입사일이 : 2022-1-1 퇴사일 : 2023-1-31(월수:계산)
select
    round(MONTHS_BETWEEN(to_date('2023-1-1'),
    to_date('2022-1-1')),0) 총개월수
from dual;

-- 3개월 후의 날짜 출력 특이하게 빼는건 따로 없어서 add에서 빼줘야함
select add_months(sysdate,3) 결과 from dual;
select add_months(sysdate,-3) 결과 from dual;
-- 날짜와 시간
select systimestamp from dual;

-- 주문번호가 6에서 10 사이인 도서의 주문일에 3개월을 더한값을 구하시오
select
    orderid 주문번호,
    add_months(orderdate, 3) 더하기결과,
    add_months(orderdate, -3) 빼기결과
from orders
where orderid between 6 and 10;

-- 주문번호가 10인 도서인 주문일로부터 오늘까지 총 개월수를 구하시오
-- MONTHS_BETWEEN(이후날짜, 이전날짜)
select 
    orderid 주문번호,
    orderdate 주문일,
    trunc( MONTHS_BETWEEN(sysdate,orderdate),0) 총개월수
from orders
where orderid=10;

-- 서점은 주문일로부터 10일후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
select orderid 주문번호,
       orderdate+10 주문일,
       orderdate+10 확정일
from orders;

--자동 타입 변환
SELECT 1 + '2' from dual;

-- 수동 타입 변환
-- 문자를 숫자형식으로 변환
select to_number('120') from dual;

-- 날짜형식
select to_date('2022-06-30','yy-mm-dd') from dual;

-- 날짜 형식 변환
select to_char(sysdate,'yy-mm-dd') 날짜,
       to_char(sysdate,'yyyy') 연도,
       to_char(sysdate,'mm') 월,
       to_char(sysdate,'dd') 일,
       to_char(sysdate,'HH:MI:ss') 시분초
from dual;

-- 시간 형식 변환
select to_CHAR(sysdate, 'HH:MI:SS AM') 시간형식
       
from dual;

-- 고객 이름에서 같은 성을 가진 사람의 인원 수를 구하시오
-- 힌트 GROUP BY절, SUBSTR(), count(*)
select 
    substr(name,1,1) 성,
    count(*) 인원
from customer
GROUP by substr(name,1,1);
