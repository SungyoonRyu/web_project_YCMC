package editprofile;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;

/**
 * Servlet implementation class changePWservlet
 */
@WebServlet("/changePW")
public class changePWservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePWservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String oldpassword = request.getParameter("oldPassword");
		String newpassword = request.getParameter("newPassword");
		UserDAO DAO = new UserDAO();
		boolean changePWok = DAO.passwordModify(oldpassword,newpassword);
		PrintWriter out = response.getWriter();
		if(changePWok == true){
			response.sendRedirect("myProfile.jsp");
		}
		else{
			response.sendRedirect("myProfile.jsp");
		}
		
	}

}
