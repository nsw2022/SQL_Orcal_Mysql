-- user : jweb 인 계정
create user jweb@localhost identified by '1234';

-- db생성
create database javaweb;

-- db 권한주기
grant all privileges on javaweb. * to jweb@localhost with grant option;