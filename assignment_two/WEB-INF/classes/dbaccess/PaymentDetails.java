package dbaccess;

public class PaymentDetails {
	private int bookingID;
	private String name;
	private String cardNo;
	private String expiry;
	private String cvv;
	private String bill;
	private String country;
	private String postcode;
	private String city;
	private String state;
	
	public PaymentDetails (int BOOKINGID, String NAME, String CARDNO, String EXPIRY, String CVV, String BILL, String COUNTRY, String POSTCODE, String CITY, String STATE) {
		  bookingID = BOOKINGID;
		  name = NAME;
		  cardNo = CARDNO;
		  expiry = EXPIRY;
		  cvv = CVV;
		  bill = BILL;
		  country = COUNTRY;
		  postcode = POSTCODE;
		  city = CITY;
		  state = STATE;
		  
	  }
	
	public int getBookingID() {
		return bookingID;
	}
	
	public void setBookingID(int bookingID) {
		this.bookingID=bookingID;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name=name;
	}
	
	public String getCardNo() {
		return cardNo;
	}
	
	public void setCardNo(String cardNo) {
		this.cardNo=cardNo;
	}
	
	public String getExpiry() {
		return expiry;
	}
	
	public void setExpiry(String expiry) {
		this.expiry=expiry;
	}
	
	public String getCVV() {
		return cvv;
	}
	
	public void setCVV(String cvv) {
		this.cvv=cvv;
	}
	
	public String getBill() {
		return bill;
	}
	
	public void setBill(String bill) {
		this.bill=bill;
	}
	
	public String getCountry() {
		return country;
	}
	
	public void setCountry(String country) {
		this.country=country;
	}
	
	public String getPostcode() {
		return postcode;
	}
	
	public void setPostcode(String postcode) {
		this.postcode=postcode;
	}
	
	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {
		this.city=city;
	}
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state=state;
	}
	
	
	
}
