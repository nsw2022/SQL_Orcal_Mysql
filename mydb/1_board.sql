-- board 테이블
-- column - 글번호, 글제목, 작성자, 글내용, 등록일
-- 글번호 : bno NUMBER(5) PRIMARY KEY, 
-- 글제목 : title VARCHAR2(200) NOT NULL,  
-- 작성자 : writer  VARCHAR2(20) NOT NULL,
-- 글내용 : content VARCHAR2(2000) NOT NULL,
-- 등록일 : regdate DATE DEFAULT SYSDATE

create table board(
    bno NUMBER(5) PRIMARY KEY,             -- 글번호
    title VARCHAR2(200) NOT NULL,          -- 글제목
    writer  VARCHAR2(20) NOT NULL,         -- 작성자
    content VARCHAR2(2000) NOT NULL,       -- 글내용
    regdate DATE DEFAULT SYSDATE           -- 등록일
);

-- 시퀀스(일련번호, 자동순번)
CREATE SEQUENCE seq;

-- 추천수 column을 추가(column명: cnt, 자료형은: number default 0) 
-- alter table 테이블이름 add 칼러명 자료형
alter table board add cnt number default 0;

-- 게시글 추가
INSERT INTO board(bno, title, writer, content) 
VALUES(seq.NEXTVAL, '가입인사','강남역','안녕하세요~ 가입인사드려요');
INSERT INTO board(bno, title, writer, content) 
VALUES(seq.NEXTVAL, '공지사항','관리자','가입인사를 남겨주세요');
INSERT INTO board(bno, title, writer, content) 
VALUES(seq.NEXTVAL, '가입인사입니다.','이강','안녕하세요~');
INSERT INTO board(bno, title, writer, content) 
VALUES(seq.NEXTVAL, '좋은 하루.','긴하루','좋은하루되세요');

-- 작성자가 관리자인 게시글을 검색하시오
select * from board where bno=2;

-- update 테이블 set 열이름=설정내용 where 조건=조건값
-- delete 테이블 where 조건=조건값

-- 게시글의 작성자를 관리자에서 admin으로 변경하세요
update board set writer='admin' where bno=2;

-- 3번 게시글 삭제하시오
delete board where board.bno=3;

select * from board order by regdate desc;

-- 재귀 복사(자료 삽입)
-- INSERT INTO(테이블) (SELECT 칼럼 FORM 테이블이름)
INSERT INTO board(bno, title, writer, content)
(select seq.NEXTVAL, title, writer, content FROM board);

SELECT ROWNUM,bno,title,content
FROM board
WHERE ROWNUM > 0 AND ROWNUM <=10;
--WHERE ROWNUM > 11 AND ROWNUM <=20; error 반드시 ROWNUM은 1을 포함해야함

-- 페이지 처리
SELECT * 
FROM (SELECT ROWNUM rn,bno,title,content
     FROM board)
WHERE rn > 10 AND ROWNUM <=20; -- rownum의 별칭을 사용하면 가능함

-- rowid
-- 데이터를 구분하는 유일한 값

select * from board;
desc board;



