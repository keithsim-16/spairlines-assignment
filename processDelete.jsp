<%@page import ="java.sql.*"%>
<% 
String delete = request.getParameter("AcNo");
String ToDelete1 = request.getParameter("FSID");
String PageRedirect = request.getParameter("PgNm");
String search = (String)session.getAttribute("schrs");


// Step1: Load JDBC Driver
Class.forName("com.mysql.jdbc.Driver");

// Step 2: Define Connection URL
String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995"; 

// Step 3: Establish connection to URL
Connection conn = DriverManager.getConnection(connURL);

// Step 5: Execute SQL Command
if(PageRedirect.equals("AcTb")) {
	String sqlStr1 = "DELETE FROM `aircraft`.`aircraft` WHERE `Aircraft_ID`= ? ;";
  	PreparedStatement pstmt = conn.prepareStatement(sqlStr1);
  	pstmt.setString(1, delete);
  	pstmt.executeUpdate();
    response.sendRedirect("aircraftTable.jsp?deleted=successful");
    
} else if (PageRedirect.equals("SR")) {
	String sqlStr2 = "DELETE FROM `aircraft`.`aircraft` WHERE `Aircraft_ID`= ? ;";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr2);
	pstmt.setString(1, delete);
	pstmt.executeUpdate();
	response.sendRedirect("searchresults.jsp?search="+search+"");
	
} else if (PageRedirect.equals("FSTb")) {
	String sqlStr3 = "DELETE FROM `aircraft`.`flightschedule` WHERE `flightsdleid`= ? ;";
  	PreparedStatement pstmt = conn.prepareStatement(sqlStr3);
  	pstmt.setString(1, ToDelete1);
  	pstmt.executeUpdate();
    response.sendRedirect("FlightSchedule.jsp?deleted=successful");
}
// Step 7: Close connection
conn.close();
%>