SELECT * from dept;

select * from employee;

desc dept;

delete from dept where deptno='1000';

-- employee 테이블 
-- on delete cascade 제약조건 추가
-- 1. 외래키 제약 조건을 삭제
alter table employee drop CONSTRAINT emp_fk;

-- 2. on delete cascade 제약조건 추가
alter table employee add CONSTRAINT emp_fk
foreign key(deptno) REFERENCES dept(deptno)
on delete cascade;

