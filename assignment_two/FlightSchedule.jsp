<%@ include file = "checkStatus.jsp" %>
<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Flight Schedule Table - Admin</title>
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
    
    <section id="one" class="wrapper style1">
        <div class="container">
            <div class="row">
                <div class="9u">
    				<% 
					int AircraftID, flightsdleid, economycost, businesscost, firstcost;
    				String OriginAirport, DestAirport,Country,DepartDate,DepartTime,ArrivalDate,ArrivalTime,FlightTime;
    
    				try {
          				// Step1: Load JDBC Driver
           				Class.forName("com.mysql.jdbc.Driver");

          				// Step 2: Define Connection URL
          				String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995"; 

          				// Step 3: Establish connection to URL
          				Connection conn = DriverManager.getConnection(connURL);
    				
          				// Step 4: Create Statement object
          				Statement stmt = conn.createStatement();

          				// Step 5: Execute SQL Command
          				String sqlStr = "SELECT * FROM aircraft.flightschedule";
          				ResultSet rs = stmt.executeQuery(sqlStr);

          				// Step 6: Process Result
          				out.print("<table>");
          				%>
          				<h2>Flight Schedule Table</h2> 
          				<% 
          				out.print("<tr><td>flightsdleid</td><td>AircraftID</td><td>OriginAirport</td><td>DestAirport</td><td>DepartDate</td><td>ArrivalDate</td><td></td><td></td></tr>");
          				while (rs.next()) {
              				flightsdleid = rs.getInt("flightsdleid");
				            AircraftID = rs.getInt("Aircraft_ID");
				            OriginAirport = rs.getString("OriginAirport");
				            DestAirport = rs.getString("DestAirport");
				            DepartDate = rs.getString("DepartDate");
				            ArrivalDate = rs.getString("ArrivalDate");
        					out.print("<tr><td>" + flightsdleid + "</td><td>" + AircraftID + "</td><td>" + OriginAirport + "</td><td>" + DestAirport + "</td><td>" + DepartDate + "</td><td>" + ArrivalDate + "</td><td><a href='FSDetailed.jsp'>Details</a></td></td><td><a href='FlightSchedule.jsp?FSID="+flightsdleid+"#popup2' class='button special'><i class='icon fa-trash'></i></a></td></tr>");
          				}
          				out.print("</table>"); 
          				String newEntry = request.getParameter("newEntry");
          				String deleted = request.getParameter("deleted");
      	
						if (newEntry != null && newEntry.equals("successful")) {
							out.print("New entry has been added to the table <br>");
						} else if (deleted != null && deleted.equals("successful")) {
							out.print ("Entry has been deleted <br>");
						} 
          				%>
          				<a href="adminIndex.jsp">Return</a>
				</div>
                <div class="3u">
    		    	Insert a new entry into the table:
    				<%
    				String sqlStr1 = "SELECT Aircraft_ID FROM aircraft.aircraft";
    				ResultSet rs1 = stmt.executeQuery(sqlStr1); 
    				%>
        			<form action="newentry.jsp" class="aircraftTable" method="get">
        	  			<input type="hidden" name="Tb" value="FSTb">
        	  			flightsdleid <input type="text" name="flightsdleid" /> <br>
        	  			aircraft_id
              			<select name="aircraftid">
              			<%  
              			while(rs1.next()){ 
              			%>
            			<option><%=rs1.getInt("Aircraft_ID")%></option>
        				<% 
        				} 
        				%>
              			</select> <br>
				             OriginAirport <input type="text" name="originairport" /> <br>
				             DestAirport <input type="text" name="destairport" /> <br>
				             Country <input type="text" name="country" /> <br>
				             EconomyCost <input type="text" name="EconomyCost" /> <br>
				             BusinessCost <input type="text" name="BusinessCost" /> <br>
				             FirstCost <input type="text" name="FirstCost" /> <br>
				             DepartDate <input type="text" name="departdate" /> <br>
				             DepartTime <input type="text" name="departtime" /> <br>
				             ArrivalDate <input type="text" name="arrivaldate" /> <br>
				             ArrivalTime <input type="text" name="arrivaltime" /> <br>
				             FlightTime <input type="text" name="flighttime" /> <br>
				             ecoBooked <input type="text" name="ecobooked" /> <br>
				             busBooked <input type="text" name="busbooked" /> <br>
				             firstBooked <input type="text" name="firstbooked" /> <br>
						<input type="submit" name="btnSubmit" value="Submit"/>
					</form>
		
					<%
					String AcID = request.getParameter("AcID");
					String AM = request.getParameter("AM");
					String FN = request.getParameter("FN");
					String Cap = request.getParameter("Cap");
					String PS = request.getParameter("PS");
					String FSID = request.getParameter("FSID");
					%>
        			<article id="popup2" class="popup2">
        				<h2>Are you sure you want to delete?</h2>
            			<a class="close2" href="#">&times;</a>
            			<article class="content2">
                			<form action="processDelete.jsp">
                				<input type="hidden" name="PgNm" value="FSTb">
		                		<input type='hidden' name='FSID' value="<%=FSID%>">
								<input type="submit" name="btnSubmit1" value="Yes" class="delbutton"/>
							</form>
            			</article>
    				</article>
          			<%
          			// Step 7: Close connection
          			conn.close();
     				} catch (Exception e) {
        			  	System.err.println("Error :" + e);
     				}
					%>
                    <hr />
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