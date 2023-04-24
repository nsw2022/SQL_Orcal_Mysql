-- tcl_test 테스트 테이블
CREATE TABLE tcl_test(
    c1 NUMBER(2),
    c2 NUMBER(3)
);

SAVEPOINT t1; -- 저장점 실행
INSERT INTO tcl_test VALUES(10, 100);

SAVEPOINT t2; -- 저장점 실행
INSERT INTO tcl_test VALUES(20, 200);

ROLLBACK TO t2; -- t2로 롤백

SELECT * FROM tcl_test;

COMMIT; -- 커밋완료

DROP TABLE tcl_test;