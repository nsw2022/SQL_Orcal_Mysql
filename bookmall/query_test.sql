-- 연습문제
SELECT * from customer;
-- 모든 고객의 이름과 주소를 검색하시오
select name,address from customer;

-- 모든 고객의 이름, 주소, 전화번호를 검색하시오
select name,address,phone from customer;

-- 주소가 영국인 고객을 검색하시오
select * from customer where address like '영국%';

-- 고객의 이름이 김연아 혹은 안산인 고객을 검색하시오
select * from customer where name = '김연아' or name = '안산';
select * from customer where name in ('김연아','안산');

-- 주소가 대한민국이 아닌 고객을 검색하시오
select * from customer where address not like '%대한민국%';

--전화번호가 없는 고객을 검색하시오
select * from customer where phone is null;

-- 고객을 이름순으로 정렬하시오
select * from customer ORDER BY name;

-- 고객의 총 인원수를 구하시오
select count(*) 총인원수 from customer;
