package editprofile;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import comment.CommentDAO;
import user.UserDAO;

/**
 * Servlet implementation class changeProfileservlet
 */
@WebServlet("/changeProfile")
public class changeProfileservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeProfileservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String id = request.getParameter("userID");
		String nickname = request.getParameter("userNickname");
		HttpSession session = request.getSession();
		String oldnickname = (String) session.getAttribute("nickname");
		session.setAttribute("nickname", nickname);
		UserDAO DAO = new UserDAO();
		CommentDAO commentDAO = new CommentDAO();
		BoardDAO boardDAO = new BoardDAO();
		PrintWriter out = response.getWriter();
		boolean editNicknameOK = DAO.modifyNickname(id, nickname);
		int editCommentUserOK = commentDAO.modifyNickname(nickname, oldnickname);
		int editboardUserOK = boardDAO.modifyNickname(nickname,oldnickname);
		if(editNicknameOK==true){
			if(0<= editCommentUserOK && 0<= editboardUserOK){
				out.println("<script>alert('회원정보가 변경되었습니다.')</script>");
				response.sendRedirect("myProfile.jsp");
			}
			else if(editCommentUserOK==-2&&editboardUserOK==-2){
				out.println("<script>alert('게시판, 댓글 정보 변경 안되었습니다.')</script>");
				response.sendRedirect("myProfile.jsp");
			}
		}else{
			out.println("<script>alert('user의 닉네임 변경 안되었습니다.')</script>");
			response.sendRedirect("myProfile.jsp");
		}
	}

}
