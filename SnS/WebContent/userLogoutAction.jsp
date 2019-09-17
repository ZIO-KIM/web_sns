<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
	session.invalidate();
	String nextURL="index.jsp"; 
	if(request.getParameter("nextURL")!=null){
		nextURL=request.getParameter("nextURL");
	}
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("location.href=document.referrer");
	script.println("</script>");
	script.close();
	return;
%>