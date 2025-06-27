import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/traveller";
    private static final String JDBC_USER = "root"; // Change to your MySQL username
    private static final String JDBC_PASSWORD = "newpassword"; // Change to your MySQL password
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get form data
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName(JDBC_DRIVER);

            // Establish connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Check if username or email already exists
            String checkQuery = "SELECT * FROM users WHERE username = ? OR email = ?";
            pstmt = conn.prepareStatement(checkQuery);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                out.println("<html><body>");
                out.println("<script>alert('Username or Email already exists! Please try again.'); window.location='register.jsp';</script>");
                out.println("</body></html>");
            } else {
                // Insert new user
                String insertQuery = "INSERT INTO users (username, email, password, dob) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertQuery);
                pstmt.setString(1, username);
                pstmt.setString(2, email);
                pstmt.setString(3, password);
                pstmt.setString(4, dob);

                int rowsInserted = pstmt.executeUpdate();
                if (rowsInserted > 0) {
                    out.println("<html><body>");
                    out.println("<script>");
                    out.println("setTimeout(function() {");
                    out.println("    alert('Registration Successful!');");
                    out.println("    window.location='UI/login.jsp';");
                    out.println("}, 500);"); // Delay for animation effect
                    out.println("</script>");
                    out.println("</body></html>");
                } else {
                    out.println("<html><body>");
                    out.println("<script>alert('Registration Failed! Please try again.'); window.location='register.jsp';</script>");
                    out.println("</body></html>");
                }
            }
        } catch (ClassNotFoundException e) {
            out.println("<html><body>");
            out.println("<script>alert('Error: MySQL Driver not found!'); window.location='register.jsp';</script>");
            out.println("</body></html>");
        } catch (SQLException e) {
            out.println("<html><body>");
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='register.jsp';</script>");
            out.println("</body></html>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}