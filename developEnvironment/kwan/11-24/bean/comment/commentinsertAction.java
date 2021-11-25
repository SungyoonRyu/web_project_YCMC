package comment;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.*;

@WebServlet("/insertComment")
public class commentinsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public commentinsertAction() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String commentContent = request.getParameter("comment_text");
		boolean commentInsertOK = false;
		CommentDAO commentDAO = new CommentDAO();
		CommentDTO commentDTO = new CommentDTO();
		HttpSession session = request.getSession(true);
		String url = request.getParameter("boardID");
		System.out.println(url);
			commentDTO.setBoardID(url);
			commentDTO.setCommentUser((String)session.getAttribute("nickname"));
			commentDTO.setCommentContent(commentContent);
			commentInsertOK = commentDAO.commentinsert(commentDTO);
			if(commentInsertOK== true){
				System.out.println("입력완료");
				response.sendRedirect("seePost.jsp?id="+url);
			}
			else{
				System.out.println("입력x");
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
}
