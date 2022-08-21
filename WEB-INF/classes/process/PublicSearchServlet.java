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

import dbaccess.PublicSearch;
import dbaccess.PublicSearchDB;

/**
 * Servlet implementation class PublicSearchServlet
 */
@WebServlet("/PublicSearchServlet")
public class PublicSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublicSearchServlet() {
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
			String origin = request.getParameter("origin");
			String origin2 = request.getParameter("origin2");
			String dest = request.getParameter("dest");
			String dest2 = request.getParameter("dest2");
			String departdate = request.getParameter("departdate");
			String departdate2 = request.getParameter("departdate2");
			String returndate = request.getParameter("returndate");
			String group1 = request.getParameter("group1");
			String classs = request.getParameter("class");
			int total = Integer.parseInt(request.getParameter("adults")) + Integer.parseInt(request.getParameter("childs"));
			HttpSession session = request.getSession();
			session.setAttribute("totalnoofPassengers", total);
			session.setAttribute("cabinclass", classs);
			PublicSearchDB udatabase= new PublicSearchDB();
			ArrayList al = new ArrayList();
			al = udatabase.getPublicSearch(group1, origin, dest, departdate,returndate,total,classs,origin2,dest2,departdate2);
		
		request.setAttribute("dest", dest);
		request.setAttribute("dest2", dest2);
		request.setAttribute("group1", group1);
		request.setAttribute("publicsearchData", al);
		RequestDispatcher rd = request.getRequestDispatcher("publicsearchResults.jsp");
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
