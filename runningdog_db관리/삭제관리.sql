-- 

-- 테이블의 모든 데이터 삭제
truncate table 테이블이름A;
truncate table images;
truncate table users;
truncate table dog;
truncate table coords;
truncate table walkLog;
truncate table walkedDog;
truncate table meeting;
truncate table meetingInfo;
truncate table friend;
truncate table walklogcmt;
truncate table club;
truncate table trailcmt;


truncate table trailstar;
truncate table trailtag;
truncate table trailused;


truncate table trailcmt;
truncate table trailcmt;
truncate table trailcmt;

DELETE FROM coords
WHERE type = 'walkLog'
and useno = 12;



UPDATE your_table
SET
walkLog = '새로운 A 값',
column_b = '새로운 B 값';
