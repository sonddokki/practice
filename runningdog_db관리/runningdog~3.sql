SELECT * FROM meeting;

SELECT * FROM trail;

SELECT * FROM walklog
ORDER BY walklogno DESC;

SELECT * FROM coords
ORDER BY coordno DESC;

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
        
UPDATE images
SET type = 'trail'
WHERE type = 'trailMap';
        
        
SELECT * FROM coords
WHERE type = 'trail'
and useno < 20;

DELETE FROM coords
WHERE type = 'trail'
and useno <= 20;

SELECT * FROM trail;

SELECT
    *
FROM walkLog wa ,trailused tu
where wa.walklogno = tu.walklogno
and tu.trailno = 39
ORDER BY wa.walkLogNo ASC;