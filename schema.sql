DROP DATABASE IF EXISTS carDealership;

CREATE DATABASE carDealership;

USE carDealership;

CREATE TABLE `dealerships`(
	`dealership_id` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50),
    `address` VARCHAR(50),
    `phone` VARCHAR(12)
);

CREATE TABLE vehicles (
    VIN VARCHAR(18) PRIMARY KEY,
    make VARCHAR(30),
    model VARCHAR(30),
    year INT,
    price DECIMAL(10, 2),
    SOLD BOOLEAN DEFAULT FALSE
);



CREATE TABLE `inventory` (
 `dealership_id` INTEGER,
 `VIN` VARCHAR(18),
    PRIMARY KEY (`dealership_id`, `VIN`),
    FOREIGN KEY (`dealership_id`) REFERENCES dealerships(`dealership_id`),
    FOREIGN KEY (`VIN`) REFERENCES vehicles(`VIN`)
);

CREATE TABLE `sales_contracts`(
`sales_id` INTEGER AUTO_INCREMENT PRIMARY KEY,
`VIN` VARCHAR(18),
`buyerName` VARCHAR(50),
`salesPrice` DECIMAL(10, 2),
`dateSold` DATE,
FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO dealerships (name, address, phone) VALUES
('Prime Auto', '123 Main St', '555-123-4567'),
('Speedy Motors', '456 Elm Rd', '555-987-6543'),
('Value Wheels', '789 Oak Ave', '555-222-3333');

INSERT INTO vehicles (VIN, make, model, year, price, SOLD) VALUES
('1HGCM82633A123456', 'Honda', 'Accord', 2010, 18500.00, TRUE),
('2T1BURHE4JC567890', 'Toyota', 'Corolla', 2018, 22000.00, TRUE),
('3FAHP0HA6AR345678', 'Ford', 'Fusion', 2012, 19950.00, FALSE);


INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A123456'),
(2, '2T1BURHE4JC567890'),
(1, '3FAHP0HA6AR345678');

INSERT INTO sales_contracts (VIN, buyerName, salesPrice, dateSold)
VALUES 
('1HGCM82633A123456', 'Alice Johnson', 18500.00, '2025-06-01'),
('2T1BURHE4JC567890', 'Brian Lee', 22000.00, '2025-06-03');


INSERT INTO sales_contracts (VIN, buyerName, salesPrice, dateSold)
VALUES ('3FAHP0HA6AR345678', 'Cynthia Torres', 19950.00, '2025-06-05');


SHOW TABLES;
