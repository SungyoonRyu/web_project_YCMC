package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public userDAO(){
		try{
			String dbURL ="jdbc:mysql:/'localhost:3306/webdb";
			String dbID =""; //db아이디 
			String dbPassword ="";//db비밀번호
			Class.forName("com.mysql.jdb.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public int login(String userID, String userPassword){
		String SQL ="SELECT userPassword FROM WHERE usrID =? ";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(userPassword)){
					return 1; // 로그인 성공
				}
				else
					return 0; // 비밀번호 불일치 
			}
			return -1; // ID가 없음
		}catch(Exception e){
			e.printStackTrace();
		}
		return -2; // db 오류
	}
	public int registerInfo(userDTO user){
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?,?)";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserGender());
			pstmt.setString(6, user.getUserNickname());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		} 	
		return -1; // db 오류
	}
}
