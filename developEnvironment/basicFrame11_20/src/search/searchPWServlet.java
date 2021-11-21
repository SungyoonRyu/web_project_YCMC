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
 * Servlet implementation class searchPW
 */
@WebServlet("/searchPW")
public class searchPWServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchPWServlet() {
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
		String inputID = request.getParameter("userID");
		String inputNickname = request.getParameter("userNickname");
		String inputEmail = request.getParameter("userEmail");
		String inputGender = request.getParameter("userGender");
		searchInfo search = new searchInfo(inputID, inputNickname, inputEmail, inputGender);
		String resultIDString = search.searchingPW();
		
		if(resultIDString != null) { 
			RequestDispatcher dispatcher =  request.getRequestDispatcher("searchResult.jsp");
			request.setAttribute("resultType", "Password");
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
