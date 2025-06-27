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
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/traveller";
    private static final String JDBC_USER = "root"; // Change to your MySQL username
    private static final String JDBC_PASSWORD = "newpassword"; // Change to your MySQL password
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName(JDBC_DRIVER);

            // Establish connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // SQL query to check user credentials
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // User exists, create session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setMaxInactiveInterval(120);
                // Redirect to welcome.jsp
                response.sendRedirect("UI/welcome.jsp");


            } else {
                // User does not exist, show error message
                out.println("<html><body>");
                out.println("<script>alert('Invalid Username or Password! Please try again.'); window.location='UI/login.jsp';</script>");
                out.println("</body></html>");
            }
        } catch (ClassNotFoundException e) {
            out.println("<html><body>");
            out.println("<script>alert('Error: MySQL Driver not found!'); window.location='login.jsp';</script>");
            out.println("</body></html>");
        } catch (SQLException e) {
            out.println("<html><body>");
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='login.jsp';</script>");
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