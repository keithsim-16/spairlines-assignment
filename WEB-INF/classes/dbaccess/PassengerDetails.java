package dbaccess;

public class PassengerDetails {
	
	private int bookingID;
	private String title;
	private String name;
	private String passportNo;
	private String passengerType;
	private String contactTitle;
	private String contactName;
	private String contactEmail;
	private String contactNo;
	
	  public PassengerDetails (int BOOKINGID, String TITLE, String NAME, String PASSPORTNO, String PASSENGERTYPE, String CONTACTITLE, String CONTACTNAME, String CONTACTEMAIL, String CONTACTNO) {
		  bookingID = BOOKINGID;
		  title = TITLE;
		  name = NAME;
		  passportNo = PASSPORTNO;
		  passengerType = PASSENGERTYPE;
		  contactTitle = CONTACTITLE;
		  contactName = CONTACTNAME;
		  contactEmail = CONTACTEMAIL;
		  contactNo = CONTACTNO;
		  
	  }
	
	  public int getBookingID() {
		  return bookingID;
	  }
	  
	  public void setBookingID(int bookingID) {
		  this.bookingID = bookingID;
	  }
	
	  public String getTitle() {
	        return title;
	  }
	    
	  public void setTitle(String title){
	        this.title = title;
	  }
	  
	  public String getName() {
		  return name;
	  }
	  
	  public void setName(String name) {
		  this.name = name;
	  }
	  
	  public String getPassportNo() {
		  return passportNo;
	  }
	  
	  public void setPassportNo(String passportNo) {
		  this.passportNo = passportNo;
	  }
	  
	  public String getPassengerType() {
		  return passengerType;
	  }
	  
	  public void setPassengerType(String passengerType) {
		  this.passengerType = passengerType;
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
