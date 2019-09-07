<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="complaints.ComplaintsDAO" %>
<%@ page import="complaints.ComplaintsDTO" %>
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
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
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
			script.println("location.href='userLogin.jsp'");
			script.println("</script>"); 
			script.close();
		}
	 %>
  
    <header>
      <nav id='first_area'>
        <a href='index.jsp'><img src="imgs/software_convergence_logo.PNG" id='logo' alt="소융대 로고"></a> <!-- 소융대 로고 -->
        <div id="menubar">
          <ul> <!-- 사이트 타이틀 하단 메뉴바 -->
            <li>학생회 <!-- 메뉴바 첫번째 - 학생회 카테고리 -->
              <ul id='submenu'>
                <li><a href='student_council_introduce.jsp'>학생회 소개</a></li>
                <li><a href='student_council_photo.jsp'>갤러리</a></li>
                <li><a href='student_council_events.jsp'>행사</a></li>
                <li><a href='student_council_public_money.jsp'>학생회비 내역</a></li>
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
                <li><a href='admission_reviews.jsp'>선배들의 입시 후기</a></li>
                <li><a href='admission_qnas.jsp'>QnA</a></li>
              </ul>
            </li>

            <li>취업&amp;졸업 <!-- 메뉴바 네번째 - 취업&졸업 카테고리 -->
              <ul id='submenu'>
                <li><a href='employ_reviews.jsp'>취창업 후기</a><br></li>
                <li><a href='graduate_interviews.jsp'>졸업생 인터뷰</a><br></li>
                <li><a href='graduate_qnas.jsp'>졸업생 QnA</a><br></li>
              </ul>
            </li>

            <li>홍보 <!-- 메뉴바 다섯번째 - 홍보 카테고리 -->
              <ul id='submenu'>
                <li><a href='school_contests.jsp'>교내 공모전</a><br></li>
                <li><a href='not_school_contests.jsp'>교외 공모전</a><br></li>
              </ul>
            </li>

            <li>QnA <!-- 메뉴바 여섯번째 - QnA 카테고리 -->
              <ul id='submenu'>
                <li><a href='chatbot.jsp'>Chatbot</a><br></li>
                <li><a href='qna.jsp'>QnA</a><br></li>
              </ul>
            </li>
          </ul>
        </div>
        
        <h1 id='language'>한국어 / EN </h1> <!--영어, 한글 버전 바꾸는 버튼-->
        
      	<h2 id='login'><a href="userLogoutAction.jsp" style="text-decoration:none; color:#000000">LOGOUT</a></h2>

      </nav>
    </header>
    <div id="container">
    <nav>
      <nav>
        <h2>
          <span></span>
            민원
        </h2>
        <ul class="lnb_deps2">
             <li>
               <a href='cmp_to_student_council.jsp' class="jwxe_22350 active">학생회 건의사항</a>
             </li>
             <li>
               <a href='cmp_to_school.jsp' class="jwxe_22351 ">학교 건의사항</a>
            </li>
            <li>
              <a href='introduce_cmp.jsp' class="jwxe_22351 ">민원창구 소개</a>
            </li>
        </ul>
      </nav>
    </nav>
    
    
    <section class="content">
      <header>
        <h1>프로필 수정</h1>
      </header>
      <form method="post" action="./userProfile" enctype="multipart/form-data">
      
      <table class="table table-bordered">
        <tbody>
        	<tr>
        		<th>사용자 아이디 </th>
               	<td colspan="2">
					<input type="text" name="userID" value=<%=userID%>> 
               </td>
            </tr>
            <tr>
               <th>사진 업로드 </th>
               <td colspan="2">
               		<input type="file" name="userProfile" class="file">
               		<div class="input-group col-xs-12">
               			<span class="input-group-addon"><i class="fa fa-image"></i></span>
               			<input type="text" class="form-control input-lg" disabled placeholder="이미지를 업로드 하세요.">
               			<span class="input-group-btn">
               				<button class="browse btn btn-primary input-lg" type="button"><i class="fa fa-search"></i>파일 찾기</button>
               			</span>
               		</div>
					
               </td>
            </tr>
            <tr>
               <td colspan="2">
                 <input type="submit" class="btn btn-primary pull-right" value="수정하기">
               </td>
             </tr>
          
        </tbody>
      </table>
      </form>
      </section>
      
      <footer>
   		<p id='footer_content'> 010-0000-0000 | sejongsc3@gmail.com | 학생회관 409호 <br>
   		COPYRIGHT &copy 2019 세종대학교 소프트웨어융합대학 데단한 사람들 All rights reserved.</p>
    </footer>
    
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript">
    	$(document).on('click','.browse',function(){
    		var file = $(this).parent().parent().parent().find('.file');
    		file.trigger('click');
    	});
    	$(document).on('change','.file',function(){
    		$(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i,''));
    	});
    </script>
  </body>
</html>
