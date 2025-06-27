import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutUser")
public class LogoutUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the current session, if exists
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate(); // Destroy session
        }

        // Redirect to login page after logout
        response.sendRedirect("UI/login.jsp");
    }
}