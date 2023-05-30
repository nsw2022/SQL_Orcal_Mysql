-- java 연동 테이블

CREATE TABLE person(
    userId      VARCHAR2(10) PRIMARY KEY,
    userpw      VARCHAR2(10) NOT NULL,
    name        VARCHAR2(20) NOT NULL,
    age         NUMBER
);

INSERT INTO person VALUES('clould','cloud123','구름이',120);
INSERT INTO person VALUES('today','today123','투데이',5);
commit;

SELECT * FROM person;