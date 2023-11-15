         
INSERT INTO walkLog
VALUES (3,    -- 산책일지번호 walkLogNo
        99,     -- 회원번호 userNo
        111,    -- 동네번호 locationNo
        11111, -- 모임번호 meetingNo
        SYSDATE, -- 작성시간 regDate
        SYSDATE, -- 시작시간 startTime
        SYSDATE, -- 종료시간 endTime
        SYSDATE, -- 소요시간 logTime
        15, -- 거리 distance
        '내용을 적어주세요', -- 내용 content
        '공개', -- 공개여부 security
        'T' -- 상태 status
        );

INSERT INTO walkedDog
VALUES (seq_walkeddog_no.NEXTVAL,    -- 산책한강아지번호 walkedDogNo 일렬번호
        1,     -- 산책일지번호 walkLogNo 셀렉트키
        1    -- 강아지번호 dogNo       
        );


INSERT INTO coords (coordNo, coordOrder, type, useNo, lng, lat) 
VALUES (seq_coords_no.NEXTVAL, -- 좌표일렬번호
        1,  -- 좌표 순서
        'walkLog', --사용처타입
        1,  --  셀렉트키
        127.1252811, -- lng
        37.5436749 -- lat
        );
        
-- 이미지







INSERT INTO walkLog
VALUES (22,    -- 산책일지번호 walkLogNo
        99,     -- 회원번호 userNo
        1174010900,    -- 동네번호 locationNo
        null, -- 모임번호 meetingNo
        SYSDATE, -- 작성시간 regDate
        '1111', -- 시작시간 startTime
        '1111', -- 종료시간 endTime
        '1111', -- 소요시간 logTime
        15, -- 거리 distance
        null, -- 내용 content
        '공개', -- 공개여부 security
        'T' -- 상태 status
        ); 
        
        
INSERT INTO walkLog
VALUES (14,    -- 산책일지번호 walkLogNo
        1,     -- 회원번호 userNo
        1174010900,    -- 동네번호 locationNo
        null, -- 모임번호 meetingNo
        SYSDATE, -- 작성시간 regDate
        '2023-11-14T01:18', -- 시작시간 startTime
        '2023-11-14T01:18', -- 종료시간 endTime
        '00:00:03', -- 소요시간 logTime
        '0', -- 거리 distance
        null, -- 내용 content
        '공개', -- 공개여부 security
        'T' -- 상태 status
        ); 
           
        
walkLogNo=0, 
userNo=1, 
regDate=null, 
startTime=2023-11-14T01:18, 
endTime=2023-11-14T01:18, 
logTime=00:00:03, 
distance=0, 
content=null, 
security=null, 
status=

-- 최종 확인본 11/14
INSERT INTO walkLog
VALUES (1,    -- 산책일지번호 walkLogNo
        99,     -- 회원번호 userNo
        1174010900,    -- 동네번호 locationNo
        null, -- 모임번호 meetingNo
        '제목',
        SYSDATE, -- 작성시간 regDate
        to_date('2023-11-04 03:28','YYYY/MM/DD HH:MI'), -- 시작시간 startTime 2023-11-14T03:28
        to_date('2023-11-05 03:28','YYYY/MM/DD HH:MI'), -- 종료시간 endTime
        3560, -- 소요시간 logTime
        15, -- 거리 distance
        '내용을 적어주세요', -- 내용 content
        '공개', -- 공개여부 security
        'T' -- 상태 status
        ); 

INSERT INTO walkLog
		 VALUES (100,  
		         1,
		         1174010900,
                 0,
		         '제목', 
		         SYSDATE,
		         to_date('2023-11-05 12:20','YY-MM-DD HH:MI'),
		         to_date('2023-11-05 12:30','YY-MM-DD HH:MI'),
		         1342,
		         1,
		         null,
		         '공개',
		         'T'
		         );
                 
                 
                 SELECT seq_walkdog_no.nextVal FROM dual    
                 
                 
11/14 확인             
셀렉트키 MoWalkLogVo [walkLogNo=0, 
                    userNo=1, 
                    locationNo=0, 
                    meetingNo=0, 
                    title=null, 
                    regDate=null, 
                    startTime=2023-11-14 08:59, 
                    endTime=2023-11-14 08:59, 
                    logTime=1, 
                    distance=0, 
                    content=null, 
                    security=null, 
                    status= 