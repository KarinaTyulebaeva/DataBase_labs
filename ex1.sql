--1.1
SELECT Oi.orderId, SUM(Oi.quant) as totalI, SUM(Oi.quant * I.price) as totalP
FROM "OrderItem" as Oi
JOIN "Item" as I on I.itemId = Oi.itemId GROUP BY Oi.orderId;

--1.2
SELECT C.customerId, SUM(Oi.quant * I.price) as totalP
FROM "Customer" as C
JOIN "OrderItem" as Oi on Oi.customerId = C.customerId
JOIN "Item" as I on I.itemId = Oi.itemId
GROUP BY C.customerId
ORDER BY SUM(Oi.quant * I.price) DESC
LIMIT 1;