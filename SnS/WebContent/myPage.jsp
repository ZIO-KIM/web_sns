<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="complaints.ComplaintsDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="page.PageDAO" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>세종대학교 소프트웨어융합대학 :: 마이 페이지 :: 프로필 수정</title>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/PSB.css">
    <link rel="stylesheet" href="css/light-bootstrap-dashboard.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">

    <meta name="viewport" content="device-width, initial-scale=1">
    <style type="text/css">
    	.btn-file{
    		position:relative;
    		overflow:hidden;
    	}
    	.btn-file input[type=file]{
    		position:absolute;
    		top: 0;
    		right:0;
    		min-width:100%;
    		min-height:100%;
    		font-size:100px;
    		text-align:right;
    		filter:alpha(opacity=0);
    		opacity:0;
    		outline:none;
    		background:white;
    		cursor:inherit;
    		display:block;
    	}
    	.file{
    		visibility:hidden;
    		position:absolute;
    	}
    </style>
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
		UserDAO userDAO = new UserDAO();
		UserDTO user = userDAO.getUser(userID);
		
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
    

      
      <div class="im_footer_right" style="margin-left:950px; margin-top: -100px; ">
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

    
    <div class="content">
                <div class="container-fluid">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">회원정보 관리</h4>
                                </div>
                                <div class="card-body">
                                    <form method="post" action="./userProfile" enctype="multipart/form-data">
                                    	<input type="hidden" class="form-control" name="userID" value="<%=userID%>">
                                        <div class="row">
                                            <div class="col-md-12 px-1">
                                                <div class="form-group">
                                                    <label>User Name</label>
                                                    <input type="text" class="form-control" name="userName" placeholder="UserName" value="<%=user.getUserName()%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 pl-1">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Email address</label>
                                                    <input type="email" class="form-control" name="userEmail" placeholder="@sju.ac.kr" value="<%=user.getUserEmail()%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>About Me</label>
                                                    <textarea rows="4" cols="80" class="form-control" name="aboutMe" placeholder="Here can be your description"><%=user.getAboutMe()%></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Profile Image</label>
                                                    <input type="file" name="userProfile" class="file">
                                                    <input type="text" style="float:left;" class="form-control input-sm"  disabled placeholder="Image Upload">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- <input type="file" name="userProfile" class="file"> -->
               							<div class="input-group col-xs-12">
               								<label for="profileDisclosure">프로필 공개여부</label>
               								<button type="submit" class="btn btn-info btn-fill pull-right" style="margin-left:2%;">프로필 업데이트</button>
											<input type="checkbox" checked data-toggle="toggle">
											<div class="col-md-4 pull-right">
												<!-- <input type="text" style="float:left;" class="form-control input-sm"  disabled placeholder="이미지를 업로드하세요."> -->
												<!-- <input type="button" style="float:right;" class="browse btn btn-primary pull-right" value="업로드">  -->
												<span class="input-group-btn"><button class="browse btn btn-primary pull-right"  type="button"><i class="fa fa-search"></i>프로필 사진 업데이트</button></span>
											</div>
               							</div>

							<div class="clearfix"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-user">
                                <div class="card-body">
                                    <div class="author">
                                        <br><br><br><br><br><br>
                                        <img class="avatar border-gray" src="<%=userDAO.getProfile(userID) %>" alt="프로필 이미지">
                                        
                                        <p class="description">
                                            <%=user.getUserName() %>
                                        </p>
                                    </div>
                                    <p class="description text-center">
                                        <%=user.getAboutMe()%>
                                    </p>
                                    
                                </div>
                                <br>
                            </div>
                            <%
                            	if(user.getUserEmailChecked()==0){
                            %>
                            <button type="button" onclick="location.href='emailSendAction.jsp'" class="btn btn-danger btn-fill pull-left">이메일 인증하기</button>
                            <%
                            	}
                            %>
                        </div>
                    </div>
                </div>
    
      
      <footer>
   		<p id='footer_content'> 010-0000-0000 | sejongsc3@gmail.com | 학생회관 409호 <br>
   		COPYRIGHT &copy 2019 세종대학교 소프트웨어융합대학 데단한 사람들 All rights reserved.</p>
    </footer>
    
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript">
    	$(document).on('click','.browse',function(){
    		var file = $(this).parent().parent().parent().parent().find('.file');
    		file.trigger('click');
    	});
    	$(document).on('change','.file',function(){
    		$(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i,''));
    	});
    </script>
  </body>
</html>
