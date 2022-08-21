package process;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbaccess.addBookingDetails;

import java.util.*;
import java.sql.*;
/**
 * Servlet implementation class addBookingServlet
 */
@WebServlet("/addBookingServlet")
public class addBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		int bookingID = 0;
		int flightid = (int)session.getAttribute("flightid");
		int interflightid = 0;
		if (session.getAttribute("flightid2") == null) {
			 interflightid =0;
		} else {
			 interflightid = (int)session.getAttribute("flightid2");
		}
		int flightcost = (int)session.getAttribute("flightcost");
		int interflightcost = 0;
		if (session.getAttribute("flightcost2") == null) {
			 interflightcost =0;
		} else {
			interflightcost = (int)session.getAttribute("flightcost2");
		}
		int totalnoofPassengers = (int)session.getAttribute("totalnoofPassengers");
		String cabinclass = (String)session.getAttribute("cabinclass");
		int flightsdleid = 0;
		int AircraftID = 0;
		String originn = "";
		String destt = "";
		String DepartDatee = "";
		String AircraftFlightNumber = "";
		int flightsdleid2 = 0;
		int AircraftID2 = 0;
		String originn2 = "";
		String destt2 = "";
		String DepartDatee2 = "";
		String AircraftFlightNumber2 = "";
		if (session.getAttribute("interconnecting") ==null && session.getAttribute("returnflight") ==null && session.getAttribute("multicity") ==null) {
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
				String sqlStr= "SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'aircraft' AND TABLE_NAME = 'booking';";
				String sqlStr2= "SELECT * FROM aircraft.flightschedule WHERE flightsdleid = ?;";
				String sqlStr3 = "SELECT * FROM aircraft.aircraft WHERE Aircraft_ID = ?;";	
				PreparedStatement pstmt1 = conn.prepareStatement(sqlStr2); 
				PreparedStatement pstmt2 = conn.prepareStatement(sqlStr3); 
				pstmt1.setInt(1, flightid);
				ResultSet rs = stmt.executeQuery(sqlStr);
				ResultSet rs2 = pstmt1.executeQuery();
				while (rs.next()) {
					bookingID = rs.getInt("AUTO_INCREMENT");
				}
			
				while (rs2.next()) {
					flightsdleid = rs2.getInt("flightsdleid");
					AircraftID = rs2.getInt("Aircraft_ID");
					originn = rs2.getString("OriginAirport");
					destt = rs2.getString("DestAirport");
					DepartDatee = rs2.getString("DepartDate");
					pstmt2.setInt(1, AircraftID);
					ResultSet rs3=pstmt2.executeQuery();
					while (rs3.next()){
						AircraftFlightNumber = rs3.getString("Aircraft_Flight_Number");
					}
				}
				conn.close();
				
			} catch (Exception e) {
			 		System.err.println("Error :" + e.toString());
			} 
			
			session.setAttribute("bookingID", bookingID);
			
			addBookingDetails a = new addBookingDetails(bookingID, flightid, interflightid, AircraftFlightNumber, AircraftFlightNumber2, originn, originn2, destt, destt2, DepartDatee, DepartDatee2, cabinclass, totalnoofPassengers, flightcost, interflightcost);
			
			ArrayList<addBookingDetails> bookingList = (ArrayList<addBookingDetails>)session.getAttribute("booking");
			
			if(bookingList==null)
				bookingList = new ArrayList<addBookingDetails>();
			
			bookingList.add(a);
			
			session.setAttribute("booking", bookingList);
			
			//response.sendRedirect("insertPassengerDetails.jsp?from=addBookingServlet");
			String url ="insertPassengerDetails.jsp?from=addBookingServlet";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		
		} else {
			int flightid2 =interflightid;
			int flightcost2 = interflightcost;
			
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
				String sqlStr= "SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'aircraft' AND TABLE_NAME = 'booking';";
				String sqlStr2= "SELECT * FROM aircraft.flightschedule WHERE flightsdleid = ?;";
				String sqlStr3 = "SELECT * FROM aircraft.aircraft WHERE Aircraft_ID = ?;";	
				PreparedStatement pstmt1 = conn.prepareStatement(sqlStr2); 
				PreparedStatement pstmt2 = conn.prepareStatement(sqlStr3); 
				PreparedStatement pstmt3 = conn.prepareStatement(sqlStr2);
				PreparedStatement pstmt4 = conn.prepareStatement(sqlStr3);
				pstmt1.setInt(1, flightid);
				pstmt3.setInt(1, flightid2);
				ResultSet rs = stmt.executeQuery(sqlStr);
				ResultSet rs2 = pstmt1.executeQuery();
				ResultSet rs4 = pstmt3.executeQuery();
				while (rs.next()) {
					bookingID = rs.getInt("AUTO_INCREMENT");
				}
			
				while (rs2.next()) {
					flightsdleid = rs2.getInt("flightsdleid");
					AircraftID = rs2.getInt("Aircraft_ID");
					originn = rs2.getString("OriginAirport");
					destt = rs2.getString("DestAirport");
					DepartDatee = rs2.getString("DepartDate");
					pstmt2.setInt(1, AircraftID);
					ResultSet rs3=pstmt2.executeQuery();
					while (rs3.next()){
						AircraftFlightNumber = rs3.getString("Aircraft_Flight_Number");
					}
				}
				
				while (rs4.next()) {
					flightsdleid2 = rs4.getInt("flightsdleid");
					AircraftID2 = rs4.getInt("Aircraft_ID");
					originn2 = rs4.getString("OriginAirport");
					destt2 = rs4.getString("DestAirport");
					DepartDatee2 = rs4.getString("DepartDate");
					pstmt4.setInt(1, AircraftID);
					ResultSet rs5=pstmt4.executeQuery();
					while (rs5.next()){
						AircraftFlightNumber2 = rs5.getString("Aircraft_Flight_Number");
					}
				}
				
				conn.close();
			
		} catch (Exception e) {
		 		System.err.println("Error :" + e.toString());
		} 
			
			session.setAttribute("bookingID", bookingID);
			
			addBookingDetails a = new addBookingDetails(bookingID, flightid, flightid2, AircraftFlightNumber, AircraftFlightNumber2, originn, originn2, destt, destt2, DepartDatee, DepartDatee2, cabinclass, totalnoofPassengers, flightcost, flightcost2);
			
			ArrayList<addBookingDetails> bookingList = (ArrayList<addBookingDetails>)session.getAttribute("booking");
			
			if(bookingList==null)
				bookingList = new ArrayList<addBookingDetails>();
			
			bookingList.add(a);
			
			session.setAttribute("booking", bookingList);
			
			String url ="insertPassengerDetails.jsp?from=addBookingServlet";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
	}
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
