select * from people;
drop table people;

create table people(
person_id int auto_increment primary key, -- 아이디 / 자동 1씩 증가, 기본 키(PK)
person_name varchar(10) not null, -- 이름 / 공백 입력 불가
age tinyint unsigned, -- 나이 / 음수 입력불가
birthday date default (current_date()) -- 생년월일 / 오늘 날짜 자동입력
);

-- 데이터 삽입하기
-- insert into 테이블이름(각 필드명) values(각 값);
insert into people(person_name, age, birthday) 
values
('홍길동', 15, '2005-10-05'),
('개나리', 20, '2005-10-05'),
('진달래', 1, default)
;