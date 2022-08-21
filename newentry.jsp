<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<% 
String PageRedirect = request.getParameter("Tb");
	
// Step1: Load JDBC Driver
Class.forName("com.mysql.jdbc.Driver");

// Step 2: Define Connection URL
String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995"; 

// Step 3: Establish connection to URL
Connection conn = DriverManager.getConnection(connURL);

if(PageRedirect.equals("AcTb")) {
	  String aircraftmodel = request.getParameter("aircraftmodel");
	  String flightno = request.getParameter("flightno");
	  String capacity = request.getParameter("capacity");
	  String planeseat = request.getParameter("planeseat");
		
	  String sqlStr1 = "INSERT INTO `aircraft`.`aircraft` (`Aircraft_Model`, `Aircraft_Flight_Number`, `Flight_Passenger_Capacity`, `Plane_Seat`) VALUES (?, ?, ?, ?)";
	  PreparedStatement pstmt = conn.prepareStatement(sqlStr1);
	  pstmt.setString(1, aircraftmodel);
	  pstmt.setString(2, flightno);
	  pstmt.setString(3, capacity);
	   	
	  File file = new File(request.getServletContext().getRealPath(planeseat));
	  if(file.exists()){
	     pstmt.setString(4, planeseat);
	  } else {
		 pstmt.setString(4, "/img/default.png");
	  }
	  pstmt.executeUpdate();
	  response.sendRedirect("aircraftTable.jsp?newEntry=successful");
	  
} else if (PageRedirect.equals("FSTb")) {
      int aircraftid, flightsdleid,economycost, businesscost, firstcost;
	  String OriginAirport = request.getParameter("originairport");
	  String DestAirport = request.getParameter("destairport");
	  String Country = request.getParameter("country");
	  String DepartTime = request.getParameter("departtime");
	  String ArrivalTime = request.getParameter("arrivaltime");
	  String FlightTime = request.getParameter("flighttime");
	  aircraftid = Integer.parseInt(request.getParameter("aircraftid"));
	  flightsdleid = Integer.parseInt(request.getParameter("flightsdleid"));
	  economycost = Integer.parseInt(request.getParameter("EconomyCost"));
	  businesscost = Integer.parseInt(request.getParameter("BusinessCost"));
	  firstcost = Integer.parseInt(request.getParameter("FirstCost"));
	  String DepartDate = request.getParameter("departdate");
	  String ArrivalDate = request.getParameter("arrivaldate");
		String eB = request.getParameter("ecobooked");
		String bB = request.getParameter("busbooked");
		String fB = request.getParameter("firstbooked");
		
	  String sqlStr2 = "INSERT INTO `aircraft`.`flightschedule` (`flightsdleid`, `Aircraft_ID`, `OriginAirport`, `DestAirport`, `Country`, `EconomyCost`, `BusinessCost`, `FirstCost`, `DepartDate`, `DepartTime`, `ArrivalDate`, `ArrivalTime`, `FlightTime`, `ecoBooked`, `busBooked`, `firstBooked`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	  PreparedStatement pstmt = conn.prepareStatement(sqlStr2);
	   pstmt.setInt(1, flightsdleid);
	   pstmt.setInt(2, aircraftid);
	   pstmt.setString(3, OriginAirport);
	   pstmt.setString(4, DestAirport);
	   pstmt.setString(5, Country);
	   pstmt.setInt(6, economycost);
	   pstmt.setInt(7, businesscost);
	   pstmt.setInt(8, firstcost);
	   pstmt.setString(9, DepartDate);
	   pstmt.setString(10, DepartTime);
	   pstmt.setString(11, ArrivalDate);
	   pstmt.setString(12, ArrivalTime);
	   pstmt.setString(13, FlightTime);
	   pstmt.setString(14, eB);
	   pstmt.setString(15, bB);
	   pstmt.setString(16, fB);
	   pstmt.executeUpdate();
	   response.sendRedirect("FlightSchedule.jsp?newEntry=successful");
}
// Step 7: Close connection
conn.close();
%>