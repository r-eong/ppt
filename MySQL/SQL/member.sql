drop table member;

create table member(
user_id varchar(20) primary key not null unique, -- 아이디 / 무조건 기본 키 지정(PK)
user_pw varchar(20) not null, -- 비밀번호
user_name varchar(10) not null, -- 이름 
Reg_date date default (current_date()) -- 가입일
);

insert into member(user_id, user_pw, user_name, Reg_date)
values
('gun1234', 'g1234', '안경', '1994-12-08'),
('H1031', '1208', '할로', '1994-10-31'),
('apple1234', 'a1234', '사과', '2000-12-10')
;