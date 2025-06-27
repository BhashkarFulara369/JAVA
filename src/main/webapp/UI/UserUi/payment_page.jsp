<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.Random" %>
<%
    Random rand = new Random();
    int ticketPrice = rand.nextInt(500) + 300;  // Generates price between 300 and 800

    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String source = request.getParameter("source");
    String destination = request.getParameter("destination");
    String travelDate = request.getParameter("travelDate");
    String busType = request.getParameter("busType");
    String seatNumber = request.getParameter("seatNumber");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 500px;
            background: white;
            padding: 20px;
            margin-top: 50px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.2);
            text-align: center;
        }
        .price-list {
            margin-top: 20px;
        }
        .price-item {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
        .btn-success {
            transition: 0.3s ease-in-out;
        }
        .btn-success:hover {
            background-color: #218838;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-3">Scan QR to Pay</h2>
        <img src="./images/qr-code.jpeg" alt="Google Pay QR Code" width="250">

        <!-- Show Generated Ticket Price -->
        <div class="mt-3">
            <h4>Your Ticket Price: ₹<%= ticketPrice %></h4>
        </div>

        <!-- Price List -->
        <div class="price-list">
            <h5>Estimated Prices for Different Bus Types:</h5>
            <div class="price-item"><span>Standard Bus</span> <span>₹300 - ₹500</span></div>
            <div class="price-item"><span>Semi-Luxury Bus</span> <span>₹500 - ₹700</span></div>
            <div class="price-item"><span>Luxury Bus</span> <span>₹700 - ₹1000</span></div>
        </div>

        <!-- Payment Form -->
        <form action="/E-Ticketing_System/PaymentSuccessServlet" method="POST" onsubmit="return confirmPayment()">
            <input type="hidden" name="username" value="<%= username %>">
            <input type="hidden" name="email" value="<%= email %>">
            <input type="hidden" name="source" value="<%= source %>">
            <input type="hidden" name="destination" value="<%= destination %>">
            <input type="hidden" name="travelDate" value="<%= travelDate %>">
            <input type="hidden" name="busType" value="<%= busType %>">
            <input type="hidden" name="seatNumber" value="<%= seatNumber %>">
            <input type="hidden" name="ticketPrice" value="<%= ticketPrice %>">

            <button type="submit" class="btn btn-success mt-3">Confirm Payment</button>
        </form>
    </div>

    <script>
        function confirmPayment() {
            return confirm("Are you sure you want to proceed with payment?");
        }
    </script>
</body>
</html>