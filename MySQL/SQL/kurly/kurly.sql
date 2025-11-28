-- 회원테이블
create table member (
m_id varchar(20) primary key, -- 자연사 코드
m_pw varchar(20) not null,
m_name varchar(20) not null,
m_phoneNum varchar(20) not null,
m_email varchar(30) not null,
m_address varchar(50) not null,
m_gender tinyint unsigned default 0 not null, 
m_birthday date 
);

insert into member (m_id,m_pw,m_name,m_phoneNum,m_email,m_address,m_gender,m_birthday)
values
('admin','admin1234','관리자','1644-1107','help@kurlycorp.com','서울시 강남구 테혜란로',2,'1990-01-21'),
('kkk','123','홍길동','010-1234-5678','kkk@naver.com','경기도 부천시 중동',1,'1990-10-21'),
('aaa','456','개나리','010-2222-5678','aaa@naver.com','서울시 관악구 신림동',2,'1995-06-20'),
('bbb','789','진달래','010-3333-5678','bbb@naver.com','경기도 부천시 약대동',2,'1980-07-15'),
('ccc','567','김백합','010-8888-5678','ccc@naver.com','인천광역시 부평구 부평동',2,'2000-11-08'),
('ddd','345','박디비','010-9999-5678','ddd@naver.com','서울시 종로구 효제동',1,'1983-05-23');

-- 대분류 테이블
create table category(
c_id int auto_increment primary key,
c_name varchar(20) not null
);

insert into category(c_name)
values 
('채소'),
('과일/견과/쌀'),
('수산/해산/건어물'),
('정육/가공육/달걀'),
('국/반찬/메인요리');

-- 소분류 테이블
create table subcategory (
s_id int auto_increment primary key,
s_name varchar(20) not null,
c_id int not null,
foreign key(c_id) references category(c_id) -- 외래키 지정
);
-- foreign key(c_id) <- 자식테이블의 FK referencescategory(c_id) <- 부모테이블의 이름 (부모테이블 PK)
-- category 부모테이블의 c_id(PK)를 참조해서 자식인 sucategory에서 c_id 를 외래키(FK)로 지정한다는 뜻

insert into subcategory(s_name,c_id)
values
('친환경',1),
('고구마/감자/당근',1),
('시금치/쌈채소/나물',1),
('제철과일',2),
('국산과일',2),
('친환경',2),
('제철수산',3),
('생선류',3),
('굴비/반건류',3),
('국내산소고기',4),
('수입산소고기',4),
('국내산돼지고기',4),
('국/탕/찌개',5),
('밑반찬',5),
('김치/젓갈/장류',5);

-- 상품테이블
create table product (
p_id int auto_increment primary key,
p_name varchar(30) not null,
p_img varchar(10) not null,
p_price int default 0,
p_coment varchar(50),
p_discount decimal(3,2) default null,
s_id int not null,
foreign key(s_id) references subcategory(s_id) -- 외래키 지정
);

insert into product(p_name,p_img,p_price,p_coment,p_discount,s_id)
values
('영광 친환경 꿀고구마','1.jpg',10900,'포실포실 달콤한 꿀 고구마를 무농약으로 줄기세요',0.10,1),
('친환경 양파','2.jpg',4290,'최대혜택으로 줄기세요',null,1),  
('제주 흙당근','3.jpg',5500,'제주도에서 자란 영양 가득 채소',0.08,2), 
('감자','4.jpg',12900,'푸짐하게 즐기는 파근파근한 감자',null,2),  
('청경채','5.jpg',2590,'아삭함과 부드러움을 동시에 지닌',0.20,3), 
('다다기오이','6.jpg',3490,'믿고 먹을 수 있는 상품을 합리적인 가격에, KF365',null,4), 
('성주 꼬마 참외','7.jpg',7700,'아담한 크기에 꽉 찬 달콤함',null,5), 
('청송 사과','8.jpg',11900,'사과의 유명산지 청송에서 온 새콤달콤한 선물',0.15,5),
('친환경 블루베리','9.jpg',13900,'톡톡 터지는 살콤달콤함',null,6),
('페루산 아보카드','10.jpg',1995,'잔류농약 안전사항 참고 부탁드립니다.',null,7),
('도다리 세꼬시','11.jpg',11300,'뼈째 즐기는 도다리',0.05,8),
('제주 통갈치','12.jpg',30900,'청청 제주에서 온 은갈치',null,9),
('프리미엄 영광굴비','13.jpg',7500,'고소하고 부드러운 굴비의 참맛',null,10),
('한우 국거리','14.jpg',12665,'1g당 가격이 4,225원',null,11),
('호주산 목초육 안심스테이크','15.jpg',17175,'100g당 가격이 9,165원',null,12),
('한돈 급랭 목살','16.jpg',15540,'100g당 가격이 2,590원',null,12),
('[사마헌]갈비탕','18.jpg',13000,'진짜 칼비로 우려낸 전통 갈비탕',null,13),
('[마마리]들깨미역국','19.jpg',4900,'최소 구매 수량2개(9,800원)',null,14);

