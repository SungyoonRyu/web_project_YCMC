package editPost;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deletePostServlet
 */
@WebServlet("/deleteMyPost")
public class deletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletePostServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String boardID = request.getParameter("id");
		String saveDir = "C:\\Users\\류성윤\\workspace\\project_YCMC_1\\WebContent\\images\\imageboard";
		for(int i = 1; i<5; i++) {
			File deleteFile = new File(saveDir + "\\" + boardID + i + ".jpg");
		
			deleteFile.delete();
		}
		
		boolean isDelete = editMyPost.deletingBoard(boardID);
		
		if(isDelete) {
			response.sendRedirect("main.jsp");
		}
		else {
			response.getWriter().append("관리자에게 문의해 주세요<br>").append(Boolean.toString(isDelete));
		}
	}
}
