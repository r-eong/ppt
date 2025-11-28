create table player(
ply_code int auto_increment primary key,
dsp_code varchar(50) not null,
nat_code int not null,
ply_rank tinyint default 0,
ply_age tinyint,
ply_name varchar(20)
);

insert into player(dsp_code, nat_code, ply_rank, ply_age, ply_name)
values
(1, 1, 12, 23, '김민수'),
(2, 3, 7, 21, '이지훈'),
(3, 5, 18, 28, '박서연'),
(4, 2, 25, 19, '최동현'),
(5, 7, 9, 30, '강재원'),
(1, 1, 14, 25, '한유라'),
(6, 4, 22, 22, '서민호'),
(8, 6, 11, 27, '윤하린'),
(3, 8, 1, 24, '류건우'),
(2, 3, 19, 29, '오세나'),
(3, 2, 8, 20, '임희준'),
(2, 1, 16, 31, '장하늘'),
(9, 9, 21, 26, '백윤성'),
(10, 11, 13, 18, '김아름'),
(5, 3, 24, 32, '신재현'),
(6, 5, 6, 23, '차예진'),
(4, 4, 17, 28, '유나경'),
(7, 7, 10, 19, '문주리'),
(3, 6, 20, 30, '남시우'),
(1, 1, 4, 21, '양호진')
;