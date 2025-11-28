create table product(
product_id int not null primary key auto_increment,
product_name VARCHAR(50) not null,
price int ,
stock int not null,
category_id int not null
);

insert into product(product_name, price, stock, category_id)
values
('사과 1kg', 4500, 120, 1),
('배 1kg',5500 , 90, 1),
('당근 1kg', 2500, 80, 2),
('브로콜리 1송이', 1800, 70, 2),
('돼지고기 삼겹살 1kg', 14500, 60, 3),
('소고기 등심 500g', 22000, 40, 3),
('고등어 1마리', 3000, 50, 4),
('오징어 1마리', 2500, 70, 4),
('콜라 1.5L', 2100, 100, 5),
('사이다 1.5L', 2000, 100, 5),
('초코파이 12개입', 4500, 150, 6),
('감자칩 오리지널', 2500, 130, 6),
('주방세게 1L', 3500, 90, 7),
('휴지 30롤', 14000, 40, 7),
('볼펜 3개 세트', 1500, 200, 12)
;