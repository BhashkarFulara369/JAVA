<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome to ETS </title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>


<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="index.jsp">🏠 Home</a>

        <!-- Real-Time Clock & Weather -->
        <span class="navbar-text mx-auto fs-4 fw-bold text-white">
            <i class="fas fa-sun"></i> <span id="weather"></span>
            <i class="fas fa-clock-rotate-left"></i> <span id="digitalClock"></span>
        </span>

        <!-- Smooth Scroll Links -->
        <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link text-white smooth-scroll" href="#footer">About</a></li>
            <li class="nav-item"><a class="nav-link text-white smooth-scroll" href="#footer">Services</a></li>
            <li class="nav-item"><a class="nav-link text-white smooth-scroll" href="#footer">Contact</a></li>
        </ul>

       <!-- Notifications -->
       <div class="position-relative mx-3 notification-container">
           <i class="fas fa-bell fa-2x text-white notification-icon" id="notificationIcon"></i>
           <div id="notificationDropdown" class="dropdown-menu dropdown-menu-end">
               <a class="dropdown-item" href="UI/main_page/discount.jsp">🚀 Special Discount on Tickets!</a>
               <a class="dropdown-item" href="UI/main_page/events.jsp">📅 Upcoming Events</a>
           </div>
       </div>


        <!-- Language Selection -->
        <select id="languageSelect" class="form-select form-select-sm mx-3">
            <option selected>🌍 Language</option>
            <option value="en">English</option>

        </select>

        <!-- Dark Mode Toggle -->
        <button class="btn btn-outline-light mx-3" id="darkModeToggle">🌙 Dark Mode</button>

        <!-- User Dropdown -->
        <div class="position-relative user-container">
            <i class="fas fa-user-circle fa-2x text-white user-icon" id="userIcon"></i>
            <div id="userDropdown" class="dropdown-menu dropdown-menu-end">

                <a class="dropdown-item" href="UI/login.jsp">🔑 Login</a>
                <a class="dropdown-item" href="UI/register.jsp">🆕 Register</a>
            </div>
        </div>
    </div>
</nav>

<!-- Bootstrap & FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
    /* User Icon Hover Effect */
    .user-icon { cursor: pointer; transition: transform 0.3s ease-in-out; }
    .user-icon:hover { transform: scale(1.2); }



          /* Notification Icon Hover Effect */
          .notification-icon {
              cursor: pointer;
              transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
          }

          .notification-icon:hover {
              transform: scale(1.2);
              box-shadow: 0px 0px 15px rgba(255, 0, 127, 0.5);
          }

          /* Dropdown Menu Styling */
          #notificationDropdown  #userIcon{
              display: none;
              position: absolute;
              right: 0;
              background: white;
              border-radius: 5px;
              box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
              padding: 10px;
              transition: opacity 0.3s ease-in-out, transform 0.3s ease-in-out;
              transform: translateY(-10px);
              opacity: 0;
          }

          /* Show Dropdown on Icon or Dropdown Hover */
          .notification-container:hover #notificationDropdown {
              display: block;
              transform: translateY(0);
              opacity: 1;
          }

          /* usericon drop down hover */

          .user-container:hover #userDropdown{
          display: block;
                        transform: translateY(0);
                        opacity: 1;
          }


          .notification-container:hover #notificationDropdown {
              display: block;
              transform: translateY(0);
              opacity: 1;
          }

          /* Dropdown Item Hover */
          #notificationDropdown a {
              display: block;
              padding: 8px 12px;
              color: black;
              text-decoration: none;
              transition: background 0.3s ease-in-out;
          }

          #notificationDropdown a:hover {
              background: #f0f0f0;
          }


    /* Dropdown Styling */
    #userDropdown, #notificationDropdown { display: none; position: absolute; right: 0; background: white; border-radius: 5px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); padding: 10px; }
    #userDropdown a, #notificationDropdown a { display: block; padding: 8px 12px; color: black; text-decoration: none;
        transition: background 0.3s ease-in-out; }
    #userDropdown a:hover, #notificationDropdown a:hover { background: #f0f0f0; }

#userDropdown{

}

    /* Clock & Weather Styling */
    .fa-clock, .fa-cloud-sun { margin-right: 5px; color: #ffcc00; animation: pulse 1s infinite alternate; }

    @keyframes pulse { from { transform: scale(1); } to { transform: scale(1.1); } }

    /* Smooth Scroll Effect */
    html { scroll-behavior: smooth; }



.dark-mode {
    background-color: black !important;
    color: white !important;
}
.dark-mode.card {
    background-color: black !important;
    color: white !important;
    border: 0.1px solid white;
}
.dark-mode #userDropdown a{
color:white;
background:black;
}


