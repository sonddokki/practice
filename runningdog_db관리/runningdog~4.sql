SELECT trailno
FROM trail
WHERE status = 'F';

SELECT *
FROM trail;

SELECT
    *
FROM coords
WHERE type = 'trail'
and useno = (SELECT trailno
             FROM trail);