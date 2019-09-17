<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="gallery.GalleryDTO"%>
<%@ page import="gallery.GalleryDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="page.PageDAO" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<title>세종대학교 소프트웨어융합대학 :: 학생회 :: 갤러리</title>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/13inch_board_PSB.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int galID = 0;
		if (request.getParameter("galID") != null) {
			galID = Integer.parseInt(request.getParameter("galID"));
		}
		if (galID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='student_council_photo.jsp'");
			script.println("</script>");
		}
		GalleryDTO gal = new GalleryDAO().getGal(galID);
		GalleryDAO.hit(galID);
		String fromProfile = new UserDAO().getProfile(userID);
		String galFile = "http://sejongsc.org/SnS/upload/" + gal.getGalRealFile();
		PageDAO pageDAO = new PageDAO();
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
    

      
      <div class="im_footer_right" style="margin-left:880px; margin-top: -100px; ">
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
			$('messageModal').modal("show");
		</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
	
	<div id="container">
	
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

		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd; margin-top: -70px;">
					<thead>
						<tr>
							<th colspan="3"
								style="background-color: #eeeeee; text-align: center;">갤러리
							</th>
						</tr>
					<thead>
					<tbody>
						<tr>
							<td style="width: 20%;">제목:</td>
							<td colspan="2"><%=gal.getGalTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>")%></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><%=gal.getUserID()%></td>
						</tr>
						<tr>
							<td>작성자 이미지</td>
							<td colspan="2"><img class="media-object img-circle" style="width:30px;height:30px;margin: 0px auto;" src="<%=fromProfile%>"></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="2"><%=gal.getGalDate().substring(0, 11) + gal.getGalDate().substring(11, 13) + "시"
					+ gal.getGalDate().substring(14, 16) + "분"%></td>
						</tr>
						<tr>
							<td>조회 수</td>
							<td colspan="2"><%=gal.getGalHit()%></td>
						</tr>
						<tr>
							<td><img style="width: 200px;" class="media-object" src="<%=galFile%>"></td>
						</tr>
						<tr>
							<td style="line-height: 300px;">내용</td>
							<td colspan="2" style="height: 300px; text-align: left;"><%=gal.getGalContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt")
					.replaceAll("\n", "<br>")%></td>
						</tr>

					</tbody>
				</table>
				<%
					if (userID != null && userID.equals(gal.getUserID())) {
				%>
				<a
					href="gal_to_student_council_Update.jsp?galID=<%=gal.getGalID()%>"
					class="btn btn-primary">수정</a> <a
					onclick="return confirm('정말로 삭제하시겠습니까?')"
					href="deleteAction.jsp?galID=<%=gal.getGalID()%>"
					class="btn btn-primary">삭제</a>
				<%
					}
				%>
					
			</div>
		</div>

	</div>
	
	<div class="im_footerWrap">
   	<div class="im_footer" style="width: 1600px;">
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
