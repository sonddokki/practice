-- 전체 테이블 확인
SELECT * FROM tab;
-- author 테이블 확인
SELECT * FROM author; 
-- book 테이블 확인
SELECT * FROM book;

-- 테이블,시퀸스 전체 삭제
DROP TABLE book;
DROP TABLE author;
drop SEQUENCE seq_author_id;
drop SEQUENCE seq_book_id;

--===============================================================================================
-- author 테이블 생성
create table author(author_id   number(5),      
                    author_name varchar2(50),  
                    author_desc varchar2(50),
                    PRIMARY KEY(author_id)         -- 프라이머리키 지정
                    );
-- book 테이블 생성
create table book(book_id  number(5),      
                  title    varchar2(50),  
                  pubs   varchar2(50), 
                  pub_date date,
                  author_id number(5),
                  PRIMARY KEY(book_id),            -- 프라이머리키 지정
                  CONSTRAINT book_fk FOREIGN KEY (author_id) -- CONSTRAINT 관계선이름 FOREIGN KEY (참조당할칼럼명)
                  REFERENCES author(author_id)  -- REFERENCES 참조할테이블(참조할칼럼명)
                  );    
--===============================================================================================                  
-- 시퀸스 생성 (데이터 등록시 번호 생성할 칼럼)
CREATE SEQUENCE seq_author_id 
INCREMENT BY 1                 -- 번호1씩 상승
START WITH 1                   -- 초기번호 1부터 시작 
nocache;                       -- 번호미리생성 안하기     
CREATE SEQUENCE seq_book_id   
INCREMENT BY 1                  
START WITH 1                  
nocache;                               
--===============================================================================================
-- 데이터 등록
-- 작가등록
INSERT INTO author
VALUES (seq_author_id.nextval, '김문열', '경북 영양' );
INSERT INTO author
VALUES (seq_author_id.nextval, '박경리', '경상남도 통영' );
INSERT INTO author
VALUES (seq_author_id.nextval, '유시민', '17대 국회의원' );
INSERT INTO author
VALUES (seq_author_id.nextval, '기안84', '기안동에서 산 84년생' );
INSERT INTO author
VALUES (seq_author_id.nextval, '강풀', '온라인 만화가 1세대' );
INSERT INTO author
VALUES (seq_author_id.nextval, '김영하', '알쓸신잡' );
--===============================================================================================
-- 책등록
INSERT INTO book
VALUES (seq_book_id.nextval, '우리들의 일그러진 영웅', '다림' , '1998-02-22' , 1 );
INSERT INTO book
VALUES (seq_book_id.nextval, '삼국지', '민음사' , '2002-03-01' , 1 );
INSERT INTO book
VALUES (seq_book_id.nextval, '토지', '마로니에북스' , '2012/08/15' , 2 );
INSERT INTO book
VALUES (seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길' , '2015/04/01' , 3 );
INSERT INTO book
VALUES (seq_book_id.nextval, '패션왕', '중앙북스(books)' , '2012/02/22' , 4 );
INSERT INTO book
VALUES (seq_book_id.nextval, '순정만화', '재미주의' , '2011/08/03' , 5 );
INSERT INTO book
VALUES (seq_book_id.nextval, '오직두사람', '문학동네' , '2017/05/04' , 6 );
INSERT INTO book
VALUES (seq_book_id.nextval, '26년', '재미주의' , '2012/02/04' , 5 );
--===============================================================================================
-- 테이블 JOIN 출력해서 데이터 확인
SELECT  b.book_id "책번호"
        ,b.title  "제목"
        ,b.pubs   "출판사"
        ,to_char(b.pub_date, 'YYYY-MM-DD' ) "출간일"
        ,b.author_id  "작가아이디"
        ,a.author_name  "작가이름"
        ,a.author_desc  "작가설명"  
FROM author a, book b
where a.author_id = b.author_id;     
-- 완성
--===============================================================================================
-- 강풀의 author_desc 정보를 ‘서울특별시’ 로 변경해 보세요
UPDATE author
set author_desc = '서울특별시'
where author_name = '강풀';   

-- author 테이블에서 기안84 데이터를 삭제해 보세요  삭제 안됨
DELETE FROM author 
WHERE author_name = '기안84' ;

-- 참조하는 테이블에 공유되는 칼럼의 값이 있는 데이터를 모두 삭제하면 기안84 삭제 가능!
DELETE FROM book 
WHERE author_id = 4 ;  

--===============================================================================================

UPDATE book
set title = '삼국지 (상)'
where title = '삼국지';   

SELECT  book_id
        ,title
        ,pubs
        ,pub_date
        ,author_id
FROM book;

SELECT   author_id
        ,author_name
        ,author_desc
FROM author; 


SELECT  b.book_id
        ,b.title
        ,b.pubs
        ,b.pub_date
        ,b.author_id
        ,a.author_name    
FROM book b, author a
WHERE b.author_id = a.author_id;


UPDATE book
set author_id = 8
where title = '사국지' ;
            
-- 책삭제                
DELETE FROM book 
WHERE book_id = 2 ;            
                
                