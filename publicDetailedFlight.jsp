<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Detailed Flight Schedule - SP Airlines</title>
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
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
    

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
                <div class="7u">
                    <% 
					int AircraftID, flightsdleid, economycost, businesscost, firstcost;
				    String OriginAirport, DestAirport,Country,DepartDate,DepartTime,ArrivalDate,ArrivalTime,FlightTime,AircraftModel, FlightNo, Capacity, PlaneSeat;
				    int AcNo = Integer.parseInt(request.getParameter("AcNo"));
				    int FgtNo = Integer.parseInt(request.getParameter("FgtNo"));
    
		            // Step1: Load JDBC Driver
		            Class.forName("com.mysql.jdbc.Driver");
		
		            // Step 2: Define Connection URL
		            String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995"; 
		
		            // Step 3: Establish connection to URL
		            Connection conn = DriverManager.getConnection(connURL);
						    
		            // Step 4: Create Statement object
				    String sqlStr = "SELECT * FROM aircraft.flightschedule fs, aircraft.aircraft ac WHERE fs.Aircraft_ID = ac.Aircraft_ID AND fs.Aircraft_ID = ? AND ac.Aircraft_ID = ? AND flightsdleid = ?;";
		
		            // Step 5: Execute SQL Command
			   	    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			   	    pstmt.setInt(1, AcNo);
			   	    pstmt.setInt(2, AcNo);
			   	    pstmt.setInt(3, FgtNo);
			   	    ResultSet rs = pstmt.executeQuery();

                    // Step 6: Process Result
          			out.print("<table>");
          			%>
                    <h1>Detailed Flight Schedule</h1>
                     <% 
          			if (rs.next()) {
			              flightsdleid = rs.getInt("flightsdleid");
			              AircraftID = rs.getInt("Aircraft_ID");
			              OriginAirport = rs.getString("OriginAirport");
			              DestAirport = rs.getString("DestAirport");
			              Country = rs.getString("Country");
			              economycost = rs.getInt("EconomyCost");
			              businesscost = rs.getInt("BusinessCost");
			              firstcost = rs.getInt("FirstCost");
			              DepartDate = rs.getString("DepartDate");
			              DepartTime = rs.getString("DepartTime");
			              ArrivalDate = rs.getString("ArrivalDate");
			              ArrivalTime = rs.getString("ArrivalTime");
			              FlightTime = rs.getString("FlightTime");
			              AircraftModel = rs.getString("Aircraft_Model");
			              FlightNo = rs.getString("Aircraft_Flight_Number");
			              Capacity = rs.getString("Flight_Passenger_Capacity");
        				  out.print("<tr><th>Flight Schedule ID</th><td>" + flightsdleid + "</td></tr><tr><th>Aircraft ID</th><td>" + AircraftID + "</td></tr><tr><th>Aircraft Model</th><td>" + AircraftModel + "</td></tr><tr><th>Flight Number</th><td>" + FlightNo + "</td></tr><tr><th>Capacity</th><td>" + Capacity + "</td></tr><tr><th>Origin Airport</th><td>" + OriginAirport + "</td></tr><tr><th>Destination Airport</th><td>" + DestAirport + "</td></tr><tr><th>Departure Date</th><td>" + DepartDate + "</td></tr><tr><th>Departure Time</th><td>" + DepartTime + "</td></tr><tr><th>Arrival Date</th><td>" + ArrivalDate + "</td></tr><tr><th>Arrival Time</th><td>" + ArrivalTime + "</td></tr><tr><th>Flight Time</th><td>" + FlightTime + "</td></tr>");
          			}
          			out.print("</table>"); 
          			%>
                    <a href="index.jsp">Return</a>
          			<% 
          			conn.close();
		  			%>
                    <hr class="major" />
                </div>
                <div class="4u">
                    <%
          			File file = new File(request.getServletContext().getRealPath("/img/AcID"+ AcNo +".png"));

					if(file.exists()){
					%> 
					<img src="<%=request.getContextPath()%>/img/AcID<%=AcNo%>.png" class="AcIDImage"> 
					<%
					} else {
					%>
					<img src="<%=request.getContextPath()%>/img/default.png" class="DefaultImage"> 
					<%
					}
         			%>
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