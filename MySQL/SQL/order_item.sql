create table order_item(
item_id int not null primary key auto_increment,
order_id int not null,
product_id int not null,
quantity int
);
INSERT INTO order_item(order_id, product_id, quantity) VALUES
(1, 1, 2),
(2, 3, 1),
(3, 5, 3),
(4, 2, 1),
(5, 4, 2),
(6, 6, 1),
(7, 8, 4),
(8, 7, 2),
(9, 9, 1),
(10,10,3),
(11,11,2),
(12,12,5),
(13,13,1),
(14,14,2),
(15,15,1);