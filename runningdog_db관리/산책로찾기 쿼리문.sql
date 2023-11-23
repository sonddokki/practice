-- 산책로 업데이트

-- 이용수 카운트





-- 찜


-- 비교할칼럼,ABS(비교할칼럼값 - 비교할값) AS Distance FROM [비교할테이블] ORDER BY Distance;
SELECT LAT,ABS(LAT - 36) AS Distance FROM coords ORDER BY Distance;
SELECT LNG,ABS(LNG - 36) AS Distance FROM coords ORDER BY Distance;

-- [이용한 산책좌표]에 마지막 [좌표 값 X]와 [등록된 산책좌표]의 첫번째 [좌표 값 X] 와 비교하고
-- [이용한 산책좌표]에 마지막 [좌표 값 y]와 [등록된 산책좌표]의 첫번째 [좌표 값 y] 와 비교하서 
-- 각각 오차가 낮은 애들



-- type가 'trail' 이고 coordOrder가 1인 애들중 LAT이

-- LAT (y) 위도 좌표값
SELECT useno AS trailNo  
       ,LAT
       ,ABS(LAT - 36) AS Distance   
FROM coords 
WHERE type = 'trail'  
and coordorder = 1
ORDER BY Distance;

-- LNG (X) 경도 좌표값
SELECT useno AS trailNo  
       ,LNG
       ,ABS(LNG - 120) AS Distance   
FROM coords 
WHERE type = 'trail'  
and coordorder = 1
ORDER BY Distance;

-- trailNo 가 같은 Distance 끼리 더 하고 그중에서 오차숫자가 적은순으로 정렬 상위 3개의 trailNo를 가져옴




SELECT trailF.rn
       ,trailF.trailno
FROM   (SELECT rownum rn
               ,trailC.trailno
               ,trailc.distance
        FROM   (SELECT  latc.trailno  as trailno
                        ,latc.distance1 + lngc.distance2 as distance
                FROM   (SELECT useno AS trailNo  
                               ,LAT
                               ,ABS(LAT - 36) AS Distance1   
                        FROM coords 
                        WHERE type = 'trail'  
                        and coordorder = 1
                        ORDER BY Distance1) latC , (SELECT useno AS trailNo  
                                                           ,LNG
                                                           ,ABS(LNG - 120) AS Distance2   
                                                    FROM coords 
                                                    WHERE type = 'trail'  
                                                    and coordorder = 1
                                                    ORDER BY Distance2) lngC
                WHERE latc.trailno = lngc.trailno
                ORDER BY distance) trailC) trailF
WHERE trailF.rn BETWEEN 1 and 3;

SELECT rownum rn
       ,trailC.trailno
       ,trailc.distance
FROM   (SELECT  latc.trailno  as trailno
                ,latc.distance1 + lngc.distance2 as distance
        FROM   (SELECT useno AS trailNo  
                       ,LAT
                       ,ABS(LAT - 36) AS Distance1   
                FROM coords 
                WHERE type = 'trail'  
                and coordorder = 1
                ORDER BY Distance1) latC , (SELECT useno AS trailNo  
                                                   ,LNG
                                                   ,ABS(LNG - 120) AS Distance2   
                                            FROM coords 
                                            WHERE type = 'trail'  
                                            and coordorder = 1
                                            ORDER BY Distance2) lngC
        WHERE latc.trailno = lngc.trailno
        ORDER BY distance) trailC;


-- 쿼리문 완성   좌표 [LAT(y)위도]와 [LNG(X)경도] 값을 넣어서 젤 가까운 좌표 찾기

SELECT  tr.trailno as trailNo
        ,tr.name as name
        ,tn.rn
FROM trail tr, (SELECT trailF.rn
                       ,trailF.trailno
                FROM   (SELECT rownum rn
                               ,trailC.trailno
                               ,trailc.distance
                        FROM   (SELECT  latc.trailno  as trailno
                                        ,latc.distance1 + lngc.distance2 as distance
                                FROM   (SELECT useno AS trailNo  
                                               ,LAT
                                               ,ABS(LAT - 36) AS Distance1   
                                        FROM coords 
                                        WHERE type = 'trail'  
                                        and coordorder = 1
                                        ORDER BY Distance1) latC , (SELECT useno AS trailNo  
                                                                           ,LNG
                                                                           ,ABS(LNG - 120) AS Distance2   
                                                                    FROM coords 
                                                                    WHERE type = 'trail'  
                                                                    and coordorder = 1
                                                                    ORDER BY Distance2) lngC
                                WHERE latc.trailno = lngc.trailno
                                ORDER BY distance) trailC) trailF
                WHERE trailF.rn BETWEEN 1 and 3) tN
