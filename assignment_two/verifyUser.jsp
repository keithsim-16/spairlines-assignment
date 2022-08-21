<%@page import ="java.sql.*"%>
<%@page import ="java.security.*" %>
<% 
String user = request.getParameter("loginid");
//out.print(user);
String plainText=request.getParameter("password");
String pwd;

MessageDigest mdAlgorithm = MessageDigest.getInstance("SHA-256");
mdAlgorithm.update(plainText.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
    plainText = Integer.toHexString(0xFF & digest[i]);

    if (plainText.length() < 2) {
        plainText = "0" + plainText;
    }

    hexString.append(plainText);
}

pwd=hexString.toString();


//--------------------variable declaration--------------------//
try {
      // Step1: Load JDBC Driver
      Class.forName("com.mysql.jdbc.Driver");

      // Step 2: Define Connection URL
      String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995"; 
      String storeProc = "{call checkUser(? , ?)}";
      
      // Step 3: Establish connection to URL
      Connection conn = DriverManager.getConnection(connURL);
      
      // Step 4: Create Statement object
      CallableStatement cstmt = conn.prepareCall(storeProc);
      cstmt.setString(1, user); //new
      cstmt.setString(2, pwd);

      // Step 5: Execute SQL Command
      ResultSet rs = cstmt.executeQuery();

      // Step 6: Process Result
      if (rs.next()) {
    	  session.setAttribute("LOGIN-STATUS", "YES");
       	  session.setAttribute("name", user); 
      	  response.sendRedirect ("index.jsp");
      } else if (user.equals("admin") && pwd.equals("6ca13d52ca70c883e0f0bb101e425a89e8624de51db2d2392593af6a84118090")) {
    	  session.setAttribute("LOGIN-STATUS", "YES");
      	  response.sendRedirect("adminIndex.jsp"); 
      } else {
      	  response.sendRedirect("index.jsp?login=fail#popup1");
      }
      // Step 7: Close connection
      conn.close();
} catch (Exception e) {
      System.err.println("Error :" + e);
}
%>