<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Random" %>
<%
    Random rand = new Random();
    int ticketPrice = rand.nextInt(50000) + 100000;  // Generates price between 100,000 - 150,000
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Space Travel Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap');

        /* Background Video */
        .video-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }

        .video-container video {
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.8;
        }

        /* Main container */
        .container {
            max-width: 700px;
            padding: 30px;
            margin-top: 50px;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 12px;
            box-shadow: 0px 0px 15px rgba(255,255,255,0.4);
        }

        /* Title Styling */
        .title {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            letter-spacing: 2px;
            text-transform: uppercase;
            text-shadow: 0px 0px 15px #ffffff;
        }

        /* Animated button */
        .btn-space {
            background: linear-gradient(45deg, #ff0080, #8000ff);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0px 0px 10px #ff0080;
        }

        .btn-space:hover {
            transform: scale(1.08);
            box-shadow: 0px 0px 18px #ff0080;
        }

        /* Travel Selection */
        select, input {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            margin-top: 10px;
            border: none;
            font-size: 18px;
            text-align: center;
        }

        /* Countdown Timer */
        .countdown {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            color: #ffcc00;
            margin-top: 20px;
            text-shadow: 0px 0px 8px #ffcc00;
        }

        /* Seat Selection Grid */
        .seat-grid {
            display: grid;
            grid-template-columns: repeat(5, 60px);
            gap: 12px;
            justify-content: center;
            margin-top: 20px;
        }

        .seat {
            width: 60px;
            height: 60px;
            background: #222;
            color: #fff;
            text-align: center;
            line-height: 60px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
            font-size: 16px;
            font-weight: bold;
            text-shadow: 0px 0px 10px #ffffff;
        }

        .seat:hover {
            background: #ff0080;
            transform: scale(1.15);
            box-shadow: 0px 0px 12px #ff0080;
        }
    </style>
</head>
<body>
    <!-- Background Video -->
    <div class="video-container">
        <video autoplay loop muted playsinline>
            <source src="video/space_bg.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
    </div>

    <div class="container">
        <h2 class="title">🚀 Book Your Space Adventure</h2>

        <form action="/E-Ticketing_System/SpaceTravelSuccessServlet" method="POST">
            <label>👨‍🚀 Choose Your Spacecraft:</label>
            <select name="spacecraft">
                <option value="Star Voyager">Star Voyager ⭐⭐⭐⭐⭐ - Lightning-Speed Travel</option>
                <option value="Nebula Seeker">Nebula Seeker ⭐⭐⭐⭐ - Smooth & Comfortable</option>
                <option value="Cosmic Explorer">Cosmic Explorer ⭐⭐⭐⭐⭐ - Luxury Space Voyage</option>
                <option value="Galaxy Runner">Galaxy Runner ⭐⭐⭐ - Efficient Deep Space Travel</option>
            </select>

            <label>💺 Select Travel Class:</label>
            <select name="class">
                <option value="Economy">Economy Class</option>
                <option value="Luxury">Luxury Suite</option>
                <option value="VIP Experience">VIP Galactic Experience</option>
            </select>

            <label>🎟️ Choose Seat Number:</label>
            <div class="seat-grid">
                <div class="seat">A1</div>
                <div class="seat">A2</div>
                <div class="seat">A3</div>
                <div class="seat">A4</div>
                <div class="seat">A5</div>
                <div class="seat">B1</div>
                <div class="seat">B2</div>
                <div class="seat">B3</div>
                <div class="seat">B4</div>
                <div class="seat">B5</div>
            </div>
            <input type="hidden" name="seatNumber" id="seatNumber">

            <!-- Dynamic Ticket Price -->
            <div class="countdown">Your Ticket Price: ₹<%= ticketPrice %></div>
            <input type="hidden" name="ticketPrice" value="<%= ticketPrice %>">

            <div class="countdown">Next Space Launch in: <span id="countdown-timer"></span></div>

            <button type="submit" class="btn-space mt-4">Confirm Booking</button>
        </form>

            <!-- AI-powered Chatbot -->
            <div class="ai-chatbot">
                <h3>🤖 AI Booking Assistant</h3>
                <p>Need help choosing the best spacecraft? Ask me!</p>
                <input type="text" id="chatInput" placeholder="Type your question..." />
                <button class="btn-ai" onclick="getAIChatResponse()">Ask AI</button>
                <div id="chatResponse" class="chat-response"></div>
            </div>

            <!-- Augmented Reality Hover Effect on Spacecraft -->
            <label>🚀 Select Your Spacecraft:</label>
            <div class="spacecraft-grid">
                <div class="spacecraft" data-info="Fastest route to Mars in under 3 hours!">
                    <img src="images/star-voyager.png" alt="Star Voyager">
                    <p>Star Voyager ⭐⭐⭐⭐⭐</p>
                </div>
                <div class="spacecraft" data-info="Luxury cruise beyond the asteroid belt!">
                    <img src="images/cosmic-explorer.png" alt="Cosmic Explorer">
                    <p>Cosmic Explorer ⭐⭐⭐⭐⭐</p>
                </div>
                <div class="spacecraft" data-info="Efficient and affordable deep-space travel!">
                    <img src="images/nebula-seeker.png" alt="Nebula Seeker">
                    <p>Nebula Seeker ⭐⭐⭐⭐</p>
                </div>
            </div>

            <!-- Real-time 3D Planetary Visualization -->
            <div class="planetary-view">
                <h3>🌍 View Your Destination</h3>
                <iframe src="https://solarsystem.nasa.gov/gltf_embed/2342" width="100%" height="400px"></iframe>
            </div>

            <button type="submit" class="btn-space mt-4">Confirm Booking</button>

            </div> <!-- Closing Main Container -->

            <style>
                /* AI Chatbot Styling */
                .ai-chatbot {
                    background: rgba(0, 0, 0, 0.7);
                    padding: 15px;
                    border-radius: 10px;
                    text-align: center;
                    margin-top: 20px;
                }

                .btn-ai {
                    background: linear-gradient(45deg, #00ffcc, #0080ff);
                    padding: 10px;
                    border: none;
                    border-radius: 6px;
                    font-size: 16px;
                    cursor: pointer;
                    transition: 0.3s;
                }

                .btn-ai:hover {
                    transform: scale(1.05);
                    box-shadow: 0px 0px 8px #00ffcc;
                }

                .chat-response {
                    margin-top: 15px;
                    font-size: 18px;
                    color: #ffcc00;
                    text-shadow: 0px 0px 10px #ffcc00;
                }

                /* Augmented Reality Hover Effect on Spacecraft */
                .spacecraft-grid {
                    display: flex;
                    justify-content: center;
                    gap: 20px;
                    margin-top: 20px;
                }

                .spacecraft {
                    text-align: center;
                    cursor: pointer;
                    transition: transform 0.3s, box-shadow 0.3s;
                }

                .spacecraft:hover {
                    transform: scale(1.1);
                    box-shadow: 0px 0px 20px rgba(0, 255, 255, 0.8);
                }

                .spacecraft img {
                    width: 100px;
                    height: 100px;
                    border-radius: 50%;
                }

                /* Booking Confirmation Animation */
                .btn-space {
                    background: linear-gradient(45deg, #ff0080, #8000ff);
                    padding: 12px 24px;
                    border: none;
                    border-radius: 8px;
                    font-size: 18px;
                    cursor: pointer;
                    transition: 0.3s;
                    box-shadow: 0px 0px 10px #ff0080;
                }

                .btn-space:hover {
                    transform: scale(1.08);
                    box-shadow: 0px 0px 18px #ff0080;
                }
            </style>

            <script>
                // AI-powered chatbot response function
                function getAIChatResponse() {
                    let userInput = document.getElementById("chatInput").value;
                    let responseBox = document.getElementById("chatResponse");

                    if (userInput.toLowerCase().includes("fastest route")) {
                        responseBox.innerText = "🚀 The **Star Voyager** will get you to Mars in under 3 hours!";
                    } else if (userInput.toLowerCase().includes("most luxurious")) {
                        responseBox.innerText = "🌌 **Cosmic Explorer** offers the best luxury experience!";
                    } else {
                        responseBox.innerText = "🤖 I'm learning... but space travel is exciting!";
                    }
                }

                // Spacecraft Hover Info Display
                document.querySelectorAll(".spacecraft").forEach(spacecraft => {
                    spacecraft.addEventListener("mouseover", function () {
                        let info = this.getAttribute("data-info");
                        this.innerHTML += `<p class="hover-info">${info}</p>`;
                    });

                    spacecraft.addEventListener("mouseleave", function () {
                        document.querySelectorAll(".hover-info").forEach(info => info.remove());
                    });
                });
            </script>

                <!-- Voice-Controlled Booking Feature -->
                <div class="voice-control">
                    <h3>🎤 Voice Command Booking</h3>
                    <button class="btn-voice" onclick="startVoiceCommand()">Start Voice Booking</button>
                    <p id="voiceResult" class="voice-output"></p>
                </div>

                <!-- Real-Time Custom Flight Scheduler -->
                <div class="flight-scheduler">
                    <h3>🛸 Customize Your Flight Schedule</h3>
                    <label>Select Departure Time:</label>
                    <input type="datetime-local" id="flightTime">
                    <button class="btn-schedule" onclick="confirmFlightTime()">Confirm Schedule</button>
                    <p id="scheduleOutput" class="schedule-output"></p>
                </div>

                <button type="submit" class="btn-space mt-4">Confirm Booking</button>

                </div> <!-- Closing Main Container -->

                <style>
                    /* Voice-Controlled Booking Styling */
                    .voice-control {
                        background: rgba(0, 0, 0, 0.7);
                        padding: 15px;
                        border-radius: 10px;
                        text-align: center;
                        margin-top: 20px;
                    }

                    .btn-voice {
                        background: linear-gradient(45deg, #ffcc00, #ff6600);
                        padding: 10px;
                        border: none;
                        border-radius: 6px;
                        font-size: 16px;
                        cursor: pointer;
                        transition: 0.3s;
                    }

                    .btn-voice:hover {
                        transform: scale(1.05);
                        box-shadow: 0px 0px 8px #ffcc00;
                    }

                    .voice-output {
                        margin-top: 15px;
                        font-size: 18px;
                        color: #ffcc00;
                        text-shadow: 0px 0px 10px #ffcc00;
                    }

                    /* Flight Scheduler Styling */
                    .flight-scheduler {
                        background: rgba(0, 0, 0, 0.8);
                        padding: 15px;
                        border-radius: 12px;
                        margin-top: 20px;
                        text-align: center;
                    }

                    .btn-schedule {
                        background: linear-gradient(45deg, #00ffcc, #0080ff);
                        padding: 10px;
                        border: none;
                        border-radius: 6px;
                        font-size: 16px;
                        cursor: pointer;
                        transition: 0.3s;
                    }

                    .btn-schedule:hover {
                        transform: scale(1.05);
                        box-shadow: 0px 0px 8px #00ffcc;
                    }

                    .schedule-output {
                        margin-top: 15px;
                        font-size: 18px;
                        color: #00ffcc;
                        text-shadow: 0px 0px 10px #00ffcc;
                    }
                </style>

                <script>
                    // Voice Control for Booking
                    function startVoiceCommand() {
                        let recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();
                        recognition.start();

                        recognition.onresult = function(event) {
                            let voiceText = event.results[0][0].transcript;
                            document.getElementById("voiceResult").innerText = "Booking Command: " + voiceText;

                            if (voiceText.toLowerCase().includes("book star voyager")) {
                                document.querySelector("select[name='spacecraft']").value = "Star Voyager";
                            } else if (voiceText.toLowerCase().includes("book cosmic explorer")) {
                                document.querySelector("select[name='spacecraft']").value = "Cosmic Explorer";
                            }
                        };
                    }

                    // Flight Scheduling Feature
                    function confirmFlightTime() {
                        let selectedTime = document.getElementById("flightTime").value;
                        if (selectedTime) {
                            document.getElementById("scheduleOutput").innerText = "Flight Scheduled for: " + selectedTime;
                        } else {
                            document.getElementById("scheduleOutput").innerText = "Please select a departure time.";
                        }
                    }
                </script>

                    <!-- Multi-Language Support -->
                    <div class="language-selection">
                        <h3>🌏 Choose Your Language</h3>
                        <select id="languageSelect">
                            <option value="en">English</option>
                            <option value="es">Spanish</option>
                            <option value="fr">French</option>
                            <option value="de">German</option>
                            <option value="jp">Japanese</option>
                        </select>
                    </div>

                    <!-- Live Passenger Tracking -->
                    <div class="passenger-tracking">
                        <h3>🛰️ Track Your Space Voyage</h3>
                        <p>Current Status: <span id="trackingStatus">Preparing for launch...</span></p>
                        <button class="btn-track" onclick="startTracking()">Start Tracking</button>
                    </div>

                    <!-- Dynamic Price Calculator -->
                    <div class="price-calculator">
                        <h3>💸 Calculate Your Final Ticket Price</h3>
                        <p>Base Price: ₹<%= ticketPrice %></p>
                        <label>Select Discount Code:</label>
                        <input type="text" id="discountCode" placeholder="Enter code here">
                        <button class="btn-price" onclick="applyDiscount()">Apply Discount</button>
                        <p id="finalPrice" class="price-output"></p>
                    </div>

                    <button type="submit" class="btn-space mt-4">Confirm Booking</button>

                    </div> <!-- Closing Main Container -->

                    <style>
                        /* Multi-Language Support Styling */
                        .language-selection {
                            background: rgba(0, 0, 0, 0.7);
                            padding: 15px;
                            border-radius: 10px;
                            text-align: center;
                            margin-top: 20px;
                        }

                        /* Passenger Tracking Styling */
                        .passenger-tracking {
                            background: rgba(0, 0, 0, 0.8);
                            padding: 15px;
                            border-radius: 12px;
                            margin-top: 20px;
                            text-align: center;
                        }

                        .btn-track {
                            background: linear-gradient(45deg, #00ffcc, #0080ff);
                            padding: 10px;
                            border: none;
                            border-radius: 6px;
                            font-size: 16px;
                            cursor: pointer;
                            transition: 0.3s;
                        }

                        .btn-track:hover {
                            transform: scale(1.05);
                            box-shadow: 0px 0px 8px #00ffcc;
                        }

                        /* Price Calculator Styling */
                        .price-calculator {
                            background: rgba(0, 0, 0, 0.8);
                            padding: 15px;
                            border-radius: 12px;
                            margin-top: 20px;
                            text-align: center;
                        }

                        .btn-price {
                            background: linear-gradient(45deg, #ffcc00, #ff6600);
                            padding: 10px;
                            border: none;
                            border-radius: 6px;
                            font-size: 16px;
                            cursor: pointer;
                            transition: 0.3s;
                        }

                        .btn-price:hover {
                            transform: scale(1.05);
                            box-shadow: 0px 0px 8px #ffcc00;
                        }

                        .price-output {
                            margin-top: 15px;
                            font-size: 18px;
                            color: #ffcc00;
                            text-shadow: 0px 0px 10px #ffcc00;
                        }
                    </style>

                    <script>
                        // Multi-Language Support
                        document.getElementById("languageSelect").addEventListener("change", function() {
                            let selectedLang = this.value;
                            alert("Language changed to: " + selectedLang);
                            // Here, you could implement translations for UI elements dynamically
                        });

                        // Live Passenger Tracking
                        function startTracking() {
                            let statuses = ["Preparing for launch...", "Boarding spacecraft...", "Leaving Earth orbit...", "Entering hyperspace...", "Arriving at destination"];
                            let index = 0;

                            let trackingInterval = setInterval(() => {
                                if (index < statuses.length) {
                                    document.getElementById("trackingStatus").innerText = statuses[index];
                                    index++;
                                } else {
                                    clearInterval(trackingInterval);
                                }
                            }, 2000);
                        }

                        // Dynamic Price Calculation
                        function applyDiscount() {
                            let basePrice = <%= ticketPrice %>;
                            let discountCode = document.getElementById("discountCode").value;
                            let discount = 0;

                            if (discountCode === "GALAXY10") {
                                discount = 10;
                            } else if (discountCode === "SPACE20") {
                                discount = 20;
                            }

                            let finalPrice = basePrice - (basePrice * (discount / 100));
                            document.getElementById("finalPrice").innerText = "Final Price: ₹" + finalPrice;
                        }
                    </script>

</body>
</html>