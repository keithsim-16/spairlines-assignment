package process;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbaccess.PassengerDetails;

/**
 * Servlet implementation class InsertPassengerDetailsServlet
 */
@WebServlet("/InsertPassengerDetailsServlet")
public class InsertPassengerDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPassengerDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
        //response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		int totalnoofPassengers = (int)session.getAttribute("totalnoofPassengers");
		int bookingID =  (int)session.getAttribute("bookingID");
		try{
			for (int i=0; i<totalnoofPassengers; i++) {
				String stringi = Integer.toString(i);
				String title = request.getParameter("title"+stringi);
				String name = request.getParameter("name"+stringi);
				String passportNo = request.getParameter("passportNo"+stringi);
				String passengerType = request.getParameter("passengerType"+stringi);
				String contactTitle = request.getParameter("contactTitle");
				String contactName = request.getParameter("contactName");
				String contactEmail = request.getParameter("contactEmail");
				String contactNo = request.getParameter("contactNo");
				PassengerDetails a = new PassengerDetails(bookingID, title, name, passportNo, passengerType, contactTitle, contactName, contactEmail, contactNo);
				ArrayList<PassengerDetails> passengerDList = (ArrayList<PassengerDetails>)session.getAttribute("passengerD");
				if(passengerDList==null)
					passengerDList = new ArrayList<PassengerDetails>();
				
				passengerDList.add(a);
				
				session.setAttribute("passengerD", passengerDList);
				
			}
			String url ="insertPaymentDetails.jsp?from=InsertPassengerDetailsServlet";
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
