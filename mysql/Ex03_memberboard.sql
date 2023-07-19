-- Members 프로젝트 
use mydb;
-- 회원테이블
create table t_member(
	memberid	varchar(20),
    passwd		varchar(20) not null,
    name		varchar(30) not null,
    gender		varchar(10),
    joindate	timestamp default now(),
    primary key(memberid)
);

-- 게시판 테이블
create table t_board(
	bnum		int primary key auto_increment,
    title		varchar(100) not null,
    content 	text,
    regdate 	timestamp default now(),
    modifydate  timestamp,
    hit			int default 0,
    memberid	varchar(20),
    fileupload	varchar(50),
    constraint	fk_member_board foreign key(memberid)
    references  t_member(memberid) on delete cascade 
);

-- 댓글 테이블
create table t_reply(
	rno int primary key auto_increment,  -- 댓글 번호
	bnum int not null, 					 -- 외래키(게시글번호)
    rcontent text not null,				 -- 댓글내용
    replyer varchar(30) not null,		 -- 작성자
    rdate timestamp default now(), 		 -- 작성일
    rupdate timestamp, 					 -- 수정일
    constraint fk_reply_board foreign key(bnum) -- 외래키 제약조건
    references t_board(bnum) on delete cascade
);

-- 댓글 추가
insert into t_reply(bnum, rcontent, replyer)
values(1, '내용에 대한 답변입니다.', 'tmddn3410');

-- 게시글 쓰기
insert into t_board(title, content, memberid)
values('가입인사','내가왔다','test11');

insert into t_board(title, content, memberid)
values('yoyo','ee','test11');


insert into t_board(title, content, memberid)
values('qwer','tt','test11');


insert into t_board(title, content, memberid)
values('xx','ttss','test11');

insert into t_board(title, content, memberid)
values('qq','rr','test11');


SELECT * FROM t_board
ORDER BY bnum DESC
LIMIT 3;

-- limit(시작행, 게시글 수)
select * from t_board order by bnum desc limit 0, 10;
select * from t_board order by bnum desc limit 11, 20;
select * from t_member;
select * from t_reply;
select * from t_board;

select count(title) from t_board where title like '%인사%' 
order by bnum desc limit 0, 10;
