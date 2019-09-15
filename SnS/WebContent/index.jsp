<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="complaints.ComplaintsDTO" %>
<%@ page import="complaints.ComplaintsDAO" %>
<%@ page import="post.PostDAO" %>
<%@ page import="post.PostDTO" %>
<%@ page import="page.PageDAO" %>
<%@ page import="page.PageDTO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr"><!-- lastbranch test -->
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>세종대학교 소프트웨어융합대학</title>
    <% PageDAO pageDAO= new PageDAO(); %>
    <link rel="shortcut icon" type="image/x-icon" href="<%=pageDAO.getPageImage()%>">
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&disp
    lay=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="css/mainpage.css">
 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/Backstretch.js" type="text/javascript"></script>
    <script src="js/mainpage.js"></script>
    
  </head>
  <body>
  
  <%
     String userID =null;
     if(session.getAttribute("userID")!=null){
        userID=(String)session.getAttribute("userID");  
     }
     PostDAO postDAO = new PostDAO();
     ComplaintsDAO cmpDAO = new ComplaintsDAO();
	
  %>  
    <script>
      $.backstretch(["imgs/drop_7.jpg"],
         {duration: 20, fade: 900});
      $(window).on("backstretch.before", function (e, instance, index) {
         // If we wanted to stop the slideshow after it reached the end
         if (index === instance.images.length - 1) {
           instance.pause();
         };
       });
    </script>

    <header>
      <nav class="navbar navbar-default" style="background:none;border:none;font-size:22px;margin:0 1%; padding:2%; color:#000000;">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a  class="navbar-brand logobox" href='index.jsp'>
         <img style="width:60px;"src="<%=pageDAO.getPageLogo() %>" alt="소융대 로고">
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="post.jsp?boardID=1" style="font-size: 20px;">공지사항</a></li>
        <li><a href="student_council_photo.jsp" style="font-size: 20px;">갤러리</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">학생회 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a class="dropdownLi" href='student_council_introduce.jsp'>학생회 소개</a></li>
            <li><a class="dropdownLi" href='student_council_photo.jsp'>갤러리</a></li>
            <li><a class="dropdownLi" href='post.jsp?boardID=2'>행사</a></li>
            <li><a class="dropdownLi" href='post.jsp?boardID=3'>학생회비 내역</a></li>
            <li><a class="dropdownLi" href='departments.jsp'>과별 게시판</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">민원 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a class="dropdownLi" href='cmp_to_student_council.jsp'>학생회 건의사항</a></li>
         <li><a class="dropdownLi" href='cmp_to_school.jsp'>학교 건의사항</a></li>
         <li><a class="dropdownLi" href='introduce_cmp.jsp'>민원창구 소개</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">예비소융인 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a class="dropdownLi" href='post.jsp?boardID=18'>선배들의 입시 후기</a></li>
         <li><a class="dropdownLi" href='post.jsp?boardID=19'>QnA</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">취업 &amp; 졸업 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a class="dropdownLi" href='post.jsp?boardID=20'>취창업 후기</a></li>
         <li><a class="dropdownLi" href='post.jsp?boardID=21'>졸업생 인터뷰</a></li>
         <li><a class="dropdownLi" href='post.jsp?boardID=22'>졸업생 QnA</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">홍보 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a class="dropdownLi" href='post.jsp?boardID=24'>교내 공모전</a></li>
         <li><a class="dropdownLi" href='post.jsp?boardID=25'>교외 공모전</a></li>
          </ul>
        </li>
        <li><a href='post.jsp?boardID=27' style="font-size: 20px;">열린 광장</a><br></li>
        <li><a href='chatbot.jsp' style="font-size: 20px;">Chatbot</a><br></li>
      </ul>
      <ul class="nav navbar-nav navbar-right" id="navbar-right">
        <li><a href="index.jsp" style="font-size: 18px;">KR</a> / <a href="index_en.jsp" style="font-size: 18px;">EN</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="font-size: 18px;">접속관리 <span class="caret"></span></a>
          <ul class="dropdown-menu">
         <%
            if (userID == null) {
         %>
            <li><a class="dropdownLi" data-toggle="modal" href="#modal-login" style="font-size: 18px;">로그인</a></li>
         <%
            } else {
         %>
            <li><a class="dropdownLi" href="myPage.jsp" style="font-size: 18px;">내 프로필</a></li>
            <li role="separator" class="divider"></li>
            <li><a class="dropdownLi" href="userLogoutAction.jsp" style="font-size: 18px;">로그아웃</a></li>
         <%
            }
         %>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
    </header>

   <%
      String messageContent = null;
      if(session.getAttribute("messageContent")!=null){
         messageContent=(String)session.getAttribute("messageContent");
      }
      String messageType = null;
      if(session.getAttribute("messageType")!=null){
         messageType=(String)session.getAttribute("messageType");
      }
      if(messageContent != null){
   %>
      <div id="messageModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
         <div class="vertical-alignment-helper">
            <div class="modal-dialog vertical-align-center">
               <div class="modal-content" <%if(messageType.equals("오류 메시지")) out.println("panel-warning");else out.println("panel-success"); %>>
                  <div class="modal-header panel-heading">
                     <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                     </button>
                     <h4 class="modal-title">
                        <%=messageType %>
                     </h4>
                  </div>
                  <div class="modal-body">
                     <%=messageContent %>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <script>
         $('#messageModal').modal("show");
      </script>
   <%
      session.removeAttribute("messageContent");
      session.removeAttribute("messageType");
      }
   %>

   <div id="modal-login" class="modal fade">
         <div class="modal-dialog modal-sm">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"
                     aria-hidden="true">×</button>
                  <h4 class="modal-title">로그인</h4>
               </div>
               <script>
                  $(document).ready(function(){
                     $('btnLogin').click(function(){
                        var action = $('#frmLogin').attr("action");
                        var form_data={
                              user_id:$('#userID').val(),
                              user_pw:$('#userPassword').val()
                        };
                        $.ajax({
                           type:"POST",
                           url:action,
                           data:form_data,
                           success:function(response){
                              if(response.trim()=="success"){
                              sessionStorage.setItem("user_id",form_data.user_id);
                              $('#msg').html("<p style='color:green;font-weight:bold'>로그인 성공!</p>");
                           }else{
                              $('#msg').html("<p style='color:red'>아이디 또는 비밀번호가 잘못되었습니다.</p>");
                           }
                        },
                        error:function(){
                           $('#msg'),html("<h2>Error</h2>");
                        }
                        });
                     });
                  });
               </script>
               <div class="modal-body">
                  <form action="userLoginAction.jsp" id="frmLogin" method="post">
                     <div class="form-group">
                        <input type="text" name="userID" id="uid" value=""
                           placeholder="아이디" class="form-control" required="">
                     </div>
                     <div class="form-group">
                        <input type="password" name="userPassword" id="upw" value=""
                           placeholder="비밀번호" class="form-control" required="">
                     </div>
                     <div class="checkbox">
                        <label for="keep_signed"
                           onclick="jQuery('#modal-login input[name=\'keep_signed\']').click();"><input
                           type="checkbox" name="keep_signed" value="Y"
                           onclick="if(this.checked) return confirm('브라우저를 닫더라도 로그인이 계속 유지될 수 있습니다.\n\n로그인 유지 기능을 사용할 경우 다음 접속부터는 로그인할 필요가 없습니다.\n\n단, 게임방, 학교 등 공공장소에서 이용 시 개인정보가 유출될 수 있으니 꼭 로그아웃을 해주세요.');">
                           로그인 유지</label>
                     </div>
                     <button type="submit" id="btnLogin" class="btn btn-block">
                        <i class="fa fa-sign-in" aria-hidden="true"></i> 로그인
                     </button>
                     <br>
                  </form>
               </div>
               <div class="modal-footer">
                  <div class="btn-group btn-group-justified">
                     <a
                        href="userJoin.jsp"
                        class="btn btn-default btn-sm"><i class="fa fa-user-plus"
                        aria-hidden="true"></i> 회원가입</a> <a
                        href="findAccount.jsp"
                        class="btn btn-default btn-sm"><i
                        class="fa fa-question-circle" aria-hidden="true"></i> ID/PW 찾기</a>

                  </div>
               </div>
            </div>
         </div>
      </div>

    <nav id='title_animation' class="title">
      <h1 id='title' class="title_mq">College of<br>Software &amp; Convergence Technology</h1>
      <h3 id='subtitle' class="subtitle_mq">소프트웨어 사회의 주역이 될 인재 양성</h3>
    </nav>
    
    
    <div id='all_boards' class="container-fluid">
       <div id="notice" class="col-md-4">
            <h2><a href='#' id='Notice'>공지사항</a></h2>
            <br>
            <table class="table table-hover">
            <%
         	   ArrayList<PostDTO> notice= null;
				notice = postDAO.getList(1, 1);
				for (int i = 0; i < notice.size(); i++) {
			%>
			<tr>
				<td><%=notice.get(i).getPostID() %></td>
				<td><a id="Notice" href="post_View.jsp?boardID=<%=1 %>&postID=<%=notice.get(i).getPostID()%>"
					style="text-decoration: none"><%=notice.get(i).getPostTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></a></td>
				<td><%=notice.get(i).getPostDate().substring(0,11)+notice.get(i).getPostDate().substring(11,13)+"시"+notice.get(i).getPostDate().substring(14,16)+"분" %></td>
			</tr>
			<%
				}
			%>
			</table>
       </div>

       <div id="promotion" class="col-md-4">
            <h2><a href='#' id='"promotion"'>홍보게시판</a></h2>
            <br>
            <table class="table table-hover">
            <%
          	  ArrayList<PostDTO> promotion= null;
				promotion = postDAO.getList(24, 1);
				for (int i = 0; i < promotion.size(); i++) {
			%>
			<tr>
				<td><%=promotion.get(i).getPostID() %></td>
				<td><a id="promotion" href="post_View.jsp?boardID=<%=24 %>&postID=<%=promotion.get(i).getPostID()%>"
					style="text-decoration: none"><%=promotion.get(i).getPostTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></a></td>
				<td><%=promotion.get(i).getPostDate().substring(0,11)+promotion.get(i).getPostDate().substring(11,13)+"시"+promotion.get(i).getPostDate().substring(14,16)+"분" %></td>
			</tr>
			<%
				}
			%>
			</table>
       </div>
    
       <div id="claim" class="col-md-4">
            <h2><a href='#' id='"claim"'>민원게시판</a></h2>
            <br>
            <table class="table table-hover">
            <%
          	  ArrayList<ComplaintsDTO> complain= null;
         	   complain = cmpDAO.getList(1, 1);
				for (int i = 0; i < complain.size(); i++) {
			%>
			<tr>
				<td><%=complain.get(i).getCmpID() %></td>
				<td><a id="claim" href="cmp_View.jsp?isStudent=<%=1 %>&cmpID=<%=complain.get(i).getCmpID()%>"
					style="text-decoration: none"><%=complain.get(i).getCmpTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></a></td>
				<td><%=complain.get(i).getCmpDate().substring(0,11)+complain.get(i).getCmpDate().substring(11,13)+"시"+complain.get(i).getCmpDate().substring(14,16)+"분" %></td>
			</tr>
			<%
				}
			%>
			</table>
       </div>

       <div id="departments">
            <h2><a href='departments.jsp' id='Departments'>과별 게시판</a></h2>
            <a href='computer_science.jsp' id='Departments'>컴퓨터공학과</a><br/>
            <a href='software.jsp' id='Departments'>소프트웨어학과</a><br/>
            <a href='data_science.jsp' id='Departments'>데이터사이언스학과</a><br/>
            <a href='information_security.jsp' id='Departments'>정보보호학과</a><br/>
            <a href='intelligent_mechanics_engineering.jsp' id='Departments'>지능기전공학부</a><br/>
            <a href='cartoon_animation.jsp' id='Departments'>만화애니메이션텍</a><br/>
            <a href='design_innovation.jsp' id='Departments'>디자인이노베이션학과</a><br/>
       </div>
    </div>

   <div id='table_responsive'>
       <table>
            <tr>
              <td>Quick Menu</td>
              <td><a href='http://www.sejong.ac.kr/' id='quick_menu'>세종대학교</a></td>
              <td><a href='http://www.sejongstudent.com/xe/' id='quick_menu'>세종대학교<br>총학생회</a></td>
              <td><a href='https://ko-kr.facebook.com/sejong1sc/' id='quick_menu'>세종소융<br>페이스북</a></td>
              <td><a href='https://www.facebook.com/sejongstudent/' id='quick_menu'>세종대학교<br>총학생회 페이스북</a></td>
            </tr>
       </table>
    </div>
    
    <footer>
         <p id='footer_content'> 010-0000-0000 | sejongsc3@gmail.com | 학생회관 409호 <br>
         COPYRIGHT &copy 2019 세종대학교 소프트웨어융합대학 데단한 사람들 All rights reserved.</p>
    </footer>

  </body>
</html>