package search;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class searchID
 */
@WebServlet("/searchID")
public class searchIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchIDServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String inputNickname = request.getParameter("userNickname");
		String inputEmail = request.getParameter("userEmail");
		searchInfo search = new searchInfo(null, inputNickname, inputEmail);
		String resultIDString = search.searchingID();
		
		if(resultIDString != null) { 
			RequestDispatcher dispatcher =  request.getRequestDispatcher("searchResult.jsp");
			request.setAttribute("resultType", "ID");
			request.setAttribute("resultString", resultIDString);
			dispatcher.forward(request, response);
		}
		else {
			RequestDispatcher dispatcher =  request.getRequestDispatcher("searchResult.jsp");
			request.setAttribute("resultType", "none");
			dispatcher.forward(request, response);
		}
	}

}
