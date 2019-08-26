<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
    
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
    <link rel="stylesheet" href="css/login_page.css">
  </head>
  <body>
  
  <%
  	String userID =null;
  	if(session.getAttribute("userID")!=null){
  		
  		userID=(String)session.getAttribute("userID");
  	}
  	if(userID!=null){
  		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태입니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;
  	}
  	%>
  
    <header>
      <nav id='first_area'>
        <a href='index.jsp'><img src="imgs/software_convergence_logo.PNG" id='logo' alt="소융대 로고"></a> <!-- 소융대 로고 -->
        <div id="menubar">
          <ul> <!-- 사이트 타이틀 하단 메뉴바 -->
            <li><a href='student_council.jsp'>학생회</a> <!-- 메뉴바 첫번째 - 학생회 카테고리 -->
              <ul id='submenu'>
                <li><a href='student_council_introduce.jsp'>학생회 소개</a></li>
                <li><a href='student_council_photo.jsp'>갤러리</a></li>
                <li><a href='student_council_events.jsp'>행사</a></li>
                <li><a href='student_council_public_money.jsp'>학생회비 내역</a></li>
              </ul>
            </li>

            <li><a href='complaints.jsp'>민원</a> <!-- 메뉴바 두번째 - 민원 카테고리 -->
              <ul id='submenu'>
                <li><a href='cmp_to_student_council.jsp'>학생회 건의사항</a></li>
                <li><a href='cmp_to_school.jsp'>학교 건의사항</a></li>
                <li><a href='cmp_to_etc.jsp'>기타 민원</a></li>
                <li><a href='introduce_cmp.jsp'>민원창구 소개</a></li>
              </ul>
            </li>

            <li><a href='pre_sju_student.jsp'>예비 소융인</a> <!-- 메뉴바 세번째 - 예비 소융인 카테고리 -->
              <ul id='submenu'>
                <li><a href='admission_reviews.jsp'>선배들의 입시 후기</a></li>
                <li><a href='admission_qnas.jsp'>QnA</a></li>
              </ul>
            </li>

            <li><a href='employ_n_grauation.jsp'>취업 & 졸업</a> <!-- 메뉴바 네번째 - 취업&졸업 카테고리 -->
              <ul id='submenu'>
                <li><a href='employ_reviews.jsp'>취창업 후기</a><br></li>
                <li><a href='graduate_interviews.jsp'>졸업생 인터뷰</a><br></li>
                <li><a href='graduate_qnas.jsp'>졸업생 QnA</a><br></li>
              </ul>
            </li>

            <li><a href='contest_promotions.jsp'>홍보</a> <!-- 메뉴바 다섯번째 - 홍보 카테고리 -->
              <ul id='submenu'>
                <li><a href='school_contests.jsp'>교내 공모전</a><br></li>
                <li><a href='not_school_contests.jsp'>교외 공모전</a><br></li>
              </ul>
            </li>

            <li><a href='questions.jsp'>QnA</a> <!-- 메뉴바 여섯번째 - QnA 카테고리 -->
              <ul id='submenu'>
                <li><a href='chatbot.jsp'>Chatbot</a><br></li>
                <li><a href='qna.jsp'>QnA</a><br></li>
              </ul>
            </li>
          </ul>
        </div>
        <h2 id='language'>한국어 / EN </h2> <!--영어, 한글 버전 바꾸는 버튼-->
        <h2 id='login'> LOGIN</h2> <!-- 로그인 버튼-->
      </nav>
    </header>
    <div id="wrap">
    <div id="top">

     <div id="log-title">

     <p class="title">LOGIN</p>

     <!--p><span class="subtitle">세종대학교</span><span style="color:#8c8c8c;  font-family: 'Nanum Gothic', serif; font-size:12px;">&nbsp;| SEJONGUNIVERSITY</span></p-->

     <br><br>
     <p><span class="subtitle">소프트웨어융합대학</span><span class="sub-text"> 에 오신것을<br>환영합니다.</span></p>
     </div>

     <div id="login_box">
    	<form method="post" action="/jsp/login/login_action.jsp" name="loginForm">
    		 <input type="hidden" name="rtUrl" value="uis.sejong.ac.kr/app/sys.Login.servj?strCommand=SSOLOGIN">
    		 <input type="hidden" name="loginUrl" value="uisloginSSL.jsp">
    		<fieldset>
           <p>
           <label for="id">학번/아이디</label>
    		   <input type="text" id="id" name="id" value="" size="20" tabindex="1" style="ime-mode:disabled">
    		   </p>
    		   <p>

    		   <label for="password">비밀번호</label>
    		   <input type="password" id="password" name="password" value="" size="20" tabindex="2">
    		   </p>

    		</fieldset>

    			 <input type="submit" value="로그인" id="logbtn" onclick="return beforeSubmit();" style="cursor:hand">

    	</form>

    </div>
    <p>
    </p><p class="subtitle1"><b><font color="black">※ 학생은 학번,</font> <font color="red">교수/직원은 포털아이디</font></b>로 로그인이 가능합니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <p></p>


  </body>
</html>
