package dbaccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class PassengerDetailsDB {
	public PassengerDetails insertPassengerDetails(int bookingID, String title, String name, String passportNo, String passengerType) throws SQLException{
	        
	    	PassengerDetails uBean2 = null;
	    	Connection conn = null;
	    	try{
	    		Class.forName("com.mysql.jdbc.Driver");
	    		String sqlStr = "INSERT INTO `aircraft`.`passengerdetails` (`Booking_ID`, `Title`, `Name`, `PassportNo`, `PassengerType`) VALUES (?, ?, ?, ?, ?);";
	    		conn = DriverManager.getConnection("jdbc:mysql://localhost/aircraft?user=root&password=Abcd$63641995&useSSL=false");
	    		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	    		pstmt.setInt(1, bookingID);
	    		pstmt.setString(2, title);
	    		pstmt.setString(3, name);
	    		pstmt.setString(4, passportNo);
	    		pstmt.setString(5, passengerType);
	    		pstmt.executeUpdate();
	    	} catch (Exception e){
	    		System.out.print("PassengerDetailsDB:"+e);
	    	} finally{
	    		conn.close();
	    	}
	    
	    return uBean2;
		}
}
