package login;
import user.UserDAO;

public class loginBean {
	private String userID;
	private String userPW;
	
	public loginBean(String ID, String PW) {
		userID = ID;
		userPW = PW;
	}
	public int checkingLogin() {
		UserDAO userDAO = new UserDAO();
		int loginStatus = userDAO.login(userID ,userPW);
		return loginStatus;
	}
}