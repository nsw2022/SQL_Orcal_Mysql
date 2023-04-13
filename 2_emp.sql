-- 사원 테이블
CREATE TABLE emp(
    -- 칼럼 이름 자료형
    empno     NUMBER(3) PRIMARY key,       -- 사원번호
    ename   VARCHAR2(20) not null,       -- 사원이름
    sal     NUMBER(10),                  -- 급여
    createdate  DATE DEFAULT SYSDATE     -- 등록일
);

-- 사원에 성별 칼럼 추가 ( ALTER ~ ADD 칼럼이름 자료형 )
ALTER TABLE emp ADD gender VARCHAR2 (4);
desc emp; -- 테이블 중간 확인용도

-- 사원의 성별 자료형을 변경(MODIFY) VARCHAR2(30)
ALTER TABLE emp MODIFY gender VARCHAR2(10);


-- 사원 추가
insert into emp VALUES (100,'이강',2500000, SYSDATE ,null);
insert into emp VALUES (101,'김산',3000000, SYSDATE ,null);
insert into emp VALUES (102,'오상식',5000000, SYSDATE ,null);
insert into emp VALUES (103,'박신입',null, SYSDATE ,null);
insert into emp values (104,'서울시',1500000,SYSDATE , '여');
-- 사원 조회
select * FROM emp;

-- 사원번호, 사원이름, 급여
SELECT emp as 사번, ename 사원명, sal as 급여 from emp;
-- as 생략해도 되긴함!!

-- 실행 완료 ; 트랜잭션의 한 부분 이걸해야 완벽히 실행된것 단축키F11이라고함

-- 급여가 없는 사원을 검색하시오
select * from emp where sal is null; --null 이 아닌 구문은 isnotnull

-- 급여가 300 이하인사람
select * from emp where sal <= 3000000;

-- 급여가 많은 순으로 정렬
select * from emp where sal <= 3000000 order by sal desc;

-- 성별이 '여'인 사원을 '여자로'로 변경하시오
UPDATE emp SET gender = '여자' where empno='104';

-- 사원의 수를 구하시오
select count(*) as 사원수 from emp;

-- 사원 급여의 합계와 평균을 구하시오
select SUM(sal) as 급여합계, AVG(sal) 급여평균
from emp;

-- 사원 이름이 서울시인 사원 삭제
DELETE from emp
where ename = '서울시';

rollback; -- commit 전상태로 돌려줌 이미했다면 돌릴방법 없음

COMMIT;


