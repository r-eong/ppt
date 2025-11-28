-- 1) 주문이 ‘주문완료’ 상태인 고객 이름과 주문 날짜를 출력하라.
-- (customer INNER JOIN orders)
select c.user_name, o.order_date from orders as o 
inner join customer c on o.customer_id = c.customer_id 
where o.status = '주문완료';


-- 2) ‘배송완료’ 상태의 주문에 대해 고객 이름과 배송완료 날짜를 출력하라  
-- (orders INNER JOIN customer)
select c.user_name, o.order_date from orders o
inner join customer c on o.customer_id = c.customer_id
where o.status = '배송완료' ;


-- 3) 주문상품(order_item)을 기준으로 어떤 고객이 어떤 상품을 주문했는지 고객명, 상품명, 수량을 출력하라.
-- (orders → order_item → product → customer)
select c.user_name, p.product_name, oi.quantity from order_item oi
inner join orders o on o.order_id = oi.order_id
inner join product p on oi.product_id = p.product_id
inner join customer c on c.customer_id = o.customer_id;

-- 4) 상품 카테고리별로 주문된 상품명과 카테고리명을 출력하라.
-- (product ↔ category INNER JOIN order_item)
select p.product_name, c.category_name from product p
inner join category c on p.category_id = c.category_id
inner join order_item oi on oi.product_id = p.product_id;

-- 5) 배송(shipment)이 등록된 주문들만 가져와 주문번호, 고객명, 운송장 번호를 출력하라.
-- (orders INNER JOIN shipment INNER JOIN customer)
select o.order_id, c.user_name, s.tracking_number from shipment s
inner join orders o on o.order_id = s.order_id
inner join customer c on c.customer_id = o.customer_id;

-- 6) 서울(city = '서울')에 사는 고객이 구매한 상품명과 구매 수량을 출력하라.
select p.product_name, oi.quantity from order_item oi
inner join product p on oi.product_id = p.product_id
inner join orders o on o.order_id = oi.order_id
inner join address a on a.customer_id = o.customer_id
-- inner join customer c on o.customer_id = c.customer_id
where a.city = '서울';

-- 7) 재고(stock)가 50 이상인 상품 중 주문된 상품들의 상품명과 주문한 고객명을 출력하라.
select p.product_name, c.user_name from product p
inner join order_item oi on p.product_id = oi.product_id
inner join orders o on o.order_id = oi.order_id
inner join customer c on c.customer_id = o.customer_id
where p.stock >= 50;

-- 8) 주문 날짜가 ‘2024-01-05’ 이전인 주문들의 고객명과 주문한 상품명을 출력하라.
select c.user_name, p.product_name from order_item oi
inner join product p on oi.product_id = p.product_id
inner join orders o on o.order_id = oi.order_id
inner join customer c on c.customer_id = o.customer_id
where o.order_date <= '2024-01-15';

-- 9) ‘육류’ 카테고리(category_name='육류') 상품을 주문한 고객명과 주문 날짜를 출력하라.
select ct.user_name, o.order_date from product p
inner join category cg on cg.category_id = p.category_id
inner join order_item oi on oi.product_id = p.product_id
inner join orders o on o.order_id = oi.order_id
inner join customer ct on ct.customer_id = o.customer_id
where cg.category_name = '육류';

-- 10) 특정 도시별(city)로 어떤 상품이 가장 많이 주문되었는지 도시명, 상품명, 주문량을 출력하라.
select * from product p
inner join order_item oi on oi.product_id = p.product_id
inner join orders o on o.order_id = oi.order_id
inner join address a on a.customer_id = o.customer_id
group by a.city limit 1;

-- 11)카테고리별(category)로 판매된 상품명을 카테고리명과 함께 출력하라.


-- 12) 운송장 번호가 'TRK-010'인 주문의 고객명과 주문한 상품명을 출력하라.
select s.tracking_number, c.user_name, p.product_name from orders o
inner join shipment s on s.order_id = o.order_id
inner join customer c on c.customer_id = o.customer_id
inner join order_item oi on oi.order_id = o.order_id
inner join product p on p.product_id = oi.product_id
where s.tracking_number = 'TRK-010';

-- 13) ‘배송중’ 상태의 주문들의 고객명, 상품명, 수량을 출력하라.
select o.status, c.user_name, p.product_name, oi.quantity from orders o
inner join order_item oi on oi.order_id = o.order_id
inner join customer c on c.customer_id = o.customer_id
inner join product p on p.product_id = oi.product_id
where o.status = '배송중';

-- 14)고객 주소(city, district)를 포함하여 어떤 고객이 어떤 상품을 주문했는지 출력하라.
select c.user_name, a.city, a.district, p.product_name from orders o
inner join order_item oi on oi.order_id = o.order_id
inner join product p on p.product_id = oi.product_id
inner join customer c on c.customer_id = o.customer_id
inner join address a on a.customer_id = c.customer_id;

-- 15)‘음료’(category_name='음료')을 주문한 고객의 이름과 상품명을 출력하라.
select ct.user_name, p.product_name from orders o
inner join order_item oi on oi.order_id = o.order_id
inner join product p on p.product_id = oi.product_id
inner join customer ct on ct.customer_id = o.customer_id
inner join category cg on cg.category_id = p.category_id
where cg.category_name = '음료';

-- 16)주문 금액(상품가격 × 수량)을 계산하여 고객명, 상품명, 총금액을 출력하라.
-- (product.price × order_item.quantity)
select (p.price * oi.quantity) as '총 주문금액', c.user_name, p.product_name from orders o
inner join order_item oi on oi.order_id = o.order_id
inner join product p on p.product_id = oi.product_id
inner join customer c on c.customer_id = o.customer_id;