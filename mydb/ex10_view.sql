-- 중첩 쿼리 - 괄호안을 먼저 실행함, from절 - 인라인 뷰
select rownum, name, score from
    (select rownum, name, score
    from ex_score
    order by score desc)
WHERE rownum <= 5;

-- job_info 테이블
CREATE TABLE JOB_INFO(
    JOB_ID      VARCHAR(10),
    MIN_SALARY  NUMBER,
    MAX_SALARY  NUMBER
);

INSERT INTO JOB_INFO VALUES ('AD_PRES', 20080, 40000);
INSERT INTO JOB_INFO VALUES ('AD_VP', 15000, 30000);
INSERT INTO JOB_INFO VALUES ('AD_ASST', 3000, 6000);
INSERT INTO JOB_INFO VALUES ('FI_MGR', 8200, 16000);
INSERT INTO JOB_INFO VALUES ('FI_ACCOUNT', 4200, 9000);
INSERT INTO JOB_INFO VALUES ('AC_MGR', 8200, 16000);
INSERT INTO JOB_INFO VALUES ('AC_ACCOUNT', 4200, 9000);

-- 집계함수 - COUNT(), SUM(), AVG()
SELECT COUNT(*) 총개수, 
       ROUND(AVG(MIN_SALARY),-1) 최저급여평균,
       AVG(MAX_SALARY) 최대급여평균
FROM JOB_INFO;

-- 최저 급여가 5000 달러이상인 직업 이름을 검색하시오
SELECT JOB_ID, job_info.min_salary "min_sal"
FROM JOB_INFO
WHERE job_info.min_salary > 5000; 
--WHERE min_sal > 5000;

--최저 급여가 5000달러 이상인 직업 아이디를 검색한 뷰를 작성하시오
-- CREATE VIEW 뷰이름 AS 구분
CREATE VIEW V_JOB_INFO 
AS  SELECT *
    FROM JOB_INFO
    WHERE job_info.min_salary > 5000; 

SELECT * FROM v_job_info;

-- 최고급여와 최저급여의 차가 8000이상인 갯수를 검색하시오
SELECT COUNT(*) 
FROM v_job_info
WHERE max_salary - min_salary >= 8000;

-- 직업아이디 검색
SELECT JOB_ID 
FROM v_job_info
WHERE max_salary - min_salary >= 8000;

-- 직업아이디의 이름이 AD로 시작하는 자료 검색 - LIKE 큰따옴표로 묶음 오류남
SELECT *
FROM v_job_info
WHERE JOB_ID LIKE 'AD%';


