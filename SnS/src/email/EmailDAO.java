package email;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class EmailDAO {
	
	public int getNext() {
		String SQL="";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;	
		try {
			SQL = "SELECT emailID FROM email ORDER BY emailID DESC";
			conn=DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return -1; 
	}
	
	public EmailDTO getEmail(int emailID){
		String SQL ="SELECT * FROM email WHERE emailID =?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		EmailDTO email =new EmailDTO();
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, emailID);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				email.setEmailID(rs.getInt(1));
				email.setDivide(rs.getString(2));
				email.setEmail(rs.getString(3));
				email.setStatus(rs.getInt(4));
				return email;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return email;
	}
	
	public ArrayList<EmailDTO> getList(){
		String SQL ="SELECT * FROM email ORDER BY emailID ASC";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		ArrayList<EmailDTO> list =new ArrayList<EmailDTO>();
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				EmailDTO email =new EmailDTO();
				email.setEmailID(rs.getInt(1));
				email.setDivide(rs.getString(2));
				email.setEmail(rs.getString(3));
				email.setStatus(rs.getInt(4));
				list.add(email);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return list;
	}
	
	public int open(EmailDTO email) {
		String SQL = "INSERT INTO email VALUES(?, ?, ?, ?)";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext());
			pstmt.setString(2,email.getDivide());
			pstmt.setString(3,email.getEmail());
			pstmt.setInt(4,1);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null)conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null)pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null)rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -1;
	}
	
	public int update(EmailDTO email) {
		String SQL = "UPDATE email SET divide =?, email = ?  WHERE emailID= ?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,email.getDivide());
			pstmt.setString(2,email.getEmail());
			pstmt.setInt(3,email.getStatus());
			pstmt.setInt(4,email.getEmailID());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null)conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null)pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null)rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -1;
	}
	
	public int ban(int emailID) {
		String SQL = "UPDATE email SET status = 0 WHERE emailID= ?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,emailID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null)conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null)pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null)rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -1;
	}
	
	public int unBan(int emailID) {
		String SQL = "UPDATE email SET status = 1 WHERE emailID= ?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,emailID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null)conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null)pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null)rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -1;
	}
	
	public int delete(int emailID) {
		String SQL = "DELETE FROM email WHERE emailID=?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,emailID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null)conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null)pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null)rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -1;
	}
}
