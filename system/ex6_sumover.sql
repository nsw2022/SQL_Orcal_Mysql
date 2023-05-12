-- 급여 총액
SELECT *
FROM employee;

-- 부서별 급여 총액
SELECT deptno ,sum(sal)
FROM employee
group by deptno;

-- 부서별 급여 소계와 총액
SELECT deptno ,sum(sal)
FROM employee
group by rollup(deptno);

-- 부서별 급여 총액이 500만원 이상인 자료 검색
SELECT deptno ,sum(sal)
FROM employee
group by deptno
HAVING sum(sal) > 5000000;

-- 급여 누적값 계산
-- SUM(칼럼명) over(order by 칼럼명)
select  empno,
        ename,
        sal,
        sum(sal) over(order by empno) sal_sum, --오름차순 누적
        sum(sal) over(order by empno --오름차순 누적(이전행과 현재행 더하기)
            rows between unbounded preceding and current row) sal_sum2,
        sum(sal) over(order by empno --내림 차순 누적(현재행과 다음행 더하기)
            rows between current row and unbounded following) sal_sum3
from employee;


