<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="email.EmailDAO"%>
<%@ page import="email.EmailDTO"%>
<%@ page import="user.UserDAO" %>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	UserDAO userDAO=new UserDAO();
	int userLevel=userDAO.getUserEmailChecked(userID);
	if (userLevel<2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='admin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	int emailID = 0;
	if (request.getParameter("emailID") != null) {
		emailID = Integer.parseInt(request.getParameter("emailID"));
	}
	EmailDAO emailDAO = new EmailDAO();
	int result=emailDAO.ban(emailID);
	if(result==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이메일 발송이 비활성화되었습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 비활성화가 되어있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
%>