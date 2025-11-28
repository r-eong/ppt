-- 11/25 부터 예매한 사람의 좌석번호, 타입
select b.b_id as '예매코드', 
concat_ws(' ', b.b_date, r.r_arrival) as '예매일', 
concat_ws(' / ',b.b_seat, p.p_type) as '좌석번호 / 매수'
from booking b
inner join routeinfo r on r.r_id = b.r_id
inner join pessengertype p on p.p_id = b.p_id
where b.b_date >= '2025-11-25';

-- 전주에서 출발해서 인천에 도착하는 버스의 시간표
select d.d_terminal as '출발터미널', 
a.a_terminal as '도착터미널', 
r.r_departure as '출발시간', 
r.r_arrival as '도착시간'
from departure d
inner join routeinfo r on r.d_id = d.d_id
inner join arrival a on a.a_id = r.a_id
where d.d_terminal = '군산' and a.a_terminal = '인천';

-- 운행정보가 없는 예약내역 삭제하기
delete from booking b
where r_id > 51;

-- 관리자가 작성한 글 제목과 글 내용 중'시외'을 포함하고 있는 게시글의 글번호와 글제목, 글내용(앞 20글자만)을 출력하시오.
select n_id as '글번호', n_title as '글제목', substr(n_content, 1, 20) as '글내용' from notice
where  n_title like '%시외%' or n_content like '%시외%' ;


-- 구리에서 공주가는 노선의 승객정보(전화번호, 승객유형, 결제금액) 출력
select b.b_phone as '전화번호', p.p_type as '승객유형', (bt.bt_price + bc.bc_class + p.p_discount) as '결제금액' from routeinfo r
inner join booking b on b.r_id = r.r_id
inner join pessengertype p on p.p_id = b.p_id
inner join busclass bc on bc.bc_id = r.bc_id
inner join bustype bt on bt.bt_id = r.bt_id
where r.a_id = 5 and r.d_id = 33;


-- 운행정보가 없는 예약 내역 삭제하기
delete from booking b
where r_id > 51;
select * from booking;

-- 전체 승객 중 아동 승객 예매 정보 출력
select 
p_type as '승객유형', b_date as '예약일자', 
bt_type as '버스종류', bc_class as '버스등급',
r_date as '운행날짜', d_terminal as '출발터미널', 
a_terminal as '도착터미널', r_departure as '출발시간', 
r_takeTime as '예상소요시간', r_arrival as '예상도착시간', 
(bt.bt_price + bc.bc_class + p.p_discount) as '결제금액'  from booking b
inner join routeinfo r on r.r_id = b.r_id
inner join departure d on d.d_id = r.d_id
inner join arrival a on a.a_id = r.a_id
inner join busclass bc on bc.bc_id = r.bc_id
inner join bustype bt on bt.bt_id = r.bt_id
inner join pessengertype p on p.p_id = b.p_id
where b.p_id = 2;

-- 예매정보 기반 운수사 별 운행횟수
SELECT c.c_id as '운수사코드', c.c_name as '회사명', COUNT(distinct r.r_id) as '운행횟수' FROM booking b
inner join routeinfo r on r.r_id = b.r_id 
inner join company c on r.c_id = c.c_id
group by c.c_id
order by c.c_id;

-- 예매정보 기반 운수사 별 총매출
select c.c_id as '운수사코드', c.c_name as '회사명', sum(bt.bt_price + bc.bc_discount + p.p_discount) as '총 매출액' from routeinfo r
inner join company c on r.c_id = c.c_id
inner join busclass bc on bc.bc_id = r.bc_id
inner join bustype bt on bt.bt_id = r.bt_id
inner join booking b on b.r_id = r.r_id
inner join pessengertype p on b.p_id = p.p_id
group by c.c_id
order by c.c_id;

-- 예매 정보에서 승객유형이 어른인사람 / 총 예매 수   
select concat((truncate((count(*)/85),2)*100),'%')
 as '어른 예매자 비율'from booking b
inner join pessengertype p on b.p_id = p.p_id
where p.p_type ='어른';

-- 예매내역의 승객유형 , 버스유형, 버스등급을 통한 요금 산출
select p.p_type as '승객유형', bt.bt_type as '버스유형', bc.bc_class as '버스등급',
concat(bt_price+p.p_discount+bc.bc_discount,'원') as '요금' from booking b
inner join pessengertype p on b.p_id = p.p_id
inner join routeinfo r on b.r_id = r.r_id
inner join busclass bc on bc.bc_id = r.bc_id
inner join bustype bt on bt.bt_id = r.bt_id;

-- 동서울 -> 동동서울로 수정하여 출력
update arrival
set a_terminal=concat('동',a_terminal)
where a_terminal='동서울';

-- 좌석이 프리미엄인 고객의 전화번호 가운데 4자리만 ****로 수정하여 출력 <select>
select b.b_id, b.b_seat, replace(b_phone,substr(b_phone,5,4),'****'), b.b_birth, r.r_date,bc.bc_class from booking b
inner join routeinfo r on r.r_id = b.r_id
inner join busclass bc on bc.bc_id = r.bc_id 
where bc.bc_class='프리미엄';