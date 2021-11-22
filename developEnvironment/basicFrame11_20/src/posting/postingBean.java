package posting;

import board.*;
import image.*;
import java.util.ArrayList;

public class postingBean {
	public postingBean() {}
	
	public static boolean postUpinBoard(String boardID, String title, String area, String content, String rentalDate, String userNickname, ArrayList<String> files) {
		BoardDTO DTO = new BoardDTO();
		BoardDAO DAO = new BoardDAO();
		ImageDAO Imagefile = new ImageDAO();
		DTO.setBoardID(boardID);
		DTO.setTitle(title);
		DTO.setArea(area);
		DTO.setBoardContent(content);
		DTO.setRentalDate(rentalDate);
		DTO.setRentalCount(0);
		DTO.setUserNickname(userNickname);
		boolean postupStatus = DAO.Boardinsert(DTO) && Imagefile.insertfile(boardID, files.get(0).toString());
		return postupStatus;
	}
}
