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
    REFERENCES t_member(memberid)
);

-- 글번호, 글제목, 글내용, 작성일, 수정일, 조회수, 아이디(외래키)
-- 자동순번(시퀀스 오토인크리먼트)
CREATE SEQUENCE b_seq;

INSERT INTO t_board(bnum, title, content, memberId)
VALUES(b_seq.nextval, '가입인사','안녕하세요. 반갑습니다.', 'cloud');

select * from t_board;
