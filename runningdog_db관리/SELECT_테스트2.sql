-- 테이블의 모든 데이터 삭제
truncate table 테이블이름A;
truncate table images;
truncate table users;
truncate table dog;
truncate table coords;
truncate table walkLog;
truncate table walkedDog;
truncate table trail;

DELETE FROM coords
WHERE type = 'walkLog'
and useno = 12;



UPDATE your_table
SET
walkLog = '새로운 A 값',
column_b = '새로운 B 값';

SELECT *
FROM trail tr, coords co
where co.type = 'trail'
and tr.locationno = 1174010900
ORDER BY co.coordno asc
, co.coordorder asc;

SELECT *
FROM trail
WHERE locationno = 1174010900;

SELECT ort.trailNo
       ,ort.name
       ,ort.distance
       ,ort.eta
       ,ort.regDate
  FROM (SELECT ROWNUM rn
               ,ot.trailNo
               ,ot.name
               ,ot.distance
               ,ot.eta
               ,ot.regDate
          FROM (SELECT t.trailNo
                       ,t.name
                       ,t.distance
                       ,t.eta
                       ,TO_CHAR(t.regdate, 'YYYY-MM-DD') regDate
                       FROM coords c, trail t      
                       ) ot ) ort
                        WHERE ort.rn >= 1
                        AND ort.rn <= 10;
                        
                        
SELECT * FROM trail;    -- 내가걸은 좌표번호랑 동네번호로 3개 가져오기        