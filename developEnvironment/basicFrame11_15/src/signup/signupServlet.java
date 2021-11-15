package signup;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class signupServlet
 */
@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signupServlet() {
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
		String inputPW = request.getParameter("userPassword");
		String inputNickname = request.getParameter("userNickname");
		String inputEmail = request.getParameter("userEmail");
		String inputGender = request.getParameter("userGender");
		signupBean signup = new signupBean(inputID, inputPW, inputNickname, inputEmail, inputGender);
		boolean signupStatus = signup.makeAccount();
		if(signupStatus == true) {
			response.sendRedirect("doLogin.jsp");
		}
		else {
			response.sendRedirect("main.jsp");
		}
	}

}
