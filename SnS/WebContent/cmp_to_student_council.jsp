<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="complaints.ComplaintsDAO" %>
<%@ page import="complaints.ComplaintsDTO" %>
<%@ page import="page.PageDAO" %>
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
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/PSB.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

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
		int isStudent=1;
		PageDAO pageDAO = new PageDAO();
	%>

	<div id="wrapper">
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
			$('#messageModal').modal("show");
		</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>

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
			</header>
			<hr style="width: 950px">
			<div class="find_content">
				<form method="get" action="cmp_to_student_council.jsp" class="form-inline mt-3">
					<select name="searchType" class="form-control mx-1 mt-2">
						<option value="최신순" <% if(searchType.equals("최신순")) out.println("selected"); %>>최신순</option>
						<option value="추천순" <% if(searchType.equals("추천순")) out.println("selected"); %>>추천순</option>
					</select>
					<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="작성자/제목/내용">
					<button type="submit" class="btn mx-1 mt-2">검색</button>
				</form>
			</div>
			<div class="full_table">
				<div class="content_table">
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
					<tr>
						<td>1</td>
						<td>웹소설 상금이 왜 이렇게 적은가요 ?</td>
						<td>지오</td>
						<td>2019.09.17</td>
						<td>100</td>
						<td>300</td>
					</tr>
					<tr>
						<td>1</td>
						<td>웹소설 상금이 왜 이렇게 적은가요 ?</td>
						<td>지오</td>
						<td>2019.09.17</td>
						<td>100</td>
						<td>300</td>
					</tr>
					<tr>
						<td>1</td>
						<td>웹소설 상금이 왜 이렇게 적은가요 ?</td>
						<td>지오</td>
						<td>2019.09.17</td>
						<td>100</td>
						<td>300</td>
					</tr>
					<tr>
						<td>1</td>
						<td>웹소설 상금이 왜 이렇게 적은가요 ?</td>
						<td>지오</td>
						<td>2019.09.17</td>
						<td>100</td>
						<td>300</td>
					</tr>
					<tr>
						<td>1</td>
						<td>웹소설 상금이 왜 이렇게 적은가요 ?</td>
						<td>지오</td>
						<td>2019.09.17</td>
						<td>100</td>
						<td>300</td>
					</tr>
					<tr>
						<td>1</td>
						<td>웹소설 상금이 왜 이렇게 적은가요 ?</td>
						<td>지오</td>
						<td>2019.09.17</td>
						<td>100</td>
						<td>300</td>
					</tr>
					<tr>
						<td>1</td>
						<td>웹소설 상금이 왜 이렇게 적은가요 ?</td>
						<td>지오</td>
						<td>2019.09.17</td>
						<td>100</td>
						<td>300</td>
					</tr>
					<tr>
						<td>1</td>
						<td>웹소설 상금이 왜 이렇게 적은가요 ?</td>
						<td>지오</td>
						<td>2019.09.17</td>
						<td>100</td>
						<td>300</td>
					</tr>
					<tr>
						<td>1</td>
						<td>웹소설 상금이 왜 이렇게 적은가요 ?</td>
						<td>지오</td>
						<td>2019.09.17</td>
						<td>100</td>
						<td>300</td>
					</tr>
					
				</thead>
				<tbody>
					<%
            ComplaintsDAO cmpDAO = new ComplaintsDAO();
			ArrayList<ComplaintsDTO> list = null;
			if(search==null){
				list = cmpDAO.getList(pageNumber,isStudent);	
			}else{
				list=cmpDAO.getSearch(searchType,search,pageNumber,isStudent);
			}
            for(int i=0; i<list.size();i++){
         %>
					<tr>
						<td><%=list.get(i).getCmpID() %></td>
						<td><a href="cmp_View.jsp?isStudent=<%=isStudent %>&cmpID=<%=list.get(i).getCmpID()%>"
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
			</div>
			<div class="write_button">
				<a class="btn btn-default pull-right"
				href="cmp_Write.jsp?isStudent=<%=isStudent%>">글쓰기</a>
			</div>
			<br><br>
			<div class="list_button">
				<%
				if(search==null){
			%>
			<div class="text-center">
				<ul class="pagination" style="margin: 0 auto;">
					<%
          	int startPage=(pageNumber/10)*10+1;
          	if(pageNumber%10==0) startPage-=10;
          	int targetPage =cmpDAO.targetPage(pageNumber,isStudent);
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
			</div>
			</div>
			<br>
			<br>
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
   
   </div>
  </body>
</html>