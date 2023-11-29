SELECT m.meetingno   as meetingNo
			       ,m.name     as name
			       ,m.time     as time
			       ,mu.userCount  as userCount
			       ,m.maxmember   as maxMember
			       ,md.dogCount  as dogCount
       			   ,m.userNo	as	userNo
			FROM meeting m , (SELECT mi.meetingno
			                        ,COUNT(mi.dogno) as dogCount
			                  FROM meetinginfo mi ,(SELECT meetingNo
			                                        FROM meetinginfo
			                                        WHERE userno = 29
			                                        GROUP BY meetingNo) minum , meeting me
			                  WHERE mi.meetingno = minum.meetingno
			                  AND mi.meetingno = me.meetingno
			                  GROUP BY mi.meetingno) md , (select  meetingNo 
			                                                      ,count(distinct userNo) userCount
			                                               from meetingInfo
			                                               where meetingNo in(select meetingNo
			                                                                  from meetingInfo mi
			                                                                  where userNo = 29
			                                                                  GROUP BY meetingNo)                                                                 
			                                               GROUP BY meetingNo) mu
			WHERE m.meetingno = md.meetingno
			and  m.meetingno = mu.meetingno
			and TO_DATE(SUBSTR(m.meetingdate, 1, 8), 'YY-MM-DD') = TO_DATE('23/11/23', 'YY/MM/DD')
			and m.status ='T'
			ORDER BY m.time asc;
            
UPDATE images
SET type = 'trail'
WHERE type = 'trailMap';   

-- 유저 아이디변경
UPDATE users
SET id = 'aab'
WHERE id = 'aaa';   

SELECT * FROM users;

SELECT * FROM trail;
SELECT * FROM meeting;


UPDATE meeting
SET trailNo = 39
WHERE meetingno = 41;  