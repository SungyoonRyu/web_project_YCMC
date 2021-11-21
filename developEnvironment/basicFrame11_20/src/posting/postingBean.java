package posting;

import board.*;

public class postingBean {
	public postingBean() {}
	
	public static boolean postUpinBoard(String boardID, String title, String area, String content, String rentalDate, String userNickname) {
		BoardDTO DTO = new BoardDTO();
		BoardDAO DAO = new BoardDAO();
		DTO.setBoardID(boardID);
		DTO.setTitle(title);
		DTO.setArea(area);
		DTO.setBoardContent(content);
		DTO.setRentalDate(rentalDate);
		DTO.setRentalCount(0);
		DTO.setUserNickname(userNickname);
		boolean postupStatus = DAO.Boardinsert(DTO);
		return postupStatus;
	}
}
