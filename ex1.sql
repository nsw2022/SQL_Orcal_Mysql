-- 문자 자료형의 비교
CREATE TABLE ex1(
    column1 CHAR(10),      -- 고정길이 자료형
    column2 VARCHAR2(10)   -- 가변길이 자료형
);

-- 자료 추가
insert into ex1(column1, column2) VALUES ('abc','abc');
insert into ex1 VALUES ('강남역','강남');


-- 자료 조회
select column1, length(column1) len1,column2, length(column2) len2 from ex1;
commit;

