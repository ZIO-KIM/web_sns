package complaints;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DatabaseUtil;

public class ComplaintsDAO {

	Connection conn=DatabaseUtil.getConnection();
	
	public String getDate() {
		String SQL="SELECT NOW()";
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public int getNext(boolean isStudent) {
		String SQL = "SELECT cmpID FROM CMP_SC ORDER BY cmpID DESC";
		if(isStudent) {
			SQL = "SELECT cmpID FROM CMP_ST ORDER BY cmpID DESC";
		}
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL);
			ResultSet rs=pstmt.executeQuery();
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public int write(ComplaintsDTO complaintsDTO, boolean isStudent) {
		String SQL ="INSERT INTO CMP_SC VALUES(NULL, ?, ?, ?, ?, ?, 0)";
		if(isStudent) {
			SQL ="INSERT INTO CMP_ST VALUES(NULL, ?, ?, ?, ?, ?, 0)";
		}
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,complaintsDTO.getCmpTitle());
			pstmt.setString(2,complaintsDTO.getUserID());
			pstmt.setString(3,getDate());
			pstmt.setString(4,complaintsDTO.getCmpContent());
			pstmt.setString(5,complaintsDTO.getCmpDivide());
			return pstmt.executeUpdate();
			}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return -1;
	}
	
	public ArrayList<ComplaintsDTO> getList(int pageNumber,boolean isStudent){
		String SQL1 ="SELECT * FROM CMP_ST WHERE cmpID < ? ORDER BY cmpID DESC LIMIT 10";//available 추가해야하는 문장
		String SQL2 ="SELECT * FROM CMP_SC WHERE cmpID < ? ORDER BY cmpID DESC LIMIT 10";//available 추가해야하는 문장
		
		ArrayList<ComplaintsDTO> list =new ArrayList<ComplaintsDTO>();
		try {
			PreparedStatement pstmt;
			if(isStudent) {
				pstmt=conn.prepareStatement(SQL1);
			}
			else {
				pstmt=conn.prepareStatement(SQL2);
			}
			pstmt.setInt(1, getNext(isStudent)-(pageNumber-1)*10);
			ResultSet rs= pstmt.executeQuery();
			
			while(rs.next()) {
				ComplaintsDTO cmpDTO =new ComplaintsDTO();
				cmpDTO.setCmpID(rs.getInt(1));
				cmpDTO.setCmpTitle(rs.getString(2));
				cmpDTO.setUserID(rs.getString(3));
				cmpDTO.setCmpDate(rs.getString(4));
				cmpDTO.setCmpContent(rs.getString(5));
				cmpDTO.setCmpDivide(rs.getString(6));
				cmpDTO.setAgreeCount(rs.getInt(7));
				
				list.add(cmpDTO);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber,boolean isStudent) {
		String SQL ="SELECT * FROM CMP_ST WHERE cmpID < ?"; //AND cmpAvailable = 1 추가   
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext(isStudent)-(pageNumber-1)*10);
			ResultSet rs= pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public ComplaintsDTO getCmp(int cmpID,boolean isStudent) {
		String SQL = "SELECT * FROM CMP_SC WHERE cmpID = ?";
		if(isStudent) {
			SQL = "SELECT * FROM CMP_ST WHERE cmpID = ?";
		}
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmpID);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				ComplaintsDTO cmp = new ComplaintsDTO();
				cmp.setCmpID(rs.getInt(1));
				cmp.setCmpTitle(rs.getString(2));
				cmp.setUserID(rs.getString(3));
				cmp.setCmpDate(rs.getString(4));
				cmp.setCmpContent(rs.getString(5));
				cmp.setCmpDivide(rs.getString(6));
				cmp.setAgreeCount(rs.getInt(7));
				return cmp;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int agree(int cmpID, boolean isStudent) { 
		String SQL = "UPDATE CMP_SC SET agreeCount = agreeCount + 1 WHERE cmpID = ?";
		if(isStudent) {
			SQL = "UPDATE CMP_ST SET agreeCount = agreeCount + 1 WHERE cmpID = ?";
		}
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmpID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public int delete(int cmpID, boolean isStudent) { 
		String SQL = "DELETE FROM CMP_SC WHERE cmpID=?";
		if(isStudent) {
			SQL = "DELETE FROM CMP_ST WHERE cmpID=?";
		}
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmpID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	public String getUserID(int cmpID,boolean isStudent) {
		String SQL="SELECT userID FROM CMP_SC WHERE cmpID=?";
		if(isStudent) {
			SQL="SELECT userID FROM CMP_ST WHERE cmpID=?";
		}
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmpID);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류
	}
}