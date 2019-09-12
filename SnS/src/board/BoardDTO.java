package board;

public class BoardDTO {
	int boardID;
	String boardName;
	String boardURL;
	int boardAvailable;
	
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
	public int getBoardAvailable() {
		return boardAvailable;
	}
	public void setBoardAvailable(int boardAvailable) {
		this.boardAvailable = boardAvailable;
	}
	public BoardDTO() {

	}
	
	public BoardDTO(int boardID, String boardName, String boardURL, int boardAvailable) {
		this.boardID = boardID;
		this.boardName = boardName;
		this.boardURL = boardURL;
		this.boardAvailable = boardAvailable;
	}
}
