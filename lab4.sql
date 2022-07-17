/* 1 */

SELECT *
FROM dealer CROSS JOIN client;

SELECT dealer.id, dealer.name, client.name, client.city, client.priority, sell.id, sell.date, sell.amount
FROM dealer INNER JOIN client ON dealer.id = client.dealer_id
INNER JOIN sell ON client.id = sell.client_id;

SELECT dealer.name, client.name
FROM dealer INNER JOIN client ON dealer.location = client.city;

SELECT sell.id, sell.amount, client.name, client.city
FROM sell INNER JOIN client ON sell.client_id = client.id AND amount BETWEEN 100 AND 500;

SELECT dealer.id, dealer.name, client.id, client.name
FROM dealer INNER JOIN client ON dealer.id = client.dealer_id;

SELECT client.name, client.city, dealer.name, dealer.charge
FROM dealer INNER JOIN client ON dealer.id = client.dealer_id;

SELECT client.name, client.city, dealer.id, dealer.name, dealer.charge
FROM dealer INNER JOIN client ON dealer.id = client.dealer_id AND dealer.charge > 0.12;

SELECT client.id, client.name, client.city, sell.id, sell.date, sell.amount, dealer.name, dealer.charge
FROM client LEFT JOIN dealer ON client.dealer_id = dealer.id
LEFT JOIN sell ON client.id = sell.client_id;

SELECT
client.name, client.priority, dealer.name, sell.id, sell.amount
FROM client INNER JOIN dealer ON client.dealer_id = dealer.id
LEFT JOIN sell ON client.id = sell.client_id
WHERE sell.amount > 2000 AND client.priority != NULL;




/* 2 */

SELECT date, COUNT(client.id), AVG(amount), SUM(amount)
FROM sell
GROUP BY date;

SELECT date, SUM(amount)
FROM sell
ORDER BY SUM(amount) DESC
LIMIT 5
GROUP BY date;

SELECT dealer.id, dealer.name, COUNT(dealer.id), AVG(amount), SUM(amount)
FROM sell
GROUP BY dealer.id;

SELECT sell.dealer.id, SUM(sell.amount) * dealer.charge
FROM dealer INNER JOIN sell ON dealer.id = sell.dealer.id
GROUP BY dealer.location;

SELECT COUNT(dealer.location), AVG(sell.amount),  SUM(sell.amount)
FROM dealer INNER JOIN sell ON dealer.id = sell.dealer.id
GROUP BY dealer.location;

SELECT COUNT(client.city), AVG(sell.amount), SUM(sell.amount)
FROM client INNER JOIN sell ON client.id = sell.client.id
GROUP BY client.city;

SELECT COUNT(client.city), AVG(sell.amount), SUM(sell.amount)
FROM client INNER JOIN sell ON client.id = sell.client.id
GROUP BY client.city;

