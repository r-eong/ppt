select current_date(), date(now()), time(now()), date('2025-11-20'), time('12:08:00');

-- greendb 스키마안의 <orders> 테이블의 order_date의 날짜가 
-- 2024-01-7 ~ 2024-01-09 사이의 모든 데이터가 출력되도록 SQL문을 작성하여 아래 화면과 같은 결과를 도출하세요  
-- (단, DATE, BETWEEN ~ AND 함수를 이용)
select * from orders
where order_date between date('2024-01-07') and date('2024-01-09');

select order_date, year(order_date), month(order_date), day(order_date) from orders;

 -- <orders> 테이블의 order_date의 날짜 형식을 ‘년/월/일 요일(영문)’의 형식으로 
-- 변경하여 NewDate필드를 아래 출력 결과 화면과 같이 출력되도록 SQL문을 작성 하시오.
-- (단, YEAR, MONTH, DAY, DAYNAME,CONCAT, CONCAT_WS, UPPER, LEFT 함수를 모두이용)
select order_id, concat(concat_ws('/', year(order_date), month(order_date), day(order_date)), ' ', left(upper(dayname(order_date)),3)) as NewDate from orders;

-- adddate(날짜, 차이) : 날짜를 기준으로 차이를 더하거나 뺸 날짜를 구한다
select adddate('2025-11-01', interval 1 year);
select adddate('2025-11-01', interval -1 year);

-- detediff(날짜1, 날짜2) : 반드시 날짜1 - 날짜2
-- 날짜 1이 날짜2 보다 이전이면 음수, 이후면 양수
select shipment_id, tracking_number, datediff(shipped_date, current_date()) as '오늘까지의 일수' from shipment;

-- last_day(날짜) : 이 날짜의 월의 마지막 일을 출력
select order_id, last_day(shipped_date) from shipment;

-- 기본 if
-- if(조건식, true, false)
-- 다중 if
-- if(조건식1, true, if(조건식2, true, if(조건식3, true, false)))
-- else if 는 존재하지않음
-- 물냉면이면 맛좋다, 아메리카노면 맛없어, 둘 다 아니면 나도몰라
select menu_name, if(menu_name = '물냉면', '맛좋다', if(menu_name = '아메리카노', '맛없어', '나도몰라')) as '맛평가' from menus;

-- case 변수
-- 		when 조건1 then 결과1
-- 		when 조건2 then 결과2
-- 		when 조건3 then 결과3
-- 		else 그 이외의 결과 값
-- end
-- if문과 switch ~ case문을 섞어 놓은 것 같은 느낌의 함수
select business_name as '가게명',
case status
	 when 'OPN' then '운영중'
	 when 'RMD' then '휴무'
	 when 'CLS' then '폐업'
     else '점검중'
end as '영업 상태'
from businesses;

-- greendb 스키마안의 < businesses > 테이블의 status, can_takeout을 이용해 
-- 다음 조건을 모두 적용하여 가게 상태를 표시하시오.
-- (단, CASE, IF 문을 이용)
select business_name, status, can_takeout,
case
	 when status = 'OPN' and can_takeout = 1 then '정상영업 + 포장가능'
	 when status = 'OPN' and can_takeout = 0 then '정상영업 + 포장불가'
	 when status = 'CLS' then '폐업'
     else '기타'
end as business_condition
from businesses;

-- ----------------------------------------------------------------------------

-- 1. greendb 스키마안의 menus 테이블에서 칼로리(kilocalories)가 500 이상이면 '고칼로리', 300 이상 이면
-- '중칼로리', 그 외는 '저칼로리'라고 표시하여 메뉴 이름과 함께 출력되록 SQL문을 작성하시오.
-- (단, if문 사용)
select menu_name, 
if(kilocalories >= 500, '고칼로리', if(kilocalories >= 300, '중칼로리', '저칼로리')) as calories_level 
from menus;

-- 2. greendb 스키마안의 모든 메뉴(menus)에 대해, 가격(price)에 따라 아래 조건으로 메뉴의 
-- 가격 등급을 표시되도록 SQL문을 작성하시오. 가격이 5,000원 미만이면 → '저가’
-- 5,000 ~ 9,999원이면 → '중간' 10,000원 이상이면 → '고가'
--  (단, CASE WHEN 사용)
select menu_name, price,
case
	 when price < 5000 then '저가'
	 when 5000 <= price <= 9999 then '중간'
     else '고가'
end as price_grade
from menus;


