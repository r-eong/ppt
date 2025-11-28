-- 비상관 쿼리 : 외부와 내부 쿼리가 상관없다
-- 비상관 쿼리는 내부 쿼리가 우선실행된다
select business_id, business_name, status, 
	(select menu_name from menus where likes = 32) as '비상관커리'
from businesses;

select menu_name from menus where likes = 32;

select avg(price) from menus;  -- <- '7173.0769'
select * from menus where price < (select avg(price) from menus);

-- <menus>테이블과 <businesses>테이블을 이용해 전체 메뉴 중 status가 ‘OPN’
-- 인가장높은likes 값을 가진 메뉴이름을조회하는필드명을아래의<출력결과>와같이출력되도록SQL문을작성하시오.
-- (단, 비상관 서브쿼리(select~where) 이용)
select business_name, status, (select max(likes) from menus) as max_likes
from businesses
where status = 'OPN';

-- in을 이용한 비상관 쿼리
select menu_name, kilocalories, price, fk_business_id 
from menus
where fk_business_id in(select business_id from businesses where can_takeout = 0);

select business_id from businesses where can_takeout = 0;

-- all : 서브쿼리의 모든 결과에 대해 일치하면 true(참)
select * from menus where price > all(select price from menus where likes >= 10);
-- 1500 5000 9000 11000 12000 -> 결론은 max(price)
select price from menus where likes >= 10;

-- any : 서브쿼리의 하나라도 만족하는 결과에 대해 true(참)
select menu_name, kilocalories, price from menus
where fk_business_id = any(select business_id from businesses where status = 'OPN');
-- 1 2 4 5 6 8 9 10 11 14 16 17
select business_id from businesses where status = 'OPN';

--  <menus>테이블, <businesses> 테이블, <sections>테이블을 이용해 메뉴 가격이
-- 분식메뉴가격보다모두낮은메뉴이름과가격을조회하는 SQL문을아래의 <출력결과>와같이출력되도록작성하시오.
-- (단, 비상관 서브쿼리(select~where), ~ALL, JOIN 이용)
select menu_name, price from menus 
where price < all(
select price from menus m 
inner join businesses b on b.business_id = m.fk_business_id
inner join sections s on s.section_id = b.fk_section_id
where s.section_name = '분식');

select price from menus m 
inner join businesses b on b.business_id = m.fk_business_id
inner join sections s on s.section_id = b.fk_section_id
where s.section_name = '분식';

-- ------------------------------------------------------------------------------------

-- 상관쿼리 : 내부 쿼리의 값이 결정되는데 외부 쿼리에 의존
-- 예를들어, 외부 쿼리 m.fk_business_id 값이 있어야 내부 쿼리가 수행된다
select menu_name, kilocalories, (
select business_name from businesses b where b.business_id = m.fk_business_id
)
from menus m;
-- 상관쿼리는 안의 select 문의 따로 싱행되지 않음!
select business_name from businesses b where b.business_id = m.fk_business_id;

-- exists : 조건을 만족하는 데이터가 존재하면 true
-- 2 16 14 5 11 9 16
select * from  ratings;
-- 5 8 17 6 15 17 9 16 6 16 14 1 9 5 10 2 11 2 11 2 15 4 10 1 11 4 8 14
select * from  menus;
-- ratings 와 menus 에서 겹치는 id : 2 16 14 5 11 9 
-- ↓↑ business_id 가 겹치는 부분만 출력
select menu_name, price, fk_business_id from menus m 
where exists(select * from  ratings r where r.fk_business_id = m.fk_business_id);








