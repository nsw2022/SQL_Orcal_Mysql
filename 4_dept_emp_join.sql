-- 부서테이블과 사원테이블 조인(join)
-- join - 2개 이상의 테이블이 연결하여 사용하는 기법

select * from dept;
select * from employee;

-- 사원번호, 사원명, 부서번호, 부서명을 출력하시오
SELECT emp.empno, emp.ename, emp.deptno, dep.deptname
FROM employee emp, dept dep
where emp.deptno = dep.deptno;
