package complaints;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DatabaseUtil;

public class ComplaintsDAO {

	public String getDate() {
		String SQL="SELECT NOW()";
		try {
			Connection conn=DatabaseUtil.getConnection();
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
}
