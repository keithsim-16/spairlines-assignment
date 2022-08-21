package dbaccess;

public class updatedFlightSchedule {
	private int flightid;
	private int flightid2;
	private String cabin_class;
	private int total_no_of_passengers;


	public int getFlightID() {
		return flightid;
	}
	
	public void setFlightID(int flightid) {
		this.flightid=flightid;
	}
	
	 public int getFlightID2() {
			return flightid2;
	}
		
	public void setFlightID2(int flightid2) {
			this.flightid2=flightid2;
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

}