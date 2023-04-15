	DELIMITER //
CREATE PROCEDURE AddBooking(IN BookingID INT, IN Date DATETIME, IN TableNumber INT, IN CustomerID INT) BEGIN
INSERT INTO Bookings (BookingID, Date, TableNumber, CustomerID) VALUES (BookingID, Date, TableNumber, CustomerID);
END;

//
DELIMITER ;

CALL AddBooking(11, '2023-01-03 12:00:00', 3, 4);