<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="complaints.ComplaintsDAO" %>
<%@ page import="complaints.ComplaintsDTO" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <title>세종대학교 소프트웨어융합대학 :: 민원 :: 학생회 건의사항</title>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/PSB.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">



	<style type="text/css">
		a, a:hover{
			color:#000000;
			text-decoration:none;
		}
	</style>

  </head>
  <body>

	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		String searchType="최신순";
		String search=null;
		if(request.getParameter("searchType")!=null){
			searchType=request.getParameter("searchType");
		}
		if(request.getParameter("search")!=null){
			search=request.getParameter("search");
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
        <h1 id='language'>한국어 / EN </h1> <!--영어, 한글 버전 바꾸는 버튼-->
        <%
        	if(userID==null){
        %>
        <h2 id='login'><a href="userLogin.jsp" style="text-decoration:none; color:#000000">LOGIN</a></h2>
        <%
        	}else{
        %>
      	<h2 id='login'><a href="userLogoutAction.jsp" style="text-decoration:none; color:#000000">LOGOUT</a></h2>
        <%
        	}
        %>
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
    </div>

		<section class="content">
			<header>
				<h1>학생회 건의사항</h1>
				<form method="get" action="cmp_to_student_council.jsp" class="form-inline mt-3">
					<select name="searchType" class="form-control mx-1 mt-2">
						<option value="최신순" <% if(searchType.equals("최신순")) out.println("selected"); %>>최신순</option>
						<option value="추천순" <% if(searchType.equals("추천순")) out.println("selected"); %>>추천순</option>
					</select>
					<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요">
					<button type="submit" class="btn mx-1 mt-2">검색</button>
				</form>
			</header>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>동의 수</th>
						<th>조회 수</th>
					</tr>
				</thead>
				<tbody>
					<%
            ComplaintsDAO cmpDAO = new ComplaintsDAO();
			ArrayList<ComplaintsDTO> list = null;
			if(search==null){
				list = cmpDAO.getList(pageNumber,true);	
			}else{
				list=cmpDAO.getSearch(searchType,search,pageNumber,true);
			}
            for(int i=0; i<list.size();i++){
         %>
					<tr>
						<td><%=list.get(i).getCmpID() %></td>
						<td><a href="cmp_to_student_council_View.jsp?cmpID=<%=list.get(i).getCmpID()%>"
							style="text-decoration: none"><%=list.get(i).getCmpTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></a></td>
						<td><%=list.get(i).getUserID() %></td>
						<td><%=list.get(i).getCmpDate().substring(0,11)+list.get(i).getCmpDate().substring(11,13)+"시"+list.get(i).getCmpDate().substring(14,16)+"분" %></td>
						<td><%=list.get(i).getAgreeCount() %></td>
						<td><%=list.get(i).getCmpHit() %></td>
					</tr>
					<%
            }
         %>
				</tbody>
			</table>
			<hr>
			<a class="btn btn-default pull-right"
				href="cmp_to_student_council_Write.jsp">글쓰기</a>
			<br><br>
			<%
				if(search==null){
			%>
			<div class="text-center">
				<ul class="pagination" style="margin: 0 auto;">
					<%
          	int startPage=(pageNumber/10)*10+1;
          	if(pageNumber%10==0) startPage-=10;
          	int targetPage =cmpDAO.targetPage(pageNumber,true);
          	if(startPage!=1){
          %>
					<li><a
						href="cmp_to_student_council.jsp?pageNumber=<%=startPage-1%>"
						class="btn btn-success">이전</a></li>
					<%
          	}else{
          %>
					<li><a href="#" class="btn" style="color: gray;">이전</a></li>
					<%
          	}for(int i = startPage;i<pageNumber;i++){
        	%>
					<li><a href="cmp_to_student_council.jsp?pageNumber=<%=i %>"><%=i %></a></li>
					<%      			
          		}
          	%>
					<li><a class="active"
						href="cmp_to_student_council.jsp?pageNumber=<%=pageNumber %>"><%=pageNumber %></a></li>
					<%
				for(int i = pageNumber+1;i<=targetPage+pageNumber;i++){
					if(i<startPage+10){
			%>
					<li><a href="cmp_to_student_council.jsp?pageNumber=<%=i %>"><%=i %></a></li>
					<%
					}
				}
				if(targetPage+pageNumber>startPage+9){
			%>
					<li><a
						href="cmp_to_student_council.jsp?pageNumber=<%=startPage+10 %>">다음</a></li>
					<%
				}else{
			%>
					<li><a href="#" class="btn" style="color: gray;">다음</a></li>
					<%
				}
				}
			%>
				</ul>
			</div>
			<br>
			<br>
		</section>
	</div>
   
   <footer>
   		<p id='footer_content'> 010-0000-0000 | sejongsc3@gmail.com | 학생회관 409호 <br>
   		COPYRIGHT &copy 2019 세종대학교 소프트웨어융합대학 데단한 사람들 All rights reserved.</p>
    </footer>
    <script src="js/bootstrap.js"></script>
  </body>
</html>