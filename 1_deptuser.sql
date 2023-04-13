-- 부서 테이블(dept)
CREATE TABLE dept(
    -- ?????? ?????
    deptno  VARCHAR2(4) PRIMARY KEY,
    deptname  VARCHAR2(20) NOT NULL,
    office  VARCHAR2(10)    
);
-- 이상 현상 해결
-- 부서코드 : 식별자(Identifier) - 기본키(Primary Key)속성 추가
-- 부서 명 : 필수 입력 사항 (not null 속성 추가)
DESC dept;
 
-- 부서 추가
INSERT INTO dept(deptno, deptname, office) VALUES ('1000', '인사팀', '서울');
INSERT INTO dept(deptno, deptname, office) VALUES ('1001', '전산팀', '수원');
INSERT INTO dept VALUES ('1002', '전산팀', '수원');
INSERT INTO dept(deptno, deptname) VALUES ('1003', '영업팀');

-- 실행 완료 ; 트랜잭션의 한 부분
COMMIT;

-- 실행 완료 : 트랜잭션의 한 부분
SELECT * FROM dept;
SELECT deptno as 부서코드, deptname as 부서명 FROM dept;

SELECT * FROM dept;
--WHERE deptno = '1002';

-- 부서번호가 1002인 부서를 회계팀으로 변경
UPDATE dept 
SET deptname='회계팀' where deptno='1002';

/* 부서 테이블 삭제 */
DROP TABLE dept;

delete dept where dept.deptno = '1003';

