package signup;
import user.UserDAO;
import user.UserDTO;

public class signupBean {
	private String userID;
	private String userPW;
	private String userName;
	private String userEmail;
	private String userGender;
	UserDTO DTO = new UserDTO();
	
	public signupBean(String ID, String PW, String Name, String Email, String Gender) {
		userID = ID;
		userPW = PW;
		userName = Name;
		userEmail = Email;
		userGender = Gender;
	}
	
	public boolean makeAccount() {
		UserDAO userDAO = new UserDAO();
		DTO.setUserID(userID);
		DTO.setUserPassword(userPW);
		DTO.setUserNickname(userName);
		DTO.setUserEmail(userEmail);
		DTO.setUserGender(userGender);
		boolean signupStatus = userDAO.signup(DTO);
		return signupStatus;
	}
}
