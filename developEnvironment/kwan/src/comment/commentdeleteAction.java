package comment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class commentdeleteAction
 */
@WebServlet("/commentdeleteAction")
public class commentdeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public commentdeleteAction() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		CommentDTO DTO = new CommentDTO();
		String boardID = request.getParameter("boardID");
		String commentUser= request.getParameter("commentUser");
		String CommentDate = request.getParameter("CommentDate");
		String commentContent = request.getParameter("commentContent");
		commentContent = commentContent.replaceAll("\r\n|\n\r|\n", "\r\n");
		PrintWriter out = response.getWriter();
		DTO.setBoardID(boardID);
		DTO.setCommentContent(commentContent);
		DTO.setCommentUser(commentUser);
		DTO.setCommentDate(CommentDate);
		CommentDAO DAO = new CommentDAO();
		boolean deleteOK = DAO.commentDelete(DTO);
		if(deleteOK==true){
			response.sendRedirect("seePost.jsp");
		}
		else {
			out.println("<script>alert('삭제가 안됬습니다')</script>");
			out.println("<script>location.reload(seePost.jsp)</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)boardID
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
