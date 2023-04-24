-- 집합연산
CREATE TABLE job(
    job_id VARCHAR2(10),
    salary NUMBER(5) -- 달러로 입력
);

INSERT INTO job VALUES('manager', 1300);
INSERT INTO job VALUES('manager', 1500);
INSERT INTO job VALUES('manager', 1900);
INSERT INTO job VALUES('hleper', 1000);
INSERT INTO job VALUES('hleper', 1500);
INSERT INTO job VALUES('hleper', 2500);

-- job 전체의 개수와 급여의 총합계 구하기
SELECT count(*) 개수, sum(salary) 급여총합계
FROM job;

-- 직업아이디별 개수와 급여의 총합계 구하기
SELECT job.job_id, sum(salary) 급여총합계
FROM job
GROUP BY job.job_id;

-- 직업아이디별 개수와 급여의 최대값 구하기
SELECT job.job_id, MAX(salary) 최대급여값
FROM job
GROUP BY job.job_id;

-- 직업아이디별 개수와 급여의 최소값 구하기
SELECT job.job_id, MIN(salary) 최소급여값
FROM job
GROUP BY job.job_id;

-- 직업아이디별 개수와 급여의 최대값과 최소값 UNION으로 구하기
SELECT job.job_id, MAX(salary) RESULT
FROM job
GROUP BY job.job_id
UNION
SELECT job.job_id, MIN(salary) RESULT
FROM job
GROUP BY job.job_id;


COMMIT;

SELECT * FROM job;