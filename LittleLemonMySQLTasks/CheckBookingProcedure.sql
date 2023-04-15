	DELIMITER //
CREATE PROCEDURE CheckBooking(IN Date DATETIME, IN TableNumber INT) BEGIN
SELECT Date, TableNumber FROM Bookings
WHERE EXISTS (SELECT * FROM Bookings WHERE Date = Date and TableNumber = TableNumber);
END;

//
DELIMITER ;

CALL CheckBooking ('2022-11-12 13:00:00',3)