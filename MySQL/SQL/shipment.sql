create table shipment(
shipment_id int not null primary key auto_increment,
order_id int not null,
 tracking_number VARCHAR(40) unique,
 shipped_date date
);

INSERT INTO shipment(order_id, tracking_number, shipped_date) VALUES
(1,'TRK-001','2024-01-02'),
(2,'TRK-002','2024-01-03'),
(3,'TRK-003','2024-01-04'),
(4,'TRK-004','2024-01-05'),
(5,'TRK-005','2024-01-06'),
(6,'TRK-006','2024-01-07'),
(7,'TRK-007','2024-01-08'),
(8,'TRK-008','2024-01-09'),
(9,'TRK-009','2024-01-10'),
(10,'TRK-010','2024-01-11'),
(11,'TRK-011','2024-01-12'),
(12,'TRK-012','2024-01-13'),
(13,'TRK-013','2024-01-14'),
(14,'TRK-014','2024-01-15'),
(15,'TRK-015','2024-01-16');
