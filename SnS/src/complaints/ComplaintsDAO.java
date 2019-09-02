package complaints;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DatabaseUtil;

public class ComplaintsDAO {

	
	
	public String getDate() {
		String SQL="SELECT NOW()";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;	
		try {
			conn=DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return "";
	}
	public int getNext(boolean isStudent) {
		String SQL="";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;	
		try {
			if(isStudent) {
				SQL = "SELECT cmpID FROM CMP_ST ORDER BY cmpID DESC";
			}
			else {
				SQL = "SELECT cmpID FROM CMP_SC ORDER BY cmpID DESC";
			}
			conn=DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			rs = pstmt.executeQuery();
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
	public int countCmp(boolean isStudent) {
		String SQL="";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;		
		if(isStudent) {
			SQL = "SELECT COUNT(*) FROM CMP_ST";
		}
		else {
			SQL = "SELECT COUNT(*) FROM CMP_SC";
		}
		try {
			conn=DatabaseUtil.getConnection();
			pstmt =conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return -1; 
	}
	
	
	public ArrayList<ComplaintsDTO> getList(int pageNumber,boolean isStudent){
		String SQL="";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		ArrayList<ComplaintsDTO> list =new ArrayList<ComplaintsDTO>();
		try {
			if(isStudent) {
				SQL ="SELECT * FROM CMP_ST WHERE cmpGroup >  (SELECT MAX(cmpGroup) FROM CMP_ST) - ? AND cmpGroup <= (SELECT MAX(cmpGroup) FROM CMP_ST) - ? AND cmpLevel=0 AND cmpAvailable=1 ORDER BY cmpGroup DESC";
			}
			else {
				SQL ="SELECT * FROM CMP_SC WHERE cmpGroup >  (SELECT MAX(cmpGroup) FROM CMP_SC) - ? AND cmpGroup <= (SELECT MAX(cmpGroup) FROM CMP_SC) - ? AND cmpLevel=0 AND cmpAvailable=1 ORDER BY cmpGroup DESC";
			}
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, pageNumber*10);
			pstmt.setInt(2, (pageNumber-1)*10);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				ComplaintsDTO cmpDTO =new ComplaintsDTO();
				cmpDTO.setCmpID(rs.getInt(1));
				cmpDTO.setCmpTitle(rs.getString(2));
				cmpDTO.setUserID(rs.getString(3));
				cmpDTO.setCmpDate(rs.getString(4));
				cmpDTO.setCmpContent(rs.getString(5));
				cmpDTO.setCmpDivide(rs.getString(6));
				cmpDTO.setAgreeCount(rs.getInt(7));
				cmpDTO.setCmpHit(rs.getInt(8));
				cmpDTO.setCmpGroup(rs.getInt(9));
				cmpDTO.setCmpSequence(rs.getInt(10));
				cmpDTO.setCmpLevel(rs.getInt(11));
				cmpDTO.setCmpAvailable(rs.getInt(12));
				list.add(cmpDTO);
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
	public ArrayList<ComplaintsDTO> getSearch(String searchType, String search, int pageNumber,boolean isStudent){
		String SQL="";
		ArrayList<ComplaintsDTO> searchList=null;
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			if(isStudent) {
				if(searchType.equals("최신순")) {
					SQL ="SELECT * FROM CMP_ST WHERE cmpGroup >  (SELECT MAX(cmpGroup) FROM CMP_ST) - ? AND cmpGroup <= (SELECT MAX(cmpGroup) FROM CMP_ST) - ?  AND CONCAT(cmpTitle,cmpContent,userID) LIKE ? AND cmpLevel=0 AND cmpAvailable=1 ORDER BY cmpGroup DESC";
				}
				else {
					SQL ="SELECT * FROM CMP_ST WHERE cmpGroup >  (SELECT MAX(cmpGroup) FROM CMP_ST) - ? AND cmpGroup <= (SELECT MAX(cmpGroup) FROM CMP_ST) - ?  AND CONCAT(cmpTitle,cmpContent,userID) LIKE ? AND cmpLevel=0 AND cmpAvailable=1 ORDER BY agreeCount DESC";
				}
			}
			else {
				if(searchType.equals("최신순")) {
					SQL ="SELECT * FROM CMP_SC WHERE cmpGroup >  (SELECT MAX(cmpGroup) FROM CMP_ST) - ? AND cmpGroup <= (SELECT MAX(cmpGroup) FROM CMP_ST) - ?  AND CONCAT(cmpTitle,cmpContent,userID) LIKE ? AND cmpLevel=0 AND cmpAvailable=1 ORDER BY cmpGroup DESC";
				}
				else {
					SQL ="SELECT * FROM CMP_SC WHERE cmpGroup >  (SELECT MAX(cmpGroup) FROM CMP_ST) - ? AND cmpGroup <= (SELECT MAX(cmpGroup) FROM CMP_ST) - ?  AND CONCAT(cmpTitle,cmpContent,userID) LIKE ? AND cmpLevel=0 AND cmpAvailable=1 ORDER BY agreeCount DESC";
				}
			}
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, pageNumber*200);
			pstmt.setInt(2, (pageNumber-1)*200);
			pstmt.setString(3, "%" + search + "%");
			rs=pstmt.executeQuery();
			searchList= new ArrayList<ComplaintsDTO>();
			while(rs.next()) {
				ComplaintsDTO cmpDTO= new ComplaintsDTO();
				cmpDTO.setCmpID(rs.getInt(1));
				cmpDTO.setCmpTitle(rs.getString(2));
				cmpDTO.setUserID(rs.getString(3));
				cmpDTO.setCmpDate(rs.getString(4));
				cmpDTO.setCmpContent(rs.getString(5));
				cmpDTO.setCmpDivide(rs.getString(6));
				cmpDTO.setAgreeCount(rs.getInt(7));
				cmpDTO.setCmpHit(rs.getInt(8));
				cmpDTO.setCmpGroup(rs.getInt(9));
				cmpDTO.setCmpSequence(rs.getInt(10));
				cmpDTO.setCmpLevel(rs.getInt(11));
				cmpDTO.setCmpAvailable(rs.getInt(12));
				searchList.add(cmpDTO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return searchList;
	}
	public ArrayList<ComplaintsDTO> getReply(int cmpGroup,boolean isStudent){
		String SQL="";
		ArrayList<ComplaintsDTO> list=null;
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
	
		list =new ArrayList<ComplaintsDTO>();
		try {
			if(isStudent) {
				SQL ="SELECT * FROM CMP_ST WHERE cmpGroup = ? AND cmpLevel != 0 AND cmpAvailable=1 ORDER BY cmpSequence ASC";
			}
			else {
				SQL ="SELECT * FROM CMP_SC WHERE cmpGroup = ? AND cmpLevel != 0 AND cmpAvailable=1 ORDER BY cmpSequence ASC";
			}
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, cmpGroup);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				ComplaintsDTO cmpDTO =new ComplaintsDTO();
				cmpDTO.setCmpID(rs.getInt(1));
				cmpDTO.setCmpTitle(rs.getString(2));
				cmpDTO.setUserID(rs.getString(3));
				cmpDTO.setCmpDate(rs.getString(4));
				cmpDTO.setCmpContent(rs.getString(5));
				cmpDTO.setCmpDivide(rs.getString(6));
				cmpDTO.setAgreeCount(rs.getInt(7));
				cmpDTO.setCmpHit(rs.getInt(8));
				cmpDTO.setCmpGroup(rs.getInt(9));
				cmpDTO.setCmpSequence(rs.getInt(10));
				cmpDTO.setCmpLevel(rs.getInt(11));
				cmpDTO.setCmpAvailable(rs.getInt(12));
				list.add(cmpDTO);
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
	public boolean nextPage(int pageNumber,boolean isStudent) {
		String SQL="";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			if(isStudent) {
				SQL ="SELECT * FROM CMP_ST WHERE cmpGroup >= ? AND cmpAvailable=1";
			}
			else {
				SQL ="SELECT * FROM CMP_SC WHERE cmpGroup >= ? AND cmpAvailable=1";
			}
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, pageNumber*10);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return false;
	}
	public int targetPage(int pageNumber,boolean isStudent) {
		String SQL="";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			if(isStudent) {
				SQL ="SELECT COUNT(cmpGroup) FROM CMP_ST WHERE cmpGroup > ?";
			}
			else {
				SQL ="SELECT COUNT(cmpGroup) FROM CMP_SC WHERE cmpGroup > ?";
			}
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, (pageNumber-1)*10);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)/10;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return 0;
	}
	public ComplaintsDTO getCmp(int cmpID,boolean isStudent) {
		String SQL="";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			if(isStudent) {
				SQL = "SELECT * FROM CMP_ST WHERE cmpID = ?";
			}
			else {
				SQL = "SELECT * FROM CMP_SC WHERE cmpID = ?";
			}
			conn=DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmpID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ComplaintsDTO cmp = new ComplaintsDTO();
				cmp.setCmpID(rs.getInt(1));
				cmp.setCmpTitle(rs.getString(2).replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>"));
				cmp.setUserID(rs.getString(3));
				cmp.setCmpDate(rs.getString(4));
				cmp.setCmpContent(rs.getString(5).replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>"));
				cmp.setCmpDivide(rs.getString(6));
				cmp.setAgreeCount(rs.getInt(7));
				cmp.setCmpHit(rs.getInt(8));
				cmp.setCmpGroup(rs.getInt(9));
				cmp.setCmpSequence(rs.getInt(10));
				cmp.setCmpLevel(rs.getInt(11));
				cmp.setCmpAvailable(rs.getInt(12));
				return cmp;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return null;
	}
	public int agree(int cmpID, boolean isStudent) { 
		String SQL="";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			if(isStudent) {
				SQL = "UPDATE CMP_ST SET agreeCount = agreeCount + 1 WHERE cmpID = ?";
			}
			else {
				SQL = "UPDATE CMP_SC SET agreeCount = agreeCount + 1 WHERE cmpID = ?";
			}
			conn=DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmpID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return -1; //데이터베이스 오류
	}
	public static int hit(int cmpID,boolean isStudent) {
		String SQL="";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			if(isStudent) {
				SQL ="UPDATE CMP_ST SET cmpHit = cmpHit + 1 WHERE cmpID=?";
			}
			else {
				SQL ="UPDATE CMP_SC SET cmpHit = cmpHit + 1 WHERE cmpID=?";
			}
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,cmpID);
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
	public int write(ComplaintsDTO complaintsDTO, boolean isStudent) {
		String SQL="";
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			if(isStudent) {
				SQL ="INSERT INTO CMP_ST VALUES(NULL, ?, ?, ?, ?, ?, 0,0,IFNULL((SELECT MAX(cmpGroup)+1 FROM CMP_ST a),0),0,0,1)";
			}
			else {
				SQL ="INSERT INTO CMP_SC VALUES(NULL, ?, ?, ?, ?, ?, 0,0,IFNULL((SELECT MAX(cmpGroup)+1 FROM CMP_SC a),0),0,0,1)";
			}
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
	public int update(int cmpID, String cmpTitle, String cmpContent,boolean isStudent) {
		String SQL="";
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			if(isStudent) {
				SQL = "UPDATE CMP_ST SET cmpTitle = ?, cmpContent = ? WHERE cmpID = ?";
			}
			else {
				SQL = "UPDATE CMP_SC SET cmpTitle = ?, cmpContent = ? WHERE cmpID = ?";
			}
			conn=DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cmpTitle);
			pstmt.setString(2, cmpContent);
			pstmt.setInt(3, cmpID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return -1; //데이터베이스 오류
	}
	public int delete(int cmpID, boolean isStudent) { 
		String SQL="";
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			if(isStudent) {
				SQL = "UPDATE CMP_ST SET cmpAvailable =0 WHERE cmpID=?";
			}
			else {
				SQL = "UPDATE CMP_SC SET cmpAvailable =0 WHERE cmpID=?";
			}
			conn=DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmpID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return -1; //데이터베이스 오류
	}
	public int reply(ComplaintsDTO complaintsDTO,ComplaintsDTO parent, boolean isStudent) {
		String SQL="";
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			if(isStudent) {
				SQL ="INSERT INTO CMP_ST VALUES(NULL, ?, ?, ?, ?, ?, 0,0,?,?,?,1)";
			}
			else {
				SQL ="INSERT INTO CMP_SC VALUES(NULL, ?, ?, ?, ?, ?, 0,0,?,?,?,1)";
			}
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,complaintsDTO.getCmpTitle());
			pstmt.setString(2,complaintsDTO.getUserID());
			pstmt.setString(3,getDate());
			pstmt.setString(4,complaintsDTO.getCmpContent());
			pstmt.setString(5,complaintsDTO.getCmpDivide());
			pstmt.setInt(6,parent.getCmpGroup());
			pstmt.setInt(7,parent.getCmpSequence()+1);
			pstmt.setInt(8,parent.getCmpLevel()+1);
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
	public int replyUpdate(ComplaintsDTO parent,boolean isStudent) {
		String SQL="";
		Connection conn =null;
		PreparedStatement pstmt=null;
		try {
			if(isStudent) {
				SQL = "UPDATE CMP_ST SET cmpSequence = cmpSequence + 1 WHERE cmpGroup = ? AND cmpSequence > ?";
			}
			else {
				SQL = "UPDATE CMP_SC SET cmpSequence = cmpSequence + 1 WHERE cmpGroup = ? AND cmpSequence > ?";
			}
			conn=DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, parent.getCmpGroup());
			pstmt.setInt(2, parent.getCmpSequence());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}	
		}
		return -1; //데이터베이스 오류
	}
	public String getUserID(int cmpID,boolean isStudent) {
		String SQL="";
		Connection conn =null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			if(isStudent) {
				SQL="SELECT userID FROM CMP_ST WHERE cmpID=?";
			}
			else {
				SQL="SELECT userID FROM CMP_SC WHERE cmpID=?";
			}
			conn=DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, cmpID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return null; //데이터베이스 오류
	}
}