</style>

<script>
    // Toggle Dropdowns on Click
    document.getElementById("userIcon").addEventListener("click", function() {
        var dropdown = document.getElementById("userDropdown");
        dropdown.style.display = dropdown.style.display === "none" ? "block" : "none";
    });

    document.getElementById("notificationIcon").addEventListener("click", function() {
        var dropdown = document.getElementById("notificationDropdown");
        dropdown.style.display = dropdown.style.display === "none" ? "block" : "none";
    });

    // Close Dropdowns When Clicking Outside
    document.addEventListener("click", function(event) {
        var userDropdown = document.getElementById("userDropdown");
        var notificationDropdown = document.getElementById("notificationDropdown");
        var userIcon = document.getElementById("userIcon");
        var notificationIcon = document.getElementById("notificationIcon");

        if (!userIcon.contains(event.target) && !userDropdown.contains(event.target)) {
            userDropdown.style.display = "none";
        }
        if (!notificationIcon.contains(event.target) && !notificationDropdown.contains(event.target)) {
            notificationDropdown.style.display = "none";
        }
    });

    // Real-Time Digital Clock
    function updateClock() {
        var now = new Date();
        var hours = now.getHours().toString().padStart(2, '0');
        var minutes = now.getMinutes().toString().padStart(2, '0');
        var seconds = now.getSeconds().toString().padStart(2, '0');
        document.getElementById("digitalClock").innerText = `${hours}:${minutes}:${seconds}`;
    }
    setInterval(updateClock, 1000);
    updateClock();

    // Fetch Weather Data
    async function fetchWeather() {
        try {
            let response = await fetch('https://api.weatherapi.com/v1/current.json?key=42e582d45ddc4df4834160059251605&q=auto:ip');
            let data = await response.json();
            document.getElementById("weather").innerText = `${data.current.temp_c}°C | ${data.current.condition.text}`;
        } catch (error) {
            document.getElementById("weather").innerText = "⚠️ Weather unavailable";
        }
    }
    fetchWeather();

    // Dark Mode Toggle
    document.getElementById("darkModeToggle").addEventListener("click", function() {
        document.body.classList.toggle("dark-mode");
        document.querySelector(".navbar").classList.toggle("dark-mode"); // dark mode to navbar
        document.getElementById("footer").classList.toggle("dark-mode"); //  dark mode to footer
        document.getElementById("languageSelect").classList.toggle("dark-mode"); // dark mode for languageSelect
       document.getElementById("userIcon").classList.toggle("dark-mode"); // Apply red outline to user icon
       document.getElementById("userDropdown").classList.toggle("dark-mode"); // Apply red outline to dropdown

 let cards = document.querySelectorAll(".card"); // Selects all card divs
    cards.forEach(card => {
        card.classList.toggle("dark-mode"); // Applies dark mode styling
    });

        // apply dark mode to div

    });

</script>


