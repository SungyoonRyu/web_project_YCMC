package search;
import user.UserDAO;

public class searchInfo {
	private String userID;
	private String userNickname;
	private String userEmail;
	private String userGender;
	private 
	UserDAO DAO;
	
	public searchInfo(String ID, String Nickname, String Eamil, String Gender) {
		userID = ID;
		userNickname = Nickname;
		userEmail = Eamil;
		userGender = Gender;
		DAO = new UserDAO();
	}
	
	public String searchingID() {
		String resultID = DAO.searchID(userNickname, userEmail,userGender);
		return resultID;
	}
	
	public String searchingPW() {
		return DAO.searchPW(userID, userNickname, userEmail, userGender);
	}
}