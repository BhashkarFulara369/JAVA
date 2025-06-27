
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Train Ticket Booking</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
        /* Page Background */
        body {
            background-image: url("trains.jpeg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
        }

        .blur-effect{
           position:absolute;
           width: 100%;
           height: 100%;
           backdrop-filter: blur(2.8px) saturate(180%);
           background-color: rgba(255, 255, 255, 0.2); /* Creates the frosted look */
           border-radius: 10px; /* Optional: Adds rounded corners */
           box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
         }

        /* Card Styling */
        .booking-card {
            background: white;
            color: black;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
        }
        .booking-card:hover { transform: scale(1.02); }

        /* Button Animation */
        .btn-primary {
            transition: transform 0.3s ease-in-out;
        }
        .btn-primary:hover {
            transform: scale(1.05);
            background-color: #0056b3 !important;
        }

        /* Input Field Hover Effect */
        .form-control:hover {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
        }

        /* Seat Selection Styling */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            visibility: hidden;
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
        }

        .seat-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }

        .seat-map {
            display: grid;
            grid-template-columns: repeat(9, 50px);
            gap: 8px;
            justify-content: center;
            margin-top: 15px;
        }

        .seat {
            padding: 10px;
            border: 2px solid #007bff;
            background-color: white;
            cursor: pointer;
            transition: 0.3s;
            font-weight: bold;
        }

        .seat:hover, .seat.selected {
            background-color: #007bff;
            color: white;
        }

        .seat.booked {
            background-color: gray;
            cursor: not-allowed;
        }

        /* Smooth Seat Selection Animation */
        .seat {
            transition: transform 0.2s ease-in-out, background-color 0.2s ease-in-out;
        }

        .seat:hover { transform: scale(1.1); }
        .seat.selected { transform: scale(1.2); background-color: #28a745 !important; }
    </style>
</head>
<body>
<div class = "blur-effect">
<div class="container mt-5">
    <div class="text-center">
       <h2 class="fw-bold"><i class="fas fa-train"></i> Train Ticket Booking</h2>
                   <p>Book your train tickets easily with our seamless booking system.</p>
               </div>

               <form action="/E-Ticketing_System/TrainBookingServlet" method="post">
                   <div class="row mt-4">
                       <!-- User Details Section -->
                       <div class="col-md-4">
                           <div class="booking-card">
                               <h3 class="section-title"><i class="fas fa-user"></i> User Details</h3>
                               <div class="mb-3">
                                   <label for="username" class="form-label">Username</label>
                                   <input type="text" class="form-control" id="username" name="username" required>
                               </div>
                               <div class="mb-3">
                                   <label for="email" class="form-label">Email</label>
                                   <input type="email" class="form-control" id="email" name="email" required>
                               </div>
                           </div>
                       </div>

                       <!-- Travel Details Section -->
                       <div class="col-md-4">
                           <div class="booking-card">
                               <h3 class="section-title"><i class="fas fa-map-marker-alt"></i> Travel Details</h3>
                               <div class="mb-3">
                                   <label for="source" class="form-label">From (Source)</label>
                                   <input type="text" class="form-control" id="source" name="source" required>
                               </div>
                               <div class="mb-3">
                                   <label for="destination" class="form-label">To (Destination)</label>
                                   <input type="text" class="form-control" id="destination" name="destination" required>
                               </div>
                               <div class="mb-3">
                                   <label for="travelDate" class="form-label">Travel Date</label>
                                   <input type="date" class="form-control" id="travelDate" name="travelDate" required>
                               </div>
                               <div class="mb-3">
                                   <label for="trainClass" class="form-label">Train Class</label>
                                   <select class="form-select" id="trainClass" name="trainClass" required>
                                       <option value="First Class">First Class</option>
                                       <option value="Second Class">Second Class</option>
                                       <option value="Sleeper">Sleeper</option>
                                       <option value="General">General</option>
                                   </select>
                               </div>
                           </div>
                       </div>

            <!-- Seat Selection & Payment -->
            <div class="col-md-4">
                <div class="booking-card">
                    <h3 class="section-title"><i class="fas fa-chair"></i> Coach Selection</h3>

                    <div class="d-flex align-items-center mb-3">
                        <button id="showSeatsBtn" class="btn btn-primary">Show Coach</button>
                        <span id="selectedSeatDisplay" class="ms-3 fw-bold text-success"></span>
                    </div>

                    <input type="number" id="selectedSeat" name="seatNumber" required hidden>

                    <div id="seatOverlay" class="overlay">
                        <div class="seat-container">
                            <h4>Select a Seat</h4>
                            <div class="seat-map"></div>
                            <button id="confirmSeat" class="btn btn-success mt-3" disabled>Confirm Selection</button>
                        </div>
                    </div>

                    <h3 class="section-title mt-4"><i class="fas fa-credit-card"></i> Payment</h3>
                    <button type="submit" class="btn btn-primary w-100 mt-3">Book Now</button>
                </div>
            </div>
        </div>
    </form>
</div>
</div>

<script>
    const showSeatsBtn = document.getElementById("showSeatsBtn");
    const seatOverlay = document.getElementById("seatOverlay");
    const seatContainer = document.querySelector(".seat-map");
    const confirmSeatBtn = document.getElementById("confirmSeat");
    const selectedSeatInput = document.getElementById("selectedSeat");
    const selectedSeatDisplay = document.getElementById("selectedSeatDisplay");

    const trainCoaches = ["A1", "A2", "B1", "B2", "C1", "C2", "D1", "D2", "E1", "E2", "F1", "F2", "G1", "G2", "H1"];

    showSeatsBtn.addEventListener("click", function () {
        seatOverlay.style.visibility = "visible";
        seatOverlay.style.opacity = "1";
        seatContainer.innerHTML = "";

        trainCoaches.forEach(coach => {
            const isBooked = Math.random() < 0.3; // Randomly mark some coaches as unavailable
            const seat = document.createElement("button");

            seat.classList.add("seat", isBooked ? "booked" : "available");
            seat.innerText = coach;

            if (!isBooked) {
                seat.addEventListener("click", function () {
                    document.querySelectorAll(".seat").forEach(s => s.classList.remove("selected"));
                    this.classList.add("selected");
                    selectedSeatInput.value = this.innerText;
                    selectedSeatDisplay.innerText = "Coach: " + this.innerText;
                    confirmSeatBtn.disabled = false;
                });
            }

            seatContainer.appendChild(seat);
        });
    });

    confirmSeatBtn.addEventListener("click", () => seatOverlay.style.visibility = "hidden");
</script>

</body>
</html>