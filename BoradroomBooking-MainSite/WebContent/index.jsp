<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="Header.jsp" %>
<title><%=resource.getString("index.label.title") %></title>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
<!-- Navbar section -->
	
	<!-- Main Title Section -->
	<div class="container-fluid">
		<div class="headerContent">
			<div class="row">
				<div class="col-md-2">
				  <img src="resource/logo2.png" class="img-responsive">
				</div>
				<div class="col-md-10">
					<h1 class="page-header">
						<span class="bgfont"><%=resource.getString("index.label.B") %></span><span class="smallFont"><%=resource.getString("index.label.oard") %></span>
						<span class="bgfont"><%=resource.getString("index.label.R") %></span><span class="smallFont"><%=resource.getString("index.label.oom") %></span>
						<span class="bgfont"><%=resource.getString("index.label.BK") %></span><span class="smallFont"><%=resource.getString("index.label.ooking") %></span>
					</h1>
					<h4 class="italic"><%=resource.getString("index.label.madeEasy") %></h4>
				</div>
			</div>
		</div>	
	</div>

	<!-- Container (About Section) -->
	<div id="about" class="container-fluid">
		<div class="aboutContent">
			<h2><strong><a href="Booking.jsp?rowOffSet=1"><%=resource.getString("index.header.book") %></a></strong></h2>
			<h3>
				<%=resource.getString("index.label.about") %>
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
		    						<h2><%=resource.getString("index.label.convenient") %></h2>
		    						<ul>
		    							<li><h4><%=resource.getString("index.list.spaces") %></h4></li>
		    							<li><h4><%=resource.getString("index.list.location") %></h4></li>
		    							<li><h4><%=resource.getString("index.list.provinces") %></h4></li>	
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
		    						<h2><%=resource.getString("index.label.fast") %></h2>
		    						<ul>
		    							<li><h4><%=resource.getString("index.list.online") %></h4></li>
		    							<li><h4><%=resource.getString("index.list.support") %></h4></li>
		    							<li><h4><%=resource.getString("index.list.minutes") %></h4></li>	
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
		    						<h2><%=resource.getString("index.label.secure") %></h2>
		    						<ul>
		    							<li><h4><%=resource.getString("index.list.identity") %></h4></li>
		    							<li><h4><%=resource.getString("index.list.login") %></h4></li>
		    							<li><h4><%=resource.getString("index.list.profile") %></h4></li>	
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
			<h2><strong><%=resource.getString("index.label.available") %></strong></h2>
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
				    <span class="sr-only"><%=resource.getString("index.label.previous") %></span>
				  </a>
				  <a class="right carousel-control" href="#roomCarousel" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only"><%=resource.getString("index.label.next") %></span>
				  </a>
			</div>
		</div>
	</div>
	<!-- Container (Contact Section) -->
	<div id="contact" class="container-fluid bg-grey">
		<h2 class="text-center"><%=resource.getString("index.header.contact") %></h2>
		<div class="row">
			<div class="col-sm-5">
			  <p><%=resource.getString("index.label.contactInfo") %></p>
			  <p><span class="glyphicon glyphicon-map-marker"></span> <%=resource.getString("index.label.loaction") %></p>
			  <p><span class="glyphicon glyphicon-phone"></span> <%=resource.getString("index.label.tel") %></p>
			  <p><span class="glyphicon glyphicon-envelope"></span> <%=resource.getString("index.label.email") %></p>
			</div>
			<div class="col-sm-7">
				<div class="row">
					<div class="col-sm-6 form-group">
					  <input class="form-control" id="name" name="name" placeholder="<%=resource.getString("index.placeholder.name") %>" type="text" required>
					</div>
				<div class="col-sm-6 form-group">
				  <input class="form-control" id="email" name="email" placeholder="<%=resource.getString("index.placeholder.email") %>" type="email" required>
				</div>
				</div>
			<textarea class="form-control" id="comments" name="comments" placeholder="<%=resource.getString("index.placeholder.comment") %>" rows="5"></textarea><br>
				<div class="row">
					<div class="col-sm-12 form-group">
						<button class="btn btn-default pull-right" type="submit"><%=resource.getString("index.button.send") %></button>
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