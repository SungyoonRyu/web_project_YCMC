package search;
import user.UserDAO;

public class searchInfo {
	private String userID;
	private String userNickname;
	private String userEmail;
	UserDAO DAO;
	
	public searchInfo(String ID, String Nickname, String Eamil) {
		userID = ID;
		userNickname = Nickname;
		userEmail = Eamil;
		DAO = new UserDAO();
	}
	
	public String searchingID() {
		String resultID = DAO.searchID(userNickname, userEmail);
		return resultID;
	}
	
	public String searchingPW() {
		return DAO.searchPW(userID);
	}
}
