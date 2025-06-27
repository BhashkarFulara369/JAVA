<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Page Background */
        body {
            background: linear-gradient(to right, #007bff, #00c6ff);
            color: white;
        }

        /* Card Styling */
        .profile-card {
            background: white;
            color: black;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
        }

        .profile-card:hover {
            transform: scale(1.02);
        }

        /* Button Animation */
        .btn-primary {
            transition: transform 0.3s ease-in-out;
        }

        .btn-primary:hover {
            transform: scale(1.05);
        }

        /* Input Field Hover Effect */
        .form-control:hover {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
        }

        /* Section Titles */
        .section-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="text-center">
            <h2 class="fw-bold"><i class="fas fa-user"></i> Manage Profile</h2>
            <p>Update your profile details below.</p>
        </div>

        <%
            // Fetch user data from the database
            String username = (String) session.getAttribute("username");
            String email = "";
            String dob = "";

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/traveller", "root", "Java@123");

                String query = "SELECT email, dob FROM users WHERE username = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    email = rs.getString("email");
                    dob = rs.getString("dob");
                }
            } catch (Exception e) {
                out.println("<p class='text-danger'>Error fetching user data: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>

        <form action="/E-Ticketing_System/ProfileServlet" method="post">
            <div class="row mt-4">
                <!-- User Details Section -->
                <div class="col-md-6">
                    <div class="profile-card">
                        <h3 class="section-title"><i class="fas fa-user"></i> Current User Details</h3>
                        <div class="mb-3">
                            <label for="currentUsername" class="form-label">Current Username</label>
                            <input type="text" class="form-control" id="currentUsername" name="currentUsername" value="<%= username %>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="dob" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" id="dob" name="dob" value="<%= dob %>" required>
                        </div>
                    </div>
                </div>

                <!-- Update Profile Section -->
                <div class="col-md-6">
                    <div class="profile-card">
                        <h3 class="section-title"><i class="fas fa-edit"></i> Update Profile</h3>
                        <div class="mb-3">
                            <label for="newUsername" class="form-label">New Username</label>
                            <input type="text" class="form-control" id="newUsername" name="newUsername">
                        </div>
                        <div class="mb-3">
                            <label for="newEmail" class="form-label">New Email</label>
                            <input type="email" class="form-control" id="newEmail" name="newEmail">
                        </div>
                        <div class="mb-3">
                            <label for="newDob" class="form-label">New Date of Birth</label>
                            <input type="date" class="form-control" id="newDob" name="newDob">
                        </div>
                        <button type="submit" class="btn btn-primary w-100 mt-3">Update Profile</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>