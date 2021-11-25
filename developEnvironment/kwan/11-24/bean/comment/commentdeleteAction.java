package comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class commentdeleteAction
 */
@WebServlet("/deleteComment")
public class commentdeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public commentdeleteAction() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDAO commentDAO = new CommentDAO();
		CommentDTO commentDTO = (CommentDTO) request.getAttribute("DeleteComment");
		boolean deleteOK = commentDAO.commentDelete(commentDTO);
		if(deleteOK == true){
			System.out.println("제거 완료");
		}
		else{
			System.out.println("제거 실패");
		}
	}

}