WHERE tr.trailno = tn.trailno 
ORDER BY tn.rn ASC;


---------------------------------------------------------------------
SELECT  tr.trailno as trailNo
        ,tr.name as name
        ,tn.rn
FROM trail tr, (SELECT trailF.rn
                       ,trailF.trailno
                FROM   (SELECT rownum rn
                               ,trailC.trailno
                               ,trailc.distance
                        FROM   (SELECT  latc.trailno  as trailno
                                        ,latc.distance1 + lngc.distance2 as distance
                                FROM   (SELECT useno AS trailNo  
                                               ,LAT
                                               ,ABS(LAT - 36) AS Distance1   
                                        FROM coords 
                                        WHERE type = 'trail'  
                                        and coordorder = 1
                                        ORDER BY Distance1) latC , (SELECT useno AS trailNo  
                                                                           ,LNG
                                                                           ,ABS(LNG - 120) AS Distance2   
                                                                    FROM coords 
                                                                    WHERE type = 'trail'  
                                                                    and coordorder = 1
                                                                    ORDER BY Distance2) lngC
                                WHERE latc.trailno = lngc.trailno
                                ORDER BY distance) trailC) trailF
                WHERE trailF.rn BETWEEN 1 and 3) tN
WHERE tr.trailno = tn.trailno 
ORDER BY tn.rn ASC;
-------------------------------------------------------------------
-- 챗지피티
SELECT  tr.trailno as trailNo
        ,tr.name as name
        ,CASE WHEN ts.trailno IS NOT NULL THEN 1 ELSE 0 END AS trailStar
        ,tn.rn
        ,ts.trailstarno
FROM trail tr
JOIN (SELECT trailF.rn
             ,trailF.trailno
      FROM   (SELECT rownum rn
                     ,trailC.trailno
              FROM   (SELECT latc.trailno as trailno
                                  ,latc.distance1 + lngc.distance2 as distance
                      FROM   (SELECT useno AS trailNo  
                                     ,LAT
                                     ,ABS(LAT - 36) AS Distance1   
                              FROM coords 
                              WHERE type = 'trail'  
                              and coordorder = 1
                              ORDER BY Distance1) latC 
                             , (SELECT useno AS trailNo  
                                       ,LNG
                                       ,ABS(LNG - 120) AS Distance2   
                                FROM coords 
                                WHERE type = 'trail'  
                                and coordorder = 1
                                ORDER BY Distance2) lngC
                      WHERE latc.trailno = lngc.trailno
                      ORDER BY distance) trailC) trailF
      WHERE trailF.rn BETWEEN 1 and 3) tn
ON tr.trailno = tn.trailno
LEFT JOIN trailStar ts ON tr.trailno = ts.trailno AND ts.userno = 14
ORDER BY tn.rn ASC;

------------------------------------------------------------
SELECT *
FROM trailStar
WHERE userno = 14
and trailno = 20;



INSERT INTO trailStar
VALUES(998 ,  14 ,  18 , sysdate );

----- 찜번호, 유저번호,산책로번호,날짜



SELECT trailF.rn
       ,trailF.trailno
FROM   (SELECT rownum rn
               ,trailC.trailno
               ,trailc.distance
        FROM   (SELECT  latc.trailno  as trailno
                        ,latc.distance1 + lngc.distance2 as distance
                FROM   (SELECT useno AS trailNo  
                               ,LAT
                               ,ABS(LAT - 36) AS Distance1   
                        FROM coords 
                        WHERE type = 'trail'  
                        and coordorder = 1
                        ORDER BY Distance1) latC , (SELECT useno AS trailNo  
                                                           ,LNG
                                                           ,ABS(LNG - 120) AS Distance2   
                                                    FROM coords 
                                                    WHERE type = 'trail'  
                                                    and coordorder = 1
                                                    ORDER BY Distance2) lngC
                WHERE latc.trailno = lngc.trailno
                ORDER BY distance) trailC) trailF
