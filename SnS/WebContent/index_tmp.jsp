<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="post.PostDAO" %>
<%@ page import="post.PostDTO" %>
<%@ page import="page.PageDAO" %>
<%@ page import="page.PageDTO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
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
  
      <nav id='first_area'>
  
        <a href= 'index.jsp'><img src="<%=pageDAO.getPageLogo() %>" id='logo' alt="소융대 로고"></a> <!-- 소융대 로고 -->
    
        <div class="menubar">
          <ul> <!-- 사이트 타이틀 하단 메뉴바 -->
          	<li><a href='post.jsp?boardID=1'>공지사항</a></li>
            <li>학생회 <!-- 메뉴바 첫번째 - 학생회 카테고리 -->
              <ul id='submenu'>
                <li><a href='student_council_introduce.jsp'>학생회 소개</a></li>
                <li><a href='student_council_photo.jsp'>갤러리</a></li>
                <li><a href='post.jsp?boardID=2'>행사</a></li>
                <li><a href='post.jsp?boardID=3'>학생회비 내역</a></li>
                <li><a href='departments.jsp'>과별 게시판</a></li>
              </ul>
            </li>

            <li>민원 <!-- 메뉴바 두번째 - 민원 카테고리 -->
              <ul id='submenu'>
                <li><a href='cmp_to_student_council.jsp'>학생회 건의사항</a></li>
                <li><a href='cmp_to_school.jsp'>학교 건의사항</a></li>
                <li><a href='introduce_cmp.jsp'>민원창구 소개</a></li>
              </ul>
            </li>

            <li>예비 소융인 <!-- 메뉴바 세번째 - 예비 소융인 카테고리 -->
              <ul id='submenu'>
                <li><a href='post.jsp?boardID=18'>선배들의 입시 후기</a></li>
                <li><a href='post.jsp?boardID=19'>QnA</a></li>
              </ul>
            </li>

            <li>취업&amp;졸업 <!-- 메뉴바 네번째 - 취업&졸업 카테고리 -->
              <ul id='submenu'>
                <li><a href='post.jsp?boardID=20'>취창업 후기</a><br></li>
                <li><a href='post.jsp?boardID=21'>졸업생 인터뷰</a><br></li>
                <li><a href='post.jsp?boardID=22'>졸업생 QnA</a><br></li>
              </ul>
            </li>

            <li>홍보 <!-- 메뉴바 다섯번째 - 홍보 카테고리 -->
              <ul id='submenu'>
                <li><a href='post.jsp?boardID=24'>교내 공모전</a><br></li>
                <li><a href='post.jsp?boardID=25'>교외 공모전</a><br></li>
              </ul>
            </li>

            <li>QnA <!-- 메뉴바 여섯번째 - QnA 카테고리 -->
              <ul id='submenu'>
                <li><a href='chatbot.jsp'>Chatbot</a><br></li>
                <li><a href='post.jsp?boardID=27'>열린게시판</a><br></li>
              </ul>
            </li>
		</ul>
      </div>
        
		<div id='language'>
        	<h1 id='language_content'><a href="index.jsp">한국어</a> / <a href="index_en.jsp">EN</a> </h1> <!--영어, 한글 버전 바꾸는 버튼-->
        </div>
        
        <div id='login'>

        <%
				if (userID == null) {
			%>
			<h2 id='login_content'>
				<a data-toggle="modal" href="#modal-login" style="text-decoration: none; color: #000000">LOGIN</a>
			</h2>
			<%
				} else {
			%>
			<h2 id='logout_content'>
				<a href="userLogoutAction.jsp"
					style="text-decoration: none; color: #000000">LOGOUT</a>
			</h2>
			<%
				}
			%>
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

    <nav id='title_animation'>
      <h1 id='title'>College of<br>Software &amp; Convergence Technology</h1>
      <h3 id='subtitle'>소프트웨어 사회의 주역이 될 인재 양성</h3>
    </nav>
    
    
    <div id='all_boards'>
       <div id="notice">
            <h2><a href='#' id='Notice'>공지사항</a></h2>
            <br/> 
            <a href='#' id='Notice'>공지사항 최근 글</a> <!-- 링크만 남기고 글 지울 것 -->
       </div>

       <div id="promotion">
            <h2><a href='#' id='Promotion'>홍보 게시판</a></h2>
            <br/>
            <a href='#' id='Promotion'>홍보 게시판 최근 글</a> <!-- 링크만 남기고 글 지울 것 -->
       </div>
    
       <div id="claim">
            <h2><a href='#' id='Claims'>민원 게시판</a></h2>
            <br/>
            <a href='#' id='Claims'>민원 게시판 최근 글</a> <!-- 링크만 남기고 글 지울 것 -->
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