create table discipline(
dsp_code int primary key,
dsp_name varchar(10),
dsp_catrgory varchar(50),
first_Hyear varchar(4) not null
);

insert into discipline(dsp_code, dsp_name, dsp_catrgory, first_Hyear)
values
(1, '수영', '스피드와 지구력이 중요한 수상 스포츠', 1896),
(2, '육상', '달리기와 도약 중심의 기초 스포츠', 1896),
(3, '사격', '정밀한 조준 능력이 필요한 정적 스포츠', 1896),
(4, '유도', '균형과 기술을 활용하는 투기 종목', 1964),
(5, '체조', '유연성과 균형 감각을 요구하는 예술 스포츠', 1896),
(6, '축구', '전략과 팀워크 중심의 구기 종목', 1900),
(7, '역도', '근력과 폭발적인 힘이 중요한 힘 겨루기 종목', 1920),
(8, '탁구', '빠른 반응속도가 요구되는 라켓 스포츠', 1988),
(9, '자전거', '지구력과 스피드가 필요한 레이스 종목', 1896),
(10, '배드민턴', '민첩성과 스피드가 핵심인 라켓 스포츠', 1992)
;