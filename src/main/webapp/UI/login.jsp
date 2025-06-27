<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("username") != null) {
        response.sendRedirect("welcome.jsp"); // Redirect already logged-in users
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Center the login card */
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Medium-sized card */
        .card {
            width: 50%;
            max-width: 500px;
            transition: transform 0.3s ease-in-out;
        }
        body {
                   background: linear-gradient(to right, #007bff, #00c6ff);
                   color: white;
               }

        .card:hover {
            transform: scale(1.05);
        }

        /* Button animation */
        .btn-success, .btn-primary {
            transition: transform 0.3s ease-in-out;
        }

        .btn-success:hover, .btn-primary:hover {
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <div class="container login-container">
        <div class="card shadow-lg p-4">
            <div class="card-header bg-success text-white text-center">
                <h2>Login</h2>
            </div>
            <div class="card-body">
                <form action="/E-Ticketing_System/LoginServlet" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Login</button>
                </form>
                <hr>
                <div class="text-center">
                    <p>New user? Register here:</p>
                    <a href="register.jsp" class="btn btn-primary w-100">Register</a>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>