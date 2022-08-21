package dbaccess;
import java.sql.*;
import java.util.ArrayList;

public class PublicSearchDB {
	public ArrayList getPublicSearch(String group1, String origin, String dest, String departdate, String returndate, int total, String classs, String origin2, String dest2, String departdate2) throws SQLException {
		ArrayList al = new ArrayList();
        Connection conn = null;
    	String FlightNo1 = "";
    	int eco = 0;
    	int bus = 0;
    	int first = 0;
    	int cur = 0;
    	int curcost =0;
    	int ecocost = 0;
    	int buscost = 0;
    	int firstcost =0;
        try{
        	Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/aircraft?user=root&password=Abcd$63641995&useSSL=false");
        	if (group1.equals("return")) {
	            String sqlStr1 = "SELECT * FROM aircraft.flightschedule WHERE (OriginAirport LIKE ? and DestAirport LIKE ? and DepartDate LIKE ?) OR (OriginAirport LIKE ? and DestAirport LIKE ? and DepartDate LIKE ?);";
				String sqlStr2 = "SELECT * FROM aircraft.aircraft WHERE Aircraft_ID = ?;";	
				PreparedStatement pstmt1 = conn.prepareStatement(sqlStr1); 
				PreparedStatement pstmt2 = conn.prepareStatement(sqlStr2);
				pstmt1.setString(1, "%"+origin+"%");
				pstmt1.setString(2, "%"+dest+"%");
				pstmt1.setString(3, "%"+departdate+"%");
				pstmt1.setString(4, "%"+dest+"%");
				pstmt1.setString(5, "%"+origin+"%");
				pstmt1.setString(6, "%"+returndate+"%");
				ResultSet rs = pstmt1.executeQuery();
				while (rs.next()) {
					int flightsdleid = rs.getInt("flightsdleid");
					int AircraftID = rs.getInt("Aircraft_ID");
		  			String originn = rs.getString("OriginAirport");
		  			String destt = rs.getString("DestAirport");
		  			String DepartDatee = rs.getString("DepartDate");
		  			String DepartTime = rs.getString("DepartTime");
		  			String ArrivalTime = rs.getString("ArrivalTime");
		  			String FlightTime = rs.getString("FlightTime");
		  			int ecob = rs.getInt("ecoBooked");
		  			int busb = rs.getInt("busBooked");
		  			int firstb = rs.getInt("firstBooked");
		  			ecocost = rs.getInt("EconomyCost");
		  			buscost = rs.getInt("BusinessCost");
		  			firstcost = rs.getInt("FirstCost");
		  			pstmt2.setInt(1, AircraftID);
		  		 	ResultSet rs1 = pstmt2.executeQuery();
					while (rs1.next()){
						FlightNo1 = rs1.getString("Aircraft_Flight_Number");
						eco = rs1.getInt("Eco_Class");
						bus = rs1.getInt("Bus_Class");
						first = rs1.getInt("First_Class");
					}
					if(classs.equals("Economy")) {
						cur = eco - ecob;
						curcost = ecocost;
					} else if(classs.equals("Business")) {
						cur = bus - busb;
						curcost = buscost;
					} else {
						cur = first - firstb;
						curcost = firstcost;
					}
					if(cur > total) {
	                    PublicSearch b = new PublicSearch(flightsdleid, AircraftID, originn, destt,  DepartDatee, DepartTime, ArrivalTime, FlightTime,  FlightNo1, cur, curcost);
	                    al.add(b);	
					}		
				}
        	} else if (group1.equals("oneway")) {
        			// direct flights
			  		String sqlStr1 = "SELECT * FROM aircraft.flightschedule fs, aircraft.aircraft acd WHERE fs.Aircraft_ID = acd.Aircraft_ID AND OriginAirport LIKE ? AND DestAirport LIKE ? AND DepartDate LIKE ?" ;
			  		PreparedStatement pstmt = conn.prepareStatement(sqlStr1); 
				 	pstmt.setString(1, "%"+origin+"%");
				    pstmt.setString(2, "%"+dest+"%");
				    pstmt.setString(3, "%"+departdate+"%");
				    ResultSet rs1 = pstmt.executeQuery();
				    while (rs1.next()) {
				    	int flightsdleid = rs1.getInt("flightsdleid");
				    	int AircraftID = rs1.getInt("Aircraft_ID");
				    	String originn = rs1.getString("OriginAirport");
				    	String destt = rs1.getString("DestAirport");
			  			String DepartDatee = rs1.getString("DepartDate");
			  			String DepartTime = rs1.getString("DepartTime");
			  			String ArrivalTime = rs1.getString("ArrivalTime");
			  			String FlightTime = rs1.getString("FlightTime");
			  			FlightNo1 = rs1.getString("Aircraft_Flight_Number");
			  			int ecob = rs1.getInt("ecoBooked");
			  			int busb = rs1.getInt("busBooked");
			  			int firstb = rs1.getInt("firstBooked");
			  			eco = rs1.getInt("Eco_Class");
						bus = rs1.getInt("Bus_Class");
						first = rs1.getInt("First_Class");
						ecocost = rs1.getInt("EconomyCost");
			  			buscost = rs1.getInt("BusinessCost");
			  			firstcost = rs1.getInt("FirstCost");
			  			if(classs.equals("Economy")) {
							cur = eco - ecob;
							curcost = ecocost;
						} else if(classs.equals("Business")) {
							cur = bus - busb;
							curcost = buscost;
						} else {
							cur = first - firstb;
							curcost = firstcost;
						}
			  			if(cur > total) {
		                    PublicSearch b = new PublicSearch(flightsdleid, AircraftID, originn, destt,  DepartDatee, DepartTime, ArrivalTime, FlightTime,  FlightNo1, cur, curcost);
		                    al.add(b);	
						}		
				    }
				    // Interconnecting
				    String origin1, destination1, departuredate1,arrivaltime1,departtime1,flighttime1, destination2, departuredate2, arrivaltime2, departtime2, flighttime2;
				    int flightscheduleid1, flightscheduleid2;
				    String flightnumber1 = "";
			    	String flightnumber2 = "";
			    	int flightsdleid1 = 0;
			    	int flightsdleid2 = 0;
			    	int aircraftid1 = 0;
			    	int aircraftid2 = 0;
				    int cur2 = 0;
				    int eco2 = 0;
				    int bus2 = 0;
				    int first2 = 0;
				    int ecob = 0;
				    int busb = 0;
				    int firstb = 0;
				    int ecob2 = 0;
				    int busb2 = 0;
				    int firstb2 = 0;
				    int curcost2 =0;
				    int ecocost2 =0;
				    int buscost2=0;
				    int firstcost2 =0;
				    String sqlStr2 = "SELECT a.flightsdleid as flightscheduleid1 , b.flightsdleid as flightscheduleid2 , a.OriginAirport as origin1 , b.OriginAirport as origin2, a.DestAirport as destination1, b.DestAirport as destination2, a.DepartDate as departuredate1, b.DepartDate as departuredate2, a.DepartTime as departtime1, b.DepartTime as departtime2, a.ArrivalTime as arrivaltime1, b.ArrivalTime as arrivaltime2, a.FlightTime as flighttime1, b.FlightTime as flighttime2 FROM aircraft.flightschedule a JOIN aircraft.flightschedule b on a.DestAirport = b.OriginAirport and a.OriginAirport LIKE ? and b.DestAirport LIKE ? AND a.DepartDate LIKE ?"; 
				    String sqlStr3 = "SELECT * FROM aircraft.flightschedule fs, aircraft.aircraft acd WHERE fs.Aircraft_ID = acd.Aircraft_ID AND flightsdleid=?";
				    PreparedStatement pstmt1 = conn.prepareStatement(sqlStr2); 
				 	PreparedStatement pstmt2 = conn.prepareStatement(sqlStr3);
				 	PreparedStatement pstmt3 = conn.prepareStatement(sqlStr3);
					pstmt1.setString(1, "%"+origin+"%");
				    pstmt1.setString(2, "%"+dest+"%");
				    pstmt1.setString(3, "%"+departdate+"%");
				    ResultSet rs = pstmt1.executeQuery();
				    rs.last();
				  	int count1 = rs.getRow();
				  	rs.beforeFirst();
				  	
				  	if (count1 > 0) {
				    while (rs.next()) {
						flightscheduleid1 = rs.getInt("flightscheduleid1");
			  		 	origin1 = rs.getString("origin1");
			  		 	destination1 = rs.getString("destination1");
			  		 	departuredate1 = rs.getString("departuredate1");
			  		 	arrivaltime1 = rs.getString("arrivaltime1");
			  		 	departtime1 = rs.getString("departtime1");
			  		 	flighttime1 = rs.getString("flighttime1");
			  		 	pstmt2.setInt(1, flightscheduleid1);
			  		 	ResultSet rs2 = pstmt2.executeQuery();
						while (rs2.next()) {
	 						flightnumber1 = rs2.getString("Aircraft_Flight_Number");
			  		 		aircraftid1 = rs2.getInt("Aircraft_ID");
			  		 		flightsdleid1 = rs2.getInt("flightsdleid");
			  		 		eco = rs2.getInt("Eco_Class");
							bus = rs2.getInt("Bus_Class");
							first = rs2.getInt("First_Class");
							ecob = rs2.getInt("ecoBooked");
				  			busb = rs2.getInt("busBooked");
				  			firstb = rs2.getInt("firstBooked");
				  			ecocost = rs2.getInt("EconomyCost");
				  			buscost = rs2.getInt("BusinessCost");
				  			firstcost = rs2.getInt("FirstCost");
						}
						flightscheduleid2 = rs.getInt("flightscheduleid2");
		  		 		origin2 = rs.getString("origin2");
		  		 		destination2 = rs.getString("destination2");
		  		 		departuredate2 = rs.getString("departuredate2");
		  		 		arrivaltime2 = rs.getString("arrivaltime2");
		  		 		departtime2 = rs.getString("departtime2");
		  		 		flighttime2 = rs.getString("flighttime2");
		  		 		pstmt3.setInt(1, flightscheduleid2);
		  		 		ResultSet rs3 = pstmt3.executeQuery();
	 					while(rs3.next()) {
		  		 			flightnumber2 = rs3.getString("Aircraft_Flight_Number");
		  		 			aircraftid2 = rs3.getInt("Aircraft_ID");
		  		 			flightsdleid2 = rs3.getInt("flightsdleid");
		  		 			eco2 = rs3.getInt("Eco_Class");
							bus2 = rs3.getInt("Bus_Class");
							first2 = rs3.getInt("First_Class");
							ecob2 = rs3.getInt("ecoBooked");
				  			busb2 = rs3.getInt("busBooked");
				  			firstb2 = rs3.getInt("firstBooked");
				  			ecocost2 = rs3.getInt("EconomyCost");
				  			buscost2 = rs3.getInt("BusinessCost");
				  			firstcost2 = rs3.getInt("FirstCost");
						}
			  			if(classs.equals("Economy")) {
							cur = eco - ecob;
							cur2 = eco2 - ecob2;
							curcost = ecocost;
							curcost2 = ecocost2;
						} else if(classs.equals("Business")) {
							cur = bus - busb;
							cur2 = bus2 - busb2;
							curcost = buscost;
							curcost2 = buscost2;
						} else {
							cur = first - firstb;
							cur2 = first2 - firstb2;
							curcost = firstcost;
							curcost2 = firstcost2;
						}
			  			if(cur > total && cur2 > total) {
		                    PublicSearch b = new PublicSearch(flightsdleid1, aircraftid1, origin1, destination1,  departuredate1, departtime1, arrivaltime1, flighttime1, flightnumber1, cur, curcost);
		                    PublicSearch b1 = new PublicSearch(flightsdleid2, aircraftid2, origin2, destination2,  departuredate2, departtime2, arrivaltime2, flighttime2, flightnumber2, cur2, curcost2);
		                    al.add(b);	
		                    al.add(b1);	
						}	
				    }
				 }
        	} else {
			 	String sqlStr3 = "SELECT * FROM aircraft.flightschedule fs, aircraft.aircraft ac WHERE fs.Aircraft_ID = ac.Aircraft_ID AND ((((OriginAirport LIKE ?) AND (DestAirport LIKE ?)) OR ((OriginAirport LIKE ?) AND (DestAirport LIKE ?)) AND (DepartDate LIKE ?)));";
			 	PreparedStatement pstmt3 = conn.prepareStatement(sqlStr3);  //modified
    			pstmt3.setString(1, "%"+origin+"%");
    			pstmt3.setString(2, "%"+dest+"%");
    			pstmt3.setString(3, "%"+origin2+"%");
    			pstmt3.setString(4, "%"+dest2+"%");
    			pstmt3.setString(5, "%"+departdate2+"%");
    			ResultSet rs = pstmt3.executeQuery();
    			while (rs.next()) {
    	  			FlightNo1 = rs.getString("Aircraft_Flight_Number");
    	  			String originn = rs.getString("OriginAirport");
    	  			String destt = rs.getString("DestAirport");
    	  			String DepartTime = rs.getString("DepartTime");
    	  			String DepartDatee = rs.getString("DepartDate");
    	  			String ArrivalTime = rs.getString("ArrivalTime");
    	  			String FlightTime = rs.getString("FlightTime");
    	  			int ecob = rs.getInt("ecoBooked");
		  			int busb = rs.getInt("busBooked");
		  			int firstb = rs.getInt("firstBooked");
    	  			int flightsdleid = rs.getInt("flightsdleid");
    	  			int AircraftID = rs.getInt("Aircraft_ID");
    	  			eco = rs.getInt("Eco_Class");
					bus = rs.getInt("Bus_Class");
					first = rs.getInt("First_Class");
					ecocost = rs.getInt("EconomyCost");
		  			buscost = rs.getInt("BusinessCost");
		  			firstcost = rs.getInt("FirstCost");
    	  			if(classs.equals("Economy")) {
						cur = eco - ecob;
						curcost = ecocost;
					} else if(classs.equals("Business")) {
						cur = bus - busb;
						curcost = buscost;
					} else {
						cur = first - firstb;
						curcost = firstcost;
					}
					if(cur > total) {
	                    PublicSearch b = new PublicSearch(flightsdleid, AircraftID, originn, destt,  DepartDatee, DepartTime, ArrivalTime, FlightTime,  FlightNo1, cur, curcost);
	                    al.add(b);	
					}		
				} 
        	}
        } catch (Exception e){
        	System.out.print("..............PublicSearchDB:"+e);
        } finally{
            conn.close();
        }
        return al;
    } 
	}

