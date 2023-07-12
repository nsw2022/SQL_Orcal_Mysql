-- 회원 테이블 생성
CREATE TABLE t_member(
    memberid    VARCHAR2(20) PRIMARY KEY,
    passwd      VARCHAR2(20) NOT NULL,
    name        VARCHAR2(30) NOT NULL,
    gender      VARCHAR2(10),
    joinDate    DATE DEFAULT SYSDATE
);

INSERT INTO t_member( memberid,passwd,name,gender )
       values('cloud','m12345','승우','남');
       
SELECT * from t_member;


-- 글번호, 글제목, 글내용, 작성일, 수정일, 조회수, 아이디(외래키)
create table t_board(
    bnum    Number(4) PRIMARY KEY,
    title   varchar2(100) not null,
    content varchar2(2000) not null,
    regdate TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate TIMESTAMP,
    hit NUMBER DEFAULT 0,
    memberid VARCHAR2(20) NOT NULL,
    CONSTRAINT FK_MemberBoard FOREIGN KEY (memberid)
    REFERENCES t_member(memberid) ON DELETE CASCADE
);

-- 글번호, 글제목, 글내용, 작성일, 수정일, 조회수, 아이디(외래키)
-- 자동순번(시퀀스 오토인크리먼트)
CREATE SEQUENCE b_seq;

-- 시퀀스의 캐쉬초기화
ALTER SEQUENCE b_seq NOCACHE;

-- 1로 초기화해줌 사용해본결과 0으로 초기화하거나 
-- 걍 삭제하고 다시만드는게 편함
ALTER SEQUENCE b_seq INCREMENT by 1;


--drop SEQUENCE b_seq;


INSERT INTO t_board(bnum, title, content, memberId)
VALUES(b_seq.nextval, '가입인사','안녕하세요. 반갑습니다.', 'cloud');

select * from t_board;
drop TABLE t_board;

update t_board set hit=hit+1 where bnum=1;

-- id 중복체크
select count(*) as result 
from t_member
where memberid = 'cloud';

-- id 중복체크
select decode(count(*), 1 , 'true','false') as result 
from t_member
where memberid = 'cloud';


ALTER TABLE t_board add fileupload VARCHAR2(100);

--페이징 처리
SELECT ROWNUM, t_board. *
FROM t_board 
WHERE ROWNUM >= 1 AND ROWNUM <= 10
ORDER BY bnum DESC;

SELECT *
FROM (
    SELECT ROWNUM AS rn, t_board.*
    FROM t_board
    ORDER BY bnum DESC
) WHERE rn >= 11 AND rn <= 20;
--페이징 처리2(인라인뷰 - 중첩쿼리(서브쿼리))
select * 
from (select rownum rn, board.*
      from (select * from t_board order by bnum desc) board)
where rn >= 1 and rn <= 10;


-- 총행수
select count(*) from t_board;

drop table t_board;

