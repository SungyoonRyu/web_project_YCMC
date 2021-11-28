package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import board.BoardDTO;

public class CommentDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public CommentDAO(){
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
	public boolean commentinsert(CommentDTO commentDTO){
		Date nowday = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String SQL = "INSERT INTO comment VALUES (?,?,?,?)";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, commentDTO.getBoardID());
			pstmt.setString(2, commentDTO.getCommentUser());
			pstmt.setString(3, date.format(nowday));
			pstmt.setString(4, commentDTO.getCommentContent());
			if(pstmt.executeUpdate() == 1){
				return true;
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
		}
		return false;
	}
	public boolean commentDelete(CommentDTO commentDTO){
		Date nowday = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String SQL = "DELETE from comment where boardID =? and commentUser=? and commentDate=? and CommentContent=?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, commentDTO.getBoardID());
			pstmt.setString(2, commentDTO.getCommentUser());
			pstmt.setString(3, commentDTO.getCommentDate());
			pstmt.setString(4, commentDTO.getCommentContent());
			if(pstmt.executeUpdate() == 1){
				return true;
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
		}
		return false;
	}
	public ArrayList<CommentDTO> commentList(String boardID){
		String SQL ="select * from comment where boardID= ? order by commentDate DESC"; 
		ArrayList <CommentDTO> commentArr = new ArrayList<CommentDTO>();
	try{
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1,boardID);
		rs = pstmt.executeQuery();
		while(rs.next()){
			CommentDTO comment = new CommentDTO();
			comment.setBoardID(rs.getString(1));
			comment.setCommentUser(rs.getString(2));
			comment.setCommentDate(rs.getString(3));
			comment.setCommentContent(rs.getString(4));
			commentArr.add(comment);
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
	return commentArr;
	}
	public int modifyNickname(String newNickname,String oldNickname){
		String SQL ="UPDATE comment SET commentUser=? WHERE commentUser = ?"; 	  
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,newNickname);
			pstmt.setString(2,oldNickname);
			return pstmt.executeUpdate();
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
		}return -2; // db 오류 
	}
}
