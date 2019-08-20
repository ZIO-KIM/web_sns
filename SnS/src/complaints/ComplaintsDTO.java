package complaints;

public class ComplaintsDTO {
	int cmpID;
	String cmpTitle;
	String userID;
	String cmpContent;
	String cmpDivide;
	String cmpDate;
	int agreeCount;
	
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
	public String getCmpDate() {
		return cmpDate;
	}
	public void setCmpDate(String cmpDate) {
		this.cmpDate = cmpDate;
	}
	public int getAgreeCount() {
		return agreeCount;
	}
	public void setAgreeCount(int agreeCount) {
		this.agreeCount = agreeCount;
	}
	
	public ComplaintsDTO() {
		
	}
	
	
	public ComplaintsDTO(int cmpID, String cmpTitle, String userID, String cmpContent, String cmpDivide,
			String cmpDate, int agreeCount) {
		this.cmpID = cmpID;
		this.cmpTitle = cmpTitle;
		this.userID = userID;
		this.cmpContent = cmpContent;
		this.cmpDivide=cmpDivide;
		this.cmpDate=cmpDate;
		this.agreeCount = agreeCount;
	}
}
