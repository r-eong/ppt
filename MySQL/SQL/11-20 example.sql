-- 1. address 테이블에서 ‘city + district + detail’을 하나의 문자열로 합쳐 ‘전체주소’로 출력하시오. 
-- (CONCAT 사용)
select concat_ws(' ', city, district, detail) from address;

-- 2. customer 테이블에서 user_name, email, phone을 ‘/’로 구분하여 하나의 문자열로 출력하시오. 
-- (CONCAT_WS 사용)
select concat_ws(' / ', user_name, email, phone) from customer;

-- 3. address 테이블에서 detail 컬럼에서 ‘동’까지의 첫 2글자를 잘라서 ‘행정동’ 이름만 출력하시오.
-- (SUBSTR 사용)
select substr(detail, 1, 2) from address;

-- 4. product 테이블에서 product_name의 글자수를 CHAR_LENGTH로 출력하시오. ‘상품이름길이’ 컬럼명 사용
select product_name, char_length(product_name) as '상품이름길이' from product;

-- 5. address 테이블의 detail 값이 몇 바이트인지 LENGTH로 확인하여 ‘바이트수’라는 컬럼명으로 출력하시오.
select detail, length(detail) as '바이트수' from address;

-- 6. category 테이블에서 category_name을 길이 10으로 하고, 빈 공간은 ‘#’로 채워서 왼쪽 정렬되도록 출력하시오. 
-- (LPAD 사용)
select lpad(category_name, 10, '#') from category;

-- 7. address 테이블에서 district 컬럼의 ‘구’를 ‘군’으로 바꾸어 출력하시오. (REPLACE 사용)
 select replace(district, '구', '군') from address;
 
-- 8. product 테이블에서 product_name에서 '1kg' 문자열을 ‘1KG’로 변경하여 출력하시오. (REPLACE 사용)
 select replace(product_name, '1kg', '1KG') from product;
 
-- 9. address 테이블에서 detail 안에 ‘동’이라는 단어가 몇 번째에 위치하는지 검색하시오. (INSTR 사용)
 select detail, instr(detail, '동') from address;
 
-- 10. customer 테이블에서 user_name과 phone을 연결해 ‘고객연락처’ 형태로 출력하시오. (CONCAT 사용)
-- 예: 김철수(010-1111-1111)
select concat(user_name, ' (', phone, ')') as '고객연락처' from customer;

-- 11. orders 테이블에서 order_date의 앞 4자리(연도)만 잘라서 출력하시오. (SUBSTR 사용)
select order_date, substr(order_date, 1, 4) from orders;

-- 12. product 테이블에서 product_name과 price를 ‘상품명: 가격원’ 형태로 결합한 새로운 컬럼을 출력하시오. 
-- (CONCAT_WS 또는 CONCAT 사용)
select concat_ws(' : ', product_name, price) from product;

-- 13. category 테이블에서 category_name의 첫 글자만 SUBSTR로 추출하시오.
-- 예: 서울-강남구
select category_name, substr(category_name, 1, 1) from category;

-- 14. address 테이블에서 city, district를 ‘-’로 연결한 주소 ID 문자열을 출력하시오. (CONCAT_WS 사용)
select concat_ws(' - ', city, district) from address;

-- 15. customer 테이블에서 email 컬럼에서 ‘@’의 위치를 INSTR로 찾고 ‘이메일_골뱅이_위치’라는 컬럼명으로 출력하시오.
select instr(email, '@') as '이메일_골뱅이_위치' from customer;