<%@page import ="java.sql.*"%>
<% 
String PageRedirect = request.getParameter("Tb");

// Step1: Load JDBC Driver
Class.forName("com.mysql.jdbc.Driver");

// Step 2: Define Connection URL
String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995"; 

// Step 3: Establish connection to URL
Connection conn = DriverManager.getConnection(connURL);

// Step 5: Execute SQL Command
if(PageRedirect.equals("AcTb")) {
	String update = request.getParameter("update");
	String AcID = request.getParameter("aircraftid");
	String AM = request.getParameter("aircraftmodel");
	String FN = request.getParameter("flightno");
	String Cap = request.getParameter("capacity");
	String PS = request.getParameter("planeseat");
    String sqlStr1 = "UPDATE `aircraft`.`aircraft` SET `Aircraft_ID`= ? , `Aircraft_Model`= ? , `Aircraft_Flight_Number`= ? , `Flight_Passenger_Capacity`= ? , `Plane_Seat`= ?  WHERE `Aircraft_ID`= ? ;";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr1);
	pstmt.setString(1, AcID);
	pstmt.setString(2, AM);
	pstmt.setString(3, FN);
	pstmt.setString(4, Cap);
	pstmt.setString(5, PS);
	pstmt.setString(6, update);
	pstmt.executeUpdate();
    response.sendRedirect("aircraftTable.jsp?updated=successful");
    
} else if(PageRedirect.equals("FSTb")) {
	String update = request.getParameter("update");
	String fsid = request.getParameter("flightsdleid");
	String acid = request.getParameter("aircraftid");
	String OA = request.getParameter("originairport");
	String DA = request.getParameter("destairport");
	String C = request.getParameter("country");
	String ec = request.getParameter("economycost");
	String bc = request.getParameter("businesscost");
	String fc = request.getParameter("firstcost");
	String DD = request.getParameter("departdate");
	String DT = request.getParameter("departtime");
	String AD = request.getParameter("arrivaldate");
	String AT = request.getParameter("arrivaltime");
	String FT = request.getParameter("flighttime");
	String eB = request.getParameter("ecobooked");
	String bB = request.getParameter("busbooked");
	String fB = request.getParameter("firstbooked");
	String sqlStr2 = "UPDATE `aircraft`.`flightschedule` SET `flightsdleid`= ? , `Aircraft_ID`= ? , `OriginAirport`= ? , `DestAirport`= ? , `Country`= ? , `EconomyCost`= ? , `BusinessCost`= ? , `FirstCost`= ? , `DepartDate`= ? , `DepartTime`= ? , `ArrivalDate`= ? , `ArrivalTime`= ? , `FlightTime`= ?, `ecoBooked`= ?, `busBooked`= ?, `firstBooked`= ?  WHERE `flightsdleid`= ? ;";
 	PreparedStatement pstmt = conn.prepareStatement(sqlStr2);
 	pstmt.setString(1, fsid);
 	pstmt.setString(2, acid);
 	pstmt.setString(3, OA);
 	pstmt.setString(4, DA);
 	pstmt.setString(5, C);
 	pstmt.setString(6, ec);
 	pstmt.setString(7, bc);
 	pstmt.setString(8, fc);
 	pstmt.setString(9, DD);
 	pstmt.setString(10, DT);
 	pstmt.setString(11, AD);
 	pstmt.setString(12, AT);
 	pstmt.setString(13, FT);
 	pstmt.setString(14, eB);
 	pstmt.setString(15, bB);
 	pstmt.setString(16, fB);
 	pstmt.setString(17, update);
 	pstmt.executeUpdate();
    response.sendRedirect("FSDetailed.jsp?updated=successful");
}
// Step 7: Close connection
conn.close();
%>