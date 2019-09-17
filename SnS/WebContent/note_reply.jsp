<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="complaints.ComplaintsDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="page.PageDAO" %>
<%@ page import="note.NoteDAO" %>
<%@ page import="note.NoteDTO" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>세종대학교 소프트웨어융합대학 :: 쪽지 답장 </title>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/13inch_board_PSB.css">
    <link rel="stylesheet" href="css/light-bootstrap-dashboard.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <meta name="viewport" content="device-width, initial-scale=1">
  </head>
  <body>
  
	<%
		String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		if(userID==null){
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("history.back()");
			script.println("</script>"); 
			script.close();
		}
		int noteID=0;
		if(request.getParameter("noteID")!=null){
			noteID=Integer.parseInt(request.getParameter("noteID")); 
		}
		NoteDAO noteDAO =new NoteDAO();
		NoteDTO note = noteDAO.getNote(noteID);
		UserDAO userDAO = new UserDAO();
		String to = note.getFromID();
		String from = note.getToID();
		if(!from.equals(userID)){
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('접근할 수 없습니다.')");
			script.println("history.back()");
			script.println("</script>"); 
			script.close();
		}
	%>
	
	<div class="modal" id="noteModal" tabindex="-1" role="dialog" aria-labelledby="noteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 id="noteModalLabel"><span class="modal-title" style="font-weight:bold;"><%=userDAO.getUser(to).getUserName() %></span>에게 쪽지 쓰기</h4>
      </div>
      <form action="./note" method="post">
      <div class="modal-body">
        	<input type="hidden" class="form-control" name="fromID" value="<%=from %>">
        	<input type="hidden" class="form-control" name="toID" value="<%=to %>">
          <div class="form-group">
            <label for="message-text" class="control-label">제목:</label>
            <textarea class="form-control" name="noteTitle"></textarea>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">내용:</label>
            <textarea class="form-control" name="noteContent"></textarea>
          </div>
          <script>
		  $('#noteModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) 
		  var recipient = button.data('whatever') 
		  var modal = $(this)
		  modal.find('.modal-title').text(recipient)
		})
 		 </script>
      </div>
      <div class="modal-footer">
        <a type="button" href="myPage.jsp" type="button" class="btn btn-default">닫기</a>
        <button type="submit" class="btn btn-primary">보내기</button>
      </div>
      </form>
    </div>
  </div>
</div>

	<script>
		$('#noteModal').modal("show");
	</script>

  </body>
</html>
