

import dao.DeleteDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateDriverServlet")
public class UpdateDriverServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        String adminName = request.getParameter("Adminname");
        String adminId = request.getParameter("adminid");

        if (id != null && !id.isEmpty() && type != null && !type.isEmpty()) {
            try {
                int parsedId = Integer.parseInt(id);
                DeleteDao deleteDao = new DeleteDao();
                String result;

                // Perform the delete operation based on the type
                if ("driver".equalsIgnoreCase(type)) {
                    result = deleteDao.deleteDriver(parsedId);
                } else if ("user".equalsIgnoreCase(type)) {
                    result = deleteDao.deleteUser(parsedId);
                } else {
                    response.sendRedirect("errorPage.jsp?status=invalid_type");
                    return;
                }

                // Redirect to the respective JSP based on type
                String redirectUrl = type.equalsIgnoreCase("driver")
                        ? "driverlist.jsp?Adminname=" + adminName + "&adminid=" + adminId
                        : "UserList.jsp?Adminname=" + adminName + "&adminid=" + adminId;

                // Handle the result of the delete operation
                if ("SUCCESS".equals(result)) {
                    response.sendRedirect(redirectUrl + "&status=success");
                } else if ("NOT_FOUND".equals(result)) {
                    response.sendRedirect(redirectUrl + "&status=not_found");
                } else {
                    response.sendRedirect(redirectUrl + "&status=error");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("errorPage.jsp?status=invalid_id");
            }
        } else {
            response.sendRedirect("errorPage.jsp?status=missing_params");
        }
    }
}
