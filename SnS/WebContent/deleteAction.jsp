<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="complaints.ComplaintsDAO" %>
<%@ page import="post.PostDAO" %>
<%@ page import="agree.AgreeDTO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	request.setCharacterEncoding("UTF-8");
	int isStudent = -1;
	if (request.getParameter("isStudent") != null) {
		isStudent = Integer.parseInt(request.getParameter("isStudent"));
	}
	int cmpID=0;
	if (request.getParameter("cmpID") != null) {
		cmpID = Integer.parseInt(request.getParameter("cmpID"));
	}
	int boardID = 0;
	if (request.getParameter("boardID") != null) {
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	int postID=0;
	if (request.getParameter("postID") != null) {
		postID = Integer.parseInt(request.getParameter("postID"));
	}
	ComplaintsDAO cmpDAO=new ComplaintsDAO();
	PostDAO postDAO=new PostDAO();
	
	if(boardID==0){
		if (userID.equals(cmpDAO.getUserID(cmpID,isStudent))) {
			int result=new ComplaintsDAO().delete(cmpID, isStudent);
			if(result==1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제가 완료되었습니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
				return;
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류가 발생하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
				return;
			}
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}
	}else{
		if (userID.equals(postDAO.getUserID(postID,boardID))) {
			int result=new PostDAO().delete(postID, boardID);
			if(result==1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제가 완료되었습니다.')");
				script.println("location.href=document.referrer");
				script.println("</script>");
				script.close();
				return;
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류가 발생하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
				return;
			}
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}
	}
	
	
%>