-- SELECT문 테스트

SELECT * FROM tab;
SELECT * FROM seq;

SELECT * FROM users;
SELECT * FROM trail;
SELECT * FROM coords;
SELECT * FROM dog;



-- 산책로 불러오는 쿼리문 
SELECT  co.coordno coordno--좌표번호
        ,tr.trailno --산책로번호
        ,tr.name --산책로이름
        ,co.coordorder --좌표순서
        ,co.lat --위도
        ,co.lng --경고
FROM trail tr, coords co
where co.type = 'trail'
and tr.trailno = co.useno
ORDER BY co.coordno asc
, co.coordorder asc;

-- 산책로 하나 불러오는 쿼리문 
SELECT  *
FROM trail tr, coords co
where co.type = 'trail'
and tr.trailno = co.useno
and co.useno = 3
ORDER BY co.coordorder asc;

-- 산책일지 하나 불러오는 쿼리문 
SELECT  *
FROM trail tr, coords co
where co.type = 'trail'
and tr.trailno = co.useno
and co.useno = 3
ORDER BY co.coordorder asc;

-- 회원번호를 통해 회원의 강아지정보 가져오기
SELECT * 
FROM users us,dog do
where us.userno = 1 
and us.userno = do.userno;






