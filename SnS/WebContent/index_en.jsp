<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Sejong Univ. College of Software Convergence</title>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/mainpage_eng_ver.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="js/Backstretch.js" type="text/javascript"></script>
    <script src="js/mainpage.js"></script>
  </head>
  <body>
    <script>
      $.backstretch(["imgs/background_img_3.jpg",
    	  "imgs/wallpaper-1812167.jpg"],
      {duration: 3000, fade: 900});
    </script>

    <header>
      <nav id='first_area'>
        <img src="imgs/software_convergence_logo.PNG" id='logo' alt="소융대 로고"> <!-- 소융대 로고 -->
        <div id="menubar">
          <ul> <!-- 사이트 타이틀 하단 메뉴바 -->
            <li><a href='student_council.jsp'>Student Council</a> <!-- 메뉴바 첫번째 - 학생회 카테고리 -->
              <ul id='submenu'>
                <li><a href='student_council_introduce.jsp'>Introduction of Student Council</a></li>
                <li><a href='student_council_photo.jsp'>Photos</a></li>
                <li><a href='student_council_events.jsp'>Events</a></li>
                <li><a href='student_council_public_money.jsp'>Usage of Public Budget</a></li>
              </ul>
            </li>

            <li><a href='complaints.jsp'>Complaints</a> <!-- 메뉴바 두번째 - 민원 카테고리 -->
              <ul id='submenu'>
                <li><a href='cmp_to_student_council.jsp'>To. Student Council</a></li>
                <li><a href='cmp_to_school.jsp'>To. School</a></li>
                <li><a href='cmp_to_etc.jsp'>To. etc</a></li>
                <li><a href='introduce_cmp.jsp'>Other ways to make Suggestions</a></li>
              </ul>
            </li>

            <li><a href='pre_sju_student.jsp'>For Pre-Sejong students</a> <!-- 메뉴바 세번째 - 예비 소융인 카테고리 -->
              <ul id='submenu'>
                <li><a href='admission_reviews.jsp'>Admission Reviews of Elders</a></li>
                <li><a href='admission_qnas.jsp'>Admission QnA</a></li>
              </ul>
            </li>

            <li><a href='employ_n_grauation.jsp'>Employment & Graduation</a> <!-- 메뉴바 네번째 - 취업&졸업 카테고리 -->
              <ul id='submenu'>
                <li><a href='employ_reviews.jsp'>Employment Reviews</a><br></li>
                <li><a href='graduate_interviews.jsp'>Graduate Interviews</a><br></li>
                <li><a href='graduate_qnas.jsp'>Graduate QnA</a><br></li>
              </ul>
            </li>

            <li><a href='contest_promotions.jsp'>Contest Promotions</a> <!-- 메뉴바 다섯번째 - 홍보 카테고리 -->
              <ul id='submenu'>
                <li><a href='school_contests.jsp'>School Contests</a><br></li>
                <li><a href='not_school_contests.jsp'>Non-school Contests</a><br></li>
              </ul>
            </li>

            <li><a href='questions.jsp'>Questions</a> <!-- 메뉴바 여섯번째 - QnA 카테고리 -->
              <ul id='submenu'>
                <li><a href='chatbot.jsp'>Chatbot</a><br></li>
                <li><a href='qna.jsp'>QnA</a><br></li>
              </ul>
            </li>
          </ul>
        </div> <!-- 메뉴바 -->
        <h2 id='language'>한국어 / EN </h2> <!--영어, 한글 버전 바꾸는 버튼-->
        <h2 id='login'> LOGIN</h2> <!-- 로그인 버튼-->
      </nav>
    </header>

    <nav id='title_animation'>
      <h1 id='title'>College of<br>Software & Convergence Technology</h1>
      <h3 id='subtitle'>Cultivate human resources that will be the mainstay of software society</h3>
    </nav>

    <!-- <table id='recent_upload'> 최근 글 띄워주는 테이블
      <tr>
        <td><a href='#'><span>공지사항</a></span></td>
        <td><a href='#'><span>홍보 게시판</a></span></td>
      </tr>
      <tr>
        <td><a href='#'><span>공지사항 최근 글</a></span></td>
        <td><a href='#'><span>홍보 게시판 최근 글</a></span></td>
      </tr>
      <tr>
        <td><a href='#'><span>민원 게시판</a></span></td>
        <td><a href='#'><span>과별 게시판</a></span></td>
      </tr>
      <tr>
        <td><span><a href='#'>민원 게시판 최근 글</a></span></td>
        <td><span><a href='#'>과별 게시판 최근 글</a></span></td>
      </tr>
    </table> -->

    <div id="notice">
      <h2><a href='#' id='Notice'>공지사항</a></h2>
      <a href='#' id='Notice'>공지사항 최근 글</a> <!-- 링크만 남기고 글 지울 것 -->
    </div>

    <div id="promotion">
      <h2><a href='#' id='Promotion'>홍보 게시판</a></h2>
      <a href='#' id='Promotion'>홍보 게시판 최근 글</a> <!-- 링크만 남기고 글 지울 것 -->
    </div>

    <div id="claims">
      <h2><a href='#' id='Claims'>민원 게시판</a></h2>
      <a href='#' id='Claims'>민원 게시판 최근 글</a> <!-- 링크만 남기고 글 지울 것 -->
    </div>

    <div id="departments">
      <h2><a href='#' id='Departments'>과별 게시판</a></h2>
      <a href='#' id='Departments'>컴퓨터공학과</a>
      <a href='#' id='Departments'>소프트웨어학과</a>
      <a href='#' id='Departments'>데이터사이언스학과</a><br>
      <a href='#' id='Departments'>정보보호학과</a>
      <a href='#' id='Departments'>지능기전공학부</a>
      <a href='#' id='Departments'>만화애니메이션텍</a>
      <a href='#' id='Departments'>디자인이노베이션</a>
    </div>

    <table>
      <tr>
        <td>Quick Menu</td>
        <td><a href='#' id='quick_menu'>세종대학교</a></td>
        <td><a href='#' id='quick_menu'>세종대학교<br>총학생회</a></td>
        <td><a href='#' id='quick_menu'>세종소융<br>페이스북</a></td>
        <td><a href='#' id='quick_menu'>세종대학교<br>총학생회 페이스북</a></td>
      </tr>
    </table>

  </body>
</html>
