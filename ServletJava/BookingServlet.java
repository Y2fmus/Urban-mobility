/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Transaction.bean.Booking;
import dao.BookingDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class BookingServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    String UserID = request.getParameter("UserID");
    String Date = request.getParameter("BookingDate");
    String Pickup = request.getParameter("Pickup");
    String Destination = request.getParameter("Destination");
    String Username=request.getParameter("username");

    // Validate inputs
    if (UserID == null || UserID.isEmpty() || !UserID.matches("\\d+")) {
        System.out.println("Invalid UserID: " + UserID);
        request.setAttribute("errMessage", "Invalid or missing UserID.");
        request.getRequestDispatcher("Payment.html").forward(request, response);
        return; // Stop further execution
    }

    if (Date == null || Date.isEmpty() || Pickup == null || Pickup.isEmpty() || Destination == null || Destination.isEmpty()) {
        System.out.println("Input is empty or null.");
        request.setAttribute("errMessage", "All fields are required.");
        request.getRequestDispatcher("Scedule.html").forward(request, response);
        return; // Stop further execution
    }

    try {
        // Set booking details
        Booking B = new Booking();
        B.setDestination(Destination);
        B.setBookingDate(Date);
        B.setUserID(Integer.parseInt(UserID)); // Safe after validation
        B.setPickup(Pickup);
        B.setPaymentStatus("Pending");

        // Process booking
        BookingDao BD = new BookingDao();
        String check = BD.makeBooking(B);

        if (check.equals("LIKE")) {
            request.setAttribute("Userid",Integer.parseInt(UserID));
            request.setAttribute("Username", Username);
            request.getRequestDispatcher("Booklist.jsp").forward(request, response);
        } else {
            request.setAttribute("errMessage", check);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    } catch (Exception e) {
        // Handle unexpected exceptions
        e.printStackTrace();
        request.setAttribute("errMessage", "An error occurred while processing the booking.");
        request.getRequestDispatcher("UserDashboard.jsp").forward(request, response);
    }
}


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
