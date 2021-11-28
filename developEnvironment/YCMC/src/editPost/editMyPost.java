package editPost;

import java.util.ArrayList;

import board.*;
import image.*;

public class editMyPost {
	public editMyPost() {}
	public static boolean editingBoard(String boardID, String title, String content, String rentalDate1, String rentalDate2, String Category, ArrayList<String> deletefiles, ArrayList<String> files) {
		BoardDTO DTO = new BoardDTO();
		BoardDAO DAO = new BoardDAO();
		ImageDAO deletefile = new ImageDAO();
		ImageDAO newfile = new ImageDAO();
		DTO.setBoardID(boardID);
		DTO.setTitle(title);
		DTO.setBoardContent(content);
		DTO.setRentalDate1(rentalDate1);
		DTO.setRentalDate2(rentalDate2);
		DTO.setBoardCategory(Category);
		deletefile.deleteFile(boardID, deletefiles);
		boolean editStatus = DAO.boardModify(DTO) && newfile.insertfile(boardID, files);
		return editStatus;
	}
	public static boolean deletingBoard(String boardID) {
		BoardDAO DAO = new BoardDAO();
		ImageDAO Imagefile = new ImageDAO();
		boolean deleteStatus = Imagefile.deleteFile(boardID) && DAO.boardDelete(boardID);
		return deleteStatus;
	}
}