<!-- Main Content -->
<div class="container mt-5">
    <!-- Travel Site Introduction -->
    <div class="text-center mb-5">
        <h1 class="fw-bold text-primary">Explore the World with E-Ticket Booking</h1>
        <p class="fs-5">Book your journey with ease—whether by bus, train, airplane, or even space travel!</p>
    </div>

    <!-- Search & Filter Section -->
    <div class="row mb-4">
        <div class="col-md-6">
            <input type="text" class="form-control" id="searchBox" placeholder="Search transport or places...">
        </div>
        <div class="col-md-6">
            <select class="form-select" id="filterSelect">
                <option value="">Filter by...</option>
                <option value="bus">Bus</option>
                <option value="train">Train</option>
                <option value="airplane">Airplane</option>
                <option value="space">Space Travel</option>
                <option value="popular">Popular Places</option>
            </select>
        </div>
    </div>

    <!-- Scrollable Transport Cards -->
    <div class="row overflow-auto" style="max-height: 90vh;">
        <!-- Bus Booking -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="res/images/bus.jpeg" class="card-img-top" alt="Bus">
                <div class="card-body ">
                    <h5 class="card-title">Bus Booking</h5>
                    <p class="card-text">Book comfortable and affordable bus tickets for your journey.</p>
                    <a href="UI/login.jsp" class="btn btn-primary">Book Now</a>
                </div>
            </div>
        </div>
        <!-- Train Booking -->
        <div class="col-md-4 mb-4">
            <div class="card ">
                <img src="res/images/train.jpeg" class="card-img-top" alt="Train">
                <div class="card-body  ">
                    <h5 class="card-title ">Train Booking</h5>
                    <p class="card-text">Reserve your train tickets with ease and travel conveniently.</p>
                    <a href="UI/login.jsp" class="btn btn-primary">Book Now</a>
                </div>
            </div>
        </div>
        <!-- Airplane Booking -->
        <div class="col-md-4 mb-4">
            <div class="card ">
                <img src="res/images/airplane.jpeg" class="card-img-top" alt="Airplane">
                <div class="card-body ">
                    <h5 class="card-title">Airplane Booking</h5>
                    <p class="card-text">Fly to your destination with the best airline deals available.</p>
                    <a href="UI/login.jsp" class="btn btn-primary">Book Now</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Space Travel Section -->
  <!-- Space Travel Section -->
 <h2 class="mt-5 text-danger space-heading">🚀 Experience Space Travel In Future!</h2>

 <style>
     /* Simple & Professional Font */
     .space-heading {
         font-family: 'Poppins', sans-serif; /* Clean & modern font */
         font-size: 3.2rem;
         font-weight: bold;
         text-align: center;
         padding-left: 20px;
         opacity: 0; /* Initially hidden */
         transform: translateY(30px); /* Start position */
         transition: opacity 0.8s ease-out, transform 0.8s ease-out;
     }

     /* Animation when scrolling */
     .space-heading.visible {
         opacity: 1;
         transform: translateY(0);
     }
 </style>

 <!-- Google Font for Clean Look -->
 <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap" rel="stylesheet">

 <script>
     // Scroll Animation: Show heading when it enters viewport, remove when it leaves
     document.addEventListener("scroll", function() {
         var heading = document.querySelector(".space-heading");
         var position = heading.getBoundingClientRect().top;
         var windowHeight = window.innerHeight;

         if (position < windowHeight - 100) {
             heading.classList.add("visible");
         } else {
             heading.classList.remove("visible"); // Remove animation when scrolling away
         }
     });
 </script>

    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card ">
                <img src="res/images/spaces.jpeg" class="card-img-top" alt="Space Travel">
                <div class="card-body ">
                    <h5 class="card-title">SpaceX Journey</h5>
                    <p class="card-text">Book a trip to space with SpaceX and experience zero gravity.</p>
                    <a href="https://www.spacex.com/" target="_blank" class="btn btn-danger">Learn More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card ">
                <img src="res/images/moons.jpeg" class="card-img-top" alt="Moon Travel">
                <div class="card-body">
                    <h5 class="card-title">Moon Expedition</h5>
                    <p class="card-text">Travel to the Moon and witness breathtaking views of Earth.</p>
                    <a href="https://en.wikipedia.org/wiki/Moon_landing" target="_blank" class="btn btn-danger">Learn More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card ">
                <img src="res/images/mars.jpeg" class="card-img-top" alt="Mars Travel">
                <div class="card-body">
                    <h5 class="card-title">Mars Exploration</h5>
                    <p class="card-text">Be among the first brave humans to explore the mysterious Red Planet.</p>
                    <a href="https://en.wikipedia.org/wiki/Mars_exploration" target="_blank" class="btn btn-danger">Learn More</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Most Popular Places in India -->
    <h2 class="mt-5 text-center PopularPlace">Most Popular Places in India</h2>
    <div class="row">
        <!-- Taj Mahal -->
        <div class="col-md-4 mb-4">
            <div class="card ">
                <img src="res/images/tajmahal.jpeg" class="card-img-top" alt="Taj Mahal">
                <div class="card-body">
                    <h5 class="card-title">Taj Mahal, Agra</h5>
                    <p class="card-text">One of the Seven Wonders of the World, a symbol of love.</p>
                    <a href="https://en.wikipedia.org/wiki/Taj_Mahal" target="_blank" class="btn btn-danger">Learn More</a>
                </div>
            </div>
        </div>
        <!-- Gateway of India -->
        <div class="col-md-4 mb-4">
            <div class="card  ">
                <img src="res/images/gatewayofIndia.jpeg" class="card-img-top" alt="Gateway of India">
                <div class="card-body">
                    <h5 class="card-title">Gateway of India, Mumbai</h5>
                    <p class="card-text">The majestic Gateway of India, a historic monument overlooking the Arabian Sea</p>
                    <a href="https://en.wikipedia.org/wiki/Gateway_of_India" target="_blank" class="btn btn-danger">Learn More</a>
                </div>
            </div>
        </div>
        <!-- Kerala Backwaters -->
        <div class="col-md-4 mb-4">
            <div class="card adventure">
                <img src="res/images/kerala.jpeg" class="card-img-top" alt="Kerala Backwaters">
                <div class="card-body">
                    <h5 class="card-title">Kerala Backwaters</h5>
                    <p class="card-text">Enjoy the serene beauty of Kerala's houseboats and nature.</p>
                    <a href="https://en.wikipedia.org/wiki/Kerala_Backwaters" target="_blank" class="btn btn-danger">Learn More</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Most popular places in India -->
 <style>
     /* Simple & Professional Font */
     .PopularPlace{
         font-family: 'Poppins', sans-serif; /* Clean & modern font */
         font-size: 3.2rem;
         font-weight: bold;
         text-align: center;
         padding-left: 20px;
         opacity: 0; /* Initially hidden */
         transform: translateY(10px); /* Start position */
         transition: opacity 0.8s ease-out, transform 0.8s ease-out;
         color:red;
     }

     /* Animation when scrolling */
     .PopularPlace.visible {
         opacity: 1;
         transform: translateY(0);
     }
 </style>

 <script>
     // Scroll Animation: Show heading when it enters viewport, remove when it leaves
     document.addEventListener("scroll", function() {
         var heading = document.querySelector(".PopularPlace");
         var position = heading.getBoundingClientRect().top;
         var windowHeight = window.innerHeight;

         if (position < windowHeight - 100) {
             heading.classList.add("visible");
         } else {
             heading.classList.remove("visible"); // Remove animation when scrolling away
         }
     });
 </script>




