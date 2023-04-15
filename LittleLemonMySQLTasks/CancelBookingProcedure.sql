	DELIMITER //
CREATE PROCEDURE CancelBooking(IN BookingID INT) BEGIN
DELETE FROM Bookings WHERE BookingID = BookingID;
END;

//
DELIMITER ;

CALL CancelBooking(4);