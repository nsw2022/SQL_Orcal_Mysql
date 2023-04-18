--학과테이블
CREATE TABLE tbl_class(
    cid NUMBER(3),                 --학과코드(기본키)
    cname VARCHAR2(30) NOT NULL,   --학과명
    ctel  VARCHAR2(15) NOT NULL,   --학과 전화번호
    colcation VARCHAR2(20) NOT NULL,  -- 과사무실 위치
    PRIMARY KEY(cid)
);

select * from tbl_class;

-- 학과 자료 삽입
insert into tbl_class values(101,'소프트웨어학과','02-1234-1234','B동 3층');
insert into tbl_class values(102,'화학공학과','02-1234-4567','B동 4층');
insert into tbl_class values(103,'전기전자공학과','02-1234-5678','B동 5층');

CREATE TABLE tbl_student(
    sunmber NUMBER(8) PRIMARY KEY,
    sname   VARCHAR2(20) NOT NULL,
    age     NUMBER(3),
    gneder  VARCHAR2(6) NOT NULL,
    address VARCHAR2(50),
    cid NUMBER(3) NOT NULL,
    --외래키 제약조건(학과)
    CONSTRAINT fk_class FOREIGN KEY(cid)
    REFERENCES tbl_class(cid) ON DELETE CASCADE
);

-- 학생 자료 삽입
INSERT INTO tbl_student VALUES (20211234, '이강', 22, '여자', '서울시 종로구', 102);
INSERT INTO tbl_student VALUES (20211235, '박대양', 25, '남자', '경기도 성남시', 101);
INSERT INTO tbl_student VALUES (20211236, '한비야', 23, '여자', '경기도 수원시', 103);
INSERT INTO tbl_student VALUES (20211234, '투데이', 31, '남자', '경기도 광주시', 101);
INSERT INTO tbl_student VALUES (20211235, '긴하루', 19, '여자', '경기도 강남구', 101);
INSERT INTO tbl_student VALUES (20211236, '한강', 22, '여자', '경기도 용인시', 102);

select * from tbl_student;
-- 박대양 학생의 학과정보 서브쿼리버전
select *
from tbl_class
where tbl_class.cid = (
                        select cid
                        from tbl_student
                        where sname = '박대양');
                        
-- 박대양 학생의 학과정보 join 버전
select *
from tbl_class cla, tbl_student stu
where cla.cid = stu.cid and stu.sname = '박대양';
--서브쿼리 join 정리
--차이점
--서브쿼리는 하나의 테이블에서의 결과값 출력
--join은 둘의 결과값에서 원하는 컬럼만 따로 출력하여 볼수있다.
--둘다 여러개의 테이블로부터 데이터를 추출하려사용함
--#서브쿼리는 가독성이 좋지만 선능이 조인에비해 매우좋지않은 퍼포먼스 문제 발생
--따라서 최신 MySQL버전에서는 서브쿼리문을 사용하면 자체적으로 조인으로 변환하여 실행

-- 1. 주소가 '경기도'인 학생을 검색하시오
SELECT * from tbl_student where address like '경기도%';

-- 2. 주소가 '경기도'이고 남자인 학생을 검색하시오
SELECT * from tbl_student where address like '경기도%' and gneder = '남자';

-- 3. 나이가 많은 순으로 정렬하시오.
select * from tbl_student ORDER BY age desc;
-- 4. '박대양의 나이를 30세로 변경(수정)하시오.
update tbl_student set age=30 where sname='박대양';
select * from tbl_student where sname='박대양';
