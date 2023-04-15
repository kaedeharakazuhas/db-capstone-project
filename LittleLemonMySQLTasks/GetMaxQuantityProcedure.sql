DELIMITER //
CREATE PROCEDURE GetMaxQuantity() BEGIN
SELECT MAX(quantity)
FROM Orders; END;

//
DELIMITER ;

CALL GetMaxQuantity();
