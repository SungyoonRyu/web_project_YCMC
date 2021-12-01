package signup;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/**
 * Servlet implementation class signupServlet
 */
@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signupServlet() {
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
		request.setCharacterEncoding("UTF-8");
		String saveDir = "C:\\Users\\류성윤\\workspace\\project_YCMC_1\\WebContent\\images\\profileimage";
		String inputID = request.getParameter("userID");
		String inputPW = request.getParameter("userPassword");
		String inputNickname = request.getParameter("userNickname");
		String inputEmail = request.getParameter("userEmail");
		String inputGender = request.getParameter("userGender");
		signupBean signup = new signupBean(inputID, inputPW, inputNickname, inputEmail, inputGender);
		boolean signupStatus = signup.makeAccount();
		if(signupStatus == true) { //회원가입 완료
			File defaultImg = new File(saveDir + "\\default.jpg");
			File newImg = new File(saveDir + "\\" + inputID + "IMG.jpg");
			
			try {
				if (newImg.createNewFile()) {
					FileInputStream input = new FileInputStream(defaultImg);
					FileOutputStream output = new FileOutputStream(newImg);

					byte[] buf = new byte[1024];

					int readData;
					while ((readData = input.read(buf)) > 0) {
						output.write(buf, 0, readData);
					}

					input.close();
					output.close();
				}
				} catch (IOException e) {
				e.printStackTrace();
				}
			response.sendRedirect("welcomYCMC.jsp");
		}
		else {
			response.sendRedirect("main.jsp");
		}
	}

}
