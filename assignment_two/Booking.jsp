<%@ include file = "checkStatus.jsp" %>
<%@page import="dbaccess.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Booking Table - Admin</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
    <script src="js/jquery.min.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/skel-layers.min.js"></script>
    <script src="js/init.js"></script>
    <link href="/css/skel.css" rel="stylesheet" type="text/css">
    <link href="/css/style.css" rel="stylesheet" type="text/css">
    <link href="/css/style-xlarge.css" rel="stylesheet" type="text/css">
</head>

<body id="top">
    <!-- Header -->
    <header id="header" class="skel-layers-fixed">
        <h1><a href="index.jsp">SP Airlines</a></h1>
        <nav id="nav">
            <ul>
				<li>Welcome <a href="adminIndex.jsp">Administrator</a> | <a href='logout.jsp'>Logout</a></li>
            </ul>
        </nav>
    </header>
        <section id="one" class="wrapper style1">
        <div class="container">
        	<div class ="row">	
        		<div class ="12u">
		            <section>
		            	<form action="BookingSearchServlet" method="POST">
		    				Search Booking Table: <input type="text" name="searchResults" />
		    				<input type="submit" value="Search" class="searchResults"/>
						</form>
		                <%
		                ArrayList<BookingDetails> booking = (ArrayList<BookingDetails>)request.getAttribute("bookingData");
		                if (booking != null) {
		                	%>
		                	<table border =1 class="FSDetailed">
		    		    	<tr><td>Booking_ID</td><td>flightsdleid_1</td><td>flightsdleid_2</td><td>cabin_class</td><td>no_of_passengers</td><td>title_passenger</td><td>name_passenger</td><td>email_passenger</td><td>contactno_passenger</td><td>cost</td></tr>			
		        			<%
		        			for(int i = 0; i < booking.size(); i++) {
		        				BookingDetails b = (BookingDetails) booking.get(i);
		        				if(b.getflightsdleid2() !=0){
				    			out.print("<tr><td>" + b.getBookingID() + "</td><td>" + b.getflightsdleid1() + "</td><td>" + b.getflightsdleid2() + "</td><td>" + b.getcabinclass() + "</td><td>" + b.getnoofpassengers() + "</td><td>" + b.gettitle() + "</td><td>" + b.getname() + "</td><td>" + b.getemail() + "</td><td>" + b.getcontactno() + "</td><td>" + b.getcost() + "</td></tr>");	
		        				} else {
		        				out.print("<tr><td>" + b.getBookingID() + "</td><td>" + b.getflightsdleid1() + "</td><td> </td><td>" + b.getcabinclass() + "</td><td>" + b.getnoofpassengers() + "</td><td>" + b.gettitle() + "</td><td>" + b.getname() + "</td><td>" + b.getemail() + "</td><td>" + b.getcontactno() + "</td><td>" + b.getcost() + "</td></tr>");	
		        				}
		        			}
		                }
		        		%>
		        		</table>
		        		<a href="adminIndex.jsp">Return</a>
						</section>
				</div>
			</div>
		</div>
    	</section>
   <footer id="footer">
        <div class="container">
            <div class="row double">
                <div class="6u">
                    <div class="row collapse-at-2">
                        <div class="6u">
                            <h3>About Us</h3>
                            <ul class="alt">
                                <li><a href="#">SP Airlines Story</a></li>
                                <li><a href="#">SP Airlines Team</a></li>
                            </ul>
                        </div>
                        <div class="6u">
                            <h3>Support</h3>
                            <ul class="alt">
                                <li><a href="#">Contact Us</a></li>
                                <li><a href="#">Feedback</a></li>
                                <li><a href="#">FAQ</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Terms and Conditions</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="6u">
                    <h2>SP Airlines</h2>
                    <p>With SP Airlines + U, its so possible!</p>
                    <ul class="icons">
                        <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        <li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
                        <li><a href="#" class="icon fa-pinterest"><span class="label">Pinterest</span></a></li>
                    </ul>
                </div>
            </div>
            <ul class="copyright">
                <li>&copy; SP Airlines. All rights reserved.</li>
                <li>Design: <a href="http://templated.co">TEMPLATED</a></li>
                <li>Images: <a href="http://unsplash.com">Unsplash</a></li>
            </ul>
        </div>
    </footer>

</body>
</html>