<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="first.aspx.cs" Inherits="CarRentalSystem.first" %>

<!DOCTYPE html>
<html>
<title>Car Rental System</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
</style>
<body>
    <p style="text-align:center;"><img src="images/drive.jpg" alt="Logo"></p>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
      
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">HOME</a>
      <a href="register.aspx" class="w3-bar-item w3-button w3-padding-large">REGISTER</a>
      <a href="login.aspx" class="w3-bar-item w3-button w3-padding-large w3-hide-small">LOGIN</a>
      <a href="FAQ.aspx" class="w3-bar-item w3-button w3-padding-large w3-hide-small">FAQ</a>
    
    
    <a href="#band" class="w3-bar-item w3-button w3-padding-large w3-hide-small">ABOUT</a>
    <a href="#contact" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACT</a>
    </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="#band" class="w3-bar-item w3-button w3-padding-large">ABOUT</a>
  <a href="#contact" class="w3-bar-item w3-button w3-padding-large">CONTACT</a>
  
</div>

<!-- Page content -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">

  <!-- Automatic Slideshow Images -->
  <div class="mySlides w3-display-container w3-center">
    <img src="/images/maserati.jpg" style="width:100%">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
        
    </div>
  </div>
  <div class="mySlides w3-display-container w3-center">
    <img src="/images/bmw.jpg" style="width:100%">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
      </div>
  </div>
  <div class="mySlides w3-display-container w3-center">
    <img src="/images/mercedes.jpg" style="width:100%">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
      </div>
  </div>

  <!-- The Band Section -->
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="band">
    <h2 class="w3-wide">ABOUT US</h2>
    <p class="w3-justify">This system provides owner to rent their cars.The system allows customer to rent a car for few hours and also for a period of days.The system allows user to create an account and choose from a wide array of cars giving them different options to choose from.</p>
    <div class="w3-row w3-padding-32">
      <div class="w3-third">
        <p><b>Sachin</b></p>
        <img src="/images/sachin.jpg" class="w3-round w3-margin-bottom" alt="Random Name" style="width:60%">
      </div>
      <div class="w3-third">
        <p><b>Dhruvin</b></p>
        <img src="/images/dhruvin.jpg" class="w3-round w3-margin-bottom" alt="Random Name" style="width:80%">
      </div>
      <div class="w3-third">
        <p><b>Abhi</b></p>
        <img src="/images/abhi.jpg" class="w3-round" alt="Random Name" style="width:80%">
      </div>
    </div>
  </div>

 

  
  <!-- The Contact Section -->
  <div class="w3-container w3-content w3-padding-64" style="max-width:800px" id="contact">
    <h2 class="w3-wide w3-center">CONTACT US</h2>
    
    <div class="w3-row w3-padding-32">
      <div class="w3-col m6 w3-large w3-margin-bottom">
        <i class="fa fa-map-marker" style="width:30px"></i> Nadiad, Gujarat<br>
        <i class="fa fa-phone" style="width:30px"></i> Phone: 7990484365<br>
        <i class="fa fa-envelope" style="width:30px"> </i> Email: ownerofmysite@gmail.com<br>
      </div>
      <div class="w3-col m6">
        <form action="/contact.aspx" target="_blank">
          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
            <div class="w3-half">
              <input class="w3-input w3-border" type="text" placeholder="Name" required name="Name">
            </div>
            <div class="w3-half">
              <input class="w3-input w3-border" type="email" placeholder="Email"title="Please enter a valid email" required name="Email">
            </div>
          </div>
          <input class="w3-input w3-border" type="text" placeholder="Message" required name="Message">
          <button class="w3-button w3-black w3-section w3-right" type="submit" >SEND</button>
        </form>
      </div>
    </div>
  </div>
  
<!-- End Page Content -->
</div>
<!-- Add Google Maps -->
<!--<div id="googleMap" style="height:400px;" class="w3-grayscale-max"></div>-->
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d24762.44870646887!2d72.87881475368096!3d22.692532059877696!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e5b25a2324821%3A0x2b3e42d294a5016b!2sVaniya+Vad%2C+Akshar+Twp%2C+Nadiad%2C+Gujarat+387001!5e0!3m2!1sen!2sin!4v1516473382136" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>-->
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge">
   <p class="white-text">
                Copyright © 2018 by Drive.<br />
                All Rights Reserved.<br />
                
            </p>
        </footer>

<script>
// Automatic Slideshow - change image every 4 seconds
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 4000);    
}

// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

// When the user clicks anywhere outside of the modal, close it
var modal = document.getElementById('ticketModal');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
</html>

