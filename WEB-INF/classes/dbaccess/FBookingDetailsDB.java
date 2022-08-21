package dbaccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class FBookingDetailsDB {
	public addFBookingDetails insertBookingDetails(int bookingID, int flightid, int flightid2, String cabin_class, int total_no_of_passengers, String contactTitle, String contactName, String contactEmail, String contactNo, int totalfinalcost) throws SQLException{
	    	addFBookingDetails uBean = null;
	    	Connection conn = null;
	    	try{
	    		Class.forName("com.mysql.jdbc.Driver");
	    		String sqlStr = "INSERT INTO `aircraft`.`booking` (`Booking_ID`, `flightsdleid_1`, `flightsdleid_2`, `cabin_class`, `no_of_passengers`, `title`, `name`, `email`, `contactno`, `cost`) VALUES (?, ?, ?, ?, ?, ?, ?, ? ,? ,?);";
	    		conn = DriverManager.getConnection("jdbc:mysql://localhost/aircraft?user=root&password=Abcd$63641995&useSSL=false");
	    		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	    		pstmt.setInt(1, bookingID);
	    		pstmt.setInt(2, flightid);
	    		if (flightid2 !=0) {
	    			pstmt.setInt(3, flightid2);
	    		} else {
	    			pstmt.setNull(3, flightid2);
	    		}
	    		pstmt.setString(4, cabin_class);
	    		pstmt.setInt(5, total_no_of_passengers);
	    		pstmt.setString(6, contactTitle);
	    		pstmt.setString(7, contactName);
	    		pstmt.setString(8, contactEmail);
	    		pstmt.setString(9, contactNo);
	    		pstmt.setInt(10, totalfinalcost);
	    		pstmt.executeUpdate();
	    	} catch (Exception e){
	    		System.out.print("FBookingDetailsDB:"+e);
	    	} finally{
	    		conn.close();
	    	}
	    
	    return uBean;
	}
}
