package dbaccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class updatedFlightScheduleDB {
	public updatedFlightSchedule updateFlightSchedule(int flightid, int flightid2, String cabin_class, int total_no_of_passengers) throws SQLException{
	        
	    	updatedFlightSchedule uBean = null;
	    	Connection conn = null;
	    	try{
	    		Class.forName("com.mysql.jdbc.Driver");
	    		String sqlStr = "";
	    		String sqlStr2 = "";
	    		if (cabin_class.equals("Economy")) {
	    			sqlStr = "UPDATE `aircraft`.`flightschedule` SET `ecoBooked` = `ecoBooked` + ? WHERE flightsdleid = ?;";
	    			sqlStr2 = "UPDATE `aircraft`.`flightschedule` SET `ecoBooked` = `ecoBooked` + ? WHERE flightsdleid = ?;";
	    		} else if (cabin_class.equals("Business")) {
	    			sqlStr = "UPDATE `aircraft`.`flightschedule` SET `busBooked` = `busBooked` + ? WHERE flightsdleid = ?;";
	    			sqlStr2 = "UPDATE `aircraft`.`flightschedule` SET `busBooked` = `busBooked` + ? WHERE flightsdleid = ?;";
	    		} else {
	    			sqlStr = "UPDATE `aircraft`.`flightschedule` SET `firstBooked` = `firstBooked` + ? WHERE flightsdleid = ?;";
	    			sqlStr2 = "UPDATE `aircraft`.`flightschedule` SET `firstBooked` = `firstBooked` + ? WHERE flightsdleid = ?;";
	    		}
	    		
	    		conn = DriverManager.getConnection("jdbc:mysql://localhost/aircraft?user=root&password=Abcd$63641995&useSSL=false");
	    		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	    		PreparedStatement pstmt2 = conn.prepareStatement(sqlStr2);
	    		pstmt.setInt(1, total_no_of_passengers);
	    		pstmt.setInt(2, flightid);
	    		pstmt.executeUpdate();
	    		if (flightid2 !=0) {
	    			pstmt2.setInt(1, total_no_of_passengers);
	    			pstmt2.setInt(2, flightid2);
	    			pstmt2.executeUpdate();
	    		}	
	    	} catch (Exception e){
	    		System.out.print("PaymentDetailsDB:"+e);
	    	} finally{
	    		conn.close();
	    	}
	    
	    return uBean;
		}	
}
