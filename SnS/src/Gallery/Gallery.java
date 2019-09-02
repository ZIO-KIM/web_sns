package Gallery;

public class Gallery {

	private int GalID;
	private String GalTitle;
	private String userID;
	private String GalDate;
	private String GalContent;
	private int GalAvailable;
	
	public int getGalID() {
		return GalID;
	}
	public void setGalID(int galID) {
		GalID = galID;
	}
	public String getGalTitle() {
		return GalTitle;
	}
	public void setGalTitle(String galTitle) {
		GalTitle = galTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getGalDate() {
		return GalDate;
	}
	public void setGalDate(String galDate) {
		GalDate = galDate;
	}
	public String getGalContent() {
		return GalContent;
	}
	public void setGalContent(String galContent) {
		GalContent = galContent;
	}
	public int getGalAvailable() {
		return GalAvailable;
	}
	public void setGalAvailable(int galAvailable) {
		GalAvailable = galAvailable;
	}
	
	public Gallery() {
		
	}
	
	public Gallery(int galID, String galTitle, String userID, String galDate, String galContent, int galAvailable) {
		GalID = galID;
		GalTitle = galTitle;
		this.userID = userID;
		GalDate = galDate;
		GalContent = galContent;
		GalAvailable = galAvailable;
	}
	
}
