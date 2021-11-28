package image;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import board.BoardDTO;

public class ImageDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ImageDAO(){
		try{
			String dbURL ="jdbc:mariadb://localhost:3307/webdb?useSSL=false";
			String dbID ="root"; //db아이디 
			String dbPassword ="root1234";//db비밀번호
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public ArrayList<String> fileNum(String boardID){
		String SQL ="select fileName from image WHERE boardID =? "; 
		ArrayList <String> imagepath = new ArrayList<>();
		try{
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1,boardID);
		rs = pstmt.executeQuery();
		while(rs.next()){
			imagepath.add(rs.getString(1));
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
	}
	return imagepath;
	}
	public boolean insertfile(String boardID,ArrayList<String> fileNames){
		String SQL ="insert into image values(?,?)";
		Iterator<String> iter = fileNames.iterator();
		try{
			pstmt = conn.prepareStatement(SQL);
			while(iter.hasNext()) {
				pstmt.setString(1, boardID);
				pstmt.setString(2, iter.next().toString());
				if(pstmt.executeUpdate() == 1){
					continue;
				} else {
					return false;
				}
			}
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
			e.printStackTrace();
			}
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false; // 실패
	}
}

