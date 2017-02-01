<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Board Room Booking</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="soStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel='stylesheet' href='fullcalendar/fullcalendar.css' />
	<script src='fullcalendar/lib/jquery.min.js'></script>
	<script src='fullcalendar/lib/moment.min.js'></script>
	<script src='fullcalendar/fullcalendar.js'></script>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
<!-- Navbar section -->
	<%@include file="Header.jsp" %>
	<!-- Main Title Section -->
	<div class="jumbotron">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2">
				  <img src="resource/logo2.png" class="img-responsive">
				</div>
				<div class="col-md-10">
					<h1 class="title">
						<span class="bgfont">B</span><span class="smallFont">ORAD</span>
						<span class="bgfont">R</span><span class="smallFont">OOM</span>
						<span class="bgfont">B</span><span class="smallFont">OOKING</span>
					</h1>
					<h3 class="ital">BOOKING MADE EASY</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- Container (About Section) -->
	<div id="about" class="container-fluid">
		<h2>Book a room NOW!</h2>
		<p>We Have a variety of rooms and facilities to choose from across Canada.</p>	
		<div class="row text-center">
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="resource/meetingA.jpg" alt="Vancouver">
					
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="resource/meetingB.jpg" alt="Ottawa">
					
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="resource/meetingC.jpg" alt="Montreal">
					
				</div>
			</div>
		</div>
	</div>
	<!-- Container (Booking Section) -->
	<!-- <div id="booking" class="container-fluid">
		<h2 class="text-center" >BOOKING</h2>
		<hr>
		<div id="calendar"></div>
	</div> -->
	<!-- Container (Contact Section) -->
	<div id="contact" class="container-fluid bg-grey">
		<h2 class="text-center">CONTACT</h2>
		<div class="row">
			<div class="col-sm-5">
			  <p>Contact us and we'll get back to you within 24 hours.</p>
			  <p><span class="glyphicon glyphicon-map-marker"></span> Ottawa, ON CAN</p>
			  <p><span class="glyphicon glyphicon-phone"></span> +1800-555-5555</p>
			  <p><span class="glyphicon glyphicon-envelope"></span> dude@algonquin.com</p>
			</div>
			<div class="col-sm-7">
				<div class="row">
					<div class="col-sm-6 form-group">
					  <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
					</div>
				<div class="col-sm-6 form-group">
				  <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
				</div>
				</div>
			<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
				<div class="row">
					<div class="col-sm-12 form-group">
						<button class="btn btn-default pull-right" type="submit">Send</button>
					</div>
				</div>
			</div>
	  </div>
	</div>
	<!-- script for smooth scrolling & iniate calendar-->
	<!-- <script>
		$(document).ready(function(){
			$('#calendar').fullCalendar({
				dayClick: function() {
					alert('A day has been clicked!');
					}
			});
		  // Add smooth scrolling to all links in navbar + footer link
		  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
			// Make sure this.hash has a value before overriding default behavior
			if (this.hash !== ""){
			  // Prevent default anchor click behavior
			  event.preventDefault();

			  // Store hash
			  var hash = this.hash;

			  // Using jQuery's animate() method to add smooth page scroll
			  // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
			  $('html, body').animate({
				scrollTop: $(hash).offset().top
			  }, 900, function(){
		   
				// Add hash (#) to URL when done scrolling (default click behavior)
				window.location.hash = hash;
			  });
			} // End if
		  });
		})
	</script> -->
</body>
</html>