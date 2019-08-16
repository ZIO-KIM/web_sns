<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>세종대학교 소프트웨어융합대학 :: 로그인</title>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="mainpage.css">
    <link rel="stylesheet" href="login_page.css">
  </head>
  <body>
    <header>
      <nav id='first_area'>
        <img src="software_convergence_logo.PNG" id='logo' alt="소융대 로고"> <!-- 소융대 로고 -->
        <div id="menubar">
          <ul> <!-- 사이트 타이틀 하단 메뉴바 -->
            <li><a href='student_council.html'>학생회</a> <!-- 메뉴바 첫번째 - 학생회 카테고리 -->
              <ul id='submenu'>
                <li><a href='student_council_introduce.html'>학생회 소개</a></li>
                <li><a href='student_council_photo.html'>갤러리</a></li>
                <li><a href='student_council_events.html'>행사</a></li>
                <li><a href='student_council_public_money.html'>학생회비 내역</a></li>
              </ul>
            </li>

            <li><a href='complaints.html'>민원</a> <!-- 메뉴바 두번째 - 민원 카테고리 -->
              <ul id='submenu'>
                <li><a href='cmp_to_student_council.html'>학생회 건의사항</a></li>
                <li><a href='cmp_to_school.html'>학교 건의사항</a></li>
                <li><a href='cmp_to_etc.html'>기타 민원</a></li>
                <li><a href='introduce_cmp.html'>민원창구 소개</a></li>
              </ul>
            </li>

            <li><a href='pre_sju_student.html'>예비 소융인</a> <!-- 메뉴바 세번째 - 예비 소융인 카테고리 -->
              <ul id='submenu'>
                <li><a href='admission_reviews.html'>선배들의 입시 후기</a></li>
                <li><a href='admission_qnas.html'>QnA</a></li>
              </ul>
            </li>

            <li><a href='employ_n_grauation.html'>취업 & 졸업</a> <!-- 메뉴바 네번째 - 취업&졸업 카테고리 -->
              <ul id='submenu'>
                <li><a href='employ_reviews.html'>취창업 후기</a><br></li>
                <li><a href='graduate_interviews.html'>졸업생 인터뷰</a><br></li>
                <li><a href='graduate_qnas.html'>졸업생 QnA</a><br></li>
              </ul>
            </li>

            <li><a href='contest_promotions.html'>홍보</a> <!-- 메뉴바 다섯번째 - 홍보 카테고리 -->
              <ul id='submenu'>
                <li><a href='school_contests.html'>교내 공모전</a><br></li>
                <li><a href='not_school_contests.html'>교외 공모전</a><br></li>
              </ul>
            </li>

            <li><a href='questions.html'>QnA</a> <!-- 메뉴바 여섯번째 - QnA 카테고리 -->
              <ul id='submenu'>
                <li><a href='chatbot.html'>Chatbot</a><br></li>
                <li><a href='qna.html'>QnA</a><br></li>
              </ul>
            </li>
          </ul>
        </div>
        <h2 id='language'>한국어 / EN </h1> <!--영어, 한글 버전 바꾸는 버튼-->
        <h2 id='login'> LOGIN</h1> <!-- 로그인 버튼-->
      </nav>
    </header>
    <div id="wrap">
    <div id="top">

     <div id="log-title">

     <p class="title">LOGIN</p>

     <!--p><span class="subtitle">세종대학교</span><span style="color:#8c8c8c;  font-family: 'Nanum Gothic', serif; font-size:12px;">&nbsp;| SEJONGUNIVERSITY</span></p-->

     <br><br>
     <p><span class="subtitle">소프트웨어</span><span class="sub-text"> 에 오신것을<br>환영합니다.</span></p>
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
