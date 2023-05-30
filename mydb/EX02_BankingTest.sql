create table test_bank(
    ano NUMBER PRIMARY KEY,
    owner VARCHAR2(15) NOT NULL,
    balance NUMBER NOT NULL
);



INSERT INTO test_bank VALUES(1234,'테스터',1000);

select * from test_bank;