<%@ include file = "checkStatus.jsp" %>
<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Aircraft Table Detailed - Admin</title>
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
        				int AircraftID;
        				String AircraftModel, FlightNo, Capacity, FirstClassSeat, BusinessClassSeat, EconomyClassSeat, PlaneSeat;
			
         				// Step1: Load JDBC Driver
           				Class.forName("com.mysql.jdbc.Driver");

          				// Step 2: Define Connection URL
          				String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995"; 

          				// Step 3: Establish connection to URL	
          				Connection conn = DriverManager.getConnection(connURL);
        				
          				// Step 4: Create Statement object
          				Statement stmt = conn.createStatement();

				        // Step 5: Execute SQL Command
						String sqlStr = "SELECT * FROM aircraft.aircraft;";
				        ResultSet rs = stmt.executeQuery(sqlStr);
				          
				      	// Step 6: Process Result
				        out.print("<table>");
				        %>
				        <h2>Aircraft Table</h2> 
				        <% 
          				out.print("<tr><td>Aircraft ID</td><td>Aircraft Model</td><td>FlightNo</td><td>Capacity</td><td>First Class Seat</td><td>Business Class Seat</td><td>Economy Class Seat</td><td>Plane Seat</td><td></td></tr>");
          				while (rs.next()) {
          					AircraftID = rs.getInt("Aircraft_ID");
              				AircraftModel = rs.getString("Aircraft_Model");
              				FlightNo = rs.getString("Aircraft_Flight_Number");
              				Capacity = rs.getString("Flight_Passenger_Capacity");
              				FirstClassSeat = rs.getString("First_Class");
              				BusinessClassSeat = rs.getString("Bus_Class");
              				EconomyClassSeat = rs.getString("Eco_Class");
              				PlaneSeat = rs.getString("Plane_Seat");
        					out.print("<tr><td>" + AircraftID + "</td><td>" + AircraftModel + "</td><td>" + FlightNo + "</td><td>" + Capacity + "</td><td>" + FirstClassSeat + "</td><td>" + BusinessClassSeat + "</td><td>" + EconomyClassSeat + "</td><td>" + PlaneSeat + "</td><td><a href='ATDetailed.jsp?AcID="+AircraftID+"&AM="+AircraftModel+"&FN="+FlightNo+"&Cap="+Capacity+"&FCS="+FirstClassSeat+"&BCS="+BusinessClassSeat+"&ECS="+EconomyClassSeat+"&PS="+PlaneSeat+"#popup1' class='button special'><i class='icon fa-refresh'></i></a></td></tr>");
          				}
          				out.print("</table>"); 
          				String updated = request.getParameter("updated");
          				if (updated != null && updated.equals("successful")) {
  							out.print("Entry has been updated <br>");
  						}
          				%>
          				<a href="aircraftTable.jsp">Return</a>
        				<%
        				String AcID = request.getParameter("AcID");
    					String AM = request.getParameter("AM");
    					String FN = request.getParameter("FN");
    					String Cap = request.getParameter("Cap");
    					String FCS = request.getParameter("FCS");
    					String BCS = request.getParameter("BCS");
    					String ECS = request.getParameter("ECS");
    					String PS = request.getParameter("PS");
				        String sqlStr1 = "SELECT Aircraft_ID FROM aircraft.aircraft";
				        ResultSet rs1 = stmt.executeQuery(sqlStr1); 
						%>
						<article id="popup1" class="popup1">
        					<h2>Update Table</h2>
            				<a class="close1" href="#">&times;</a>
            				<article class="content1">
                				<form action="processUpdate.jsp">
                					<input type="hidden" name="Tb" value="AcTb">
                					<input type='hidden' name='update' value="<%=AcID%>">
                					Aircraft_ID 
                					<input type='text' name='aircraftid' value="<%=AcID%>" required/><br>
  									AircraftModel 
                					<input type='text' name='aircraftmodel' value="<%=AM%>" required/><br>
									FlightNo 
                					<input type='text' name='flightno' value="<%=FN%>" required/><br>
									Capacity 
                					<input type='text' name='capacity' value="<%=Cap%>" required/><br>
                					First Class Seat
                					<input type='text' name='firstclassseat' value="<%=FCS%>" required/><br>
                					Business Class Seat
                					<input type='text' name='businessclassseat' value="<%=BCS%>" required/><br>
                					Economy Class Seat
                					<input type='text' name='economyclassseeat' value="<%=ECS%>" required/><br>
									PlaneSeat 
                					<input type='text' name='planeseat' value="<%=PS%>" required/><br>
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