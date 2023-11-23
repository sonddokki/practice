-- SELECT문 테스트

SELECT * FROM tab;
SELECT * FROM seq;

SELECT * FROM users;
SELECT * FROM trail;
SELECT * FROM coords;

SELECT * FROM dog;
SELECT * FROM friend;

SELECT * FROM walkLog;
SELECT * FROM walkedDog;
SELECT * FROM location;

SELECT * FROM trailStar;

SELECT * FROM trailUsed;
SELECT * FROM images;

DELETE FROM users
WHERE userNo = 4;

DELETE FROM images
WHERE imageno = 42;

DELETE FROM images
WHERE imageno = 42;

select saveName
			from images
			where type = 'users'
			and useNo = 201;
            
select locationno
from location
where GU = '종로구'
and DONG = '청운동';            

select  u.name name,
					u.id id,
			        u.code code,
			        to_char(u.birth, 'YYYY-MM-DD') birth,
			        u.gender gender,
			        u.locationNo locationNo,
			        l.si si,
			        l.gu gu,
			        l.dong dong,
			        u.status status
			from users u, location l
			where u.userNo = 201
			and u.locationNo = l.locationNo;

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
where us.userno = 2 
and us.userno = do.userno;

-- 회원번호를 통해 회원의 강아지정보 가져오기 이미지도!
SELECT  us.userno
        ,us.name 
        ,do.dogno
        ,do.name
        ,im.orgname
        ,im.savename
FROM users us,dog do, images im
where us.userno = 2 
and us.userno = do.userno
and do.dogno = im.useno;

SELECT  us.userno as userNo
		         ,us.name  as userName
		         ,do.dogno as dogNo
		         ,do.name as dogName
		         ,im.orgname as orgName
		 FROM users us,dog do, images im
	 	 where us.userno = 2
	 	 and im.type = 'dog'
	 	 and us.userno = do.userno
		 and do.dogno = im.useno;


 SELECT  us.userno as userNo 
		         ,us.name as userName
		         ,do.dogno as dogNo
		         ,do.name as dogName
	     FROM users us,dog do
	     where us.id = 'aaa'
	     and us.userno = do.userno;
         
-- 내 산책기록 좌표값 가져오기 (이미지 캡쳐용)
SELECT  coordorder
        ,lat
        ,lng
FROM coords
where type = 'walkLog' 
and useno = 57 
ORDER BY coordorder asc;



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
   
-----------------------------------------------------
SELECT tr.trailNo
       ,tr.name   
FROM (
    SELECT  trailNo
            ,name            
    FROM trail
    WHERE locationNo = 1174010900 
    ORDER BY name) tr
WHERE ROWNUM <= 3;  


select  userNo,
					code
from users
where id = 'bbb'
and password = 12345;


select  userNo
from users
where id = 'aaa'
and password = 1234;
  
-- 강아지 이미지 찾는 쿼리문         
select  *
from images
where type = 'dog'
and useNo = 1;

select  *
from images
where type = 'dog'
and useNo = 1;

select  *
from images im, dog do, users us
where us.userno = 1
and im.type = 'dog' 
and do.dogno = im.useno;

select  u.name name,
        u.id id,
        u.code code,
        to_char(u.birth, 'YYYY-MM-DD') birth,
        u.gender gender,
        u.locationNo locationNo,
        l.si si,
        l.gu gu,
        l.dong dong,
        u.status status
from users u, location l
where u.userNo = 6
and u.locationNo = l.locationNo;


select  u.name name,
        u.id id,
        u.code code,
        to_char(u.birth, 'YYYY-MM-DD') birth,
        u.gender gender,
        u.locationNo locationNo,
        l.si si,
        l.gu gu,
        l.dong dong,
        u.status status
from users u, location l
where u.userNo = 1
and u.locationNo = l.locationNo;


SELECT  us.userno as userNo
		         ,us.name  as userName
		         ,do.dogno as dogNo
		         ,do.name as dogName
		         ,im.orgname as orgName
		 FROM users us,dog do, images im
	 	 where us.userno = 2
	 	 and im.type = 'dog'
	 	 and us.userno = do.userno
		 and do.dogno = im.useno

-- 산책로 리스트
select       WL.walkLogNo,
		       		 US.userNo,
		       	  	 WL.locationNo,
		       		 TO_CHAR(WL.regDate, '""YYYY"년 "MM"월 "DD"일 "HH24"시 "MI"분"') regDate,
		       		 WL.startTime,
		      		 WL.endTime,
		      		 WL.logTime,
		      		 WL.distance,
		      		 WL.content,
		      		 WL.security,
		      		 WL.status,
		      		 US.name,
		      		 WL.title
		             
		from walkLog WL, users US
		where WL.userNo = US.userNo 
		and WL.userNo = 2
		order by WL.walkLogNo desc;
        
        (SELECT US.userNo
		                 From users US
		                WHERE code = '456')
---------------------------------------------
select   *
		from walkLog WL, users US
		where WL.userNo = US.userNo 
		and WL.userNo = 2
		order by WL.walkLogNo desc;        
                        
-- 이미지 가져오는 쿼리
  SELECT 
    WC.walkLogCmtNo,
    WC.walkLogNo,
    US.userNo,
    US.name,
    WC.content,
    TO_CHAR(WC.regDate, 'YYYY"년 "MM"월 "DD"일 "HH24"시 "MI"분"') AS regDate,
    WC.status,
    IM.saveName AS userSavename
FROM 
    walkLogCmt WC
    JOIN users US ON WC.userNo = US.userNo
    LEFT JOIN images IM ON IM.useNo = US.userNo
WHERE 
    WC.walkLogNo = 1
ORDER BY 
    WC.walkLogCmtNo ASC