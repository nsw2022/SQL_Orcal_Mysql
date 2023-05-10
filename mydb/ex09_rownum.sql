-- ROWNUM : 순번을 정해놓은 SUDO COLUMN
-- 조회되는 행의 수를 제한
SELECT ROWNUM, bno, title, writer, content 
FROM board
WHERE ROWNUM > 0 AND ROWNUM <= 10
--WHERE ROWNUM > 10 AND ROWNUM <= 20 1을 포함해야 조회됨
ORDER BY bno;

-- 11 ~ 20 검색하고 싶으면 서브쿼리로 만들어야함
SELECT * FROM 
(SELECT ROWNUM RN, bno, title, writer, content 
    FROM board)
WHERE RN > 10 AND RN <= 20; -- 별칭(RN)을 사용해야함

-- ROWNUM의 올바른 사용
CREATE TABLE EX_SCORE(
    NAME    VARCHAR2(10),
    SCORE   NUMBER
);

INSERT INTO ex_score VALUES('김하나', 94);
INSERT INTO ex_score VALUES('이하나', 100);
INSERT INTO ex_score VALUES('박하나', 97);
INSERT INTO ex_score VALUES('정하나', 87);
INSERT INTO ex_score VALUES('조하나', 87);
INSERT INTO ex_score VALUES('안하나', 91);
INSERT INTO ex_score VALUES('유하나', 66);
INSERT INTO ex_score VALUES('오하나', 80);
INSERT INTO ex_score VALUES('한하나', 80);
INSERT INTO ex_score VALUES('성하나', 95);

select * from ex_score;

-- 점수가 높은 순으로 5명 검색 (잘못된 사용)
SELECT rownum, name, score
from ex_score
where rownum <= 5
ORDER by score desc;


-- 이거도 올바르지 않은 사용
select rownum, name, score from
ex_score
where rownum <= 5
ORDER by score desc;

-- 올바른사용(서브 쿼리-인라인 뷰) 
select rownum, name, score from
    (SELECT rownum, name, score
    from ex_score
    ORDER by score desc)
where rownum <= 5;
-- 위순서로 쿼리문이 진행 
--FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY


-- 성적 순위 rank 공동일경우 다음숫자 뺌 
--         dense_rank() 공동일경우다음숫자안뺌
select name,
       score,
--    count(*) 학생수 단일 그룹 함수가 아님
       Rank() over(order by score desc) rank,
       dense_rank() over(order by score desc) 공동넣음

from ex_score;





