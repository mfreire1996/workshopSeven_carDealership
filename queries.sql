SELECT * FROM dealerships;

SELECT * FROM dealerships
WHERE name = 'Prime Auto';

SELECT  * FROM vehicles
WHERE VIN LIKE '1HG%';

SELECT * FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.VIN = v.VIN
WHERE v.make LIKE '%Honda%'
  AND d.address LIKE '%123 Main St%'
  AND v.VIN LIKE '1HG%';

SELECT * FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id 
JOIN vehicles v ON i.VIN = v.VIN
WHERE v.make LIKE 'Ford'
AND v.model = 'Fusion';

SELECT d.name AS dealership_name,
       d.address,
       v.VIN,
       v.make,
       v.model,
       v.year,
       sc.buyerName,
       sc.salesPrice,
       sc.dateSold
FROM sales_contracts sc
JOIN vehicles v ON sc.VIN = v.VIN
JOIN inventory i ON v.VIN = i.VIN
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE d.name = 'Prime Auto' 
  AND sc.dateSold BETWEEN '2025-06-01' AND '2025-06-05';
