-- 미팅 쿼리문2


SELECT orgName
			       ,saveName
			       ,filePath
			       ,type
			  FROM images
			 WHERE type = 'walkLogMap'
			   AND useNo = 317;


SELECT orgName
			       ,saveName
			       ,filePath
			       ,imageOrder
			       ,type
			  FROM images
			 WHERE type = 'walkLogCon'
			   AND imageOrder = 0
			   AND useNo = 318;



SELECT w.walklogNo
			                       ,u.userNo
			                       ,u.name
			                       ,u.code
			                       ,w.distance
			                       ,w.logTime
			                       ,w.content
			                       ,w.title
			                       ,TO_CHAR(w.regdate, 'YY-MM-DD HH24:MI') regDate
			                       ,gt.cnt
			                  FROM users u, trailUsed tu, walkLog w
			                  LEFT OUTER JOIN ( SELECT COUNT(likeNo) cnt
			                                           ,useNo
			                                      FROM userLike
			                                     WHERE type = 'walkLog'
			                                     GROUP BY useNo ) gt
			                    ON w.walkLogNo = gt.useNo
			                 WHERE tu.walklogno = w.walkLogNo
			                   AND w.userNo = u.userNo
			                   AND w.status = 'T'
			                   AND w.security = '공개'
			                   AND tu.trailNo = 21
							 ORDER BY DECODE(w.userNo, 0, 1), regDate DESC, w.walklogNo DESC
