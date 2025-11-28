drop table orders;

create table orders(
order_id int not null primary key auto_increment, 
customer_id int not null, 
order_date date not null, 
status varchar(20)
);

INSERT INTO orders(customer_id, order_date, status) 
values
(1,'2024-01-01','주문완료'),
(2,'2024-01-02','배송중'),
(3,'2024-01-03','주문완료'),
(4,'2024-01-04','배송완료'),
(5,'2024-01-05','주문완료'),
(6,'2024-01-06','배송중'),
(7,'2024-01-07','주문완료'),
(8,'2024-01-08','배송완료'),
(9,'2024-01-09','주문완료'),
(10,'2024-01-10','배송중'),
(11,'2024-01-11','주문완료'),
(12,'2024-01-12','배송완료'),
(13,'2024-01-13','주문완료'),
(14,'2024-01-14','주문완료'),
(15,'2024-01-15','배송중')
;