-- 장바구니 테이블
create table cart (
cart_id int auto_increment primary key,
cart_quantity int, -- 주문수량
p_id int not null,
m_id varchar(20) not null , -- 회원아이디
foreign key(p_id) references product(p_id),  -- 외래키 지정
foreign key(m_id) references member(m_id) -- 외래키 지정
);

insert into cart(cart_quantity,p_id,m_id)
values
(2,1,'aaa'),
(1,3,'aaa'),
(1,3,'bbb'),
(2,5,'bbb'),
(1,12,'ccc'),
(3,5,'ccc'),
(1,14,'ddd'),
(3,3,'ddd'),
(2,17,'kkk'),
(1,18,'kkk');

-- 1:1문의 게시판 테이블
create table board (
b_id int auto_increment primary key,
b_title varchar(40),
b_content text,
b_author varchar(20),
b_date date default (current_date),
m_id varchar(20),
foreign key(m_id) references member(m_id) -- 외래키 지정
);

insert into board(b_title,b_content,b_author,b_date,m_id)
values
('반품','어제 구매한 물건인데 반품언쩨까지 해야하나요?','개나리','2025-5-02','aaa'),
('적립금','적립금은 얼마이고 언제 사용할 수 있나요?','진달래','2025-3-02','bbb'),
('상품','어제 구매한 상품인데 생각보다 별로네요','김백합','2025-4-02','ccc'),
('주문','주문시 자꾸 오류가 뜨네요?','박디비',ifnull(null,current_date),'ddd'),
('쿠폰','현재 나의 쿠폰현황을 확인 방법 알고 싶습니다.','홍길동','2025-5-10','kkk');

-- 주문 테이블
create table orders(
o_id int primary key auto_increment,
o_date date default (current_date),
o_quantity tinyint default 1,
m_id varchar(20) not null, -- 회원 아이디
p_id int not null,
foreign key(m_id) references member(m_id), -- 외래키 지정
foreign key(p_id) references product(p_id) -- 외래키 지정
);

insert into orders(o_date,o_quantity,m_id,p_id)
values
('2025-5-10',1,'aaa',3),
(ifnull(null,current_date),2,'bbb',5),
('2025-3-21',3,'bbb',7),
(ifnull(null,current_date),4,'ccc',7),
('2025-5-15',5,'ddd',5),
('2025-4-8',2,'kkk',14);

-- 배송지 테이블
create table delivery(
d_id int primary key auto_increment,
o_id int not null unique,  -- orders와 delivery의 관계가 1:1 임을 의미
d_name varchar(20) not null, -- 배송받는 사람이름
d_phoneNum varchar(20) not null, -- 배송받는 사람 전화번호
d_address varchar(50),  -- 배송받는 사람 주소
d_money int default 0, -- 배송비
d_request varchar(50),
m_id varchar(20) not null, -- 회원 아이디
foreign key(o_id) references orders(o_id), -- 외래키 지정
foreign key(m_id) references member(m_id) -- 외래키 지정
);

insert into delivery(o_id,d_name,d_phoneNum,d_address,d_money,d_request,m_id) 
values
(1,'개나리','010-1234-5678','경기도 부천시 중동',3000,'문앞에 두고가세요','aaa'),
(2,'진달래','010-2222-5678','서울시 관악구 신림동',0,null,'bbb'),
(3,'진달래','010-2222-5678','서울시 관악구 신림동',3000,null,'bbb'),
(4,'김백합','010-8888-5678','인천광역시 부평구 부평동',0,null,'ccc'),
(5,'박디비','010-9999-5678','서울시 종로구 효제동',0,null,'ddd'),
(6,'홍길동','010-1234-5678','경기도 부천시 중동',3000,'초인종을 누르지 마세요','kkk');

