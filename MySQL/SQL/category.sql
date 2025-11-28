create table category(
category_id int not null primary key auto_increment,
category_name varchar(30) not null unique
);

insert into category(category_id, category_name)
values
(6, '간식'),
(8, '공산품'),
(1, '과일'),
(15, '기타'),
(12, '문구류'),
(14, '반려동물용품'),
(7, '생활용품'),
(4, '수산물'),
(13, '스포츠용품'),
(3, '육류'),
(5, '음료'),
(10, '의류'),
(9, '전자제품'),
(11, '주방용품'),
(2, '채소')
;