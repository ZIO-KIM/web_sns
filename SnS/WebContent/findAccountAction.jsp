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
	if(session.getAttribute("userID")!=null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 되어있습니다.')");
		script.println("location.href='index.jsp';");
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
	
	String host="http://sejongsc.org/SnS/";
	String from="sjswsns@gmail.com";
	String findID=userDAO.getUserID(userEmail);
	String to=userEmail.split("@")[0]+"@sju.ac.kr";
	String subject ="[세종소융]아이디 찾기";
	String content ="[세종소융]아이디 찾기<br><br>"+userDAO.getUserID(userEmail);
	
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
	script.println("alert('회원님의 아이디가 이메일로 전송되었습니다.')");
	script.println("location.href=document.referrer");
	script.println("</script>");
	script.close();
%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>세종대학교 소프트웨어융합대학 :: 로그인</title>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/PSB.css">
    <link rel="stylesheet" href="login_page.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
  </head>
  <body>
    

    
  </body>
</html>
