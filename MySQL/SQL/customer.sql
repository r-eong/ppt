create table customer(
customer_id int not null primary key AUTO_INCREMENT,
user_name VARCHAR(40) not null,
email VARCHAR(50),
phone VARCHAR(20)
);

insert into customer(user_name, email, phone)
values
('김철수', 'kimcs@example.com', '010-1111-1111'),
('박영희', 'parkYH@example.com', '010-2222-2222'),
('이민수', 'leems@example.com', '010-3333-3333'),
('최가람', 'choiGR@example.com', '010-4444-4444'),
('정하늘', 'jungHN@example.com', '010-5555-5555'),
('한별이', 'hanBE@example.com', '010-6666-6666'),
('오세훈', 'ohSH@example.com', '010-7777-7777'),
('문지혜', 'moonJH@example.com', '010-8888-8888'),
('강토리', 'kangTR@example.com', '010-9999-9999'),
('유소라', 'yuSR@example.com', '010-1212-1212'),
('윤하린', 'yoonHR@example.com', '010-1313-1313'),
('장우진', 'jangWJ@example.com', '010-1414-1414'),
('백수민', 'baekSM@example.com', '010-1515-1515'),
('홍서준', 'hongSJ@example.com', '010-1616-1616'),
('조예린', 'joYR@example.com', '010-1717-1717')
;
