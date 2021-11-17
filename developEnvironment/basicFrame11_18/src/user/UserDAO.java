package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO(){
		try{
			String dbURL ="jdbc:mariadb://localhost:3307/webdb?useSSL=false";
			String dbID ="root"; //db아이디 
			String dbPassword ="1234";//db비밀번호
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public int login(String userID, String userPassword){
		String SQL ="SELECT userPassword FROM user WHERE userID=?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(userPassword)){
					return 1; // 로그인 성공
				}
				else {
					return 0; // 비밀번호 틀림 
				}
			}
			return -1; // ID가 없음
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return -2; // db 오류
	}
	public String returnNickname(String userID, String userPassword){
		String str = null;
		String SQL ="select userNickname from user where userID=? and userPassword =?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			rs = pstmt.executeQuery();
			if(rs.next()){
				str = rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}return str;
	}
	public boolean signup(UserDTO user){
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserNickname());
			if(pstmt.executeUpdate() == 1){
				return true;
			}

		}catch(Exception e){
			e.printStackTrace();
		}
		return false; // db 오류
	}
	
	
}

