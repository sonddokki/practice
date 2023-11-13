         
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
VALUES (12,    -- 산책일지번호 walkLogNo
        99,     -- 회원번호 userNo
        1174010900,    -- 동네번호 locationNo
        null, -- 모임번호 meetingNo
        SYSDATE, -- 작성시간 regDate
        '1111', -- 시작시간 startTime
        '1111', -- 종료시간 endTime
        '1111', -- 소요시간 logTime
        15, -- 거리 distance
        '내용을 적어주세요', -- 내용 content
        '공개', -- 공개여부 security
        'T' -- 상태 status
        ); 