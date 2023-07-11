-- bookmall 관련 테이블
select * from book;
select * from customer;
select * from orders;
desc orders;
-- update orders set orderdate = TO_DATE(2018-07-01) where orderid=1;

-- 고객별, 도서별 총판매액 계산
select custid,
       bookid,
       sum(saleprice) 총판매액
from orders
group by custid, bookid;

-- rollup(), cube()
-- rollup()
select custid,
       bookid,
       sum(saleprice) 총판매액
from orders
group by ROLLUP(custid, bookid)
order by custid;

-- cube()
select custid,
       bookid,
       sum(saleprice) 총판매액
from orders
group by cube(custid, bookid)
order by custid;

-- grouping sets() : 고객별, 도서별, 소계
select custid,
       bookid,
       sum(saleprice) 총판매액
from orders
group by grouping sets(custid, bookid)
order by custid, bookid;
