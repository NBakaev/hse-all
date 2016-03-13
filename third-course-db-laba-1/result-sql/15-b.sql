
SELECT * from (
SELECT detail, count(*) bought_times from orders WHERE supplier IN (SELECT id from supplier WHERE address = 'Советский' ) GROUP BY detail) P
WHERE P.bought_times > 3