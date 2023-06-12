-- 은행 DB 만들기
CREATE TABLE account(
    ano VARCHAR2(10) PRIMARY KEY,
    owner VARCHAR2(20) NOT NULL,
    balance NUMBER(10) NOT NULL
);

INSERT INTO account VALUES('1111','노승우',10000);

COMMENT;

SELECT * FROM account;

drop table account;
