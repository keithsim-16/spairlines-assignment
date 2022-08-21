package dbaccess;
import java.sql.*;
import java.util.ArrayList;

public class BookingDetailsDB {
	public ArrayList getBookingDetails(String mySearchTxt) throws SQLException{
		ArrayList al = new ArrayList();
        Connection conn = null;
        try {
        	int Booking_ID = 0;
        	int flightsdleid_1 = 0;
        	int flightsdleid_2 = 0;
        	int cost = 0;
	        String cabin_class = "";
	        String no_of_passengers = "";
	        String title = "";
	        String name = "";
	        String email = "";
	        String contactno = "";
		     // Step1: Load JDBC Driver
                Class.forName("com.mysql.jdbc.Driver");

                // Step 2: Define Connection URL
                String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995&useSSL=false";
                String sqlStr = "SELECT * FROM aircraft.booking WHERE (flightsdleid_1 LIKE ?) or (flightsdleid_2 LIKE ?) or (cabin_class LIKE ?)";

                // Step 3: Establish connection to URL
                conn = DriverManager.getConnection(connURL); 
     			// Step 4: Create Statement object
      			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
      			if(!mySearchTxt.equals("") && mySearchTxt!=null) {
         		pstmt.setString(1, "%"+mySearchTxt+"%");
         		pstmt.setString(2, "%"+mySearchTxt+"%");
         		pstmt.setString(3, "%"+mySearchTxt+"%");
      			}
				ResultSet rs = pstmt.executeQuery();
      			// Step 6: Process Result
      			while (rs.next()) {
      				Booking_ID = rs.getInt("Booking_ID");
              		flightsdleid_1 = rs.getInt("flightsdleid_1");
              		flightsdleid_2 = rs.getInt("flightsdleid_2");
                    cabin_class = rs.getString("cabin_class");
                    no_of_passengers = rs.getString("no_of_passengers");
                    title = rs.getString("title");
              		name = rs.getString("name");
                    email = rs.getString("email");
                    contactno = rs.getString("contactno");
                    cost = rs.getInt("cost");
                    BookingDetails b = new BookingDetails(Booking_ID, flightsdleid_1, flightsdleid_2,cabin_class,no_of_passengers, title, name, email, contactno, cost);
                    al.add(b);
      			}
        } catch (Exception e){
        	System.out.print("..............UserDetailsDB:"+e);
        } finally{
            conn.close();
        }
        if(al.isEmpty()) {
        	return null;
        } else {
        	return al;
        }
	}
}