WHERE trailF.rn BETWEEN 1 and 3;


--------------------------------------------------------업데이트문

--  UPDATE [테이블] SET [열]= '변경할값' WHERE [열] is null
INSERT INTO trailUsed
VALUES(seq_trailused_no.NEXTVAL ,  14 ,  20 );

INSERT INTO trailStar
VALUES(999 ,  14 ,  20 , sysdate );


--------------------------- 이미지 가져오기도 추가 ---------------------------------------------------------
SELECT tt.trailNo
      ,tt.name
      ,tt.trailstar
      ,tt.rn
      ,tt.trailstarno
      ,im.orgname
      ,im.savename    
FROM images im, (SELECT  tr.trailno as trailNo
		        ,tr.name as name
		        ,CASE WHEN ts.trailno IS NOT NULL THEN 1 ELSE 0 END AS trailStar
		        ,tn.rn
        		,NVL(ts.trailstarno, 0) trailstarno  
		FROM trail tr
		JOIN (SELECT trailF.rn
		             ,trailF.trailno
		      FROM   (SELECT rownum rn
		                     ,trailC.trailno
		              FROM   (SELECT latc.trailno as trailno
		                                  ,latc.distance1 + lngc.distance2 as distance
		                      FROM   (SELECT useno AS trailNo  
		                                     ,LAT
		                                     ,ABS(LAT - 127) AS Distance1   
		                              FROM coords 
		                              WHERE type = 'trail'  
		                              and coordorder = 1
		                              ORDER BY Distance1) latC 
		                             , (SELECT useno AS trailNo  
		                                       ,LNG
		                                       ,ABS(LNG - 37) AS Distance2   
		                                FROM coords 
		                                WHERE type = 'trail'  
		                                and coordorder = 1
		                                ORDER BY Distance2) lngC
		                      WHERE latc.trailno = lngc.trailno
		                      ORDER BY distance) trailC) trailF
		      WHERE trailF.rn BETWEEN 1 and 3) tn
		ON tr.trailno = tn.trailno
		LEFT JOIN trailStar ts ON tr.trailno = ts.trailno AND ts.userno = 15        
		ORDER BY tn.rn ASC) tt
WHERE im.type ='trailMap'
and im.useno = tt.trailno;
--------------------------- 이미지 가져오기도 추가 ---------------------------------------------------------


--------------------------- 이미지 가져오기도 추가전 ---------------------------------------------------------
SELECT  tr.trailno as trailNo
		        ,tr.name as name
		        ,CASE WHEN ts.trailno IS NOT NULL THEN 1 ELSE 0 END AS trailStar
		        ,tn.rn
        		,NVL(ts.trailstarno, 0) trailstarno  
		FROM trail tr
		JOIN (SELECT trailF.rn
		             ,trailF.trailno
		      FROM   (SELECT rownum rn
		                     ,trailC.trailno
		              FROM   (SELECT latc.trailno as trailno
		                                  ,latc.distance1 + lngc.distance2 as distance
		                      FROM   (SELECT useno AS trailNo  
		                                     ,LAT
		                                     ,ABS(LAT - 127) AS Distance1   
		                              FROM coords 
		                              WHERE type = 'trail' 
		                              and coordorder = 1
		                              ORDER BY Distance1) latC 
		                             , (SELECT useno AS trailNo  
		                                       ,LNG
		                                       ,ABS(LNG - 37) AS Distance2   
		                                FROM coords 
		                                WHERE type = 'trail'  
		                                and coordorder = 1
		                                ORDER BY Distance2) lngC
		                      WHERE latc.trailno = lngc.trailno
		                      ORDER BY distance) trailC) trailF
		      WHERE trailF.rn BETWEEN 1 and 3) tn
		ON tr.trailno = tn.trailno
		LEFT JOIN trailStar ts ON tr.trailno = ts.trailno AND ts.userno = 15        
		ORDER BY tn.rn ASC;


INSERT INTO images
VALUES (187,    -- 이미지번호
        'map26.jpg',     -- orgname
        'map26.jpg',    -- savename
        'map26.jpg', -- filepath
        23523526, -- filesize
        'trailMap', -- type      
        26, -- useno
        0 -- 이미지순서
        ); 




