package posting;

import board.*;
import image.*;
import java.util.ArrayList;

public class postingBean {
	public postingBean() {}
	
	public static boolean postUpinBoard(String boardID, String title, String content, String rentalDate1, String rentalDate2, String userNickname, String Category, ArrayList<String> files) {
		BoardDTO DTO = new BoardDTO();
		BoardDAO DAO = new BoardDAO();
		ImageDAO Imagefile = new ImageDAO();
		DTO.setBoardID(boardID);
		DTO.setTitle(title);
		DTO.setBoardContent(content);
		DTO.setRentalDate1(rentalDate1);
		DTO.setRentalDate2(rentalDate2);
		DTO.setRentalCount(0);
		DTO.setUserNickname(userNickname);
		DTO.setBoardCategory(Category);
		boolean postupStatus = DAO.Boardinsert(DTO) && Imagefile.insertfile(boardID, files);
		return postupStatus;
	}
}
