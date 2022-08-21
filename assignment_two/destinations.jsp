<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
%>
<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>Destinations - SP Airlines</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
    <script src="js/jquery.min.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/skel-layers.min.js"></script>
    <script src="js/init.js"></script>
	<link rel="stylesheet" href="/css/skel.css" />
	<link rel="stylesheet" href="/css/style.css" />
	<link rel="stylesheet" href="/css/style-xlarge.css" />
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
    </article>
</article>
<!-- Main -->
<section id="main" class="wrapper style1">
     <header class="major">
         <h2>Destinations</h2>
         <p>Under Construction</p>
     </header>
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