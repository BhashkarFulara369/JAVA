import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PaymentSuccessServlet")
public class PaymentSuccessServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/traveller";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "newpassword";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String transactionId = UUID.randomUUID().toString();
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String travelDate = request.getParameter("travelDate");
        String busType = request.getParameter("busType");
        String seatNumber = request.getParameter("seatNumber");

        Connection conn = null;
        PreparedStatement pst = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String query = "INSERT INTO bus_bookings (transaction_id, username, email, source, destination, travel_date, bus_type, seat_number, payment_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pst = conn.prepareStatement(query);
            pst.setString(1, transactionId);
            pst.setString(2, username);
            pst.setString(3, email);
            pst.setString(4, source);
            pst.setString(5, destination);
            pst.setString(6, travelDate);
            pst.setString(7, busType);
            pst.setInt(8, Integer.parseInt(seatNumber));
            pst.setString(9, "Completed");

            int result = pst.executeUpdate();

            if (result > 0) {
                response.sendRedirect("UI/UserUi/payment_success.jsp?transactionId=" + transactionId);
            } else {
                response.getWriter().println("<h2>Payment Failed! Please try again.</h2>");
            }
        } catch (Exception e) {
            response.getWriter().println("<h2>Error Occurred: " + e.getMessage() + "</h2>");
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
