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
    <title>Insert Payment Details - SP Airlines</title>
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
                <li><a href="index.jsp">Home</a></li>
                <li><a href="plantravel.jsp">Plan travel</a></li>
                <li><a href="destinations.jsp">Destinations</a></li>
                <li><a href="travelinfo.jsp">Travel Info</a></li>
                <%
				String name = (String)session.getAttribute("name"); 

				if (name != null) {
					out.print("Welcome " + name + " | <a href='index.jsp'>Logout</a>");
				} else {
					%>
                    <li><a href="#popup1" class="button special">Login</a></li>
                    <%
				}
				%>
            </ul>
        </nav>
    </header>
    <article id="popup1" class="popup1">
        <h2>Login</h2>
        <a class="close1" href="#">&times;</a>
        <article class="content1">
            <form action="verifyUser.jsp">
                Login ID : <input type="text" name="loginid" /> <br> Password : <input type="password" name="password" /> <br>
                <input type="submit" name="btnSubmit" value="Login" />
            </form>
            <%
				String loginfail = request.getParameter("login");
	
				if (loginfail != null && loginfail.equals("fail")) {
				out.print("You entered an invalid ID/Password");
				}
			%>
        </article>
    </article>
    <section id="one" class="wrapper style1">
    	<header class="major">
         	<h2>Please Enter Payment Information</h2>
     	</header>
        <div class="container">
            <div class="row">
                <div class="12u">
                 <% 
                 	String source = request.getParameter("from");
         			if (source!=null && source.equals("InsertPassengerDetailsServlet")) {	
         				
         		
         		 %>
         		<h3>Flight Details</h3>   
				<table border='1'>
				<tr>
					<td>Aircraft Flight Number</td>
					<td>Origin</td>
					<td>Destination</td>
					<td>Depart Date</td>
					<td>Cabin Class</td>
					<td>Total Number of Passengers</td>
					<td>Total Cost</td>
				</tr>
		
				<% 
				ArrayList<addBookingDetails> bookingList = (ArrayList<addBookingDetails>)session.getAttribute("booking");
	
				if(bookingList!=null) {
					for(int i = 0; i<bookingList.size(); i++) {
						addBookingDetails a = (addBookingDetails) bookingList.get(i);
						int totalcost = 0;
						if (session.getAttribute("interconnecting") ==null && session.getAttribute("returnflight") ==null && session.getAttribute("multicity") ==null) {
							totalcost = a.getCost()*a.gettotalnoofpassengers();
						} else {
							totalcost = a.gettotalinterCost()*a.gettotalnoofpassengers();
						}
				%>
				<tr>
				<%
						out.print("<td>"+a.getAircraftFlightNumber()+"</td>"); 
						out.print("<td>"+a.getOriginAirport()+"</td>");
						out.print("<td>" + a.getDestAirport()+"</td>");
						out.print("<td>"+a.getDepartDate()+"</td>");
		
						if (session.getAttribute("interconnecting") ==null && session.getAttribute("returnflight") == null && session.getAttribute("multicity") ==null) {
			
							out.print("<td>"+a.getcabinclass()+"</td>"); 
							out.print("<td>"+a.gettotalnoofpassengers()+"</td>");
							out.print("<td> SGD "+totalcost+"</td>");
		
						} else {
		
							out.print("<td rowspan ='2'>"+a.getcabinclass()+"</td>");
							out.print("<td rowspan ='2'>"+a.gettotalnoofpassengers()+"</td>");
							out.print("<td rowspan='2'> SGD "+totalcost+"</td>");
				%>
				</tr>
				<tr>
				<%
							out.print("<td>"+ a.getAircraftFlightNumber2() + "</td>");
							out.print("<td>"+ a.getOriginAirport2()+"</td>");
							out.print("<td>"+ a.getDestAirport2() + "</td>");
							out.print("<td>"+ a.getDepartDate2() + "</td>");
				%>
				</tr>
				<%	
						}
			  	}
			}
					
				%>
				</table> <br>
                 <form action="InsertPaymentDetailsServlet" method="POST">
                        <h3>Payment Details</h3>
                        Card Holder's Name* <input type="text" name="name" required/>
                        Card No* <input type="text" name="cardNo" pattern="[0-9\-]{17,20}" title="Please the 16 digits on shown your Credit/Debit Card. E.g. 5264-6770-4552-1067" required/> 
                        Expiry* <input type="text" name="expiry" pattern="[0-9\/]{5}" title="Please enter in MM/YY format" required/>
                        CVV* <input type="text" name="cvv" pattern ="[0-9]{3}" title="Please enter your 3 digit code shown on the back of your Credit/Debit Card" required/>
                        Billing Address* <input type="text" name="bill" required/>
                        Country* <input type="text" name="country" required/>
                        Postal Code <input type ="text" name="postcode" />
                        City* <input type="text" name="city" required/>
                        State <input type="text" name="state" />
                       <input type="submit" value="Proceed" class="bookFlight" />
                  </form>
                  <form action ="insertPassengerDetails.jsp?back=insertPaymentDetailsjsp" method ="POST">
                  		<input type="submit" value="Back" class="bookFlight2" />
                  </form>
                  <form action="clearBooking.jsp" method = "POST">
                    	<input type="submit" value="Delete Booking" class="bookFlight3" />
                  </form>
                   <%
         			}
       
         			
         		String reEnter = request.getParameter("back2");
         		if (reEnter != null && reEnter.equals("bookingSummaryjsp")) {
         		
                   %>
                   
                <h3>Flight Details</h3>   
				<table border='1'>
				<tr>
					<td>Aircraft Flight Number</td>
					<td>Origin</td>
					<td>Destination</td>
					<td>Depart Date</td>
					<td>Cabin Class</td>
					<td>Total Number of Passengers</td>
					<td>Total Cost</td>
				</tr>
		
				<% 
					ArrayList<addBookingDetails> bookingList = (ArrayList<addBookingDetails>)session.getAttribute("booking");
	
					if(bookingList!=null) {
						for(int i = 0; i<bookingList.size(); i++) {
							addBookingDetails a = (addBookingDetails) bookingList.get(i);
							int totalcost = 0;
							if (session.getAttribute("interconnecting") ==null && session.getAttribute("returnflight") ==null && session.getAttribute("multicity") ==null) {
								totalcost = a.getCost()*a.gettotalnoofpassengers();
							} else {
								totalcost = a.gettotalinterCost()*a.gettotalnoofpassengers();
							}
				%>
				<tr>
				<%
							out.print("<td>"+a.getAircraftFlightNumber()+"</td>"); 
							out.print("<td>"+a.getOriginAirport()+"</td>");
							out.print("<td>" + a.getDestAirport()+"</td>");
							out.print("<td>"+a.getDepartDate()+"</td>");
			
							if (session.getAttribute("interconnecting") ==null && session.getAttribute("returnflight") == null && session.getAttribute("multicity") ==null) {
				
								out.print("<td>"+a.getcabinclass()+"</td>"); 
								out.print("<td>"+a.gettotalnoofpassengers()+"</td>");
								out.print("<td> SGD "+totalcost+"</td>");
			
							} else {
			
								out.print("<td rowspan ='2'>"+a.getcabinclass()+"</td>");
								out.print("<td rowspan ='2'>"+a.gettotalnoofpassengers()+"</td>");
								out.print("<td rowspan='2'> SGD "+totalcost+"</td>");
				%>
				</tr>
				<tr>
				<%
								out.print("<td>"+ a.getAircraftFlightNumber2() + "</td>");
								out.print("<td>"+ a.getOriginAirport2()+"</td>");
								out.print("<td>"+ a.getDestAirport2() + "</td>");
								out.print("<td>"+ a.getDepartDate2() + "</td>");
				%>
				</tr>
				<%	
							}
			  			}
					}
         		
					
				%>
				</table> <br>
                 <form action="InsertPaymentDetailsServlet" method="POST">
                        <h3>Payment Details</h3>
                        Card Holder's Name* <input type="text" name="name" required/>
                        Card No* <input type="text" name="cardNo" pattern="[0-9\-]{17,20}" title="Please the 16 digits on shown your Credit/Debit Card. E.g. 5264-6770-4552-1067" required/> 
                        Expiry* <input type="text" name="expiry" pattern="[0-9\/]{5}" title="Please enter in MM/YY format" required/>
                        CVV* <input type="text" name="cvv" pattern ="[0-9]{3}" title="Please enter your 3 digit code shown on the back of your Credit/Debit Card"  required/>
                        Billing Address* <input type="text" name="bill" required/>
                        Country* <input type="text" name="country" required/>
                        Postal Code <input type ="text" name="postcode" />
                        City* <input type="text" name="city" required/>
                        State <input type="text" name="state" />
                       <input type="submit" value="Proceed" class="bookFlight" />
                  </form>
                  <form action ="insertPassengerDetails.jsp?back=insertPaymentDetailsjsp" method ="POST">
                  		<input type="submit" value="Back" class="bookFlight2" />
                  </form>
                  <form action="clearBooking.jsp" method = "POST">
                    	<input type="submit" value="Delete Booking" class="bookFlight3" />
                   </form>
                  
                  <%
                  	session.removeAttribute("paymentD");
         		}
                  %>
                </div>
              </div>
            </div>
        </section>
     <!-- Footer -->
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