<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="complaints.ComplaintsDAO" %>
<%@ page import="complaints.ComplaintsDTO" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>세종대학교 소프트웨어융합대학 :: 민원 :: 학교 건의사항</title>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/PSB.css">
    <link rel="stylesheet" href="css/PSB.css">

  </head>
  <body>
  
	<%
		/* String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		} */
		int cmpID=0;
		if(request.getParameter("cmpID")!=null){
			cmpID =Integer.parseInt(request.getParameter("cmpID"));
		}
		if(cmpID==0){
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='cmp_to_school.jsp'");
			script.println("</script>");
		}
		ComplaintsDTO cmp =new ComplaintsDAO().getCmp(cmpID,false);
	 %>
  
    <header>
      <nav id='first_area'>
        <img src="imgs/software_convergence_logo.PNG" id='logo' alt="소융대 로고"> <!-- 소융대 로고 -->
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
        <h1 id='login'><a href="login_page.html">LOGIN</a></h1> <!-- 로그인 버튼-->
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
    
    
		<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color:#eeeeee; text-align:center;">게시판 글보기</th>
					</tr>
				<thead>
				<tbody>
					<tr>
						<td style="width:20%;">글 제목</td>
						<td colspan="2"><%=cmp.getCmpTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=cmp.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=cmp.getCmpDate().substring(0,11)+cmp.getCmpDate().substring(11,13)+"시"+cmp.getCmpDate().substring(14,16)+"분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height:200px; text-align:left;"><%=cmp.getCmpContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>")%></td>
					</tr>
				</tbody>
			</table>
			<a href="cmp_to_student_coucil.jsp" class="btn btn-primary">목록</a>
			<%-- <%
				if(userID!=null && userID.equals(bbs.getUserID())){
			%>
				<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">삭제</a>
			<%
				}
			%> --%>		
		</div>
	</div>

	</div>
    <script src="js/bootstrap.js"></script>
  </body>
</html>
