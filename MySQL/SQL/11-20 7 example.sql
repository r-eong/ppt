-- 7강 ppt 연습문제

-- 3. green 스키마 안에 <menus>,<businesses> 테이블을 이용하여 아래 조건에 만족하도록 SQL문을 작성하시오.
-- <조건>
	-- 1. <menus>테이블과 <businesses>테이블을 inner Join 한다.
	-- 2. Status가 ‘OPN’인 데이터만 추출한다.
	-- 3. 오른쪽 옆의 <출력 결과>과 같이 출력되도록 작성한다.
select b.business_name, b.status, m.menu_name, m.kilocalories, m.price from menus m
inner join businesses b on b.business_id = m.fk_business_id
where b.status = 'OPN';


-- 4. green 스키마 안에  <sections>,<businesses>,<ratings> 테이블을 이용하여 아래 조건에 만족하도록 SQL문을 작성하시오.
	-- 1. <sections>테이블과 <businesses>테이블, <ratings> 테이블을 inner Join 한다.
	-- 2. Starts는 Repeat(‘반복할 문자’, 반복할 숫자)함수를 이용하여 ‘★＇을 starts 의 입력된 숫자만큼 반복하여 출력한다. 
	-- 3. 아래의  <출력 결과>과 같이 출력되도록 작성한다.
select s.section_name, b.business_name, Repeat('★', r.stars) as stars, r.comment, r.created from businesses b
inner join sections s on s.section_id = b.fk_section_id
inner join ratings r on r.fk_business_id = b.business_id;

-- ---------------------------------------------------------------------------------------------------

-- 총 복습문제 ppt

-- 1. 메뉴(menu_name)와 음식점 이름을 '가게명 - 메뉴명' 형태로 출력하시오. (INNER JOIN + CONCAT_WS)
select concat_ws(' - ', b.business_name, m.menu_name) from businesses b
inner join menus m on m.fk_business_id = b.business_id;

-- 2. 카페·디저트(섹션 floor=1)에 있는 메뉴만 찾고, 메뉴명 첫 3글자만 잘라서 보여라. (SUBSTR + INNER JOIN)
select substr(m.menu_name, 1, 3) from businesses b
inner join menus m on m.fk_business_id = b.business_id
inner join sections s on s.section_id = b.fk_section_id
where s.floor = 1;

-- 3. 메뉴명 글자수와 바이트 수를 함께 출력하고 음식점 이름과 JOIN하시오. (CHAR_LENGTH, LENGTH)
select char_length(m.menu_name), length(m.menu_name) from businesses b
inner join menus m on m.fk_business_id = b.business_id;

-- 4. 메뉴 가격이 8000원 이상인 가게의 가게명과 섹션명, 가격을 출력하시오. (INNER JOIN)
select b.business_name as '가게명', s.section_name as '섹션명', m.price as '가격' from businesses b
inner join menus m on m.fk_business_id = b.business_id
inner join sections s on s.section_id = b.fk_section_id
where m.price >= 8000;

-- 5. 휴업(CLS) 또는 정비중(RMD)인 가게의 가게명과 섹션명 출력하시오. (JOIN + 조건)
select b.business_name as '가게명', s.section_name as '섹션명' from businesses b
inner join sections s on s.section_id = b.fk_section_id
where b.status in('CLS' ,'RMD');

-- 6. 모든 가게를 기준으로 LEFT JOIN하여 메뉴가 없는 가게도 표시하시오. (LEFT JOIN)
select b.business_name, m.menu_name from businesses b
left join menus m on m.fk_business_id = b.business_id;

-- 7. 모든 메뉴를 기준으로 RIGHT JOIN하여 가게가 삭제된 경우도 표시하시오. (RIGHT JOIN)
select b.business_name as '가게명', m.menu_name as '메뉴명'  from businesses b
right join menus m on m.fk_business_id = b.business_id;

-- 8. 모든 리뷰(ratings)를 읽고, 리뷰 댓글(comment)에 '맛'이라는 단어가 포함된 경우의 가게명과 함께 출력하시오. (JOIN + INSTR)
select b.business_name, r.comment from businesses b
inner join ratings r on r.fk_business_id = b.business_id
where instr(r.comment, '맛') > 0;

-- 9. 메뉴 이름에 ‘김’이 포함된 경우, 가게 이름과 함께 아래 <출력결과>처럼 출력되도록 SQL문을 작성하시오.
select b.business_name, m.menu_name from businesses b
inner join menus m on m.fk_business_id = b.business_id
where instr(m.menu_name, '김');

-- 10. 음식점 이름 마지막 2글자 + 해당 가게 층이  아래 <출력결과>처럼 출력되도록 SQL문을 작성하시오
-- select substr(b.business_name, -2), s.floor from businesses b
-- 위 아래 같은 결과나옴! 
select right(b.business_name, 2), s.floor from businesses b
inner join sections s on s.section_id = b.fk_section_id;

-- 11. 메뉴 가격 8000 이상, 메뉴명 + 가격 ‘₩’ 붙여서 출력 아래 <출력결과>처럼 출력되도록 SQL문을 작성하시오.
select m.menu_name, lpad(m.price, '₩') from businesses b
inner join menus m on m.fk_business_id = b.business_id
where m.price >= 8000;

-- 12. 리뷰 댓글 글자 수 10 이상인 경우, 가게 이름과 함께 출력 ,아래 <출력결과>처럼 출력되도록 SQL문을 작성하시오.
select b.business_name as '가게명', r.comment as '후기' from businesses b
inner join ratings r on r.fk_business_id = b.business_id
where char_length(replace(r.comment,' ', '')) >= 10;

-- 13. 메뉴 이름 앞 글자가 ‘치’로 시작하는 메뉴 + 가게 이름,아래 <출력결과>처럼 출력되도록 SQL문을 작성하시오.
select b.business_name, m.menu_name from businesses b
inner join menus m on m.fk_business_id = b.business_id
where substr(m.menu_name, 1, 1) = '치';
-- where instr(m.menu_name, 1) = '치';
-- where left(m.menu_name, '치') = 1;
-- where m.menu_name like '치';

-- 14. 음식점 상태 ‘CLS’→‘Closed’, ‘OPN’→‘Open’로 변환 ,아래 <출력결과>처럼 출력되도록 SQL문을 작성하시오.
-- replace 안에 replace를 여러번 쓸 수 있음!
select business_name, replace(replace(status, 'CLS', 'Closed'), 'OPN', 'Open') from businesses;