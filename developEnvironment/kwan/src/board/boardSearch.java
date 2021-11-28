package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import image.ImageDAO;
@WebServlet("/boardSearch")
public class boardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String title = request.getParameter("title");
		response.getWriter().write(jSONBoard(title));
	}
	public String jSONBoard(String title){
		if(title == null) {
			title="";
		}
		StringBuffer sb = new StringBuffer("");
		sb.append("{\"result\":[");
		BoardDAO boardDAO = new BoardDAO();
		ArrayList<BoardDTO> boardList = boardDAO.boardSearchList(title);
		ImageDAO imageDAO = new ImageDAO();
		for(int i =0 ; i<boardList.size();i++){
			ArrayList<String> imageList = imageDAO.fileNum(boardList.get(i).getBoardID());
			sb.append("[{\"value\": \""+boardList.get(i).getBoardID()+"\"},");
			sb.append("{\"value\": \""+boardList.get(i).getTitle()+"\"},");
			for(int j =0; j<imageList.size();j++){
				sb.append("{\"value\": \""+"/images/imageboard"+imageDAO.fileNum(boardList.get(i).getBoardID())+"\"},");
			}
			sb.substring(0,sb.length()-1);
			sb.append("],");
		}
		sb.append("]}");
		return sb.toString();
	}
}
