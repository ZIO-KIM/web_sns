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
 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mainpage.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/Backstretch.js" type="text/javascript"></script>
    <script src="js/mainpage.js"></script>
    
    <link rel="stylesheet" href="css/mainpage.css">
    <style>
    	body {
			background-image: url("imgs/drop_7.jpg");
			background-size: 1300px 700px; 
			background-repeat: no-repeat; 
			background-position: 0% 0%; 
		}
    </style>

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
         <img style="width:60px; margin-left: 20px; margin-top: 10px;"src="<%=pageDAO.getPageLogo() %>" alt="소융대 로고">
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav" style="margin-left: -30px; margin-top: 4px;">
        <li><a href="post.jsp?boardID=1" style="font-size: 20px; color:black;">공지사항</a></li>
        <li><a href="student_council_photo.jsp" style="font-size: 20px; color:black;">갤러리</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color:black;">학생회 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a class="dropdownLi" href='student_council_introduce.jsp'>학생회 소개</a></li>
            <li><a class="dropdownLi" href='student_council_photo.jsp' >갤러리</a></li>
            <li><a class="dropdownLi" href='post.jsp?boardID=2'>행사</a></li>
            <li><a class="dropdownLi" href='post.jsp?boardID=3'>학생회비 내역</a></li>
            <li><a class="dropdownLi" href='departments.jsp'>과별 게시판</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color:black;">민원 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a class="dropdownLi" href='cmp_to_student_council.jsp'>학생회 건의사항</a></li>
         <li><a class="dropdownLi" href='cmp_to_school.jsp'>학교 건의사항</a></li>
         <li><a class="dropdownLi" href='introduce_cmp.jsp'>민원창구 소개</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color:black;">예비소융인 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a class="dropdownLi" href='post.jsp?boardID=18'>선배들의 입시 후기</a></li>
         <li><a class="dropdownLi" href='post.jsp?boardID=19'>QnA</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color:black;">취업 &amp; 졸업 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a class="dropdownLi" href='post.jsp?boardID=20'>취창업 후기</a></li>
         <li><a class="dropdownLi" href='post.jsp?boardID=21'>졸업생 인터뷰</a></li>
         <li><a class="dropdownLi" href='post.jsp?boardID=22'>졸업생 QnA</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color:black;">홍보 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a class="dropdownLi" href='post.jsp?boardID=24'>교내 공모전</a></li>
         <li><a class="dropdownLi" href='post.jsp?boardID=25'>교외 공모전</a></li>
          </ul>
        </li>
        <li><a href='hot_post.jsp' style="font-size: 20px; color:black;">열린 광장</a><br></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color:black;">QNA <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a class="dropdownLi" href='chatbot.jsp'>Chatbot</a></li>
         	<li><a class="dropdownLi" href='#'>QnA</a></li>
          </ul>
        </li>
      </ul>

      
      <div class="im_footer_right" style="margin-left:950px; margin-top: -100px;">
         	<div class="im_footer_menu">
               <ul>
                  <li class="active"><a href="index.jsp">메인 페이지</a></li>
                  <li><a href="index.jsp">KR</a></li>
                  <li><a href="index_en.jsp">EN</a></li>
                <% 
                  if (userID == null) {
               	%>
                  	<li><a href="#modal-login">로그인</a></li>   
                <%     
                  } else {
                %>
                  <li><a href="myPage.jsp">내 프로필</a></li>
                  <li><a href="userLogoutAction.jsp">로그아웃</a></li>    
                <%
                  }
                %>
               </ul>
      		</div>
      </div>
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
    
    <div><h1 id="department_board" style="font-size: 30px; font-family: 'Nanum Gothic', sans-serif;">과별 게시판</h1></div>
    <img id="devide" src="imgs/line.PNG">
    
    <section id='departments_area'>
    	 <div id='computer_science'><!--컴퓨터공학과 게시판-->
    		<a href='post.jsp?boardID=4'><img src='imgs/computer_science_logo.jpg' id='cs_logo'></a>
    	</div>
    
    	<div id='information_security'><!--정보보호학과 게시판-->
    		<a href='post.jsp?boardID=6'><img src='imgs/information_security_logo.jpg' id='is_logo'></a>
    	</div>
    
    	<div id='software'><!--소프트웨어학과 게시판-->
    		<a href='post.jsp?boardID=8'><img src='imgs/software_logo.jpg' id='soft_logo'></a>
    	</div>
    
    	<div id='data_science'><!--데이터사이언스학과 게시판-->
    		<a href='post.jsp?boardID=10'><img src='imgs/data_science_logo.jpg' id='ds_logo'></a>
    	</div>
    
    	<div id='intelligent_mechanics_engineering'><!--지능기전공학부 게시판-->
    		<a href='post.jsp?boardID=12'><img src='imgs/mechanical_engineering_logo.jpg' id='ime_logo'></a>
    	</div>
    
   		<div id='design_innovation'><!--디자인이노베이션학과 게시판-->
    		<a href='post.jsp?boardID=14'><img src='imgs/design_innovation_logo.jpg' id='di_logo'></a>
    	</div>
    
    	<div id='cartoon_animation'><!--만화애니메이션학과 게시판-->
    		<a href='post.jsp?boardID=16'><img src='imgs/cartoon_animation_logo.jpg' id='ca_logo'></a>
    	</div>
    </section>
    <hr class="line">
        
    <!-- <table class="board">
    	<tr>
    		<td style="border-left: hidden; border-top: hidden;"><h2><a href='#' id='board_content' style="text-decoration: none; color: black; ">공지사항</a></h2></td>
    		<td style="border-right: hidden; border-top: hidden;"><h2><a href='#' id='board_content' style="text-decoration: none; color: black; ">홍보게시판</a></h2></td>
    	</tr>
    	<tr>
    		<td style="border-left: hidden; border-bottom: hidden;"><h2><a href='#' id='board_content' style="text-decoration: none; color: black; ">갤러리</a></h2></td>
    		<td style="border-right: hidden; border-bottom: hidden;"><h2><a href='departments.jsp' id='board_content' style="text-decoration: none; color: black; ">과별 게시판</a></h2></td>
    	</tr>
    </table>
    -->
    
    <div><h1 id="recent_board" style="font-size: 30px; font-family: 'Nanum Gothic', sans-serif;">최근 게시물</h1></div>
    <img id="devide" src="imgs/line.PNG">
    
    <!--  
    <table class="type02">
    	<tr>
        	<th scope="row">공지사항</th>
        	<th scope="row">홍보 게시판</th>
    	</tr>
    	<tr>
    		<td>내용이 들어갑니다.</td>
        	<td>내용이 들어갑니다.</td>
    	</tr>
    	<tr>
        	<th scope="row">갤러리</th>
        	<th scope="row">HOT 게시판</th>
    	</tr>
    	<tr>
    		<td>내용이 들어갑니다.</td>
        	<td>내용이 들어갑니다.</td>
    	</tr>
	</table>
	-->
    
    
    <!--<div id='all_boards' class="container-fluid">
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
    -->
    
    <div class="m_con"><!-- 핫이슈 -->
	<section class="m_notice">
		<!-- 공지사항 -->
		<h3><a href="post.jsp?boardID=1" style="text-decoration:none;color: black;">공지사항</a></h3>
		<ul style="list-style:none;">          
		<li>
			<a href="/cs/board/notice_under.do?mode=view&amp;articleNo=134482" style="text-decoration:none;color: black;">
				웹소설 공모전 정말 힘드네요
			</a>
			<span>2019.09.05</span>
		</li>
		<li>
			<a href="/cs/board/notice_under.do?mode=view&amp;articleNo=134240" style="text-decoration:none;color: black;">
				27시간째 눈뜨고 있어요
			</a>
			<span>2019.09.04</span>
		</li>
		<li>
			<a href="/cs/board/notice_under.do?mode=view&amp;articleNo=133918" style="text-decoration:none;color: black;">
				강의도 못 들었어요
			</a>
			<span>2019.09.03</span>
		</li>
		<li>
			<a href="/cs/board/notice_under.do?mode=view&amp;articleNo=134011" style="text-decoration:none;color: black;">
				너무 졸리고 피곤해요
			</a>
			<span>2019.09.03</span>
		</li>
		</ul>
	</section>
	
 	<section class="m_notice">
		<!-- 공지사항 -->
		<h3><a href="" style="text-decoration:none;color: black;">홍보 게시판</a></h3>
		<ul style="list-style:none;">        
		<li>
			<a href="/cs/board/notice_grad.do?mode=view&amp;articleNo=135202" style="text-decoration:none;color: black;">
				[컴퓨터보안전공] 2020학년도 전기 컴퓨터학과 컴퓨터보안 전공 설명회 
			</a>
			<span>2019.09.16</span>
		</li>
		<li>
			<a href="/cs/board/notice_grad.do?mode=view&amp;articleNo=133418" style="text-decoration:none;color: black;">
				2019학년도 후기 대학원 종합시험 시행 공고
			</a>
			<span>2019.08.29</span>
		</li>
		<li>
			<a href="/cs/board/notice_grad.do?mode=view&amp;articleNo=133395" style="text-decoration:none;color: black;">
				Summer 2019, DMIS Invited Lecture
			</a>
			<span>2019.08.28</span>
		</li>
		<li>
			<a href="/cs/board/notice_grad.do?mode=view&amp;articleNo=133394" style="text-decoration:none;color: black;">
				[교양교육원]2019학년도 2학기 교육조교 모집 안내
			</a>
			<span>2019.08.28</span>
		</li>
		</ul>
	</section>
  
  	<section class="m_notice">
		<!-- 공지사항 -->
		<h3><a href="student_council_photo.jsp" style="text-decoration:none;color: black;">갤러리</a></h3>
		<ul style="list-style:none;">       
		<li>
			<a href="/cs/board/course.do?mode=view&amp;articleNo=135093" style="text-decoration:none;color: black;">
				[네이버] 네이버 개발 직군 신입사원 공채 안내
			</a>
			<span>2019.09.11</span>
		</li>
		<li>
			<a href="/cs/board/course.do?mode=view&amp;articleNo=134846" style="text-decoration:none;color: black;">
				[대우건설] 신입사원 채용(9/16~10/1)  및 Job Cafe 신청(선착순)
			</a>
			<span>2019.09.10</span>
		</li>
		<li>
			<a href="/cs/board/course.do?mode=view&amp;articleNo=134798" style="text-decoration:none;color: black;">
				기아자동차 빅데이터AI부문 직무설명회(9/20, 금)
			</a>
			<span>2019.09.09</span>
		</li>
		<li>
			<a href="/cs/board/course.do?mode=view&amp;articleNo=134590" style="text-decoration:none;color: black;">
				2019년 청년 과학기술인 일자리 박람회 안내
			</a>
			<span>2019.09.06</span>
		</li>
		</ul>
	</section>
  
  
  	<section class="m_notice">
		<!-- 공지사항 -->
		<h3><a href="" style="text-decoration:none;color: black;">HOT 게시판</a></h3>
		<ul style="list-style:none;">          
		<li>
			<a href="/cs/board/news.do?mode=view&amp;articleNo=135194" style="text-decoration:none;color: black;">
				[블록체인연구소] 2019년 가을학기 정기 세미나 개최 안내
			</a>
			<span>2019.09.16</span>
		</li>
		<li>
			<a href="/cs/board/news.do?mode=view&amp;articleNo=134632" style="text-decoration:none;color: black;">
				로봇산업진흥원 대학생 멘토(보조강사) 모집
			</a>
			<span>2019.09.06</span>
		</li>
		<li>
			<a href="/cs/board/news.do?mode=view&amp;articleNo=133282" style="text-decoration:none;color: black;">
				[SW중심대학] 2019년 하반기 TOPCIT 정기평가 설명회 개최 안내
			</a>
			<span>2019.08.27</span>
		</li>
		<li>
			<a href="/cs/board/news.do?mode=view&amp;articleNo=132970" style="text-decoration:none;color: black;">
				제2회 국민대학교 자율주행 경진대회 안내
			</a>
			<span>2019.08.26</span>
		</li>
		</ul>
	</section>
</div>

    
   <div class="im_footerWrap">
   	<div class="im_footer">
      	<div class="im_footer_logo">
	         <a href="index.jsp"><img src="imgs/footer_logo.PNG" alt="logo" border="0" style="width: 250px; margin-left: 20px; margin-right: 20px;"></a>                     </div>
         <div class="im_footer_right">
         	<div class="im_footer_menu">
               <ul>
                  <li class="active"><a href="index.jsp">메인 페이지</a></li><li><a href="http://www.sejong.ac.kr/">세종대학교</a></li><li><a href="http://www.sejongstudent.com/xe/">세종대학교 총학생회</a></li><li><a href="https://ko-kr.facebook.com/sejong1sc/">세종소융 페이스북</a></li>             </ul>
            </div>
            <div class="im_footer_info">
            	<span class="contact">010-0000-0000 | sejongsc3@gmail.com | 학생회관 409호 </span>                              <span class="copyright">COPYRIGHT ⓒ 세종대학교 소프트웨어융합대학 All right reserved.</span>                           </div>
                     </div>
         <div class="im_gototop">
         	<a href="#"><span class="icon"><i class="fa fa-chevron-up"></i></span><span class="label">TOP</span></a>
         </div>
      </div>
   </div>
   
  </body>
  
</html>