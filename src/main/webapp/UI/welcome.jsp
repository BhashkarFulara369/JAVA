<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp"); // Redirect unauthorized users
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Page Background */
   body {
       background: linear-gradient(to right, #87CEEB, #00BFFF, #4682B4, #FFFFFF);
       background-size: 400% 400%;
       animation: gradientShift 10s ease infinite;
       color: white;
   }

      @keyframes gradientShift {
          0% { background-position: 0% 50%; }
          50% { background-position: 100% 50%; }
          100% { background-position: 0% 50%; }
      }


        /* Navbar Styling */
        .navbar {
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        /* User Icon Styling */
        .user-icon {
            font-size: 24px;
            color: white;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
        }

        .user-icon:hover {
            transform: scale(1.2);
        }

        /* Dropdown Styling */
        #profileDropdown {
            display: none;
            position: absolute;
            right: 10px;
            background: white;
            border-radius: 5px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            padding: 10px;
            width: 150px;
        }

        #profileDropdown a {
            display: block;
            padding: 8px 12px;
            color: black;
            text-decoration: none;
            transition: background 0.3s ease-in-out;
        }

        #profileDropdown a:hover {
            background: #f0f0f0;
        }

        /* Logout Button Styling */
        #logoutLink {
            color: red !important;
            font-weight: bold;
        }

        #logoutLink:hover {
            background: #ffdddd !important;
        }

        /* Card Animation */
        .card {
            transition: transform 0.3s ease-in-out;
        }

        .card:hover {
            transform: scale(1.02);
        }

        /* Button Animation */
        .btn-primary {
            transition: transform 0.3s ease-in-out;
        }

        .btn-primary:hover {
            transform: scale(1.05);
        }

    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="welcome.jsp">🏠 Home</a>

            <span class="navbar-text mx-auto fs-4 fw-bold text-white">
                Welcome, <%= session.getAttribute("username") %>
            </span>

            <!-- User Icon with Dropdown -->
            <div class="position-relative">
                <i class="fas fa-user-circle user-icon" id="userIcon"></i>
                <div id="profileDropdown" class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="UserUi/manage_profile.jsp">Manage Profile</a>
                    <a class="dropdown-item" id="logoutLink" href="logout.jsp">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- User Dashboard -->
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <div class="card-header bg-success text-white">
                <h2>Welcome, <%= session.getAttribute("username") %></h2>
            </div>
            <div class="card-body">
                <p>You have successfully logged in.</p>
            </div>
        </div>
    </div>

    <!-- Booking Options -->
    <div class="container mt-5">
        <h3 class="text-center fw-bold">Book Your Journey</h3>
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <img src="res/icons/bus2.png" class="card-img-top" alt="Bus">
                    <div class="card-body text-center">
                        <h5 class="card-title">Bus Booking</h5>
                        <a href="UserUi/busBooking.jsp" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <img src="res/icons/train.png" class="card-img-top" alt="Train">
                    <div class="card-body text-center">
                        <h5 class="card-title">Train Booking</h5>
                        <a href="UserUi/trainBooking.jsp" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <img src="res/icons/airplane.png" class="card-img-top" alt="Flight">
                    <div class="card-body text-center">
                        <h5 class="card-title">Flight Booking</h5>
                        <a href="UserUi/flightBooking.jsp" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <img src="res/icons/shuttle.png" class="card-img-top" alt="Space Travel">
                    <div class="card-body text-center">
                        <h5 class="card-title">Space Travel</h5>
                       <a class="btn btn-primary">Coming Soon!</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--History -->

        <div class="booking-history">
            <h2>Booking History</h2>
            <table class="history-table">
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Transport Mode</th>
                        <th>Destination</th>
                        <th>Date</th>
                        <th>Seat/Coach/Class</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#101</td>
                        <td>Flight</td>
                        <td>New York</td>
                        <td>2025-05-30</td>
                        <td>Business Class</td>
                        <td class="confirmed">Confirmed</td>
                    </tr>
                    <tr>
                        <td>#102</td>
                        <td>Train</td>
                        <td>London</td>
                        <td>2025-06-15</td>
                        <td>A1</td>
                        <td class="pending">Pending</td>
                    </tr>
                    <tr>
                        <td>#103</td>
                        <td>Bus</td>
                        <td>Los Angeles</td>
                        <td>2025-07-10</td>
                        <td>Seat 12</td>
                        <td class="cancelled">Cancelled</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!--History Styles -->
    <style>


    /* Booking History Container */
    .booking-history {
        background: white;
        padding: 20px;
        border-radius: 10px;
        text-align: center;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        max-width: 80%;
        margin: 40px auto;
    }

    /* History Table Styling */
    .history-table {
        width: 100%;
        border-collapse: collapse;
    }

    .history-table th, .history-table td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: center;
    }

    .history-table th {
        background-color:#006bff;
        color: white;
    }

    /* Booking Status Colors */
    .confirmed {
        color: #28a745;
        font-weight: bold;
    }

    .pending {
        color: #ffc107;
        font-weight: bold;
    }

    .cancelled {
        color: #dc3545;
        font-weight: bold;
    }

    /* Hover Effect */
    .history-table tr:hover {
        background-color: rgba(0, 123, 255, 0.1);
        transition: 0.3s ease-in-out;
    }
    </style>



  <!-- Footer -->
  <footer class="bg-primary text-white text-center py-5">
      <div class="container">
          <div class="row">
              <!-- About Section -->
              <div class="col-md-3">
                  <h5 class="fw-bold">About Us</h5>
                  <p>We provide seamless ticket booking for buses, trains, flights, and even space travel!</p>
              </div>

              <!-- Services Section -->
              <div class="col-md-3">
                  <h5 class="fw-bold">Our Services</h5>
                  <ul class="list-unstyled">
                      <li><a href="/E-Ticketing_System/index.jsp" class="footer-link">Bus Booking</a></li>
                      <li><a href="#" class="footer-link">Train Booking</a></li>
                      <li><a href="#" class="footer-link">Flight Booking</a></li>
                      <li><a href="#" class="footer-link">Space Travel</a></li>
                  </ul>
              </div>

              <!-- Contact Section -->
              <div class="col-md-3">
                  <h5 class="fw-bold">Contact Us</h5>
                  <p>Email: fularabhaskar256398@gmail.com</p>
                  <p>Phone: +91 7902050223</p>
                  <p>Address: New Delhi, India</p>
              </div>

              <!-- Social Media Section -->
              <div class="col-md-3">
                  <h5 class="fw-bold">Follow Us</h5>
                  <div class="social-icons">
                      <a href="https://github.com/BhashkarFulara369" class="social-icon"><i class="fab fa-github"></i></a>
                      <a href="https://x.com" class="social-icon"><i class="fab fa-x"></i></a>
                      <a href="https://instagram.com" class="social-icon"><i class="fab fa-instagram"></i></a>
                      <a href="https://linkedin.com" class="social-icon"><i class="fab fa-linkedin"></i></a>
                  </div>
              </div>
          </div>

          <!-- Developer Team Section -->
          <h5 class="fw-bold mt-4">Meet Our Developers</h5>
          <div class="d-flex justify-content-center mt-3">
              <div class="developer-circle">
                  <img src="../res/dev_img/dev.jpg" alt="Developer 1">
              </div>
              <div class="developer-circle">
                  <img src="../res/dev_img/dev.jpg" alt="Developer 2">
              </div>
              <div class="developer-circle">
                  <img src="../res/dev_img/dev2.jpg" alt="Developer 3">
              </div>
              <div class="developer-circle">
                  <img src="../res/dev_img/dev.jpg" alt="Developer 4">
              </div>
              <div class="developer-circle">
                  <img src="../res/dev_img/dev.jpg" alt="Developer 5">
              </div>
          </div>

          <p class="mt-4">&copy; 2025 E-Ticket Booking. All Rights Reserved.</p>
      </div>
  </footer>
  <script>
        function toggleChat() {
            var chatBox = document.getElementById("chatBox");

        }
    </script>


  <!-- Footer Styling -->
  <style>
            footer {
                    margin-top: 30px; /* Adjust the value for more or less space */
                }
      /* Footer Link Styling */
      .footer-link {
          color: white;
          text-decoration: none;
          transition: color 0.3s ease-in-out;
      }
      .footer-link:hover {
          color: #ffcc00;
      }

      /* Social Media Icons */
      .social-icons {
          display: flex;
          justify-content: center;
          gap: 15px;
      }
      .social-icon {
          font-size: 24px;
          color: white;
          transition: transform 0.3s ease-in-out;
      }
      .social-icon:hover {
          transform: scale(1.2);
          color: #ffcc00;
      }

      /* Developer Circle Styling */
      .developer-circle {
          width: 80px;
          height: 80px;
          border-radius: 50%;
          overflow: hidden;
          margin: 10px;
          transition: transform 0.3s ease-in-out;
      }
      .developer-circle img {
          width: 100%;
          height: 100%;
          object-fit: cover;
      }
      .developer-circle:hover {
          transform: scale(1.1);
          border: 3px solid #ffcc00;
      }


  </style>



  <!-- FontAwesome for Social Icons -->
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>





    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Toggle Profile Dropdown on Click
        document.getElementById("userIcon").addEventListener("click", function() {
            var dropdown = document.getElementById("profileDropdown");
            dropdown.style.display = dropdown.style.display === "none" ? "block" : "none";
        });

        // Close Dropdown When Clicking Outside
        document.addEventListener("click", function(event) {
            var dropdown = document.getElementById("profileDropdown");
            var icon = document.getElementById("userIcon");
            if (!icon.contains(event.target) && !dropdown.contains(event.target)) {
                dropdown.style.display = "none";
            }
        });
    </script>
</body>
</html>