<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upcoming Travel Events | E-Ticket Booking</title>

    <!-- Bootstrap & FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /* Animated Background */
        body {
            background: linear-gradient(-45deg, #0f0f0f, #ff007f, #6200ea, #0f0f0f);
            background-size: 400% 400%;
            animation: gradientBG 8s infinite alternate ease-in-out;
            color: white;
            font-family: Arial, sans-serif;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            100% { background-position: 100% 50%; }
        }

        /* Event Cards */
        .event-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 20px;
            margin: 15px;
            transition: transform 0.3s ease-in-out, opacity 0.4s ease-in-out;
            text-align: center;
            box-shadow: 0px 0px 15px rgba(255, 132, 127, 0.3);
        }

        .event-card:hover {
            transform: scale(1.05);
            box-shadow: 0px 0px 30px rgba(255, 0, 127, 0.5);
        }

        /* Countdown Timer */
        .countdown {
            font-size: 1.5rem;
            font-weight: bold;
            padding: 10px;
            border-radius: 50px;
            color: #ff007f;
            animation: pulse 1.5s infinite alternate;
        }

        @keyframes pulse {
            from { transform: scale(1); }
            to { transform: scale(1.1); }
        }

        /* CTA Button */
        .cta-btn {
            background: #ff007f;
            color: black;
            padding: 15px 25px;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 10px;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 0 10px #ff007f;
            text-decoration: none;
            display: inline-block;
        }

        .cta-btn:hover {
            background: white;
            transform: scale(1.1);
        }

    </style>
</head>
<body>

    <div class="container text-center">
        <h1>🚀 Upcoming Travel Events</h1>
        <p>Explore exciting journeys and book your tickets now!</p>

        <div class="row justify-content-center">
            <div class="col-md-4 event-card">
                <h2>🚍 Bus Express Festival</h2>
                <p>Enjoy 50% off on select routes! 🚌</p>
                <div class="countdown" id="countdown1">Offer Ends In: 00:00:00</div>
                <a href="../login.jsp" class="cta-btn">Book Bus 🚍</a>
            </div>
+
            <div class="col-md-4 event-card">
                <h2>🚆 High-Speed Rail Week</h2>
                <p>Experience premium train services at discounted fares! 🚄</p>
                <div class="countdown" id="countdown2">Offer Ends In: 00:00:00</div>
                <a href="../login.jsp" class="cta-btn">Reserve Train 🚆</a>
            </div>

            <div class="col-md-4 event-card">
                <h2>✈️ Flight Fiesta</h2>
                <p>Save up to 40% on international & domestic flights. ✈️</p>
                <div class="countdown" id="countdown3">Offer Ends In: 00:00:00</div>
                <a href="../login.jsp" class="cta-btn">Get Flight ✈️</a>
            </div>

            <div class="col-md-4 event-card">
                <h2>🚀 Space Tourism Launch</h2>
                <p>Book your seat for an outer space adventure! 🌌</p>
                <div class="countdown" id="countdown4">Offer Ends In: 00:00:00</div>
                <a href="../login.jsp" class="cta-btn">Reserve Space 🚀</a>
            </div>
        </div>
    </div>

    <script>
        // Countdown Timer for 24-Hour Offers
        function startCountdown(id) {
            let deadline = new Date().getTime() + (24 * 60 * 60 * 1000);
            function updateTimer() {
                let now = new Date().getTime();
                let timeLeft = deadline - now;
                let hours = Math.floor(timeLeft / (1000 * 60 * 60)).toString().padStart(2, '0');
                let minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60)).toString().padStart(2, '0');
                let seconds = Math.floor((timeLeft % (1000 * 60)) / 1000).toString().padStart(2, '0');
                document.getElementById(id).innerText = `Offer Ends In: ${hours}:${minutes}:${seconds}`;
                if (timeLeft <= 0) document.getElementById(id).innerText = "⏳ Offer Expired!";
            }
            setInterval(updateTimer, 1000);
            updateTimer();
        }

        // Apply countdown timer for all events
        startCountdown("countdown1");
        startCountdown("countdown2");
        startCountdown("countdown3");
        startCountdown("countdown4");

        // Scroll Reveal Animation for Event Cards
        function revealOnScroll() {
            let cards = document.querySelectorAll('.event-card');
            cards.forEach(card => {
                let rect = card.getBoundingClientRect();
                if (rect.top < window.innerHeight - 100) {
                    card.classList.add('visible');
                }
            });
        }

        document.addEventListener("scroll", revealOnScroll);
        revealOnScroll();
    </script>

</body>
</html>
