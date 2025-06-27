import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/traveller?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String JDBC_USER = "root"; // Change to your MySQL username
    private static final String JDBC_PASSWORD = "newpassword"; // Change to your MySQL password
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        // Get current username from session
        String currentUsername = (String) session.getAttribute("username");

        // Get updated form data
        String newUsername = request.getParameter("newUsername");
        String newEmail = request.getParameter("newEmail");
        String newDob = request.getParameter("newDob");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName(JDBC_DRIVER);

            // Establish connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Update user details in the database
            String updateQuery = "UPDATE users SET username = ?, email = ?, dob = ? WHERE username = ?";
            pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, newUsername.isEmpty() ? currentUsername : newUsername); // Keep old username if empty
            pstmt.setString(2, newEmail.isEmpty() ? "" : newEmail);
            pstmt.setString(3, newDob.isEmpty() ? "" : newDob);
            pstmt.setString(4, currentUsername);

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                // Update session with new username if changed
                if (!newUsername.isEmpty()) {
                    session.setAttribute("username", newUsername);
                }

                // Show animated success popup and redirect
                out.println("<html><head>");
                out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css' rel='stylesheet'>");
                out.println("<style>");
                out.println(".popup { position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2); text-align: center; animation: fadeIn 0.5s ease-in-out; }");
                out.println(".popup i { font-size: 50px; color: green; }");
                out.println("@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }");
                out.println("</style>");
                out.println("</head><body>");
                out.println("<div class='popup'>");
                out.println("<i class='fas fa-check-circle'></i>");
                out.println("<h3>Profile Updated Successfully!</h3>");
                out.println("</div>");
                out.println("<script>");
                out.println("setTimeout(function() { window.location='/E-Ticketing_System/index.jsp'; }, 2000);"); // Redirect after 2 seconds
                out.println("</script>");
                out.println("</body></html>");
            } else {
                out.println("<script>alert('Profile update failed! Please try again.'); window.location='profile.jsp';</script>");
            }
        } catch (ClassNotFoundException e) {
            out.println("<script>alert('Error: MySQL Driver not found!'); window.location='profile.jsp';</script>");
        } catch (SQLException e) {
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='profile.jsp';</script>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}