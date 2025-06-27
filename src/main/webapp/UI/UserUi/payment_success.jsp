<%@ page import="java.io.*, java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%
    String transactionId = request.getParameter("transactionId");
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    String DB_URL = "jdbc:mysql://localhost:3306/traveller";
    String DB_USER = "root";
    String DB_PASS = "Java@123";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

        String query = "SELECT * FROM bus_bookings WHERE transaction_id = ?";
        pst = conn.prepareStatement(query);
        pst.setString(1, transactionId);
        rs = pst.executeQuery();

        if (rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .receipt-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            width: 400px;
            text-align: center;
        }
        .receipt-header {
            background: #007bff;
            color: white;
            padding: 10px;
            font-size: 20px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .receipt-content p {
            font-size: 16px;
            padding: 5px 0;
        }
        .download-btn {
            background: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .download-btn:hover {
            background: #218838;
        }
    </style>
</head>
<body>
    <div class="receipt-container">
        <div class="receipt-header">Payment Receipt</div>
        <div class="receipt-content">
            <p><strong>Transaction ID:</strong> <%= rs.getString("transaction_id") %></p>
            <p><strong>Username:</strong> <%= rs.getString("username") %></p>
            <p><strong>Email:</strong> <%= rs.getString("email") %></p>
            <p><strong>Source:</strong> <%= rs.getString("source") %></p>
            <p><strong>Destination:</strong> <%= rs.getString("destination") %></p>
            <p><strong>Travel Date:</strong> <%= rs.getString("travel_date") %></p>
            <p><strong>Bus Type:</strong> <%= rs.getString("bus_type") %></p>
            <p><strong>Seat Number:</strong> <%= rs.getInt("seat_number") %></p>
            <p><strong>Payment Status:</strong> <%= rs.getString("payment_status") %></p>

            <form action="/E-Ticketing_System/DownloadReceiptServlet" method="post">
                <input type="hidden" name="transactionId" value="<%= rs.getString("transaction_id") %>">
                <button type="submit" class="download-btn">Download Receipt</button>
            </form>
        </div>
    </div>
</body>
</html>
<%
        } else {
            out.println("<h2>Invalid Transaction ID</h2>");
        }
    } catch (Exception e) {
        out.println("<h2>Error Occurred: " + e.getMessage() + "</h2>");
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
%>