package login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String inputID = request.getParameter("userID");
		String inputPW = request.getParameter("userPassword");
		String nickname = null;
		loginBean login = new loginBean(inputID, inputPW);
		
		int loginNumber = login.checkingLogin();
		if(loginNumber == 1) { 
			HttpSession session = request.getSession(true);
			nickname = login.returningNickname(inputID,inputPW);
			session.setAttribute("nickname", nickname);
			session.setAttribute("ID", inputID);
			response.sendRedirect("main.jsp");
		}
		else {
			RequestDispatcher dispatcher =  request.getRequestDispatcher("doLogin.jsp");
			request.setAttribute("resultLogin", loginNumber);
			dispatcher.forward(request, response);
		}
		
		
	}

}
