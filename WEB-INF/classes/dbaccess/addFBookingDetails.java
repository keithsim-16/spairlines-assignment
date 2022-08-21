package dbaccess;

public class addFBookingDetails {
	private int bookingID;
	private int flightid;
	private int flightid2;
	private String cabin_class;
	private int total_no_of_passengers;
	private int totalfinalcost;
	private String contactTitle;
	private String contactName;
	private String contactEmail;
	private String contactNo;


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
	
	public int getTotalFinalCost(){
        return totalfinalcost;
    }
    
    public void setTotalFinalCost(int totalfinalcost){
        this.totalfinalcost = totalfinalcost;
    }
    
    public String getContactTitle() {
		  return contactTitle;
	  }
	  
	public void setContactTitle(String contactTitle) {
	    this.contactTitle=contactTitle;
	}
	  
	public String getContactName() {
		return contactName;
	}
	  
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	  
	public String getContactEmail() {
		return contactEmail;
	}
	  
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	  
	public String getContactNo() {
		return contactNo;
	}
	  
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}


}




