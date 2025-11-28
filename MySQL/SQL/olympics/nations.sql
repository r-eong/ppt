create table nations(
nat_code int primary key,
nat_name varchar(50),
nat_person int,
nat_evtCnt tinyint not null,
pre_rank int default 0,
nat_rank int
);

insert into nations(nat_code, nat_name, nat_person, nat_evtCnt, pre_rank, nat_rank)
values
(1, '대한민국', 4, 8, 3, 2),
(2, '일본', 2, 7, 4, 3),
(3, '중국', 3, 9, 2, 1),
(4, '미국', 2, 10, 1, 4),
(5, '독일', 2, 6, 6, 5),
(6, '프랑스', 2, 6, 7, 6),
(7, '브라질', 2, 5, 9, 9),
(8, '스페인', 1, 5, 8, 7),
(9, '호주', 1, 4, 10, 10),
(11, '캐나다', 1, 4, 11, 11)
;