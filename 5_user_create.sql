show user;

-- 사용자 계정 만들기
-- DB이름, 비밀번호, 테이블 공간 생성
create user c##mydb IDENTIFIED by mydb
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE TEMP;

-- 권한설정 관리자 권한 설정
GRANT CONNECT, DBA TO c##mydb;
