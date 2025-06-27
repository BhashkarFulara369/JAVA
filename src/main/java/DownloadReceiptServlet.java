import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet("/DownloadReceiptServlet")
public class DownloadReceiptServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/traveller?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "newpassword";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String transactionId = request.getParameter("transactionId");

        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String query = "SELECT * FROM bus_bookings WHERE transaction_id = ?";
            pst = conn.prepareStatement(query);
            pst.setString(1, transactionId);
            rs = pst.executeQuery();

            if (rs.next()) {
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=receipt_" + transactionId + ".pdf");

                Document document = new Document();
                PdfWriter.getInstance(document, response.getOutputStream());
                document.open();

                Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD);

                document.add(new Paragraph("Payment Receipt", boldFont));
                document.add(new Paragraph("Transaction ID: " + rs.getString("transaction_id")));
                document.add(new Paragraph("Username: " + rs.getString("username")));
                document.add(new Paragraph("Email: " + rs.getString("email")));
                document.add(new Paragraph("Source: " + rs.getString("source")));
                document.add(new Paragraph("Destination: " + rs.getString("destination")));
                document.add(new Paragraph("Travel Date: " + rs.getString("travel_date")));
                document.add(new Paragraph("Bus Type: " + rs.getString("bus_type")));
                document.add(new Paragraph("Seat Number: " + rs.getInt("seat_number")));
                document.add(new Paragraph("Payment Status: " + rs.getString("payment_status")));

                document.close();
            } else {
                response.getWriter().println("Invalid Transaction ID");
            }
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}


