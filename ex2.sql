-- 날짜 자료형
create table ex2(
    col_date DATE,
    col_timestamp TIMESTAMP
);

-- 자료 삽입
INSERT INTO ex2 VALUES (sysdate, systimestamp);
INSERT INTO ex2 VALUES (sysdate, systimestamp);

-- 자료 검색
select * from ex2;