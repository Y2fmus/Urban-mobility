package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnection;

public class DeleteDao {

    public String deleteRecord(String tableName, String idColumn, int id) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.createConnection();
            String query = "DELETE FROM " + tableName + " WHERE " + idColumn + " = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0 ? "SUCCESS" : "NOT_FOUND";

        } catch (SQLException e) {
            e.printStackTrace();
            return "ERROR";
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public String deleteDriver(int driverID) {
        return deleteRecord("DRIVER", "DRIVERID", driverID);
    }

    public String deleteUser(int userID) {
        return deleteRecord("USER2", "USERID", userID);
    }
}
