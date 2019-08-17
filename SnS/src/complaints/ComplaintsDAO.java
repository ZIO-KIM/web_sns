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
	public int getNext() { 
		String SQL = "SELECT cmpID FROM CMP_ST ORDER BY cmpID DESC";
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
	
	public int write(ComplaintsDTO complaintsDTO) {
		String SQL ="INSERT INTO CMP_ST VALUES(NULL, ?, ?, ?, ?, ?, 0)";
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
	
	public ArrayList<ComplaintsDTO> getList(int pageNumber){
		String SQL ="SELECT * FROM CMP_ST WHERE cmpID < ? ORDER BY cmpID DESC LIMIT 10";//available 추가해야하는 문장
		ArrayList<ComplaintsDTO> list =new ArrayList<ComplaintsDTO>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			ResultSet rs= pstmt.executeQuery();
			
			while(rs.next()) {
				ComplaintsDTO cmpDTO =new ComplaintsDTO();
				cmpDTO.setCmpID(rs.getInt(1));
				cmpDTO.setCmpTitle(rs.getString(2));
				cmpDTO.setCmpContent(rs.getString(3));
				cmpDTO.setCmpDate(rs.getString(4));
				cmpDTO.setLikeCount(rs.getInt(5));
				cmpDTO.setUserID(rs.getString(6));
				list.add(cmpDTO);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber) {
		String SQL ="SELECT * FROM CMP_ST WHERE cmpID < ?"; //AND cmpAvailable = 1 추가   
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			ResultSet rs= pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public ComplaintsDTO getCmp(int cmpID) {

		String SQL = "SELECT * FROM CMP_ST WHERE cmpID = ?";

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
				cmp.setLikeCount(rs.getInt(7));
				return cmp;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}