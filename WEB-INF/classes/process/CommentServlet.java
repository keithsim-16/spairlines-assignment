package process;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbaccess.Comment;
import dbaccess.CommentDB;


/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Comment uBean = null;
		PrintWriter out = response.getWriter();
		
		try {
			int cid = Integer.parseInt(request.getParameter("cid"));
			String op = request.getParameter("op");
			String timeposted = request.getParameter("timeposted");
			String comment = request.getParameter("comment");
			CommentDB udatabase= new CommentDB();
			uBean = udatabase.insertUserDetails(cid, op, timeposted, comment);
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp?#four");
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
