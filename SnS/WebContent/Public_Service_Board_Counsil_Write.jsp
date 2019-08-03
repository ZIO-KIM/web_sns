<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>세종대학교 소프트웨어융합대학 :: 민원 :: 학생회 건의사항 :: 글쓰기</title>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="PSB.css">
    <meta name="viewport" content="device-width, initial-scale=1">
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
        <h1 id='language'>한국어 / EN </h1> <!--영어, 한글 버전 바꾸는 버튼-->
        <h1 id='login'> LOGIN</h1> <!-- 로그인 버튼-->
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
               <a href="Public_Service_Board_Counsil.html" class="jwxe_22350 active">학생회 건의사항</a>
             </li>
             <li>
               <a href="Public_Service_Board_School.html" class="jwxe_22351 ">학교 건의사항</a>
            </li>
            <li>
              <a href="Public_Service_Board_Other.html" class="jwxe_22351 ">기타 민원</a>
            </li>
            <li>
              <a href="Public_Service_Board_Intro.html" class="jwxe_22351 ">민원창구 소개</a>
            </li>
        </ul>
      </nav>
    </nav>
    <section class="content">
      <header>
        <h1>글쓰기</h1>
      </header>
      <table class="table table-bordered">
        <tbody>
          <form>
            <tr>
               <th>제목: </th>
               <td><input type="text" placeholder="제목을 입력하세요. " name="subject" class="form-control"/></td>
            </tr>
            <tr>
               <th>내용: </th>
               <td><textarea cols="10" placeholder="내용을 입력하세요. " name="content" class="form-control"></textarea></td>
            </tr>
            <tr>
               <th>첨부파일: </th>
               <td><input type="text" placeholder="파일을 선택하세요. " name="filename" class="form-control"/></td>
            </tr>
            <tr>
               <th>비밀번호: </th>
               <td><input type="password" placeholder="비밀번호를 입력하세요" class="form-control"/></td>
            </tr>
            <tr>
               <td colspan="2">
                 <input type="button" value="등록" onclick="#" class="pull-right"/>
                 <input type="button" value="reset" class="pull-left"/>
                 <input type="button" value="글 목록으로... " onclick="#" class="pull-right"/>
               </td>
             </tr>
          </form>
        </tbody>
      </table>
    <script src="js/bootstrap.js"></script>
  </body>
</html>
