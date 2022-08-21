<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Detailed Flight - Admin</title>
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

        <!-- Header -->
        <header id="header" class="skel-layers-fixed">
            <h1><a href="index.jsp">SP Airlines</a></h1>
            <nav id="nav">
                <ul>
                    <li>Welcome <a href="adminIndex.jsp">Administrator</a> | <a href='logout.jsp'>Logout</a></li>
                </ul>
            </nav>
        </header>
        <section id="main" class="wrapper style1">
            <div class="container">
                <div class="row">
                    <div class="12u">
                        <% 
    					String search = (String)session.getAttribute("schrs");                       
                           
						int AircraftID, flightsdleid, economycost, businesscost, firstcost;
    					String OriginAirport, DestAirport,Country,DepartDate,DepartTime,ArrivalDate,ArrivalTime,FlightTime,AircraftModel, FlightNo, Capacity, PlaneSeat;
    					int AcNo = Integer.parseInt(request.getParameter("AcNo"));
    					int FgtNo = Integer.parseInt(request.getParameter("FgtNo"));
    
          				// Step1: Load JDBC Driver
           				Class.forName("com.mysql.jdbc.Driver");

          				// Step 2: Define Connection URL
          				String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995"; 
		  				String sqlStr = "SELECT * FROM aircraft.flightschedule fs, aircraft.aircraft ac WHERE fs.Aircraft_ID = ac.Aircraft_ID AND fs.Aircraft_ID = ? AND ac.Aircraft_ID = ? AND flightsdleid = ?;";

          				// Step 3: Establish connection to URL
          				Connection conn = DriverManager.getConnection(connURL);
		  				
          				// Step 4: Create Statement object
          				PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		  				pstmt.setInt(1, AcNo);
		  				pstmt.setInt(2, AcNo);
		  				pstmt.setInt(3, FgtNo);
		  				
          				// Step 5: Execute SQL Command
          				ResultSet rs = pstmt.executeQuery();

          				// Step 6: Process Result
          				out.print("<table>");
          				%>
                        <h1>Flight Schedule Table</h1>
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
			                PlaneSeat = rs.getString("Plane_Seat");
        					out.print("<tr><th>flightsdleid</th><td>" + flightsdleid + "</td></tr><tr><th>AircraftID</th><td>" + AircraftID + "</td></tr><tr><th>AircraftModel</th><td>" + AircraftModel + "</td></tr><tr><th>flightNo</th><td>" + FlightNo + "</td></tr><tr><th>Capacity</th><td>" + Capacity + "</td></tr><tr><th>OriginAirport</th><td>" + OriginAirport + "</td></tr><tr><th>DestAirport</th><td>" + DestAirport + "</td></tr><tr><th>DepartDate</th><td>" + DepartDate + "</td></tr><tr><th>DepartTime</th><td>" + DepartTime + "</td></tr><tr><th>ArrivalDate</th><td>" + ArrivalDate + "</td></tr><tr><th>ArrivalTime</th><td>" + ArrivalTime + "</td></tr><tr><th>FlightTime</th><td>" + FlightTime + "</td></tr><tr><th>PlaneSeat</th><td>" + PlaneSeat + "</td></tr>");
          				}
          				out.print("</table>"); 
          				%>
                        <a href="searchresults.jsp?search=<%=search%>">Return</a>
                        <% 
          				conn.close();
						%>
                        <hr class="major" />
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