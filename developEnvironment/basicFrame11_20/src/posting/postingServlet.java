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
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		String saveDir = "C:\\Users\\류성윤\\workspace\\project_YCMC_1\\WebContent\\WEB-INF\\imageboard";
		int maxSize = 8*1024*1024; // 3MB
		String encoding = "utf-8";
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		long nowDate = (Long.parseLong(multi.getParameter("today")) % 1000000000000L) / 1000;
		String boardID = (String)session.getAttribute("ID") + Long.toHexString(nowDate);

		if(!boardID.equals("")) {
			int i = 0;
			String fullFileName = saveDir + "\\" + multi.getFilesystemName("postFile");
			File uploadFile= new File(fullFileName);
		    if(uploadFile.exists()) {     // 업로드된 파일명이 존재하면 Rename한다.
		    	File newFile = null;
		         do {
		        	 i++;
		        	 newFile = new File(saveDir + "\\" + boardID + i + ".jpg"); 
		        	 }while(newFile.exists());
		         uploadFile.renameTo(newFile);
		    }
		}
		boolean isPostUp = postingBean.postUpinBoard(boardID, multi.getParameter("postTitle"), "tmp", multi.getParameter("postContent"), (String)multi.getParameter("rentalFromDate"), (String)session.getAttribute("ID"));
		response.getWriter().append((String)multi.getParameter("rentalFromDate")).append(Boolean.toString(isPostUp));
	}

}
