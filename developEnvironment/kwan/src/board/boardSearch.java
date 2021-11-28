package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/searchtitle")
public class boardsearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public boardsearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String title = request.getParameter("MainTagSearch");
		BoardDAO boardDAO = new BoardDAO();
		ArrayList<BoardDTO> titleSearch = boardDAO.boardSearchList(title);
		if(titleSearch.isEmpty()){
			RequestDispatcher dispatcher =  request.getRequestDispatcher("main.jsp");
			request.setAttribute("msg","관련 게시글이 없습니다");
			dispatcher.forward(request, response);
		}else{
			RequestDispatcher dispatcher =  request.getRequestDispatcher("titlePostList.jsp");
			request.setAttribute("boardList",titleSearch);
			dispatcher.forward(request, response);
		}
	}

}
