package profileImage;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class profileImageServlet
 */
@WebServlet("/profileImage")
public class profileImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileImageServlet() {
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
		String saveDir = "C:\\Users\\류성윤\\workspace\\project_YCMC_1\\WebContent\\images\\profileimage";
		int maxSize = 8*1024*1024; // 3MB
		String encoding = "utf-8";
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		String userID = session.getAttribute("ID").toString();
		String newfileName = userID + "IMG.jpg";
		boolean isChangeImg = false;
		
		if(!userID.equals("")) {
			if(multi.getFilesystemName("profileIMG") != null) {
				String fullFileName = saveDir + "\\" + multi.getFilesystemName("profileIMG");
				File uploadFile= new File(fullFileName);
				File newFile = null;
				newFile = new File(saveDir + "\\" + newfileName); 
				if(newFile.exists()) {
					newFile.delete();
				}
				isChangeImg = uploadFile.renameTo(newFile);
			}
		}
		
		if(isChangeImg) {
			response.sendRedirect("editProfileImage.jsp");
		}
		else {
			response.getWriter().append("관리자에게 문의해 주세요<br>").append(Boolean.toString(isChangeImg)).append((String)session.getAttribute("ID"));
		}
	}
}