<!-- Bootstrap & JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Search Functionality
    document.getElementById("searchBox").addEventListener("input", function() {
        let searchValue = this.value.toLowerCase();
        let cards = document.querySelectorAll(".card");
        cards.forEach(card => {
            let title = card.querySelector(".card-title").innerText.toLowerCase();
            card.parentElement.style.display = title.includes(searchValue) ? "block" : "none";
        });
    });

    // Filter Functionality
    document.getElementById("filterSelect").addEventListener("change", function() {
        let filterValue = this.value.toLowerCase();
        let cards = document.querySelectorAll(".card");
        cards.forEach(card => {
            let title = card.querySelector(".card-title").innerText.toLowerCase();
            card.parentElement.style.display = filterValue === "" || title.includes(filterValue) ? "block" : "none";
        });
    });
</script>




  <!-- Footer -->
  <footer id = "footer" class="bg-primary text-white text-center py-5">
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
                      <li><a href="#" class="footer-link">Bus Booking</a></li>
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
                      <a href="https://x.com/" class="social-icon"><i class="fab fa-x"></i></a>
                      <a href="https://www.instagram.com/" class="social-icon"><i class="fab fa-instagram"></i></a>
                      <a href="https://www.linkedin.com/" class="social-icon"><i class="fab fa-linkedin"></i></a>
                  </div>
              </div>
          </div>

          <!-- Developer Team Section -->
          <h5 class="fw-bold mt-4">Meet Our Developers</h5>
          <div class="d-flex justify-content-center mt-3">
              <div class="developer-circle">
                  <img src="res/dev_img/dev.jpg" alt="Gaurav Sati">
              </div>
              <div class="developer-circle">
                  <img src="res/dev_img/dev.jpg" alt="Divyanshu Kandpal">
              </div>
               <div class="developer-circle">
                    <img src="res/dev_img/dev2.jpg" alt="Anushka Joshi">
               </div>
              <div class="developer-circle">
                  <img src="res/dev_img/dev.jpg" alt="Anuvesh Chilwal">
              </div>

              <div class="developer-circle">
                  <img src="res/dev_img/dev.jpg" alt="Bhashkar Fulara">
              </div>
          </div>

          <p class="mt-4">&copy; 2025 E-Ticket Booking. All Rights Reserved.</p>
      </div>
  </footer>

  <!-- Footer Styling -->
  <style>
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
          width: 90px;
          height: 90px;
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
      .developer-circle::alt::hover{
      object-fit:cover;
      }
  </style>

  <!-- FontAwesome for Social Icons -->
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</body>
</html>