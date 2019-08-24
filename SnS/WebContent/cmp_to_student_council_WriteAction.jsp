<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="complaints.ComplaintsDAO"%>
<%@ page import="complaints.ComplaintsDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
   request.setCharacterEncoding("UTF-8");
   String userID = null;
 	if(session.getAttribute("userID")!=null){
 		userID=(String)session.getAttribute("userID");
 	}
   if(userID==null){
      PrintWriter script =response.getWriter();
      script.println("<script>");
      script.println("alert('로그인을 해주세요.');");
      script.println("location.href='userLogin.jsp';");
      script.println("</script>");
      script.close();
      return;
   }
   
   String cmpTitle=null;
   String cmpContent=null;
   String cmpDivide=null;
   String cmpDate=null;

   if(request.getParameter("cmpTitle")!=null){
      cmpTitle=request.getParameter("cmpTitle");
   }
   if(request.getParameter("cmpContent")!=null){
      cmpContent=request.getParameter("cmpContent");
   }
   if(request.getParameter("cmpDivide")!=null){
      cmpDivide=request.getParameter("cmpDivide");
   }
   if(request.getParameter("cmpDate")!=null){
      cmpDate=request.getParameter("cmpDate");
   }
   if(cmpTitle==null ||cmpContent==null ||cmpDivide==null  ||cmpTitle.equals("")||cmpContent.equals("")){
      PrintWriter script =response.getWriter();
      script.println("<script>");
      script.println("alert('입력이 안 된 사항이 있습니다..');");
      script.println("history.back();");
      script.println("</script>");
      script.close();
      return;
   }
   ComplaintsDAO complaintsDAO =new ComplaintsDAO();
   int result=complaintsDAO.write(new ComplaintsDTO(0, cmpTitle,userID,cmpContent,cmpDivide,cmpDate,0),true);
   
   if(result==-1){
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('민원 등록 실패했습니다.');");
      script.println("history.back();");
      script.println("</script>");
      script.close();
      return;
   } else{
      PrintWriter script =response.getWriter();
      script.println("<script>");
      script.println("location.href='cmp_to_student_council.jsp'");
      script.println("</script>");
      script.close();
      return;
   }
%>