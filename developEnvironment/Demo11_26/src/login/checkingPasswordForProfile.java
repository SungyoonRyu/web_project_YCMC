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
 * Servlet implementation class checkingPasswordForProfile
 */
@WebServlet("/checkingPasswordForProfile")
public class checkingPasswordForProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkingPasswordForProfile() {
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
		HttpSession session = request.getSession(true);
		String inputID = session.getAttribute("ID").toString();
		String inputPW = request.getParameter("certifyPassword");
		loginBean login = new loginBean(inputID, inputPW);
		
		int loginNumber = login.checkingLogin();
		if(loginNumber == 1) { 
			response.sendRedirect("myProfile.jsp");
		}
		else {
			RequestDispatcher dispatcher =  request.getRequestDispatcher("certifyPW.jsp");
			request.setAttribute("resultCheck", loginNumber);
			dispatcher.forward(request, response);
		}
	}

}
