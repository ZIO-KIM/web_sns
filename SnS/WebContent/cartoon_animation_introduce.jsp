<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="page.PageDAO" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>세종대학교 소프트웨어융합대학 :: 과별 게시판 :: 만화애니메이션텍 :: 학과 소개</title>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/13inch_board_PSB.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
  </head>
  <body>
  
  <%
  	String userID =null;
  	if(session.getAttribute("userID")!=null){
  		userID=(String)session.getAttribute("userID");
  	}
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
    

      
      <div class="im_footer_right" style="margin-left:880px; margin-top: -100px;">
         	<div class="im_footer_menu">
               <ul>
                  <li class="active"><a href="index.jsp">메인 페이지</a></li>
                  <li><a href="index.jsp">KR</a></li>
                  <li><a href="index_en.jsp">EN</a></li>
                <% 
                  if (userID == null) {
               	%>
                  	<li><a data-toggle="modal" href="#modal-login">로그인</a></li>   
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

   <div id="container">
    <nav>
      <nav>
        <h2>
          <span></span>
          만화애니메이션텍
        </h2>
        <ul class="lnb_deps2">
             <li>
               <a href="cartoon_animation_introduce.jsp" class="jwxe_22350 active">학과 소개</a>
             </li>
             <li>
               <a href="cartoon_animation_student_council.jsp" class="jwxe_22351 ">학생회 소개</a>
            </li>
            <li>
               <a href="post.jsp?boardID=10" class="jwxe_22351 ">홍보</a>
            </li>
            <li>
               <a href="post.jsp?boardID=17" class="jwxe_22351 ">학생회비 내역</a>
            </li>
        </ul>
      </nav>
    </nav>
    </div>
    <section class="content">
      <header>
        <h1>학과 소개</h1>
      </header>
     <img style="margin-top:50px;"id="council_logo"src="imgs/cartoon_animation_logo.jpg" width="300" height="300" align="left">
      	<div class="introduce_council">
      		만화애니메이션텍 전공은 1996년 4년제 대학 최초로 만화애니메이션학과를 개설한 21년 전통의 학과로서, 2017학년부터 소프트웨어융합대학 창의소프트학부에서 전공학생을 선발한다.<br>
      		21년 동안 총 650명의 학부 졸업생과 200여명의 석박사를 배출하여 국내 웹툰산업 및 애니메이션, 게임, 캐릭터산업계의 새로운 전문인력 생태계를 부상시키고, 국내 콘텐츠의 차세대 한류를 선도하는 한국최고의 중심학과로 평가받으며 발전해나가고 있다.<br>
			본 전공은 예술과 디지털기술이 결합한 융합형 콘텐츠로서 만화와 애니메이션을 이해하고, 실용적인 학문으로서 관련 분야별 이론과 실기를 병행하는 체계적인 문화콘텐츠 융합교육을 통해 창의력과 응용력을 바탕으로 디지털 미디어를 복합적으로 연출하고 운용함으로써 콘테츠의 질을 향상시키고, 세계화 시대에 새로운 문화 창달의 가치를 실천해 나갈 수 있는 글로벌 우수인력 양성을 목표로 하고 있다.<br>
			이를 위하여 전공 내 만화, 애니메이션, 시각효과(VFX)의 분야별 트랙을 설정하고, 전공 필수과목과 전공 선택과목을 지정, 강도 높은 교육체계를 진행한다.<br>
			라이프드로잉, 만화기초, 애니메이션기초 등을 통해 관련 콘텐츠의 개념의 파악하고, 네러티브워크샵, 스토리구성워크샵, 콘텐츠기획 등을 통해 콘텐츠 창작을 위한 예술적, 산업적 접근의 기반을 확립하며, 디지털제작도구연구, 디지털제작기법연구 등을 통해 콘텐츠 제작을 위한 디지털 툴의 기본을 익힌다.<br>
			다양한 만화 창작을 위한 만화제작, 디지털만화제작, 디지털일러스트레이션 등과 디지털 애니메이션 제작을 위한 3D애니메이션제작, 3D캐릭터애니메이션, 3D조명과렌더링, 애니메이션액팅 등, 그리고 시각효과(VFX)를 위한 시각효과, 영상편집 등 분야별로 연계된 실기 실습을 통해 전공을 심화한다.<br>
			아울러 만화워크샵, 애니메이션워크샵, 콘텐츠산업체인턴쉽 등을 실시하여 산학연계 프로젝트 참여와 현장경험의 기회를 확대하고 졸업 후의 진로를 모색하며, 졸업까지 매 학년마다 과제전을 실시하고, 온라인 포트폴리오를 제작함으로써 전문가로서의 역량을 구축해 나간다.<br>
			이러한 교육과정을 통해 기초교육은 물론 독창적인 표현능력과 진화하는 미디어 플랫폼의 적응도를 높이고, 영상미학의 심화를 통해 창의적인 멀티미디어 연출력을 확보, 만화와 애니메이션 관련 디지털콘텐츠의 수준을 높이고 고부가가치를 지향하는 글로벌 경쟁력을 확보한다.<br>
      	</div>
    </section>
    
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
