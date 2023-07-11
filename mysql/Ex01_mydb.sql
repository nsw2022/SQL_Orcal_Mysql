-- user 계정
show databases; /*db보기*/

use mysql;/* db사용 */
show tables; /* 테이블 보기 */

-- db생성
create database mydb;

-- db권한주기
grant all privileges on mydb.* to root@localhost with grant option;

show databases;