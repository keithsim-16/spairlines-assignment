package dbaccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class PaymentDetailsDB {
public PaymentDetails insertPaymentDetails(int bookingID, String name, String cardNo, String expiry, String cvv, String bill, String country, String postcode, String city, String state) throws SQLException{
        
    	PaymentDetails uBean = null;
    	Connection conn = null;
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
    		String sqlStr = "INSERT INTO `aircraft`.`payment` (`Booking_ID`, `Name`, `cardNo`, `Expiry`, `CVV`, `BillingAddress`, `Country`, `Postcode`, `city`, `state`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    		conn = DriverManager.getConnection("jdbc:mysql://localhost/aircraft?user=root&password=Abcd$63641995&useSSL=false");
    		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    		pstmt.setInt(1, bookingID);
    		pstmt.setString(2, name);
    		pstmt.setString(3, cardNo);
    		pstmt.setString(4, expiry);
    		pstmt.setString(5, cvv);
    		pstmt.setString(6, bill);
    		pstmt.setString(7, country);
    		if (postcode != "") {
    			pstmt.setString(8, postcode);
    		} else {
    			pstmt.setString(8, null);
    		}
    		pstmt.setString(9, city);
    		if (state != "") {
    			pstmt.setString(10, state);
    		} else {
    			pstmt.setString(10, null);
    		}
    		pstmt.executeUpdate();
    	} catch (Exception e){
    		System.out.print("PaymentDetailsDB:"+e);
    	} finally{
    		conn.close();
    	}
    
    return uBean;
	}	
}
