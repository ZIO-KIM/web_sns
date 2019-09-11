package board;

public class boardDTO {
	int boardID;
	String boardName;
	String boardURL;
	
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardURL() {
		return boardURL;
	}
	public void setBoardURL(String boardURL) {
		this.boardURL = boardURL;
	}
	
	public boardDTO() {

	}
	
	public boardDTO(int boardID, String boardName, String boardURL) {
		this.boardID = boardID;
		this.boardName = boardName;
		this.boardURL = boardURL;
	}
}
