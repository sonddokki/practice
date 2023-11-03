-- SELECT문 테스트

SELECT * FROM tab;
SELECT * FROM seq;

SELECT * FROM users;
SELECT * FROM trail;
SELECT * FROM coords;

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



