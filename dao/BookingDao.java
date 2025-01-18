package dao;

import Transaction.bean.Booking;
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import util.DBConnection;

public class BookingDao {
    public int BookingID = 0;

    public String makeBooking(Booking B) {
        int userID = B.getUserID();
        String pickup = B.getPickup();
        String destination = B.getDestination();
        String dateString = B.getBookingDate(); // Input date as a String
        String status=B.getPaymentStatus();

        Connection con = null;
        Statement statement = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        try {
            // Convert the date string into a LocalDate
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate localDate = LocalDate.parse(dateString, formatter);

            // Convert LocalDate into java.sql.Date
            java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);

            con = DBConnection.createConnection(); // Fetch database connection object
            statement = con.createStatement(); // Statement is used to write queries.
            rs = statement.executeQuery("SELECT * FROM Booking");

            while (rs.next()) {
                BookingID = rs.getInt("BookingID");
            }

            BookingID++;

            // Use the converted sqlDate in the prepared statement
            preparedStatement = con.prepareStatement(
                "INSERT INTO Booking (BookingID, UserID, Pickup, Destination, BookingDate,PaymentStatus) VALUES (?, ?, ?, ?, ?,?)"
            );
            preparedStatement.setInt(1, BookingID);
            preparedStatement.setInt(2, userID);
            preparedStatement.setString(3, pickup);
            preparedStatement.setString(4, destination);
            preparedStatement.setDate(5, sqlDate); // Pass java.sql.Date here
            preparedStatement.setString(6, status);
            
            preparedStatement.executeUpdate();
            con.close();
            return "LIKE";
        } catch (SQLException e) {
            e.printStackTrace();
            return "FAILED";
        } catch (Exception e) {
            e.printStackTrace();
            return "INVALID_DATE_FORMAT";
        }
    }
}
