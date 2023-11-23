SELECT * 
FROM walkLog
ORDER BY walklogno DESC;


-- 업데이트문
SELECT * FROM walkLog;
SELECT * FROM trail;

-- 거리 넣기
UPDATE walkLog
SET distance = 198
WHERE walklogno = 286;

-- 시간 넣기
UPDATE walkLog
SET logtime = 198
WHERE walklogno = 286;

UPDATE walkLog
SET title = '산책을 합시다.'
WHERE walklogno = 296;

SELECT * FROM walkLog
WHERE walklogno = 286;
--------------------------------------------------- 전체쿼리

UPDATE walkLog
SET title = '산책을 합시다',
    logtime = 111,
    distance = 42
WHERE walklogno = 286;




