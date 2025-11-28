create table sections(
 section_id int not null PRIMARY key AUTO_INCREMENT,
 section_name char(3) not null,
 floor Tinyint not null
);

 INSERT INTO sections (section_name, floor)
 VALUES 
('한식', 2),        
('분식', 2),        
('중식', 3),        
('일식', 3),        
('양식', 3),        
('카페', 1),        
('디저트', 1);