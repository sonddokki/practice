-- SELECT문 테스트

SELECT * FROM tab;
SELECT * FROM seq;

SELECT * FROM users;
SELECT * FROM trail;
SELECT * FROM coords;
SELECT * FROM dog;



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






