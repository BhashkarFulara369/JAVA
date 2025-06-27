<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Special Discounts | E-Ticket Booking</title>

    <!-- Bootstrap & FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /* Animated Background */
        body {
            background: linear-gradient(-45deg, #ff416c, #ff4b2b, #6a82fb, #00c6ff);
            background-size: 400% 400%;
            animation: gradientBG 10s infinite alternate;
            color: white;
            font-family: Arial, sans-serif;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            100% { background-position: 100% 50%; }
        }

        /* Main Container */
        .container {
            text-align: center;
            padding: 50px;
        }

        /* Countdown Timer */
        .countdown {
            font-size: 2rem;
            font-weight: bold;
            background: rgba(0, 0, 0, 0.5);
            padding: 10px;
            border-radius: 10px;
            display: inline-block;
            margin-bottom: 20px;
        }

        /* Offer Cards */
        .offer-card {
            background: rgba(0, 0, 0, 0.3);
            padding: 20px;
            border-radius: 10px;
            margin: 15px;
            transition: transform 0.3s ease-in-out;
        }
        .offer-card:hover {
            transform: scale(1.05);
            box-shadow: 0px 4px 10px rgba(255, 255, 255, 0.3);
        }

        /* CTA Button */
        .cta-btn {
            background: #ffcc00;
            color: black;
            padding: 15px 25px;
            font-size: 1.5rem;
            font-weight: bold;
            border-radius: 10px;
            transition: all 0.3s ease-in-out;
        }
        .cta-btn:hover {
            background: #ffd700;
            transform: scale(1.1);
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>🚀 Limited-Time Special Discounts! 🎉</h1>
        <p>Grab exclusive deals before time runs out.</p>

        <!-- Countdown Timer -->
        <div class="countdown" id="countdownTimer">Offer Ends In: 00:00:00</div>

        <!-- Offer Cards -->
        <div class="row justify-content-center">
            <div class="col-md-4 offer-card">
                <h2>🎟️ 20% Off on Weekend Travel</h2>
                <p>Use code <strong>WEEKEND20</strong> at checkout.</p>
            </div>
            <div class="col-md-4 offer-card">
                <h2>✨ Flash Sale: 50% Off</h2>
                <p>Limited seats available! Book now.</p>
            </div>
        </div>

        <!-- Call to Action Button -->
        <a href= "../login.jsp" class="cta-btn">Book Now 🚀</a>
    </div>

    <script>
        // Countdown Timer Logic
        function startCountdown() {
            let deadline = new Date().getTime() + (2 * 60 * 60 * 1000); // 2 hours from now
            function updateTimer() {
                let now = new Date().getTime();
                let timeLeft = deadline - now;
                let hours = Math.floor(timeLeft / (1000 * 60 * 60)).toString().padStart(2, '0');
                let minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60)).toString().padStart(2, '0');
                let seconds = Math.floor((timeLeft % (1000 * 60)) / 1000).toString().padStart(2, '0');
                document.getElementById("countdownTimer").innerText = `Offer Ends In: ${hours}:${minutes}:${seconds}`;
                if (timeLeft <= 0) document.getElementById("countdownTimer").innerText = "⏳ Offer Expired!";
            }
            setInterval(updateTimer, 1000);
            updateTimer();
        }

        startCountdown();
    </script>

</body>
</html>
