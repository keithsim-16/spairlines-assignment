package process;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

import dbaccess.*;

/**
 * Servlet implementation class InsertCBookingServlet
 */
@WebServlet("/InsertCBookingServlet")
public class InsertCBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		addFBookingDetails uBean = null;
		updatedFlightSchedule uBean2 = null;
		try {
		ArrayList<addBookingDetails> bookingList = (ArrayList<addBookingDetails>)session.getAttribute("booking");
			if(bookingList!=null) {
				for(int i = 0; i<bookingList.size(); i++) {
					addBookingDetails a = (addBookingDetails) bookingList.get(i);
					int totalcost = 0;
					if (session.getAttribute("interconnecting") ==null && session.getAttribute("returnflight") ==null && session.getAttribute("multicity") ==null) {
						totalcost = a.getCost()*a.gettotalnoofpassengers();
					} else {
						totalcost = a.gettotalinterCost()*a.gettotalnoofpassengers();
					}
		
						int BookingID = a.getBookingID();
						int FlightID= a.getFlightID();
						int FlightID2 = a.getFlightID2();
						String CabinClass = a.getcabinclass(); 
						int totalnoofpassengers = a.gettotalnoofpassengers();
						
						updatedFlightScheduleDB udatabase2 = new updatedFlightScheduleDB();
						uBean2 = udatabase2.updateFlightSchedule(FlightID, FlightID2, CabinClass, totalnoofpassengers);
						
						ArrayList<PassengerDetails> passengerDList =(ArrayList<PassengerDetails>)session.getAttribute("passengerD");
						if(passengerDList!=null) {
							if (passengerDList.size()>0) {
								PassengerDetails b = (PassengerDetails) passengerDList.get(0);
								String ContactTitle = b.getContactTitle();
								String ContactName = b.getContactName();
								String ContactEmail = b.getContactEmail();
								request.setAttribute("email", ContactEmail);
								String ContactNo = b.getContactNo();
								FBookingDetailsDB udatabase= new FBookingDetailsDB();
								uBean = udatabase.insertBookingDetails(BookingID, FlightID, FlightID2, CabinClass, totalnoofpassengers, ContactTitle, ContactName, ContactEmail, ContactNo, totalcost);
								
						}
						
				}
						
			}
		}
		PassengerDetails uBean3 = null;	
		ArrayList<PassengerDetails> passengerDList =(ArrayList<PassengerDetails>)session.getAttribute("passengerD");
		if(passengerDList!=null) {
			for(int i = 0; i<passengerDList.size(); i++) {
				PassengerDetails a = (PassengerDetails) passengerDList.get(i);
				int BookingID = a.getBookingID();
				String Title = a.getTitle();
				String Name = a.getName();
				String PassportNo = a.getPassportNo();
				String PassengerType = a.getPassengerType();
				PassengerDetailsDB udatabase = new PassengerDetailsDB();
				uBean3 = udatabase.insertPassengerDetails(BookingID, Title, Name, PassportNo, PassengerType);
			}
		}
		
		PaymentDetails uBean4 = null;	
		ArrayList<PaymentDetails> paymentDList =(ArrayList<PaymentDetails>)session.getAttribute("paymentD");
		if(paymentDList!=null) {
			for(int i = 0; i<paymentDList.size(); i++) {
				PaymentDetails a = (PaymentDetails) paymentDList.get(i);
				int BookingID = a.getBookingID();
				String Name = a.getName();
				String CardNo = a.getCardNo();
				String Expiry = a.getExpiry();
				String CVV = a.getCVV();
				String Bill = a.getBill();
				String Country = a.getCountry();
				String PostCode = a.getPostcode();
				String City = a.getCity();
				String State = a.getState();
				PaymentDetailsDB udatabase = new PaymentDetailsDB();
				uBean4= udatabase.insertPaymentDetails(BookingID, Name, CardNo, Expiry, CVV, Bill, Country, PostCode, City, State);
			}
		}
		String url ="bookingSuccess.jsp?from=InsertCBookingServlet";
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);	
	} catch(Exception e){
		
	}finally{
	}
}
	
			

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
