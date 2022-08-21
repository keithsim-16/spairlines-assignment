package dbaccess;

public class PublicSearch {
	private int flightsdleid;
	private int Aircraft_ID;
	private String OriginAirport;
	private String DestAirport;
	private String DepartDate;
	private String DepartTime;
	private String ArrivalTime;
	private String FlightTime;
	private String Aircraft_Flight_Number;
	private int Seats_Left;
	private int Cost;
	
	public PublicSearch(int FLIGHTSDLEID, int AIRCRAFTID, String ORIGINAIRPORT, String DESTAIRPORT, String DEPARTDATE, String DEPARTTIME, String ARRIVALTIME, String FLIGHTTIME, String AIRCRAFTFLIGHTNUMBER, int SEATSLEFT, int COST) {
		flightsdleid = FLIGHTSDLEID;
		Aircraft_ID = AIRCRAFTID;
		OriginAirport = ORIGINAIRPORT;
		DestAirport = DESTAIRPORT;
		DepartDate = DEPARTDATE;
		DepartTime = DEPARTTIME;
		ArrivalTime = ARRIVALTIME;
		FlightTime = FLIGHTTIME;
		Aircraft_Flight_Number = AIRCRAFTFLIGHTNUMBER;
		Seats_Left = SEATSLEFT;
		Cost = COST;
	}
	public int getflightsdleid(){
        return flightsdleid;
    }
    
    public void setflightsdleid(int flightsdleid){
        this.flightsdleid = flightsdleid;
    }
	public int getAircraftID(){
        return Aircraft_ID;
    }
    
    public void setAircraftID(int Aircraft_ID){
        this.Aircraft_ID = Aircraft_ID;
    }
    public String getOriginAirport(){
        return OriginAirport;
    }
    
    public void setOriginAirports(String OriginAirport){
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
    public String getDepartTime(){
        return DepartTime;
    }
    
    public void setDepartTime(String DepartTime){
        this.DepartTime = DepartTime;
    }

    public String getArrivalTime(){
        return ArrivalTime;
    }
    
    public void setArrivalTime(String ArrivalTime){
        this.ArrivalTime = ArrivalTime;
    }
    public String getFlightTime(){
        return FlightTime;
    }
    
    public void setFlightTime(String FlightTime){
        this.FlightTime = FlightTime;
    }
    public String getAircraftFlightNumber(){
        return Aircraft_Flight_Number;
    }
    
    public void setAircraftFlightNumber(String Aircraft_Flight_Number){
        this.Aircraft_Flight_Number = Aircraft_Flight_Number;
    }
    public int getSeatsLeft(){
        return Seats_Left;
    }
    
    public void setSeatsLeft(int Seats_Left){
        this.Seats_Left = Seats_Left;
    }
    
    public int getCost(){
        return Cost;
    }
    
    public void setCost(int Cost){
        this.Cost = Cost;
    }
}
