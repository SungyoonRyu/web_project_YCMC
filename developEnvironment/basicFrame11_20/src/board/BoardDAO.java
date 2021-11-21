package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BoardDAO(){
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
	public String getDate(){
		String SQL ="SELECT now()";
		try{
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getString(1);
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
		}return null;
	}
	public boolean Boardinsert(BoardDTO boardDTO){
		Date nowday = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String SQL = "INSERT INTO board VALUES (?,?,?,?,?,?,?,?)";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardDTO.getBoardID());
			pstmt.setString(2, boardDTO.getTitle());
			pstmt.setString(3, boardDTO.getArea());
			pstmt.setString(4, date.format(nowday));
			pstmt.setString(5, boardDTO.getBoardContent());
			pstmt.setString(6, boardDTO.getRentalDate());
			pstmt.setInt(7, boardDTO.getRentalCount());
			pstmt.setString(8, boardDTO.getUserNickname());
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
	public ArrayList<BoardDTO> boardList(){
		String SQL ="select * from board order by boardDate DESC"; 
		int num = 0;
		ArrayList <BoardDTO> boardArr = new ArrayList<BoardDTO>();
	try{
		pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		while(num<9 && rs.next()){
			BoardDTO board = new BoardDTO();
			board.setBoardID(rs.getString(1));
			board.setTitle(rs.getString(2));
			board.setArea(rs.getString(3));
			board.setBoardDate(rs.getString(4));
			board.setBoardContent(rs.getString(5));
			board.setRentalDate(rs.getString(6));
			board.setRentalCount(rs.getInt(7));
			board.setUserNickname(rs.getString(8));
			boardArr.add(board);
			num++;
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
	return boardArr;
	}
	public boolean boardModify(BoardDTO board){
		String SQL ="UPDATE board SET title = ?, area = ?, boardContent = ?, rentalDate = ?, rentalCount = ? WHERE boardID = ?"; 	  
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,board.getTitle());
			pstmt.setString(2,board.getArea());
			pstmt.setString(3,board.getBoardContent());
			pstmt.setString(4,board.getRentalDate());
			pstmt.setInt(5,board.getRentalCount());
			pstmt.setString(1,board.getBoardID());
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
		}return false; // db 오류 
	}
	public boolean boardDelete(String boardID, String userNickname){
		String SQL ="DELETE FROM board where boardID = ? and userNickname = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,boardID);
			pstmt.setString(2,userNickname);
			rs = pstmt.executeQuery();
			if(rs.next()){
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
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false; // db오류
	}
}

