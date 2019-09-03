<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="complaints.ComplaintsDAO"%>
<%@ page import="complaints.ComplaintsDTO"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<title>세종대학교 소프트웨어융합대학 :: 민원 :: 학생회 건의사항</title>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/PSB.css">
<link rel="stylesheet" href="css/joinpage.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		if (session.getAttribute("userID") != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href='index.jsp'");
			script.println("</script>");
			script.close();
		}
	%>
	<script type="text/javascript">
		function confirmPw() {
			var pw = document.getElementById("pw").value;
			var pwconfirm = document.getElementById("pwconfirm").value;

			if (pw != pwck) {
				alert('비밀번호가 틀렸습니다. 다시 입력해 주세요');
				return false;
			}
		}
	</script>

	<header>
		<nav id='first_area'>
			<a href='index.jsp'><img src="imgs/software_convergence_logo.PNG"
				id='logo' alt="소융대 로고"></a>
			<!-- 소융대 로고 -->
			<div id="menubar">
				<ul>
					<!-- 사이트 타이틀 하단 메뉴바 -->
					<li><a href='student_council.jsp'>학생회</a> <!-- 메뉴바 첫번째 - 학생회 카테고리 -->
						<ul id='submenu'>
							<li><a href='student_council_introduce.jsp'>학생회 소개</a></li>
							<li><a href='student_council_photo.jsp'>갤러리</a></li>
							<li><a href='student_council_events.jsp'>행사</a></li>
							<li><a href='student_council_public_money.jsp'>학생회비 내역</a></li>
						</ul></li>

					<li><a href='complaints.jsp'>민원</a> <!-- 메뉴바 두번째 - 민원 카테고리 -->
						<ul id='submenu'>
							<li><a href='cmp_to_student_council.jsp'>학생회 건의사항</a></li>
							<li><a href='cmp_to_school.jsp'>학교 건의사항</a></li>
							<li><a href='introduce_cmp.jsp'>민원창구 소개</a></li>
						</ul></li>

					<li><a href='pre_sju_student.jsp'>예비 소융인</a> <!-- 메뉴바 세번째 - 예비 소융인 카테고리 -->
						<ul id='submenu'>
							<li><a href='admission_reviews.jsp'>선배들의 입시 후기</a></li>
							<li><a href='admission_qnas.jsp'>QnA</a></li>
						</ul></li>

					<li><a href='employ_n_grauation.jsp'>취업 & 졸업</a> <!-- 메뉴바 네번째 - 취업&졸업 카테고리 -->
						<ul id='submenu'>
							<li><a href='employ_reviews.jsp'>취창업 후기</a><br></li>
							<li><a href='graduate_interviews.jsp'>졸업생 인터뷰</a><br></li>
							<li><a href='graduate_qnas.jsp'>졸업생 QnA</a><br></li>
						</ul></li>

					<li><a href='contest_promotions.jsp'>홍보</a> <!-- 메뉴바 다섯번째 - 홍보 카테고리 -->
						<ul id='submenu'>
							<li><a href='school_contests.jsp'>교내 공모전</a><br></li>
							<li><a href='not_school_contests.jsp'>교외 공모전</a><br></li>
						</ul></li>

					<li><a href='questions.jsp'>QnA</a> <!-- 메뉴바 여섯번째 - QnA 카테고리 -->
						<ul id='submenu'>
							<li><a href='chatbot.jsp'>Chatbot</a><br></li>
							<li><a href='qna.jsp'>QnA</a><br></li>
						</ul></li>
				</ul>
			</div>
			<h1 id='language'>한국어 / EN</h1>
			<!--영어, 한글 버전 바꾸는 버튼-->
			<%
        	if(userID==null){
        %>
			<h2 id='login'>
				<a href="userLogin.jsp"
					style="text-decoration: none; color: #000000">LOGIN</a>
			</h2>
			<%
        	}
        %>
		</nav>
	</header>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="joinAction.jsp" onsubmit="return confirmPw()">
					<h3 id="join">SIGN UP</h3>
					<label for="id" class="control-label">
						<em style="color:red">*</em> 아이디 (닉네임으로 사용)
					</label>
					<div class="form-group">
						<input type="text" class="form-control"
							name="userID" maxlength="20" required>
					</div>
					<label for="password" class="control-label">
						<em style="color:red">*</em> 비밀번호
					</label>
					<div class="form-group">
						<input type="password" class="form-control" id="pw" placeholder="비밀번호"
							name="userPassword" maxlength="20" required>
					</div>
					<label for="passwordConfirm" class="control-label">
						<em style="color:red">*</em> 비밀번호확인
					</label>
					<div class="form-group">
						<input type="password" class="form-control" id="pwconfirm" placeholder="비밀번호확인"
							name="userPasswordConfirm" maxlength="20">
					</div>
					<label for="name" class="control-label">
						<em style="color:red">*</em> 이름
					</label>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" 
							name="userName" maxlength="20">
					</div>
					<label for="email" class="control-label">
						<em style="color:red">*</em> 학교이메일 (인증을 위해 필요)
					</label>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="학교이메일"
							name="userEmail" maxlength="50">
					</div>
					<label for="user_id" class="control-label">
						<em style="color:red">*</em> 성별
					</label>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label id="btn_gen_m" class="btn btn-primary active"> <input
								type="radio" name="userGender" autocomplete="off" value="남자"
								checked>남자
							</label> <label id="btn_gen_w" class="btn btn-primary"> <input
								type="radio" name="userGender" autocomplete="off" value="여자">여자								
						</div>
					</div>
					<div class="control-group">
						<label for="find_account_question" class="control-label"><em
							style="color: red">*</em> 비밀번호 찾기 질문/답변</label>
						<div class="controls">
							<select name="find_account_question" id="find_account_question"
								style="display: block; margin: 0 0 8px 0"><option
									value="1">다른 이메일 주소는?</option>
								<option value="2">나의 보물 1호는?</option>
								<option value="3">나의 출신 초등학교는?</option>
								<option value="4">나의 출신 고향은?</option>
								<option value="5">나의 이상형은?</option>
								<option value="6">어머니 성함은?</option>
								<option value="7">아버지 성함은?</option>
								<option value="8">가장 좋아하는 색깔은?</option>
								<option value="9">가장 좋아하는 음식은?</option></select><input type="text"
								name="find_account_answer" id="find_account_answer"
								title="비밀번호 찾기 답변" value="">
						</div>
					</div>
					
					
					<input id="btn_log" type="submit"
						class="btn btn-primary form-control" value="SIGN UP">
				</form>
				<br>
				<p id="namemark">
					<img src="imgs/sjnamemark.png" alt="namemark">
				</p>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>
