package posting;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import java.io.File;
import java.util.ArrayList;

/**
 * Servlet implementation class postingServlet
 */
@WebServlet("/postingServlet")
public class postingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postingServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession(true);
		String saveDir = "C:\\Users\\류성윤\\workspace\\project_YCMC_1\\WebContent\\images\\imageboard";
		int maxSize = 8*1024*1024; // 3MB
		String encoding = "utf-8";
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		long nowDate = (Long.parseLong(multi.getParameter("today")) % 1000000000000L) / 1000;
		String boardID = (String)session.getAttribute("ID") + Long.toHexString(nowDate);
		ArrayList<String> filenames = new ArrayList<String>();
		
		if(!boardID.equals("")) {
			for(int i = 1; i<=3 ; i++) {
				if(multi.getFilesystemName("postFile"+i) != null) {
					String fullFileName = saveDir + "\\" + multi.getFilesystemName("postFile" + i);
					File uploadFile= new File(fullFileName);
					File newFile = null;
					newFile = new File(saveDir + "\\" + boardID + i + ".jpg"); 
					if(newFile.exists()) {
						newFile.delete();
					}
					uploadFile.renameTo(newFile);
					filenames.add(boardID + i);
				}
			}
		}
		boolean isPostUp = postingBean.postUpinBoard(boardID, multi.getParameter("postTitle"), multi.getParameter("postContent"), (String)multi.getParameter("rentalFromDate"), (String)multi.getParameter("rentalToDate"), (String)session.getAttribute("nickname"), (String)multi.getParameter("postCategory"), filenames);
		
		if(isPostUp) {
			response.sendRedirect("seePost.jsp?id=" + boardID);
		}
		else {
			response.getWriter().append("관리자에게 문의해 주세요<br>").append(Boolean.toString(isPostUp)).append((String)session.getAttribute("nickname"));
		}
	}

}
