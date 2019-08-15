package complaints;

public class ComplaintsDTO {
	int cmpID;
	String cmpTitle;
	String userID;
	String cmpContent;
	String cmpDivide;
	int likeCount;
	
	public int getCmpID() {
		return cmpID;
	}
	public void setCmpID(int cmpID) {
		this.cmpID = cmpID;
	}
	public String getCmpTitle() {
		return cmpTitle;
	}
	public void setCmpTitle(String cmpTitle) {
		this.cmpTitle = cmpTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getCmpContent() {
		return cmpContent;
	}
	public void setCmpContent(String cmpContent) {
		this.cmpContent = cmpContent;
	}
	public String getCmpDivide() {
		return cmpDivide;
	}
	public void setCmpDivide(String cmpDivide) {
		this.cmpDivide = cmpDivide;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	public ComplaintsDTO() {
		
	}
	
	
	public ComplaintsDTO(int cmpID, String cmpTitle, String userID, String cmpContent, String cmpDivide,
			int likeCount) {
		this.cmpID = cmpID;
		this.cmpTitle = cmpTitle;
		this.userID = userID;
		this.cmpContent = cmpContent;
		this.cmpDivide=cmpDivide;
		this.likeCount = likeCount;
	}
}
