package dbaccess;

public class addBookingDetails {
	private int bookingID;
	private int flightid;
	private int flightid2;
	private String Aircraft_Flight_Number;
	private String Aircraft_Flight_Number_2;
	private String OriginAirport;
	private String OriginAirport2;
	private String DestAirport;
	private String DestAirport2;
	private String DepartDate;
	private String DepartDate2;
	private String cabin_class;
	private int total_no_of_passengers;
	private int Cost;
	private int interCost;
	private int totalintercost;
	
//	public addBookingDetails (int BOOKINGID, int FLIGHTID, String AIRCRAFT_FLIGHT_NUMBER, String ORIGINAIRPORT, String DESTAIRPORT, String DEPARTDATE, String CABIN_CLASS, int TOTAL_NO_OF_PASSENGERS,  int COST){
//		bookingID = BOOKINGID;
//		flightid = FLIGHTID;
//		Aircraft_Flight_Number = AIRCRAFT_FLIGHT_NUMBER;
//		OriginAirport = ORIGINAIRPORT;
//		DestAirport = 	DESTAIRPORT;
//		DepartDate = DEPARTDATE;
//		cabin_class = CABIN_CLASS;
//		total_no_of_passengers = TOTAL_NO_OF_PASSENGERS;
//		Cost = COST;
//		
//	}
	
	public addBookingDetails (int BOOKINGID, int FLIGHTID, int FLIGHTID2, String AIRCRAFT_FLIGHT_NUMBER, String AIRCRAFT_FLIGHT_NUMBER_2, String ORIGINAIRPORT, String ORIGINAIRPORT2, String DESTAIRPORT, String DESTAIRPORT2, String DEPARTDATE, String DEPARTDATE2, String CABIN_CLASS, int TOTAL_NO_OF_PASSENGERS, int COST,  int INTERCOST){
		bookingID = BOOKINGID;
		flightid = FLIGHTID;
		flightid2 = FLIGHTID2;
		Aircraft_Flight_Number = AIRCRAFT_FLIGHT_NUMBER;
		Aircraft_Flight_Number_2 = AIRCRAFT_FLIGHT_NUMBER_2;
		OriginAirport = ORIGINAIRPORT;
		OriginAirport2 = ORIGINAIRPORT2;
		DestAirport = 	DESTAIRPORT;
		DestAirport2 = DESTAIRPORT2;
		DepartDate = DEPARTDATE;
		DepartDate2 = DEPARTDATE2;
		cabin_class = CABIN_CLASS;
		total_no_of_passengers = TOTAL_NO_OF_PASSENGERS;
		Cost = COST;
		interCost = INTERCOST;
		
	}
	
	public int getBookingID() {
		return bookingID;
	}
	
	public void setBookingID(int bookingID) {
		this.bookingID = bookingID;
	}
	
	public int getFlightID() {
		return flightid;
	}
	
	public void setFlightID(int flightid) {
		this.flightid=flightid;
	}
	
	
	public String getAircraftFlightNumber() {
		return Aircraft_Flight_Number;
	}
	
	public void setAircraftFlightNumber(String Aircraft_Flight_Number){
        this.Aircraft_Flight_Number = Aircraft_Flight_Number;
    }
	
	public String getOriginAirport(){
	        return OriginAirport;
	}
	    
	public void setOriginAirport(String OriginAirport){
	        this.OriginAirport = OriginAirport;
	}
	
    public String getDestAirport(){
        return DestAirport;
    }
    
    public void setDestAirport(String DestAirport){
        this.DestAirport = DestAirport;
    }
    
    public String getDepartDate(){
        return DepartDate;
    }
    
    public void setDepartDate(String DepartDate){
        this.DepartDate = DepartDate;
    }
    
    
    public String getcabinclass(){
        return cabin_class;
    }
    
    public void setcabinclass(String cabin_class){
        this.cabin_class = cabin_class;
    }
	public int gettotalnoofpassengers(){
        return total_no_of_passengers;
    }
    
    public void settotalnoofpassengers(int total_no_of_passengers){
        this.total_no_of_passengers = total_no_of_passengers;
    }
    
    public int getCost(){
        return Cost;
    }
    
    public void setCost(int Cost){
        this.Cost = Cost;
    }
    
    public int getFlightID2() {
		return flightid2;
	}
	
	public void setFlightID2(int flightid2) {
		this.flightid2=flightid2;
	}
	
	public int gettotalinterCost(){
		totalintercost = interCost + Cost;
        return totalintercost;
    }
    
    public void settotalinterCost(int interCost, int Cost){
    	int totalintercost = interCost + Cost;
        this.totalintercost = totalintercost;
    }
    
    public String getOriginAirport2(){
        return OriginAirport2;
    }
    
    public void setOriginAirport2(String OriginAirport2){
        this.OriginAirport2 = OriginAirport2;
    }
    
    public String getDestAirport2(){
	    return DestAirport2;
	}
	    
    public void setDestAirport2(String DestAirport2){
        this.DestAirport2 = DestAirport2;
    }
    
    public String getAircraftFlightNumber2() {
		return Aircraft_Flight_Number_2;
	}
	
	public void setAircraftFlightNumber2(String Aircraft_Flight_Number_2){
        this.Aircraft_Flight_Number_2 = Aircraft_Flight_Number_2;
    }
	
	public String getDepartDate2(){
	    return DepartDate2;
	}
	    
	public void setDepartDate2(String DepartDate2){
	    this.DepartDate2 = DepartDate2;
	}
}
