	DELIMITER //
CREATE PROCEDURE UpdateBooking(IN BookingID INT, IN Date DATETIME) BEGIN
UPDATE Bookings SET Date = Date WHERE BookingID = BookingID;
END;

//
DELIMITER ;

CALL UpdateBooking(5, '2023-01-03 16:00:00');