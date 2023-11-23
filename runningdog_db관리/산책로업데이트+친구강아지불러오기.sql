SELECT * FROM trailStar;
SELECT * FROM trail;

-- 산책로 찜 등록
INSERT INTO trailStar
VALUES(seq_trailstar_no.NEXTVAL ,  14 ,  18 , sysdate );

-- 산책로 찜 삭제
DELETE FROM trailStar
WHERE trailno = 20 
AND userno = 14; 

DELETE FROM trailStar
WHERE userno = 14 ; 


SELECT * FROM users;
SELECT * FROM dog;
SELECT * FROM friend;

------------------------- 강아지 불러오기

-- 유저번호로 내 강아지와 이미지만
SELECT  us.userno as userNo
       ,us.name  as userName
       ,do.dogno as dogNo
       ,do.name as dogName
       ,im.orgname as orgName
       ,im.savename as saveName
FROM users us,dog do, images im
where us.userno = 15
and im.type = 'dog'
and us.userno = do.userno
and do.dogno = im.useno;

-- 최종 -------------------------------------------------------
SELECT  dono.userno as userNo
       ,dono.username  as userName
       ,dono.dogno as dogNo
       ,dono.dogname as dogName
       ,im.orgname as orgName
       ,im.savename as saveName
FROM images im , (SELECT  us.userno as userNo
                           ,us.name  as userName
                           ,do.dogno as dogNo
                           ,do.name as dogName
                           ,do.status as status
                    FROM users us,dog do 
                    WHERE (us.userno = do.userno AND us.userno = 14)
                       OR (us.userno = do.userno AND us.userno in (SELECT fi.applyuserno
                                          FROM users us, friend fi
                                          WHERE us.userno = 14  
                                          and us.userno = fi.applieduserno))   
                       OR (us.userno = do.userno AND us.userno in (SELECT fi.applieduserno
                                          FROM users us, friend fi
                                          WHERE us.userno = 14  
                                          and us.userno = fi.applyuserno))) dono
where im.type = 'dog'
and im.useno = dono.dogno
and dono.status = 'T';
---------------------------------------------------------

-- 일단 강아지만 가져오는거 완성
SELECT  us.userno as userNo
       ,us.name  as userName
       ,do.dogno as dogNo
       ,do.name as dogName
FROM users us,dog do 
WHERE (us.userno = do.userno AND us.userno = 15)
   OR (us.userno = do.userno AND us.userno in (SELECT fi.applyuserno
                      FROM users us, friend fi
                      WHERE us.userno = 15  
                      and us.userno = fi.applieduserno))   
   OR (us.userno = do.userno AND us.userno in (SELECT fi.applieduserno
                      FROM users us, friend fi
                      WHERE us.userno = 15  
                      and us.userno = fi.applyuserno))    ;



SELECT  *
FROM images im, (SELECT  us.userno as userNo
               ,us.name  as userName
               ,do.dogno as dogNo
               ,do.name as dogName
        FROM users us,dog do
        where us.userno = do.userno
        and us.userno = 15) usd , (SELECT  us.userno as userNo
                                   ,us.name  as userName
                                   ,do.dogno as dogNo
                                   ,do.name as dogName
                                    FROM users us,dog do
                                    where us.userno = do.userno
                                    and us.userno = (SELECT fi.applieduserno
                                                     FROM users us, friend fi
                                                     WHERE us.userno = 15  
                                                     and us.userno = fi.applyuserno)) fid  , (SELECT  us.userno as userNo
                                                                                                       ,us.name  as userName
                                                                                                       ,do.dogno as dogNo
                                                                                                       ,do.name as dogName
                                                                                                FROM users us,dog do
                                                                                                where us.userno = do.userno
                                                                                                and us.userno = (SELECT fi.applyuserno
                                                                                                                 FROM users us, friend fi
                                                                                                                 WHERE us.userno = 15  
                                                                                                                 and us.userno = fi.applieduserno)) fidd
WHERE im.type = 'dog'
and im.useno = usd.dogno;


-- 유저번호로 내 강아지만
SELECT  us.userno as userNo
       ,us.name  as userName
       ,do.dogno as dogNo
       ,do.name as dogName
FROM users us,dog do
where us.userno = do.userno
and us.userno = 15;

SELECT  us.userno as userNo
       ,us.name  as userName
       ,do.dogno as dogNo
       ,do.name as dogName
FROM users us,dog do
where us.userno = do.userno
and us.userno = (SELECT fi.applieduserno
                 FROM users us, friend fi
                 WHERE us.userno = 15  
                 and us.userno = fi.applyuserno);
                 
SELECT  us.userno as userNo
       ,us.name  as userName
       ,do.dogno as dogNo
       ,do.name as dogName
FROM users us,dog do
where us.userno = do.userno
and us.userno = (SELECT fi.applyuserno
                 FROM users us, friend fi
                 WHERE us.userno = 15  
                 and us.userno = fi.applieduserno);            
                 
                 

-- 14,15,16의 강아지들을 구하여라

-- 사용할 테이블 users , dog, images, friend  (4개)
-- 유저아이디로 유저와 유저친구의 강아지정보를 가져오기

-- 일단 나랑 친구관계인 애들의 유저번호가 다 들어와야함 1개든 2개든

SELECT fi.applieduserno
FROM users us, friend fi
WHERE us.userno = 15  
and us.userno = fi.applyuserno;

SELECT fi.applyuserno
FROM users us, friend fi
WHERE us.userno = 15  
and us.userno = fi.applieduserno;

SELECT 
        	DG.name,
            DG.status,
            DG.dogNo
            FROM dog DG, users US
            WHERE DG.userNo = US.userNo
            and (DG.userNo IN (SELECT applieduserNo
                           FROM friend 
                           WHERE applyuserNo = (SELECT userNo
                                                FROM users
                                                WHERE code = 'E9J4XG'))
            or  DG.userNo IN (SELECT applyuserNo
                           FROM friend
                           WHERE applieduserNo = (SELECT userNo
                                                FROM users
                                                WHERE code = 'E9J4XG')))

