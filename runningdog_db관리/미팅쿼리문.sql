---- 아이콘클릭시 출력
-- 내 유저번호와 오늘날짜로 내가 참여한 모임의 리스트가 뜸

-- 찾을 테이블 (m)meeting , (mi)meetinginfo

-- 보낼 값 userNo , '오늘' 날짜

-- 제한할 값 (m)오늘날짜'에 상태가 (m)'T'이고 내가 속한 모임 (미팅인포 테이블에서 미팅번호와 유저번호가 일치하는)

-- 가져올 값  (m)모임이름, (m)미팅번호, (m)모임시간, (m)최대참여인원, (mi)참여인원수(미팅번호끼리 일치하는 미팅인포의갯수)

--  출력예시 "재밌는모임 13:00  3/4" 

SELECT m.meetingno   -- 미팅번호
       ,m.name     -- 모임이름
       ,m.time     -- 모임시간
       ,mu.userCount
       ,m.maxmember    -- 최대참여 인원 
       ,md.dogCount  -- 참여한 강아지 수도 가져와야겠다
       ,m.meetingDate
       ,m.userNo -- 모임장
FROM meeting m , (SELECT mi.meetingno
                        ,COUNT(mi.dogno) as dogCount
                  FROM meetinginfo mi ,(SELECT meetingNo
                                        FROM meetinginfo
                                        WHERE userno = 15
                                        GROUP BY meetingNo) minum , meeting me
                  WHERE mi.meetingno = minum.meetingno
                  AND mi.meetingno = me.meetingno
                  GROUP BY mi.meetingno) md , (select  meetingNo 
                                                      ,count(distinct userNo) userCount
                                               from meetingInfo
                                               where meetingNo in(select meetingNo
                                                                  from meetingInfo mi
                                                                  where userNo = 15
                                                                  GROUP BY meetingNo)                                                                 
                                               GROUP BY meetingNo) mu
WHERE m.meetingno = md.meetingno
and  m.meetingno = mu.meetingno
and TO_DATE(SUBSTR(m.meetingdate, 1, 8), 'YY-MM-DD') = TO_DATE('23/11/25', 'YY/MM/DD')
--and m.meetingdate = TO_DATE('23/11/25', 'YY/MM/DD')
and m.status ='T'
ORDER BY m.time asc;


-- 내가 속한 모임의 참여 강아지 수

SELECT mi.meetingno
      ,COUNT(mi.dogno)
FROM meetinginfo mi ,(SELECT meetingNo
                      FROM meetinginfo
                      WHERE userno = 14
                      GROUP BY meetingNo) minum , meeting me
WHERE mi.meetingno = minum.meetingno
AND mi.meetingno = me.meetingno
GROUP BY mi.meetingno
ORDER BY mi.meetingno ASC;

-- 내가 속한 모임의 참여자 수

select  meetingNo, 
        count(distinct userNo) userNo
from meetingInfo
where meetingNo in( select meetingNo
                    from meetingInfo mi
                    where userNo = 14
                    GROUP BY meetingNo     
                   )
GROUP BY meetingNo;        



-- 내가 속한 미팅번호 추출
SELECT meetingNo
       ,userno
FROM meetinginfo
WHERE userno = 14
GROUP BY meetingNo, userNo;



------------------------------------------------------------------------
select   m.meetingNo meetingNo,
			                    m.name name,
			                    m.description description,
			                    to_char(m.meetingDate,'YYYY-MM-DD') meetingDate,
			                    m.time time,
			                    m.maxMember maxMember,
			                    CASE m.small WHEN 'T' THEN '소형'
			                                 ELSE null END as small,
			                    CASE m.medium WHEN 'T' THEN '중형'
			                                 ELSE null END as medium,
			                    CASE m.large WHEN 'T' THEN '대형'
			                                 ELSE null END as large,
			                    m.status status,
			                    m.userNo userNo,
			                    m.trailNo trailNo,
			                    t.spot spot
			            from meeting m, trail t, (  select mi.meetingNo meetingNo,
			                                               mi.userNo userNo
			                                        from meeting m, trail t, meetinginfo mi
			                                        where m.status = 'T'
			                                        and t.trailNo = m.trailNo
			                                        and m.meetingNo = mi.meetingNO
			                                        and mi.userNo = 14			                                        
			                                        group by mi.meetingNo, mi.userNo) mt
			            where m.status = 'T'
			            and t.trailNo = m.trailNo
			            and m.meetingNo = mt.meetingNO
			            order by m.meetingNo;
-----------------------------------------------------------
SELECT m.meetingno   -- 미팅번호
       ,m.name     -- 모임이름
       ,m.time     -- 모임시간
       ,mi.userCount   -- 참여한 인원
       ,m.maxmember    -- 최대참여 인원              -- 참여한 강아지 수도 가져와야겠다
FROM meeting m , (SELECT meetingNo
                         ,COUNT(DISTINCT userno) AS userCount
                          FROM meetinginfo
                          WHERE userno = 14
                          GROUP BY meetingNo) mi
WHERE m.meetingno = mi.meetingno
and m.meetingdate = '23/11/24'
and m.status ='T';


---- 선택
-- 그 리스트중 하나를 선택 할 시 내가 모임장이면 '이 모임으로 산책하시겠습니까?' or 내가 모임장이 아니면 '모임장에게 기록을 요청하세요!' 문구가 출력

-- 전자의 경우 닫기,확인버튼중 확인 클릭 후 강아지리스트가 모임참여강아지리스트로 변경 (토글기능 잠금) 후자의 경우 닫기버튼만 출력

-- 찾을 테이블 (m)meeting , (mi)meetinginfo

-- 보낼 값 userNo, 미팅번호

-- 제한 할 값 

-- 가져올 값  미팅에참여한 강아지들의 번호, 미팅번호

-- 이때 받아온 

SELECT us.userno as userNo
      ,us.name  as userName
      ,do.dogno as dogNo
      ,do.name as dogName
      ,im.orgname as orgName
      ,im.savename as saveName
FROM meetinginfo mi ,users us, dog do, images im
WHERE mi.dogno = do.dogno
and do.userno = us.userno
and do.dogno = im.useno
and im.type = 'dog'
and meetingno = 5;



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



---- 저장
-- 미팅번호가 존재하면 MoWalkLogVo보가 리스트로 생김
-- 이것을 반복문으로 저장 
-- 유저번호는 강아지번호를 통해 강아지 주인의 번호를 넣는다
-- 제목은 모임제목으로 갈 것

            
select  m.meetingNo meetingNo,
			        m.name name,
			        m.description description,
			        to_char(m.meetingDate,'YYYY-MM-DD') meetingDate,
			        m.time time,
			        m.maxMember maxMember,
 			        CASE m.small WHEN 'T' THEN '소형'
                                 ELSE null END as small,
                    CASE m.medium WHEN 'T' THEN '중형'
                                 ELSE null END as medium,
                    CASE m.large WHEN 'T' THEN '대형'
                                 ELSE null END as large,
			        m.status status,
			        m.userNo userNo,
			        m.trailNo trailNo,
			        cm.currentMember currentMember,
			        i.saveName saveName,
			        t.name trailName,
			        t.spot spot,
			        u.name userName
			from meeting m, (select count(*) currentMember
			                from (select  meetingNo,
			                              userNo
			                      from meetinginfo
			                      group by meetingNo, userNo
			                      having meetingNo = 5)
			                ) cm, trail t, images i, users u
			where meetingNo = 5
			and m.trailNo = i.useNo
			and t.trailNo = m.trailNo
			and i.type = 'trail'
			and u.userNo = m.userNo

