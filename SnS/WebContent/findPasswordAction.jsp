<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="user.UserDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="util.Gmail"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="page.PageDAO" %>
<%
	UserDAO userDAO =new UserDAO();
	String userID =null;
	if(request.getParameter("userID")!=null){
		userID=request.getParameter("userID");
	}
	if(userID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디을 입력해주세요.')");
		script.println("location.href='findAccount.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	String userEmail =null;
	if(request.getParameter("userEmail")!=null){
		userEmail=request.getParameter("userEmail");
	}
	if(userEmail==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이메일을 입력해주세요.')");
		script.println("location.href='findAccount.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	String findPwQuestion =null;
	if(request.getParameter("findPwQuestion")!=null){
		findPwQuestion=request.getParameter("findPwQuestion");
	}
	if(findPwQuestion==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('질문을 선택해주세요.')");
		script.println("location.href='findAccount.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	String findPwAnswer =null;
	if(request.getParameter("findPwAnswer")!=null){
		findPwAnswer=request.getParameter("findPwAnswer");
	}
	if(findPwAnswer==null || findPwAnswer.equals("")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('답변을 입력해주세요.')");
		script.println("location.href='findAccount.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	String host="http://sejongsc.org/SnS/";
	String from="sjswsns@gmail.com";
	String to=userEmail.split("@")[0]+"@sju.ac.kr";
	String temporary=userDAO.getRamdomPassword(6);
	String subject ="[세종소융]임시비밀번호 발급";
	String content ="[세종소융]임시비밀번호 발급<br><br>"+temporary;
	
	userDAO.setUserPassword(temporary, userID);
	
	Properties p = new Properties();
	p.put("mail.smtp.user",from);
	p.put("mail.smtp.host","smtp.googlemail.com");
	p.put("mail.smtp.port","465");
	p.put("mail.smtp.starttls.enable","true");
	p.put("mail.smtp.auth","true");
	p.put("mail.smtp.debug","true");
	p.put("mail.smtp.socketFactory.port","465");
	p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback","false");
	
	try{
		Authenticator auth =new Gmail();
		Session ses=Session.getInstance(p,auth);
		ses.setDebug(true);
		MimeMessage msg=new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr=new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO,toAddr);
		msg.setContent(content,"text/html;charset=UTF8");
		Transport.send(msg);
	}catch(Exception e){
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	PageDAO pageDAO = new PageDAO();
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 메일로 전송되었습니다.')");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	
%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>세종대학교 소프트웨어융합대학 :: 비밀번호찾기</title>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/PSB.css">
    <link rel="stylesheet" href="login_page.css">
    <link rel="stylesheet" href="bootstrap.css">
  </head>
  <body>
  </body>
</html>
