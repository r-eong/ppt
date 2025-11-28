-- 1. 비상관서브쿼리(IN)을이용해별점(ratings)이5점인가게들의메뉴목록(menu_name, 
-- price)을 조회하는SQL문을작성하시오.
select menu_name, price from menus 
where fk_business_id in(select fk_business_id from ratings where stars = 5);

select * from ratings;
select * from menus;

-- 2. 비상관서브쿼리(AVG / > )이용해전체메뉴평균칼로리보다(kilocalories) 높은칼로리
-- 메뉴를 조회하는 SQL문을 작성하시오.
select menu_name, kilocalories from menus
where kilocalories > (select avg(kilocalories) from menus);

select * from menus;
select avg(kilocalories) from menus; -- 537.047308

-- 3. 상관서브쿼리(EXISTS)를이용해리뷰가존재하는(ratings 존재) 가게(businesses)의
-- 가게이름과상태(status)를조회하는 SQL문을작성하시오.
select b.business_name, status from businesses b
where exists(select * from ratings r where r.fk_business_id = b.business_id);

select * from businesses;
select * from ratings;

-- 4. 상관서브쿼리(NOT EXISTS)이용해리뷰가하나도없는가게(businesses)의
-- business_name, fk_section_id를 조회하는 SQL문을 작성하시오.
select b.business_name, status from businesses b
where not exists(select * from ratings r where r.fk_business_id = b.business_id);

-- 5. ANY 활용해 동일가게의 메뉴들 중 가장 비싼메뉴 가격보다 비싸지 않은 메뉴를 조회하는 SQL문을 작성하시오.
-- (다시말해, 자기 가게 최고가 메뉴의 가격보다 작거나 같은 메뉴)
select m.menu_name, m.price, m.fk_business_id from menus m
where m.price <= any(select price from menus where fk_business_id = m.fk_business_id);

-- 6. ALL 활용해 모든 메뉴보다 칼로리가 가장 높은 메뉴를 조회하는 SQL문을 작성하시오. (전체 메뉴중 최고 칼로리)
select menu_name, kilocalories from menus 
where kilocalories >= all(select kilocalories from menus);

-- 7. 상관 서브쿼리(가게별인기메뉴) 이용해 각 가게별로 좋아요(likes)가 가장 높은 메뉴
-- 이름과 좋아요수를 조회하는 SQL문을 작성하시오. (가게별 최고 likes)
select fk_business_id, m.menu_name, m.likes from menus m
where m.likes = (select max(likes) from menus where fk_business_id = m.fk_business_id);
-- ┖> group by 를 한 것 같은 효과를 줌!


