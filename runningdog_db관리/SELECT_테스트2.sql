SELECT * FROM meeting;
-- 미팅의 칼럼 ( 미팅번호, 미팅이름, 모임정보?,모임날짜, 모임시간, 참여최대인원, 소형,중형,대형, 상태, 모임장번호, 산책로번호 ) 
SELECT * FROM meetinginfo;
-- 미팅 인포의 칼럼 ( 미팅참여번호, 미팅번호, 강아지주인번호, 참여된강아지번호 )




-- 산책로 검색 ------------------------
select * FROM trail;
select * FROM users;
select * FROM walklog;

select * 
FROM images im ,trail tr
where type = 'trail'
and tr.trailno = im.useno;


select  t.trailNo trailNo,
			        t.name name,
			        t.spot spot,
			        t.distance distance,
			        t.eta eta,
			        i.saveName saveName
			from trail t, images i
			where t.status = 'T'
			and t.trailNo = i.useNo
			and i.type = 'trail'
            and t.name like '%' || trim('') || '%';
            

--------------------------
SELECT *
FROM trail tr, coords co
where co.type = 'trail'
and tr.locationno = 1174010900
ORDER BY co.coordno asc
, co.coordorder asc;

SELECT *
FROM trail
WHERE locationno = 1174010900;

SELECT ort.trailNo
       ,ort.name
       ,ort.distance
       ,ort.eta
       ,ort.regDate
  FROM (SELECT ROWNUM rn
               ,ot.trailNo
               ,ot.name
               ,ot.distance
               ,ot.eta
               ,ot.regDate
          FROM (SELECT t.trailNo
                       ,t.name
                       ,t.distance
                       ,t.eta
                       ,TO_CHAR(t.regdate, 'YYYY-MM-DD') regDate
                       FROM coords c, trail t      
                       ) ot ) ort
                        WHERE ort.rn >= 1
                        AND ort.rn <= 10;
                        
                        
SELECT * FROM trail;    -- 내가걸은 좌표번호랑 동네번호로 3개 가져오기        