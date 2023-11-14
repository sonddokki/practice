-- SELECT문 테스트

SELECT * FROM tab;
SELECT * FROM seq;

SELECT * FROM users;
SELECT * FROM trail;
SELECT * FROM coords;
SELECT * FROM dog;
SELECT * FROM walkLog;



-- 산책로 불러오는 쿼리문 
SELECT  co.coordno --좌표번호
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

-- 회원번호를 통해 회원의 강아지정보 가져오기 (이미지도 가져와야함)
SELECT  us.userno
        ,us.name -- 닉네임
        ,do.dogno
        ,do.name
FROM users us,dog do
where us.userno = 1 
and us.userno = do.userno;

-- 회원번호를 통해 회원의 강아지정보 가져오기 이미지도!
SELECT  us.userno
        ,us.name -- 닉네임
        ,do.dogno
        ,do.name
FROM users us,dog do
where us.userno = 1 
and us.userno = do.userno;


 SELECT  us.userno as userNo 
		         ,us.name as userName
		         ,do.dogno as dogNo
		         ,do.name as dogName
	     FROM users us,dog do
	     where us.id = 'aaa'
	     and us.userno = do.userno;
         




   <!-- 산책기록 저장하기 -->
   <insert id="walkLogInsert"  parameterType="com.runningdog.vo.MoWalkLogVo" >
		<selectKey resultType="int" keyProperty="walkLogNo" order="BEFORE">
			<![CDATA[
			SELECT seq_walkdog_no.nextVal FROM dual    
		]]>
		</selectKey>
		<![CDATA[
		    INSERT INTO walkLog
			VALUES (16,  
			        1,
			        1174010900, 
			        11111, 
			        SYSDATE,
			        '2023-11-14T01:18',
			        '2023-11-14T01:18',
			        '00:00:03',
			        '0',
			        'aaa',
			        '공개',
			        'T'
			        )
		   ]]>
   </insert>
   
   