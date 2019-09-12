package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.BoardDTO;
import util.DatabaseUtil;

public class BoardDAO {
	public int getNext() {
		String SQL="";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;	
		try {
			SQL = "SELECT boardID FROM board ORDER BY boardID DESC";
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
	
	public BoardDTO getBoard(int boardID){
		String SQL ="SELECT * FROM board WHERE boardID =?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		BoardDTO board =new BoardDTO();
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				board.setBoardID(rs.getInt(1));
				board.setBoardName(rs.getString(2));
				board.setBoardURL(rs.getString(3));
				return board;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return board;
	}
	
	public ArrayList<BoardDTO> getList(){
		String SQL ="SELECT * FROM board ORDER BY boardID ASC";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		ArrayList<BoardDTO> list =new ArrayList<BoardDTO>();
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO board =new BoardDTO();
				board.setBoardID(rs.getInt(1));
				board.setBoardName(rs.getString(2));
				board.setBoardURL(rs.getString(3));
				list.add(board);
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
	
	public int create(BoardDTO board) {
		String SQL = "INSERT INTO BOARD VALUES(?, ? ,?)";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,board.getBoardID());
			pstmt.setString(2,board.getBoardName());
			pstmt.setString(3,board.getBoardURL());
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
	
	public int destroy(int boardID) {
		String SQL = "DELETE FROM BOARD WHERE boardID=?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,boardID);
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
