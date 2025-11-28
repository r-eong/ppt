create table address(
address_id int not null primary key auto_increment,
customer_id int not null,
city VARCHAR(30) not null,
district VARCHAR(30) not null,
detail VARCHAR(50)
);

insert into address(customer_id, city, district, detail)
values
(1, '서울', '강남구', '역삼동 123-1'),
(2, '서울', '서초구', '서초동 88-3'),
(3, '서울', '마포구', '합정동 33-10'),
(4, '부산', '해운대구', '좌동 12-2'),
(5, '대구', '중구', '동성로 55'),
(6, '인천', '남동구', '구월동 77-8'),
(7, '광주', '북구', '신안동 19-3'),
(8, '대전', '유성구', '궁동 45-9'),
(9, '울산', '남구', '삼산동 90-4'),
(10, '수원', '영통구', '원천동 24'),
(11, '성남', '분당구', '정자동 300'),
(12, '고양', '일산동구', '마두동 22-1'),
(13, '용인', '수지구', '죽전동 101'),
(14, '창원', '성산구', '성남동 77'),
(15, '전주', '완산구', '서신동 18-5')
;