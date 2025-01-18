import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditUserProfileServlet")
public class EditUserProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve updated data from the form
        String username = request.getParameter("Username");
        String email = request.getParameter("Email");
        String userPhone = request.getParameter("UserPhone");
        String password = request.getParameter("password");
        String userIdParam = request.getParameter("Userid"); // Userid passed as a hidden field in the form
        int userId = 0;

        try {
            userId = Integer.parseInt(userIdParam);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid user ID.");
            request.getRequestDispatcher("UserProfile2.jsp").forward(request, response);
            return;
        }

        // Debugging: Print received parameters
        System.out.println("Data received:");
        System.out.println("Username: " + username);
        System.out.println("Email: " + email);
        System.out.println("UserPhone: " + userPhone);
        System.out.println("Password: " + password);
        System.out.println("Userid: " + userId);

        // SQL update query
        String updateQuery = "UPDATE APP.USER2 SET Username = ?, Email = ?, UserPhone = ?, password = ? WHERE Userid = ?";

        // Database connection details
        String dbUrl = "jdbc:derby://localhost:1527/Transport2";
        String dbUser = "app";
        String dbPassword = "app";

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
             PreparedStatement ps = connection.prepareStatement(updateQuery)) {

            // Set parameters for the prepared statement
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, userPhone);
            ps.setString(4, password);
            ps.setInt(5, userId);

            // Execute the update query
            int rowsUpdated = ps.executeUpdate();
            System.out.println("Rows updated: " + rowsUpdated); // Debugging

            if (rowsUpdated > 0) {
                // Successful update
                request.setAttribute("Userid", userIdParam);
                request.setAttribute("Username", username);
                request.getRequestDispatcher("UserProfile2.jsp").forward(request,response);
            } else {
                // No rows updated (Userid might not exist)
                
                request.setAttribute("errorMessage", "No user found with the provided ID.");
                request.getRequestDispatcher("UserProfile2.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            // Handle SQL exceptions
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("UserProfile2.jsp").forward(request, response);
        }
    }
}
