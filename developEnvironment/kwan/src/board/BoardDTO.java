package board;

public class BoardDTO {
	private String boardID;
	private String title;
	private String boardDate;
	private String boardContent;
	private String rentalDate1;
	private String rentalDate2;
	private int rentalCount;
	private String userNickname;
	private String boardCategory;
	
	public String getRentalDate2() {
		return rentalDate2;
	}
	public void setRentalDate2(String rentalDate2) {
		this.rentalDate2 = rentalDate2;
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	public String getBoardID() {
		return boardID;
	}
	public void setBoardID(String boardID) {
		this.boardID = boardID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boarContent) {
		this.boardContent = boarContent;
	}
	public String getRentalDate1() {
		return rentalDate1;
	}
	public void setRentalDate1(String rentalDate) {
		this.rentalDate1 = rentalDate;
	}
	public int getRentalCount() {
		return rentalCount;
	}
	public void setRentalCount(int rentalCount) {
		this.rentalCount = rentalCount;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	
	
}
