package comment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/insertComment")
public class commentinsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public commentinsertAction() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String commentContent = request.getParameter("comment_text");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		//commentContent = commentContent.replace("\r\n", "<br>");
		boolean commentInsertOK = false;
		CommentDTO commentDTO = new CommentDTO();
		HttpSession session = request.getSession(true);
		String url = request.getParameter("boardID");
		commentDTO.setBoardID(url);
		commentDTO.setCommentContent(commentContent);
		CommentDAO commentDAO = new CommentDAO();
		if((String)session.getAttribute("nickname")!=null){
			commentDTO.setCommentUser((String)session.getAttribute("nickname"));
			commentInsertOK = commentDAO.commentinsert(commentDTO);
			if(commentInsertOK== true){
				response.sendRedirect("seePost.jsp?id="+url);
			}
			else{
				out.println("<script>alert('관리자에게 문의하세요')</scirpt>");
			}
		}else{
			out.println("<script>alert('로그인이 필요합니다')</script>");
			out.println("<script>history.back()</script>");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
