<%@ include file = "checkStatus.jsp" %>
<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Search Flight Results - Admin</title>
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
    
    <section id="main" class="wrapper style1">
        <div class="container">
            <div class="row">
                <div class="12u">
                    <% 
					String search = request.getParameter("search");

					int AircraftID, flightsdleid, economycost, businesscost, firstcost;
					String AircraftModel, FlightNo, Capacity, PlaneSeat, OriginAirport, DestAirport,Country,DepartDate,DepartTime,ArrivalDate,ArrivalTime,FlightTime;
					
					//--------------------variable declaration--------------------//
					
          			// Step1: Load JDBC Driver
           			Class.forName("com.mysql.jdbc.Driver");

          			// Step 2: Define Connection URL
          			String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995";
         			String sqlStr = "SELECT * FROM aircraft.flightschedule WHERE ((OriginAirport LIKE ?) OR (DestAirport LIKE ?) OR (DepartDate LIKE ?) OR (ArrivalDate LIKE ?) OR (MONTHNAME(DepartDate) LIKE ?) OR (MONTHNAME(ArrivalDate) LIKE ?) OR (Country LIKE ?));";

          			// Step 3: Establish connection to URL
          			Connection conn = DriverManager.getConnection(connURL);
          			// Step 4: Create Statement object
          			PreparedStatement pstmt = conn.prepareStatement(sqlStr);  //modified
          			pstmt.setString(1, "%"+search+"%");
          			pstmt.setString(2, "%"+search+"%");
          			pstmt.setString(3, "%"+search+"%");
          			pstmt.setString(4, "%"+search+"%");
          			pstmt.setString(5, "%"+search+"%");
          			pstmt.setString(6, "%"+search+"%");
          			pstmt.setString(7, "%"+search+"%");

          			// Step 5: Execute SQL Command
          			ResultSet rs = pstmt.executeQuery();
          			rs.last();
          			int count = rs.getRow();
          			rs.beforeFirst();

          			// Step 6: Process Result
          			if (count > 0 && search!="") {
          				out.print("<table>");
          				%>
                    	<h1>Search Results:</h1>
                    	<% 
          				out.print("<tr><td>flightsdleid</td><td>AircraftID</td><td>OriginAirport</td><td>DestAirport</td><td>DepartDate</td><td>ArrivalDate</td><td></td><td></td></tr>");
          				while (rs.next() && search != null) {
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
        	  				out.print("<tr><td>" + flightsdleid + "</td><td>" + AircraftID + "</td><td>" + OriginAirport + "</td><td>" + DestAirport + "</td><td>" + DepartDate + "</td><td>" + ArrivalDate + "</td><td><a href='detailedFlight.jsp?AcNo="+ AircraftID +"&FgtNo="+flightsdleid+"'>Detailed</a></td></td><td><a href='searchresults.jsp?search="+search+"&AcID="+AircraftID+"#popup2' class='button special'><i class='icon fa-trash'></i></a></td></tr>");
          				} 
          				out.print("</table>");
          			} else {
        	  			out.print("No records found <br>");
          			}
          			String AcID = request.getParameter("AcID");
          			%>
          		    <article id="popup2" class="popup2">
          	        	<h2>Are you sure you want to delete?</h2>
          	            <a class="close2" href="#">&times;</a>
          	            <article class="content2">
          	                <form action="processDelete.jsp">
          	                	<input type="hidden" name="PgNm" value="SR">
          	                	<input type='hidden' name='AcNo' value="<%=AcID%>">
          						<input type="submit" name="btnSubmit1" value="Yes" class="delbutton"/>
          					</form>
          	            </article>
          	    </article>
                <a href="adminIndex.jsp">Return</a>
                <% 
          		conn.close();
    			session.setAttribute("schrs", search);
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