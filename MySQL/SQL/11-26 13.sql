desc businesses;

-- alter table 이용해 businesses 테이블에 foreign key 를 추가
alter table businesses  -- 자식
add constraint  -- 제약조건
foreign key (fk_section_id)
references sections(section_id);  -- 부모

select * from sections;

start transaction;
delete from sections where section_id = 1;
rollback;
-- 15:55:07	delete from sections where section_id = 1	Error Code: 1451. 
-- Cannot delete or update a parent row: a foreign key constraint fails 
-- (`greendb`.`businesses`, CONSTRAINT `businesses_ibfk_1` FOREIGN KEY (`fk_section_id`) 
-- REFERENCES `sections` (`section_id`))
-- alter 로 부모와 자식을 연결했기 때문에 그냥 delete 할 수 없음!

-- foreign key 삭제방법
-- 외래키 삭제 전 제약조건 이름을 확인
select * from information_schema.table_constraints where table_name = 'businesses';
-- 삭제방법 : alter table 삭제할테이블명 drop foreign key 제약조건이름
alter table businesses drop foreign key businesses_ibfk_1;

-- foreign key 제약조건을 지정할 때 cascade(종속) 부모가 수정/삭제되면 자식도 수정/삭제 되는 조건
-- restrict(얽매이다) : 자식테이블이 존재하는 데이터 삭제 불가능 조건
alter table businesses
add constraint
foreign key (fk_section_id)
references sections(section_id)
on delete cascade  -- 부모 삭제시 자식도 삭제
on update cascade;  -- 부모 수정시 자식도 수정

select * from sections;
select * from businesses;

start transaction;
rollback;
-- section_id 가 1인것만 지움!
delete from sections where section_id = 1;
update sections set section_id = 80 where section_id = 2;



