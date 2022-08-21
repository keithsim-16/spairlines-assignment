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

import dbaccess.BookingDetails;
import dbaccess.BookingDetailsDB;

/**
 * Servlet implementation class BookingSearchServlet
 */
@WebServlet("/BookingSearchServlet")
public class BookingSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		try{
		String mySearchTxt = request.getParameter("searchResults");
		BookingDetailsDB udatabase= new BookingDetailsDB();
		ArrayList al = new ArrayList();
		al = udatabase.getBookingDetails(mySearchTxt);
		
		request.setAttribute("bookingData", al);
		RequestDispatcher rd = request.getRequestDispatcher("Booking.jsp");
		rd.forward(request, response);
		}catch(Exception e){
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
