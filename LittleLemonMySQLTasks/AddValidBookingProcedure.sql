	DELIMITER //
CREATE PROCEDURE AddValidBooking(IN Date DATETIME, IN TableNumber INT) BEGIN
START TRANSACTION;
SELECT Date, TableNumber FROM Bookings
WHERE EXISTS (SELECT * FROM Bookings WHERE Date = Date and TableNumber = TableNumber);
INSERT INTO Bookings (Date, TableNumber) VALUES (Date, TableNumber);
COMMIT;
END;

//
DELIMITER ;

CALL AddValidBooking ('2022-11-12',3)