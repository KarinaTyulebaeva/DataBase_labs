--1
SELECT S.sname
FROM parts P, suppliers S, catalog C
WHERE P.color = 'Red' AND P.pid = C.pid AND C.sid = S.sid
--2
SELECT C.sid
FROM catalog C, parts P
WHERE (P.color = 'Red' OR P.color = 'Green') AND C.pid = P.pid
--3
SELECT S.sid
FROM catalog C, suppliers S, parts P
WHERE (P.color = 'red' AND C.sid = S.sid AND C.pid = P.pid) OR S.address = '221 Packer Street'
--4
SELECT C.sid
FROM Parts P, Catalog C
WHERE C.pid = P.pid AND (P.color = 'Red' OR P.color = 'Green')
GROUP BY C.sid
HAVING COUNT(*) = (SELECT COUNT(*)
                    FROM parts P
                    WHERE P.color = 'Red' OR P.color = 'Green')
--5
SELECT C.sid
FROM Parts P, Catalog C
WHERE P.color = 'Red' AND C.pid = P.pid
GROUP BY C.sid
HAVING COUNT(*) = (SELECT COUNT(*) FROM parts P WHERE P.color = 'Red')
UNION
SELECT C.sid
FROM Catalog C, Parts P
WHERE P.color = 'Green' AND C.pid = P.pid
GROUP BY C.sid
HAVING COUNT(*) = (SELECT COUNT(*) FROM parts P WHERE P.color = 'Green')
--6
SELECT C1.sid, C2.sid
FROM catalog C1, catalog C2
WHERE C1.pid = C2.pid AND C1.sid != C2.sid AND C1.cost > C2.cost
--7
SELECT C.pid
FROM catalog C, catalog C2
WHERE C.sid != C2.sid AND C.pid = C2.pid
--8
SELECT R.redSid, R.redAvg, G.greenAvg
FROM
    (SELECT C.sid redSid, AVG(C.cost) redAvg
    FROM catalog C, parts P
    WHERE C.pid = P.pid AND (P.color = 'Red')
GROUP BY C.sid) R,
    (SELECT C.sid as greenSid, AVG(C.cost) as greenAvg
    FROM Catalog as C, Parts as P
    WHERE C.pid = P.pid AND (P.color = 'Green')
    GROUP BY C.sid) G
WHERE R.redSid = G.greenSid
--9
SELECT C.sid
FROM catalog C
GROUP BY C.sid HAVING MAX(C.cost) >= 50



