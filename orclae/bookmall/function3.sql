select * from emp;
desc emp;
-- NVL(인수1, 인수2) : 인수1이 null이 아니면 인수1 출력 만약 null이면 인수2 출력
-- 급여가 없는 사원을 검색하세요.
select * from emp where sal is null;

select ename,
       NVL(sal, 0)
from emp;

-- 성별 자료 변경
update emp set gender='여자' where empno=100 OR empno = 101;
update emp set gender='남자' where empno=102 OR empno = 103;

--DECODE(칼럼, 조건식, 참, 거짓) 함수 - IF함수와 유사
-- Male, FeMale
select ename,
       sal,
       decode(gender, '남자' ,'M','F') gender
from emp;
-- 오라클 decode 안에서는 like 함수를 쓸수없다 
-- 간단한 값비교에만 쓸수있다고한다
-- case when이라는 친구로 테스트 해보자(이친구는 된다)
/*
    case
        when 조건1 then 결과1
        when 조건2 then 결과2
        else 결과 3 
    end
*/
select ename,
       sal,
       case
        when gender like '남%' then 'M'
        else 'F'
       end gender
from emp;

-- 급여가 350만원 이상이면 직급을 '과장'로 표시하고,
-- 급여가 250만원 이상이면 직급을 '과장으로 표시 나머지는 사원
select ename,
       sal,
       case
         when sal >= 3500000 then '과장' 
         when sal >= 2500000 then '대리'
         else '사원'
        end 급여기준
from emp;

-- decode()로 작성 불가능 sign으로 가능하다함 gpt가 후에 공부 필요
SELECT ename, sal,
       DECODE(SIGN(sal-3500000), 1, '과장', 
              DECODE(SIGN(sal-2500000), 1, '대리', '사원')
             ) AS 급여기준
FROM emp;
