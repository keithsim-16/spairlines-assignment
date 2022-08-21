<%@ include file = "checkStatus.jsp" %>
<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Flight Schedule Table Detailed - Admin</title>
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
        				int flightsdleid, AircraftID, economycost, businesscost, firstcost, ecoBooked, busBooked, firstBooked;
        				String OriginAirport, DestAirport, Country, DepartDate, DepartTime, ArrivalDate, ArrivalTime, FlightTime;
			
         				// Step1: Load JDBC Driver
           				Class.forName("com.mysql.jdbc.Driver");

          				// Step 2: Define Connection URL
          				String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995"; 

          				// Step 3: Establish connection to URL	
          				Connection conn = DriverManager.getConnection(connURL);
        				
          				// Step 4: Create Statement object
          				Statement stmt = conn.createStatement();

				        // Step 5: Execute SQL Command
						String sqlStr = "SELECT * FROM aircraft.flightschedule fs;";
				        ResultSet rs = stmt.executeQuery(sqlStr);
				          
				      	// Step 6: Process Result
				        out.print("<table class='FSDetailed'>");
				        %>
				        <h2>Flight Schedule Table</h2> 
				        <% 
          				out.print("<tr><td>flightsdleid</td><td>AircraftID</td><td>OriginAirport</td><td>DestAirport</td><td>Country</td><td>economycost</td><td>businesscost</td><td>firstcost</td><td>DepartDate</td><td>DepartTime</td><td>ArrivalDate</td><td>ArrivalTime</td><td>FlightTime</td><td>ecoBooked</td><td>busBooked</td><td>firstBooked</td><td></td></tr>");
          				while (rs.next()) {
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
				            ecoBooked = rs.getInt("ecoBooked");
				            busBooked = rs.getInt("busBooked");
				            firstBooked = rs.getInt("firstBooked");
        					out.print("<tr><td>" + flightsdleid + "</td><td>" + AircraftID + "</td><td>" + OriginAirport + "</td><td>" + DestAirport + "</td><td>" + Country + "</td><td>" + economycost + "</td><td>" + businesscost + "</td><td>" + firstcost + "</td><td>" + DepartDate + "</td><td>" + DepartTime + "</td><td>" + ArrivalDate + "</td><td>" + ArrivalTime + "</td><td>" + FlightTime + "</td><td>" + ecoBooked + "</td><td>" + busBooked + "</td><td>" + firstBooked + "</td><td><a href='FSDetailed.jsp?fsid="+flightsdleid+"&acid="+AircraftID+"&OA="+OriginAirport+"&DA="+DestAirport+"&C="+Country+"&ec="+economycost+"&bc="+businesscost+"&fc="+firstcost+"&DD="+DepartDate+"&DT="+DepartTime+"&AD="+ArrivalDate+"&AT="+ArrivalTime+"&FT="+FlightTime+"&eB="+ecoBooked+"&bB="+busBooked+"&fB="+firstBooked+"#popup1' class='button special'><i class='icon fa-refresh'></i></a></td></tr>");
          				}
          				out.print("</table>"); 
          				String updated = request.getParameter("updated");
          				if (updated != null && updated.equals("successful")) {
  							out.print("Entry has been updated <br>");
  						}
          				%>
          				<a href="FlightSchedule.jsp">Return</a>
        				<%
						String fsid = request.getParameter("fsid");
						String acid = request.getParameter("acid");
						String OA = request.getParameter("OA");
						String DA = request.getParameter("DA");
						String C = request.getParameter("C");
						String ec = request.getParameter("ec");
						String bc = request.getParameter("bc");
						String fc = request.getParameter("fc");
						String DD = request.getParameter("DD");
						String DT = request.getParameter("DT");
						String AD = request.getParameter("AD");
						String AT = request.getParameter("AT");
						String FT = request.getParameter("FT");
						String eB = request.getParameter("eB");
						String bB = request.getParameter("bB");
						String fB = request.getParameter("fB");
				        String sqlStr1 = "SELECT Aircraft_ID FROM aircraft.aircraft";
				        ResultSet rs1 = stmt.executeQuery(sqlStr1); 
						%>
						<article id="popup1" class="popup1">
				        <h2>Update Table</h2>
				            <a class="close1" href="#">&times;</a>
				            <article class="content1">
				                <form action="processUpdate.jsp">
				                	<input type="hidden" name="Tb" value="FSTb">
				                	<input type='hidden' name='update' value="<%=fsid%>">
				                	flightsdleid 
				                	<input type='text' name='flightsdleid' value="<%=fsid%>" required/><br>
				  					AircraftID 
				  					<select name="aircraftid">
				  						<option selected="selected"><%=acid%></option>
				              		<%  while(rs1.next()){ %>
				            			<option><%= rs1.getInt("Aircraft_ID")%></option>
				        			<% } %>
				              		</select> <br>
									OriginAirport
				                	<input type='text' name='originairport' value="<%=OA%>" required/><br>
									DestAirport
				                	<input type='text' name='destairport' value="<%=DA%>" required/><br>
									Country
				                	<input type='text' name='country' value="<%=C%>" required/><br>
				                	economycost
				                	<input type='text' name='economycost' value="<%=ec%>" required/><br>
				  					businesscost
				                	<input type='text' name='businesscost' value="<%=bc%>" required/><br>
									firstcost
				                	<input type='text' name='firstcost' value="<%=fc%>" required/><br>
									DepartDate
				                	<input type='text' name='departdate' value="<%=DD%>" required/><br>
									DepartTime
				                	<input type='text' name='departtime' value="<%=DT%>" required/><br>
				                	ArrivalDate
				                	<input type='text' name='arrivaldate' value="<%=AD%>" required/><br>
				  					ArrivalTime 
				                	<input type='text' name='arrivaltime' value="<%=AT%>" required/><br>
									FlightTime
				                	<input type='text' name='flighttime' value="<%=FT%>" required/><br>
				                	ecoBooked
				                	<input type='text' name='ecobooked' value="<%=eB%>" required/><br>
				                	busBooked
				                	<input type='text' name='busbooked' value="<%=bB%>" required/><br>
				                	firstBooked
				                	<input type='text' name='firstbooked' value="<%=fB%>" required/><br>
									<input type="submit" name="btnSubmit" value="Submit"/>
								</form>
				            </article>
				        </article>
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