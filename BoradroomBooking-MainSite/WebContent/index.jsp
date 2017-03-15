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
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
<!-- Navbar section -->
	<%@include file="Header.jsp" %>
	<!-- Main Title Section -->
	<div class="container-fluid">
		<div class="headerContent">
			<div class="row">
				<div class="col-md-2">
				  <img src="resource/logo2.png" class="img-responsive">
				</div>
				<div class="col-md-10">
					<h1 class="page-header">
						<span class="bgfont">B</span><span class="smallFont">OARD</span>
						<span class="bgfont">R</span><span class="smallFont">OOM</span>
						<span class="bgfont">B</span><span class="smallFont">OOKING</span>
					</h1>
					<h4 class="italic">BOOKING MADE EASY</h4>
				</div>
			</div>
		</div>	
	</div>

	<!-- Container (About Section) -->
	<div id="about" class="container-fluid">
		<div class="aboutContent">
			<h2><strong><a href="Booking.jsp?rowOffSet=1">BOOK A ROOM NOW!</a></strong></h2>
			<h3>
				We Have a variety of rooms and facilities to choose from across Canada. We offer individuals, entrepreneurs and 
				small businesses effective business solutions including meeting rooms, day offices, conference rooms, and coworking spaces.
				Our meeting rooms and facilities come fully equipped with up-to-date technologies for all business needs.
			</h3>
			<div class="row">
	    		<div class="col-sm-4">
	    			<div class="row">
	    				<div class="col-sm-5">
		    				<span class="glyphicon glyphicon-globe logo"></span>
		    			</div>
		    			<div class="col-sm-7">
		    				<ul class="list-unstyled">
		    					<li>
		    						<h2>CONVENIENT</h2>
		    						<ul>
		    							<li><h4>Over 100 spaces</h4></li>
		    							<li><h4>Over 100 locations</h4></li>
		    							<li><h4>5 provinces</h4></li>	
		    						</ul>
		    					</li>	
		    				</ul>
		    			</div>
		    		</div>
	    		</div>
	    		<div class="col-sm-4">
	    			<div class="row">
	    				<div class="col-sm-5">
		    				<span class="glyphicon glyphicon-time logo"></span>
		    			</div>
		    			<div class="col-sm-7">
		    				<ul class="list-unstyled">
		    					<li>
		    						<h2>FAST</h2>
		    						<ul>
		    							<li><h4>Book Online</h4></li>
		    							<li><h4>Multi-Browser Support</h4></li>
		    							<li><h4>Book in minutes</h4></li>	
		    						</ul>
		    					</li>	
		    				</ul>
		    			</div>
		    		</div>	
	    		</div>
	    		<div class="col-sm-4">
	    			<div class="row">
	    				<div class="col-sm-5">
		    				<span class="glyphicon glyphicon-lock logo"></span>
		    			</div>
		    			<div class="col-sm-7">
		    				<ul class="list-unstyled">
		    					<li>
		    						<h2>SECURE</h2>
		    						<ul>
		    							<li><h4>Protected Identity</h4></li>
		    							<li><h4>Safe Login</h4></li>
		    							<li><h4>Guarded Profile</h4></li>	
		    						</ul>
		    					</li>	
		    				</ul>
		    			</div>
		    		</div>
	    		</div>
	    	</div>
    	</div>	
	</div>
	<!-- Container (Example Section) -->
	<div id="example" class="container-fluid text-center">
		<div class="exampleContent">
			<hr>
			<h2><strong>SOME OF THE ROOMS AVAILABLE...</strong></h2>
			<hr>
			<div id="roomCarousel" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				    <li data-target="#roomCarousel" data-slide-to="0" class="active"></li>
				    <li data-target="#roomCarousel" data-slide-to="1"></li>
				    <li data-target="#roomCarousel" data-slide-to="2"></li>
				  </ol>
				  <!--  slides -->
					<div class="carousel-inner" role="listbox">  
						<div class="item active">
							<img src="resource/meetingA.jpg" alt="Vancouver">
						</div>
						<div class="item">
							<img src="resource/meetingB.jpg" alt="Ottawa">
						</div>
						<div class="item">
							<img src="resource/meetingC.jpg" alt="Montreal">
						</div>
					</div>
				  <!-- Left and right controls -->
				  <a class="left carousel-control" href="#roomCarousel" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#roomCarousel" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
			</div>
		</div>
	</div>
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
	<!-- script for smooth scrolling TODO add to header? -->
	<script>
		$(document).ready(function(){
	
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
	</script> 
</body>
</html>