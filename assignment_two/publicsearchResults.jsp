<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Search Flight Results - SP Airlines</title>
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
    <%@page import ="java.sql.*"%>
    <%@page import="dbaccess.*"%>
	<%@ page import="java.util.*" %>
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
					out.print("Welcome " + name + " | <a href='index.jsp'>logout</a>");
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
    <section id="main" class="wrapper style1">
            <div class="container">
                <div class="row">
                    <div class="12u">
                 		<%
    					//out.print(request.getAttribute("userData"));
		                ArrayList<PublicSearch> Public = (ArrayList<PublicSearch>)request.getAttribute("publicsearchData");
		                String dest = (String)request.getAttribute("dest");
		                String dest2 = (String)request.getAttribute("dest2");
		                String group1 = (String)request.getAttribute("group1");
		                String origin = "";
	                    for(int i = 0; i < Public.size(); i++) {
	        				PublicSearch b = (PublicSearch) Public.get(i);
	        				origin = b.getOriginAirport();
                		}
		                if (group1.equals("return")) {
	                    	if ((Public.size() == 1 && !origin.equalsIgnoreCase(dest) || Public.size() == 2)) {
	                    		out.print("<h3>Search Results</h3>");
	                		%>
		                    	<table border =1>
		    					<tr><td>Aircraft Flight Number</td><td>Origin Airport</td><td>Destination Airport</td><td>Cost</td><td>Departure Date</td><td>Departure Time</td><td>Arrival Time</td><td>Flight Time</td><td>Seats Left</td><td>Full Flight Details</td><td>Book Flight</td></tr>        			
	    					<%
	        					for(int i = 0; i < Public.size(); i++) {
			        				PublicSearch b = (PublicSearch) Public.get(i);
			        				if (i == 0 && !origin.equalsIgnoreCase(dest)) {
				        				out.print("<tr><td>" + b.getAircraftFlightNumber() + "</td><td>" + b.getOriginAirport() + "</td><td>" + b.getDestAirport() + "</td><td> SGD " + b.getCost() + "</td><td>" + b.getDepartDate() + "</td><td>" + b.getDepartTime() + "</td><td>" + b.getArrivalTime() + "</td><td>" + b.getFlightTime() + "</td><td>" + b.getSeatsLeft() + "</td><td><a href='publicDetailedFlight.jsp?AcNo="+ b.getAircraftID() +"&FgtNo="+b.getflightsdleid()+"'>Detailed</a></td><td><a href='addBookingServlet'>Book</a></tr>");
				        				session.setAttribute("flightid", b.getflightsdleid());
				        				session.setAttribute("flightcost", b.getCost());
			        				} else if (i == 0) {
				        				out.print("<tr><td>" + b.getAircraftFlightNumber() + "</td><td>" + b.getOriginAirport() + "</td><td>" + b.getDestAirport() + "</td><td> SGD " +  b.getCost() + "</td><td>"+ b.getDepartDate() + "</td><td>" + b.getDepartTime() + "</td><td>" + b.getArrivalTime() + "</td><td>" + b.getFlightTime() + "</td><td>" + b.getSeatsLeft() + "</td><td><a href='publicDetailedFlight.jsp?AcNo="+ b.getAircraftID() +"&FgtNo="+b.getflightsdleid()+"'>Detailed</a></td><td rowspan='2'><a href='addBookingServlet'>Book</a></td></tr>");
				        				session.setAttribute("flightid", b.getflightsdleid());
				        				session.setAttribute("flightcost", b.getCost());
				        				String returnflight = "yes";
				        				session.setAttribute("returnflight", returnflight);
			        				} else {
				        				out.print("<tr><td>" + b.getAircraftFlightNumber() + "</td><td>" + b.getOriginAirport() + "</td><td>" + b.getDestAirport() + "</td><td> SGD " + b.getCost()+ "</td><td>" + b.getDepartDate() + "</td><td>" + b.getDepartTime() + "</td><td>" + b.getArrivalTime() + "</td><td>" + b.getFlightTime() + "</td><td>" + b.getSeatsLeft() + "</td><td><a href='publicDetailedFlight.jsp?AcNo="+ b.getAircraftID() +"&FgtNo="+b.getflightsdleid()+"'>Detailed</a></td></tr>");	
				        				session.setAttribute("flightid2", b.getflightsdleid());
				        				session.setAttribute("flightcost2", b.getCost());
				        				String returnflight = "yes";
				        				session.setAttribute("returnflight", returnflight);
			        				}
	        					}
	                    	}
	    					%>
	    					</table>
	    					<%
							if(Public.size() == 1 && !origin.equalsIgnoreCase(dest)) {
								out.print("<h3>There are no returning flights</h3>");
							} else if ((Public.size() == 0) || (Public.size() == 1 && origin.equalsIgnoreCase(dest))){
	            				out.print("<h3>There are no flights</h3>");
	            			} 
		               	} else if (group1.equals("oneway")) { 
		               		if(Public.size() > 0) {
    							out.print("<h3>Search Results</h3>");
		               			for(int i = 0; i < Public.size(); i++) {
        						PublicSearch b = (PublicSearch) Public.get(i);
        							if(Public.size() == 1) {
            							out.print("<table>");
            							out.print("<tr><td>Aircraft Flight Number</td><td>Origin Airport</td><td>Destination Airport</td><td>Cost</td><td>Departure Date</td><td>Departure Time</td><td>Arrival Time</td><td>Flight Time</td><td>Seats Left</td><td>Full Flight Details</td><td>Book Flight</td></tr>");
    		        		    		out.print("<tr><td>" + b.getAircraftFlightNumber() + "</td><td>" + b.getOriginAirport() + "</td><td>" + b.getDestAirport() + "</td><td> SGD " + b.getCost() + "</td><td>" + b.getDepartDate() + "</td><td>" + b.getDepartTime() + "</td><td>" + b.getArrivalTime() + "</td><td>" + b.getFlightTime() + "</td><td>" + b.getSeatsLeft() + "</td><td><a href='publicDetailedFlight.jsp?AcNo="+ b.getAircraftID() +"&FgtNo="+b.getflightsdleid()+"'>Detailed</a></td><td><a href='addBookingServlet'>Book</a></td></tr>");	
    		        		    		session.setAttribute("flightid", b.getflightsdleid());
    		        		    		session.setAttribute("flightcost", b.getCost());
    		        		    		out.print("</table>");
    		        		    		out.print("<div class='border'></div>");
    		        		    		out.print("<h3>There are no interconnecting flights</h3>");
            						} else if (Public.size() == 2 && i == 0) {
            							out.print("<h3>There are no direct flights</h3>");
            							out.print("<div class='border'></div>");
            							out.print("<table>");
            							out.print("<tr><td>Aircraft Flight Number</td><td>Origin Airport</td><td>Destination Airport</td><td>Cost</td><td>Departure Date</td><td>Departure Time</td><td>Arrival Time</td><td>Flight Time</td><td>Seats Left</td><td>Full Flight Details</td><td>Book Flight</td></tr>");
    		        		    		out.print("<tr><td>" + b.getAircraftFlightNumber() + "</td><td>" + b.getOriginAirport() + "</td><td>" + b.getDestAirport() + "</td><td> SGD " + b.getCost() + "</td><td>" + b.getDepartDate() + "</td><td>" + b.getDepartTime() + "</td><td>" + b.getArrivalTime() + "</td><td>" + b.getFlightTime() + "</td><td>" + b.getSeatsLeft() + "</td><td><a href='publicDetailedFlight.jsp?AcNo="+ b.getAircraftID() +"&FgtNo="+b.getflightsdleid()+"'>Detailed</a></td><td rowspan='2'><a href='addBookingServlet'>Book</a></td></tr>");
    		        		    		session.setAttribute("flightid", b.getflightsdleid());
    		        		    		session.setAttribute("flightcost", b.getCost());
    		        		    		String interconnecting = "yes";
    		        		    		session.setAttribute("interconnecting", interconnecting);
            						} else if (Public.size() == 2 &&  i == 1) {
    		        		    		out.print("<tr><td>" + b.getAircraftFlightNumber() + "</td><td>" + b.getOriginAirport() + "</td><td>" + b.getDestAirport() + "</td><td> SGD " + b.getCost() + "</td><td>" + b.getDepartDate() + "</td><td>" + b.getDepartTime() + "</td><td>" + b.getArrivalTime() + "</td><td>" + b.getFlightTime() + "</td><td>" + b.getSeatsLeft() + "</td><td><a href='publicDetailedFlight.jsp?AcNo="+ b.getAircraftID() +"&FgtNo="+b.getflightsdleid()+"'>Detailed</a></td></td></tr>");	
    		        		    		session.setAttribute("flightid2", b.getflightsdleid());
    		        		    		session.setAttribute("flightcost2", b.getCost());
    		        		    		String interconnecting = "yes";
    		        		    		session.setAttribute("interconnecting", interconnecting);
    		        		    		out.print("</table>");
            						} else if (Public.size() == 3 && i == 0) {
            							out.print("<table>");
            							out.print("<tr><td>Aircraft Flight Number</td><td>Origin Airport</td><td>Destination Airport</td><td>Cost</td><td>Departure Date</td><td>Departure Time</td><td>Arrival Time</td><td>Flight Time</td><td>Seats Left</td><td>Full Flight Details</td><td>Book Flight</td></tr>");
    		        		    		out.print("<tr><td>" + b.getAircraftFlightNumber() + "</td><td>" + b.getOriginAirport() + "</td><td>" + b.getDestAirport() + "</td><td> SGD " + b.getCost() + "</td><td>" + b.getDepartDate() + "</td><td>" + b.getDepartTime() + "</td><td>" + b.getArrivalTime() + "</td><td>" + b.getFlightTime() + "</td><td>" + b.getSeatsLeft() + "</td><td><a href='publicDetailedFlight.jsp?AcNo="+ b.getAircraftID() +"&FgtNo="+b.getflightsdleid()+"'>Detailed</a></td><td><a href='addBookingServlet'>Book</a></td></tr>");
    		        		    		session.setAttribute("flightid", b.getflightsdleid());
            							out.print("</table>");
    		        		    		out.print("<div class='border'></div>");
			    		    			out.print("<h3>Interconnecting Flights</h3>");
			    		    			out.print("<table>");
            							out.print("<tr><td>Aircraft Flight Number</td><td>Origin Airport</td><td>Destination Airport</td><td>Cost</td><td>Departure Date</td><td>Departure Time</td><td>Arrival Time</td><td>Flight Time</td><td>Seats Left</td><td>Full Flight Details</td><td>Book Flight</td></tr>");
            						} else if (Public.size() == 3 && i == 1) {
            							out.print("<tr><td>" + b.getAircraftFlightNumber() + "</td><td>" + b.getOriginAirport() + "</td><td>" + b.getDestAirport() + "</td><td> SGD " + b.getCost() + "</td><td>" + b.getDepartDate() + "</td><td>" + b.getDepartTime() + "</td><td>" + b.getArrivalTime() + "</td><td>" + b.getFlightTime() + "</td><td>" + b.getSeatsLeft() + "</td><td><a href='publicDetailedFlight.jsp?AcNo="+ b.getAircraftID() +"&FgtNo="+b.getflightsdleid()+"'>Detailed</a></td><td rowspan='2'><a href='addBookingServlet'>Book</a></td></tr>");
            							session.setAttribute("flightid", b.getflightsdleid());
            							session.setAttribute("flightcost", b.getCost());
            							String interconnecting = "yes";
            							session.setAttribute("interconnecting", interconnecting);
            						} else if (Public.size() == 3 && i == 2) {
            							out.print("<tr><td>" + b.getAircraftFlightNumber() + "</td><td>" + b.getOriginAirport() + "</td><td>" + b.getDestAirport() + "</td><td> SGD " + b.getCost() + "</td><td>" + b.getDepartDate() + "</td><td>" + b.getDepartTime() + "</td><td>" + b.getArrivalTime() + "</td><td>" + b.getFlightTime() + "</td><td>" + b.getSeatsLeft() + "</td><td><a href='publicDetailedFlight.jsp?AcNo="+ b.getAircraftID() +"&FgtNo="+b.getflightsdleid()+"'>Detailed</a></td></tr>");	
            							session.setAttribute("flightid2", b.getflightsdleid());
            							session.setAttribute("flightcost2", b.getCost());
            							String interconnecting = "yes";
            							session.setAttribute("interconnecting", interconnecting);
			    		    			out.print("</table>");
            						}
        						} 
		               		} else {
    							out.print("<h3>There are no flights</h3>");
    						}
                		} else {
                			if(Public.size() > 0) {
                				out.print("<h3>Search Results</h3>");
                				out.print("<table>");
    							out.print("<tr><td>Aircraft Flight Number</td><td>Origin Airport</td><td>Destination Airport</td><td>Cost</td><td>Departure Date</td><td>Departure Time</td><td>Arrival Time</td><td>Flight Time</td><td>Seats Left</td><td>Full Flight Details</td><td>Book Flight</td></tr>");
                				for(int i = 0; i < Public.size(); i++) {
            						PublicSearch b = (PublicSearch) Public.get(i);
            						if (Public.size() == 1) {
      			        				out.print("<tr><td>" + b.getAircraftFlightNumber() + "</td><td>" + b.getOriginAirport() + "</td><td>" + b.getDestAirport() + "</td><td> SGD " + b.getCost() + "</td><td>" + b.getDepartDate() + "</td><td>" + b.getDepartTime() + "</td><td>" + b.getArrivalTime() + "</td><td>" + b.getFlightTime() + "</td><td>" + b.getSeatsLeft() + "</td><td><a href='publicDetailedFlight.jsp?AcNo="+ b.getAircraftID() +"&FgtNo="+b.getflightsdleid()+"'>Detailed</a></td><td><a href='addBookingServlet'>Book</a></td></tr>");
      			        				session.setAttribute("flightid", b.getflightsdleid());
      			        				session.setAttribute("flightcost", b.getCost());
            						} else if (Public.size() == 2 && i == 0) {
      			        				out.print("<tr><td>" + b.getAircraftFlightNumber() + "</td><td>" + b.getOriginAirport() + "</td><td>" + b.getDestAirport() + "</td><td> SGD " + b.getCost() + "</td><td>" + b.getDepartDate() + "</td><td>" + b.getDepartTime() + "</td><td>" + b.getArrivalTime() + "</td><td>" + b.getFlightTime() + "</td><td>" + b.getSeatsLeft() + "</td><td><a href='publicDetailedFlight.jsp?AcNo="+ b.getAircraftID() +"&FgtNo="+b.getflightsdleid()+"'>Detailed</a></td><td rowspan='2'><a href='addBookingServlet'>Book</a></td></tr>");
      			        				session.setAttribute("flightid", b.getflightsdleid());
      			        				session.setAttribute("flightcost", b.getCost());
      			        				String multicity = "yes";
      			        				session.setAttribute("multicity", multicity);
            						} else {
      			        				out.print("<tr><td>" + b.getAircraftFlightNumber() + "</td><td>" + b.getOriginAirport() + "</td><td>" + b.getDestAirport() + "</td><td> SGD " + b.getCost() +  "</td><td>" + b.getDepartDate() + "</td><td>" + b.getDepartTime() + "</td><td>" + b.getArrivalTime() + "</td><td>" + b.getFlightTime() + "</td><td>" + b.getSeatsLeft() + "</td><td><a href='publicDetailedFlight.jsp?AcNo="+ b.getAircraftID() +"&FgtNo="+b.getflightsdleid()+"'>Detailed</a></td></tr>");
      			        				session.setAttribute("flightid2", b.getflightsdleid());
      			        				session.setAttribute("flightcost2", b.getCost());
      			        				String multicity = "yes";
      			        				session.setAttribute("multicity", multicity);
            						}
                				}
                				out.print("</table>");
                				if (Public.size() == 1) {
    								out.print("<h3>Only one flight you specified is available</h3>");
    							}
                			}else {
            		  	      	out.print("<h3>No records found </h3><br>");
            				}
                		}
	                	%>
	                	<a href="index.jsp">Return</a>
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