package email;

public class EmailDTO {
	int emailID;
	String divide;
	String email;
	int status;
	
	public int getEmailID() {
		return emailID;
	}
	public void setEmailID(int emailID) {
		this.emailID = emailID;
	}
	public String getDivide() {
		return divide;
	}
	public void setDivide(String divide) {
		this.divide = divide;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public EmailDTO() {
	}
	
	public EmailDTO(int emailID, String divide, String email, int status) {
		this.emailID = emailID;
		this.divide = divide;
		this.email = email;
		this.status = status;
	}
	
}
