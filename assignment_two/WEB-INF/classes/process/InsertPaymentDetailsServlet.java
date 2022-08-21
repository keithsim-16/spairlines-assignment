package process;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbaccess.PaymentDetails;

/**
 * Servlet implementation class InsertPaymentDetailsServlet
 */
@WebServlet("/InsertPaymentDetailsServlet")
public class InsertPaymentDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPaymentDetailsServlet() {
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
		int bookingID =  (int)session.getAttribute("bookingID");
		try{
			
			String name = request.getParameter("name");
			String cardNo = request.getParameter("cardNo");
			String expiry = request.getParameter("expiry");
			String cvv = request.getParameter("cvv");
			String bill = request.getParameter("bill");
			String country = request.getParameter("country");
			String postcode = request.getParameter("postcode");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			
			PaymentDetails a = new PaymentDetails(bookingID, name, cardNo, expiry, cvv, bill, country, postcode, city, state);
			ArrayList<PaymentDetails> paymentDList = (ArrayList<PaymentDetails>)session.getAttribute("paymentD");
			if(paymentDList==null)
				paymentDList = new ArrayList<PaymentDetails>();
			
			paymentDList.add(a);
			
			session.setAttribute("paymentD", paymentDList);
				
			
			String url ="bookingSummary.jsp?from=InsertPaymentDetailsServlet";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
			
			}catch(Exception e){
				System.out.print(e);
		}	finally{
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
