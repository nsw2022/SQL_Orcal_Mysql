use javaweb;

-- Market: member 테이블 생성
create table member(
	mid     varchar(20),             -- 회원 아이디
	passwd  varchar(20) not null,    -- 비밀번호
	mname   varchar(30) not null,    -- 이름
	gender  varchar(10),     		 -- 성별
	birth   varchar(20),      		 -- 생일
	phone   varchar(20),      		 -- 전화번호
    email   varchar(20),      		 -- 이메일
	address varchar(50),    		 -- 주소
	regDate timestamp default now(), -- 가입일
    primary key(mid)
    
);

insert into member(mid, passwd, mname, gender, birth, phone, email, address)
values('cloud','!a123456','구름이','여','1998/03/30','010-1234-5678','cloud@sky.com','서울시 강남구 청담동');
update member set gender = 'male' where mid = 'cloud';
select * from member;

