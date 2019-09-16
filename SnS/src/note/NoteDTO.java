package note;

public class NoteDTO {
	int noteID;
	String toID;
	String fromID;
	String noteTitle;
	String noteContent;
	String noteDate;
	int noteStatus;
	
	public int getNoteID() {
		return noteID;
	}

	public void setNoteID(int noteID) {
		this.noteID = noteID;
	}

	public String getToID() {
		return toID;
	}

	public void setToID(String toID) {
		this.toID = toID;
	}

	public String getFromID() {
		return fromID;
	}

	public void setFromID(String fromID) {
		this.fromID = fromID;
	}

	public String getNoteTitle() {
		return noteTitle;
	}

	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}

	public String getNoteContent() {
		return noteContent;
	}

	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}

	public String getNoteDate() {
		return noteDate;
	}

	public void setNoteDate(String noteDate) {
		this.noteDate = noteDate;
	}

	public int getNoteStatus() {
		return noteStatus;
	}

	public void setNoteStatus(int noteStatus) {
		this.noteStatus = noteStatus;
	}

	public NoteDTO() {
	}
	
	public NoteDTO(int noteID, String toID, String fromID, String noteTitle, String noteContent, String noteDate,
			int noteStatus) {
		this.noteID=noteID;
		this.toID = toID;
		this.fromID = fromID;
		this.noteTitle = noteTitle;
		this.noteContent = noteContent;
		this.noteDate = noteDate;
		this.noteStatus = noteStatus;
	}
}
