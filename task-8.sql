-- Drop existing procedure and function if they exist
DROP PROCEDURE IF EXISTS GetCustomerOrders;
DROP FUNCTION IF EXISTS GetTotalOrders;

-- Stored Procedure

DELIMITER //
CREATE PROCEDURE GetCustomerOrders(IN customerId INT)
BEGIN
    -- Check if customer exists
    IF EXISTS (SELECT 1 FROM Customers WHERE customer_id = customerId) THEN
        SELECT o.order_id, o.order_date, o.amount, c.customer_name
        FROM Orders o
        INNER JOIN Customers c ON o.customer_id = c.customer_id
        WHERE o.customer_id = customerId;
    ELSE
        SELECT CONCAT('Customer ID ', customerId, ' not found.') AS Message;
    END IF;
END //
DELIMITER ;

-- Call procedure
CALL GetCustomerOrders(1);
CALL GetCustomerOrders(999); -- Example for non-existent customer


-- Stored Function

DELIMITER //
CREATE FUNCTION GetTotalOrders(customerId INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    
    -- Calculate total only if customer exists
    IF EXISTS (SELECT 1 FROM Customers WHERE customer_id = customerId) THEN
        SELECT COUNT(*) INTO total
        FROM Orders
        WHERE customer_id = customerId;
    ELSE
        SET total = 0;
    END IF;
    
    RETURN total;
END //
DELIMITER ;

-- Use function
SELECT GetTotalOrders(1) AS TotalOrders;
SELECT GetTotalOrders(999) AS TotalOrders; -- Example for non-existent customer
