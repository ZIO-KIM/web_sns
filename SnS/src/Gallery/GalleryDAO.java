package Gallery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GalleryDAO {
	private Connection conn;
	private ResultSet rs;
	
	public GalleryDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/SnS?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "seeun";
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public String getDate() { 

		String SQL = "SELECT NOW()";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	public int getNext() { 
		String SQL = "SELECT GalID FROM Council ORDER BY GalID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;//첫번째 게시물인 경우 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스오류
	}
	public int write(String GalTitle, String userID, String GalContent) { 
		String SQL = "INSERT INTO GALLERY VALUES(NULL, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(2, GalTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, GalContent);
			pstmt.setInt(6,1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스오류
	}
	
	public ArrayList<Gallery> getList(int pageNumber){ 
		String SQL = "SELECT * FROM Council WHERE GalID < ? AND GalAvailable = 1 ORDER BY GalID DESC LIMIT 10";
		ArrayList<Gallery> list = new ArrayList<Gallery>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Gallery gal = new Gallery();
				gal.setGalID(rs.getInt(1));
				gal.setGalTitle(rs.getString(2));
				gal.setUserID(rs.getString(3));
				gal.setGalDate(rs.getString(4));
				gal.setGalContent(rs.getString(5));
				gal.setGalAvailable(rs.getInt(6));
				list.add(gal);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	//10단위로 끊기는 경우에 다음페이지를 보이지 않게 하기 위함
	public boolean nextPage (int pageNumber) {
		String SQL = "SELECT * FROM Council WHERE GalID < ? AND GalAvailable = 1 ORDER BY GalID DESC LIMIT 10";
		ArrayList<Gallery> list = new ArrayList<Gallery>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 		
	}
	public Gallery getGal(int GalID) {
		String SQL = "SELECT * FROM Council WHERE GalID = ?";
		ArrayList<Gallery> list = new ArrayList<Gallery>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,GalID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Gallery gel = new Gallery();
				gel.setGalID(rs.getInt(1));
				gel.setGalTitle(rs.getString(2));
				gel.setUserID(rs.getString(3));
				gel.setGalDate(rs.getString(4));
				gel.setGalContent(rs.getString(5));
				gel.setGalAvailable(rs.getInt(6));
				return gel;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	public int update(int GalID,String GalTitle,String GalContent) {
		String SQL = "UPDATE Council SET GalTitle=?,GalContent=?WHERE GalID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, GalTitle);
			pstmt.setString(2, GalContent);
			pstmt.setInt(3,GalID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스오류
	}
	public int delete(int GalID) {
		String SQL = "UPDATE Council SET GalAvailable=0 WHERE GalID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,GalID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스오류
	}
}

