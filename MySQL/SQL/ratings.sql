create table ratings(
rating_id int not null primary key AUTO_INCREMENT,
fk_business_id int not null, 
stars tinyint not null, 
comment varchar(200), 
created timestamp not null
);

 INSERT INTO ratings (fk_business_id, stars, comment, created)
 VALUES  
(2, 4, '치떡이 진리. 순대는 별로', '2021-07-01 12:30:04'),        
(16, 3, '그냥저냥 먹을만해요', '2021-07-01 17:16:07'),        
(14, 5, '인생팥빵. 말이 필요없음', '2021-07-03 11:28:12'),        
(5, 3, '육수는 괜찮은데 면은 그냥 시판면 쓴 것 같네요.', '2021-07-04 19:03:50'),        
(11, 4, '나오는데 넘 오래걸림. 맛은 있어요', '2021-07-04 13:37:42'),        
(9, 2, '빵집에서 파는 마카롱이랑 비슷하거나 못합니다.', '2021-07-06 15:19:23'),        
(16, 5, '신림에서 먹던 맛 완벽재현', '2021-07-06 20:01:39');
