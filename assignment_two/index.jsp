<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>SP Airlines</title>
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
    <!-- jquery for datepicker -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function() {
            $("#datepicker").datepicker({
                dateFormat: 'yy-mm-dd'
            });
        });
        $(function() {
            $("#datepicker2").datepicker({
                dateFormat: 'yy-mm-dd'
            });
        });
        $(function() {
            $("#datepicker3").datepicker({
                dateFormat: 'yy-mm-dd'
            });
        });
    </script>
    <script>
        $(function() {
            $('input[name=group1]').on('click init-group1', function() {
                $('#showrd').toggle($('#radio-1').prop('checked'));
            }).trigger('init-group1');
        });
    </script>
    <script>
        $(function() {
            $('input[name=group1]').on('click init-group1', function() {
                $('#showmulti').toggle($('#radio-3').prop('checked'));
            }).trigger('init-group1');
        });
    </script>
<%@page import ="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
</head>

<body id="top">

    <!-- Header -->
    <header id="header" class="skel-layers-fixed">
        <h1><a href="#">SP Airlines</a></h1>
        <nav id="nav">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="plantravel.jsp">Plan travel</a></li>
                <li><a href="destinations.jsp">Destinations</a></li>
                <li><a href="travelinfo.jsp">Travel Info</a></li>
                <%
				String name = (String)session.getAttribute("name"); 

				if (name != null) {
					out.print("Welcome " + name + " | <a href='logout.jsp'>Logout</a>");
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
    <!-- Banner -->
    <section id="banner">
        <div class="inner">
            <h2>SP Airlines</h2>
        </div>
    </section>
   <%
         // Step1: Load JDBC Driver
        Class.forName("com.mysql.jdbc.Driver");

        // Step 2: Define Connection URL
        String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995"; 

        // Step 3: Establish connection to URL
        Connection conn = DriverManager.getConnection(connURL);
    
        // Step 4: Create Statement object
        Statement stmt = conn.createStatement();
        String sqlStr2 = "SELECT DISTINCT OriginAirport FROM aircraft.flightschedule";
        ResultSet rs2 = stmt.executeQuery(sqlStr2); 
     %>
    <!-- One -->
    <section id="one" class="wrapper style1">
        <div class="container">
            <div class="row">
                <div class="8u">
                    <form action="PublicSearchServlet" method="POST">
                        <h3>Book Flights</h3>
                        Origin Airport 
                        <select name="origin">                          
                        <%  
                          while(rs2.next()){ 
                          %>
                        <option><%=rs2.getString("OriginAirport")%></option>
                        <% 
                        } 
                        %> 
                        </select>
                        Destination Airport 
                        <select name="dest" id="dest"> 
                        <%  
                        String sqlStr3 = "SELECT DISTINCT DestAirport FROM aircraft.flightschedule";
                        ResultSet rs3 = stmt.executeQuery(sqlStr3); 
                          while(rs3.next()){ 
                          %>
                        <option><%=rs3.getString("DestAirport")%></option>
                        <% 
                        } 
                        %> 
                        </select>
                        Departure Date <input type="text" name="departdate" id="datepicker"> 
                  		<div id="showrd">
                            Return Date <input type="text" name="returndate" id="datepicker2">
                        </div> <br>
                        Class<select name="class">
                              <option value="Economy">Economy</option>
                              <option value="Business">Business</option>
                              <option value="First">First</option>
                        </select> 
                        Adult<select name="adults">
                        <% for(int i = 1 ; i < 10 ; i++) { %>
                            <option value="<%=i%>"><%=i%></option>
                       <% } %>
                        </select> 
                        Child<select name="childs">
                        <% for(int i = 0 ; i < 10 ; i++) { %>
                            <option value="<%=i%>"><%=i%></option>
                       <% } %>
                        </select> 
                     	<div id="showmulti">
                            <h1>Second Flight</h1> <br>
                            <%
                            String sqlStr4 = "SELECT DISTINCT OriginAirport FROM aircraft.flightschedule";
                            ResultSet rs4 = stmt.executeQuery(sqlStr4); 
                            %>
                            Origin Airport 
                            <select name="origin2" id="origin2">                       
                            <%  
                              while(rs4.next()){ 
                              %>
                            <option><%=rs4.getString("OriginAirport")%></option>
                            <% 
                            } 
                            %> 
                            </select> 
                            Destination Airport 
                            <%
                            String sqlStr5 = "SELECT DISTINCT DestAirport FROM aircraft.flightschedule";
                            ResultSet rs5 = stmt.executeQuery(sqlStr5); 
                            %>
                            <select name="dest2">
                            <%  
                              while(rs5.next()){ 
                              %>
                            <option><%=rs5.getString("DestAirport")%></option>
                            <% 
                            } 
                            %> 
                            </select>
                            Departure Date <input type="text" name="departdate2" id="datepicker3">
                        </div>
                        <section id="radiobutton" class="flightradio">
                            <div class="container">
                                <input type="radio" name="group1" id="radio-1" value="return" checked>
                                <label for="radio-1"><span class="radio">Return</span></label>
                                <input type="radio" name="group1" id="radio-2" value="oneway">
                                <label for="radio-2"><span class="radio">One-way</span></label>
                         		<input type="radio" name="group1" id="radio-3" value="multicity">
                                <label for="radio-3"><span class="radio">MultiCity</span></label>
                            </div>
                        </section>
                        <input type="submit" value="Find flights" class="bookFlight" />
                    </form>
                </div>
                <div class="4u">
                    <section>
                        <h3>Notice</h3>
                        <p>Samsung Galaxy Note 7 devices are banned from all flights <br> <br> Travel Warning: <br> Please refrain from travelling to Hong Kong due to the rapid rise in the number of H1N1 cases</p>
                        <ul class="actions">
                            <li><a href="#" class="button alt">View More</a></li>
                        </ul>
                    </section>
                    <hr />
                    <section>
                        <h3>Most Popular Destinations</h3>
                        <ul class="alt">
                            <li><a href="#">Bangkok, Thailand</a></li>
                            <li><a href="#">London, England</a></li>
                            <li><a href="#">Paris, France</a></li>
                            <li><a href="#">New York, New York</a></li>
                        </ul>
                    </section>
                </div>
            </div>
        </div>
    </section>


    <!-- Two -->
    <section id="two" class="wrapper style2">
        <header class="major">
            <h2>Why SP Airlines?</h2>
            <p>We offer you the most luxurious and comfortable flight travels at affordable prices</p>
        </header>
        <div class="container">
            <div class="row">
                <div class="4u">
                    <section class="special box">
                        <i class="icon fa-dollar major"></i>
                        <h3>Cheap and affordable travel deals</h3>
                        <p>Air tickets as low as S$250! Check out our flight promotions to enjoy even greater savings!</p>
                    </section>
                </div>
                <div class="4u">
                    <section class="special box">
                        <i class="icon fa-globe major"></i>
                        <h3>Flying to more than 200 destinations</h3>
                        <p>Our flights covers a wide range of destinations including Los Angeles, Seoul and many more!</p>
                    </section>
                </div>
                <div class="4u">
                    <section class="special box">
                        <i class="icon fa-plane major"></i>
                        <h3>Professional in-flight services</h3>
                        <p>All our air steward and stewardess are trained and qualified to give you the most enjoyable in-flight services</p>
                    </section>
                </div>
            </div>
        </div>
    </section>


    <!-- Three -->
    <section id="three" class="wrapper style1">
        <header class="major">
            <h2>Flight Promotions</h2>
        </header>
        <div class="container">
            <div class="row">
                <div class="6u">
                    <section class="special">
                        <a href="#" class="image fit"><img src="images/pic01.jpg" alt="" /></a>
                        <h3>American Express Card Promotion</h3>
                        <p>From 31st April 2017 to 1 September 2017, enjoy 15% off flight travels when you book with American Express Card! Terms and conditions apply.</p>
                        <ul class="actions">
                            <li><a href="#" class="button alt">Learn More</a></li>
                        </ul>
                    </section>
                </div>
                <div class="6u">
                    <section class="special">
                        <a href="#" class="image fit"><img src="images/pic02.jpg" alt="" /></a>
                        <h3>Seasonal Promotion</h3>
                        <p>Travel during 1 May-30 June to enjoy cheaper flights to countries in Asia including Hong Kong, Taiwan, Seoul and Osaka! Terms and conditions apply.</p>
                        <ul class="actions">
                            <li><a href="#" class="button alt">Learn More</a></li>
                        </ul>
                    </section>
                </div>
            </div>
        </div>
    </section>
	<!-- Four -->
	<section id="four" class="wrapper style2">
        <header class="major">
            <h2>Leave a comment</h2>
        </header>
        <div class="container">
            <div class="row">
        <%
        String nextcid ="";
        String sqlStr1 = "SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'aircraft' AND TABLE_NAME = 'comment';";
  		ResultSet rs1 = stmt.executeQuery(sqlStr1);
  		while (rs1.next()) {
  			nextcid = rs1.getString("AUTO_INCREMENT");
  		}
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			if (name != null) {
				%>
				<div class="6u">
					<section class="special">
						<form action="CommentServlet" method="POST">
							<h2>Comment:</h2>
							<textarea name="comment" class="commentArea" maxlength="200"></textarea>
							<input type="hidden" name="cid" value="<%=nextcid%>">
							<input type="hidden" name="op" value="<%=name%>">
							<input type="hidden" name="timeposted" value="<%=sdf.format(cal.getTime())%>">
		        			<input type="submit" class ="button special" id = "submitButton" value="Post" >
      					</form>
      				</section>
      			</div>
	          	<% 
			} else {
				%>
				<div class="6u">
					<section class="special">
						<form action="index.jsp#popup1">
							<h2>Comment:</h2>
							<textarea name="comment" class="commentArea" maxlength="200"></textarea>
							<input type="hidden" name="cid" value="<%=nextcid%>">
							<input type="hidden" name="op" value="<%=name%>">
							<input type="hidden" name="timeposted" value="<%=sdf.format(cal.getTime())%>">
    						<input type="submit" class="button special" id = "submitButton" value="Post" >
						</form>
				     </section>
      			</div>
				<%
			}
			%>
			  <div class="6u">
					<section class="special">
						<h2>Comments</h2> 
						<% 
						String sqlStr = "SELECT * FROM aircraft.comment;";
						ResultSet rs = stmt.executeQuery(sqlStr);
						int count = 1;
						while (rs.next()) {
							if (count < 4) {
								count++;
								out.print("<p>#"+rs.getInt("commentid")+" Posted by: "+rs.getString("poster")+" on "+rs.getString("timeposted")+"</p>");
						  		out.print("<p>"+rs.getString("comment")+"</p>");
							}
					  	} 
						if(count > 3) {
							%>
							<a href="comments.jsp" class ="button special">View all comments</a>
							<%
						}
						%>
	      			</section>
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