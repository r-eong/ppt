-- view 는 협력사의 보안 문제로 인한 가상 테이블을 만드는 것
create view sections_view as
select section_id, section_name
from sections;

select * from sections_view;
select * from sections;
update sections set section_name = '분식' where section_id = 2;
delete from sections where section_id = 2;

start transaction;
rollback;

drop view sections_view;

create view vw_business_info as
select b.business_name, s.section_name, s.floor, b.status
from businesses b
inner join sections s on s.section_id = b.fk_section_id;

select * from vw_business_info;

update vw_business_info set business_name = '화룡각' where business_name = '중국관';

create view vw_popular_menus as
select m.menu_name as '이름', m.price as '가격', m.likes as '좋아요', b.business_name as '가게이름'
from businesses b
inner join menus m on m.fk_business_id = b.business_id
where m.likes >= 10;

select * from vw_popular_menus;

create view vw_business_ratings as
select avg(stars) as '평균별점', count(comment) as '리뷰수', b.business_name as '가게이름'
from businesses b
left join ratings r on r.fk_business_id = b.business_id
group by b.business_name;

select * from vw_business_ratings;
select * from ratings;

-- 제약조건에 걸려서 업데이트 안됨!
update vw_business_ratings set business_name = '팥좋아' where business_name = '파시좋아';

-- view 테이블을 업데이트 할 수는 없지만 원본 테이블은 수정할 수 있음!
select * from businesses;
update businesses set business_name = '팥좋아' where business_id = 14;