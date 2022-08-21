package dbaccess;

public class BookingDetails {
	private int Booking_ID;
	private int flightsdleid_1;
	private int flightsdleid_2;
	private String cabin_class;
	private String no_of_passengers;
	private String title;
	private String name;
	private String email;
	private String contactno;
	private int cost;

	
	public BookingDetails(int BOOKINGID, int FLIGHTSDLEID1, int FLIGHTSDLEID2, String CABINCLASS, String NOOFPASSENGERS, String TITLE,String NAME, String EMAIL,String CONTACTNO,int COST) {
		Booking_ID = BOOKINGID;
		flightsdleid_1 = FLIGHTSDLEID1;
		flightsdleid_2 = FLIGHTSDLEID2;
		cabin_class = CABINCLASS;
		no_of_passengers = NOOFPASSENGERS;
		title = TITLE;
		name = NAME;
		email = EMAIL;
		contactno = CONTACTNO;
		cost = COST;
    }
	
	public int getBookingID(){
        return Booking_ID;
    }
    
    public void setBookingID(int Booking_ID){
        this.Booking_ID = Booking_ID;
    }
	public int getflightsdleid1(){
        return flightsdleid_1;
    }
    
    public void setflightsdleid1(int flightsdleid_1){
        this.flightsdleid_1 = flightsdleid_1;
    }
	public int getflightsdleid2(){
        return flightsdleid_2;
    }
    
    public void setflightsdleid2(int flightsdleid_2){
        this.flightsdleid_2 = flightsdleid_2;
    }
	public String getcabinclass(){
        return cabin_class;
    }
    
    public void setcabinclass(String cabin_class){
        this.cabin_class = cabin_class;
    }
	public String getnoofpassengers(){
        return no_of_passengers;
    }
    
    public void setnoofpassengers(String no_of_passengers){
        this.no_of_passengers = no_of_passengers;
    }
	public String gettitle(){
        return title;
    }
    
    public void settitle(String title){
        this.title = title;
    }
	public String getname(){
        return name;
    }
    
    public void setname(String name){
        this.name = name;
    }
	public String getemail(){
        return email;
    }
    
    public void setemail(String email){
        this.email = email;
    }
	public String getcontactno(){
        return contactno;
    }
    
    public void setcontactno(String contactno){
        this.contactno = contactno;
    }  
	public int getcost(){
        return cost;
    }
    
    public void setcost(int cost){
        this.cost = cost;
    }
}
