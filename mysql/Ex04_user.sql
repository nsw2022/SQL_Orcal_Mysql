use mydb;
-- java 에서 실습할때 사용함
create table user(
	id	 int primary key,
    pwd  varchar(20) not null,
    name varchar(20) not null,
    phone varchar(20)
);

-- user 추가
insert into user values(101, '!a123456',  '테스트', '010-1234-5678');