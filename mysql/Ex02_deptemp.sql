-- 부서와 사원 테이블 만들기
use mydb;
-- 부서테이블
create table department(
	deptid   int primary key,
    deptname varchar(30) not null,
    location varchar(20) not null
);
-- 사원테이블
create table employee(
	empid int primary key,				-- 사원아이디
    empname varchar(30) not null,		-- 사원 이름
    age int,							-- 나이
    deptid int not null,				-- 부서 아이디(외래키)
    constraint fk_dept_employee foreign key(deptid)
    references department(deptid)		-- 관계 설정(외래키)
);

-- 부서 추가
insert into department values(10, '개발팀', '서울');
insert into department values(20, '디자인팀', '성남');

-- 사원추가
insert into employee values(101, '한라산', 27, 10);
insert into employee values(102, '동해', 30, 20);
insert into employee values(103, '서해', 23, 30); -- 부모키가 없음(제약조건 위배)

-- 부서 삭제(부서이름이 '디자인팀'을 삭제) -> 자식 로우가 있으므로 삭제 안됨
-- 제약조건(on delete cascade)을 추가하면 삭제 가능함
delete from department where deptid = 20;

-- 부서검색
select * from department;
-- 사원검색
select * from employee;

-- 사원이름이 '한라산'인 사원의 사원아이디와 부서아이디를 출력
select empid, deptid from employee where empname='한라산';

-- 부서이름이 '개발팀'인 사무실의 위치를 검색하세요.
select location from department where deptname='개발팀';

-- 사원 아이디가 102인 사원의 이름을 '동해'로 변경하고 나이를 40세로 로 변경
update employee set empname = '동해', age = 40 where empid = 102;

-- 트랜 잭션(실행-commit, 취소-rollback)
rollback;
