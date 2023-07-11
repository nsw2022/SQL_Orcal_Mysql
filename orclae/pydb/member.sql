--member 테이블
CREATE TABLE member(
	memberid	TEXT PRIMARY KEY,
	password	TEXT NOT NULL,
	name		TEXT NOT NULL,
	gender		TEXT,
	regdate		datetime DEFAULT(datetime('now','localtime'))
);
SELECT * from member;


-- 회원 추가
INSERT INTO member(memberid, password, name, gender) 
VALUES('cloul123','m123456#','장그레','남');

INSERT INTO member(memberid, password, name, gender) 
VALUES('cloul345','m123456#','오대리','여');

DELETE FROM member ;