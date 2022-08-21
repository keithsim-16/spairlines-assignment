<%@page import="dbaccess.*"%>
<%@ page import = "java.io.*,java.util.*, javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Booking Success - SP Airlines</title>
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
         	<h2>Your Flights Are Successfully Booked</h2>
     	</header>
        <div class="container">
            <div class="row">
                <div class="12u">
                 <%
                 	String source = request.getParameter("from");
                    String email = (String)request.getAttribute("email");
         			if (source!=null && source.equals("InsertCBookingServlet")) {	
				       
         		 %>
         		 <h3>Your Confirmation Booking ID: <%=(int)session.getAttribute("bookingID")%></h3>
         		 <%
		         		String host ="smtp.gmail.com" ;
		         		String user = "spairline57655723@gmail.com";
		         		String pass = "Abcd$63641995";
		         		String to = (String)request.getAttribute("email");
		         		String from = "spairline57655723@gmail.com";
		         		String subject = "Booking ID: " + (int)session.getAttribute("bookingID") + " Receipt";
		         		String messageText = "Dear customer, \n\nThank you for flying with SP Airlines, your flight has been confirmed. \n\nSafe Travels.";
		         		boolean sessionDebug = false;
		
		         		Properties props = System.getProperties();
		
		         		props.put("mail.smtp.starttls.enable", "true");
		         		props.put("mail.smtp.host", host);
		         		props.put("mail.smtp.port", "587");
		         		props.put("mail.smtp.auth", "true");
		         		props.put("mail.smtp.starttls.required", "true");
		
		         		java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		         		Session mailSession = Session.getDefaultInstance(props, null);
		         		mailSession.setDebug(sessionDebug);
		         		Message msg = new MimeMessage(mailSession);
		         		msg.setFrom(new InternetAddress(from));
		         		InternetAddress[] address = {new InternetAddress(to)};
		         		msg.setRecipients(Message.RecipientType.TO, address);
		         		msg.setSubject(subject); msg.setSentDate(new Date());
		         		msg.setText(messageText);
		
		         		Transport transport=mailSession.getTransport("smtp");
		         		transport.connect(host, user, pass);
		         		transport.sendMessage(msg, msg.getAllRecipients());
		         		transport.close();
         			}
         			session.removeAttribute("booking");
         			session.removeAttribute("passengerD");
         			session.removeAttribute("paymentD");
         			session.removeAttribute("flightid2");
         			session.removeAttribute("flightcost2");
         			session.removeAttribute("flightid");
         			session.removeAttribute("flightcost");
         			session.removeAttribute("totalnoofpassengers");
         			session.removeAttribute("cabinclass");
         			session.removeAttribute("interconnecting");
         			session.removeAttribute("returnflight");
         			session.removeAttribute("multicity");
         			session.removeAttribute("bookingID");
         		 %>
         		 <form action ="index.jsp" method ="POST">
					<input type="submit" value="Back to Home Page" class="bookFlight" />
				 </form>
				<%
					
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