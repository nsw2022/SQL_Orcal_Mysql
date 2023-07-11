-- GROUP BY 의 ROLLUP(), CUBE()
-- 매우복잡함 아래 3개 정리

-- 쉽게 정리 cube() 다면적 소계및 총계
-- GROUPING sets()소계만 나옴
-- roll() 단일 소계 총계
-- 부서테이블
CREATE TABLE department(
    dept_no VARCHAR2(3),
    job_name VARCHAR2(30),
    salary NUMBER(10)
);

-- 자료삽입
INSERT INTO department VALUES ('100','증권사',3300000);
INSERT INTO department VALUES ('100','관리자',4300000);
INSERT INTO department VALUES ('200','증권사',5000000);
INSERT INTO department VALUES ('200','데이터분석가',4000000);
INSERT INTO department VALUES ('200','관리자',6000000);


select * from department;


-- 부서별 급여 총계 구하기
select dept_no, 
    sum(salary) 
from department
GROUP BY dept_no;

-- 부서별 소계 총계을 rollup으로 구함
select dept_no,
    job_name,
    sum(salary) 
from department
GROUP BY rollup(dept_no,job_name)
ORDER BY dept_no;

-- 부서별, 직업별 소계, 총계 cube() 다나온다고 보면됨
select dept_no,
    job_name,
    sum(salary) 
from department
GROUP BY cube(dept_no,job_name)
ORDER BY dept_no;

-- 부서별, 직업별 소계 : GROUPING SETS()
select dept_no,
    job_name,
    sum(salary) 
from department
GROUP BY GROUPING sets(dept_no,job_name)
ORDER BY dept_no;
