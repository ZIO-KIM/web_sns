<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<title>�꽭醫낅��븰援� �냼�봽�듃�썾�뼱�쑖�빀���븰 :: �븰�깮�쉶 :: 媛ㅻ윭由� :: 湲��벐湲�</title>
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
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/PSB.css">
<link rel="stylesheet" href="css/photo.css">

<style type="text/css">
.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}

.file {
	visibility: hidden;
	position: absolute;
}
</style>

</head>
<body>

	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('濡쒓렇�씤�쓣 �빐二쇱꽭�슂.')");
			script.println("location.href='userLogin.jsp'");
			script.println("</script>");
			script.close();
		}
	%>

	<header>
		<nav id='first_area'>
			<a href='index.jsp'><img src="imgs/software_convergence_logo.PNG"
				id='logo' alt="�냼�쑖�� 濡쒓퀬"></a>
			<!-- �냼�쑖�� 濡쒓퀬 -->
			<div id="menubar">
				<ul>
					<!-- �궗�씠�듃 ���씠�� �븯�떒 硫붾돱諛� -->
					<li>�븰�깮�쉶 <!-- 硫붾돱諛� 泥ル쾲吏� - �븰�깮�쉶 移댄뀒怨좊━ -->
						<ul id='submenu'>
							<li><a href='student_council_introduce.jsp'>�븰�깮�쉶 �냼媛�</a></li>
							<li><a href='student_council_photo.jsp'>媛ㅻ윭由�</a></li>
							<li><a href='student_council_events.jsp'>�뻾�궗</a></li>
							<li><a href='student_council_public_money.jsp'>�븰�깮�쉶鍮� �궡�뿭</a></li>
							<li><a href='departments.jsp'>怨쇰퀎 寃뚯떆�뙋</a></li>
						</ul>
					</li>

					<li>誘쇱썝 <!-- 硫붾돱諛� �몢踰덉㎏ - 誘쇱썝 移댄뀒怨좊━ -->
						<ul id='submenu'>
							<li><a href='cmp_to_student_council.jsp'>�븰�깮�쉶 嫄댁쓽�궗�빆</a></li>
							<li><a href='cmp_to_school.jsp'>�븰援� 嫄댁쓽�궗�빆</a></li>
							<li><a href='introduce_cmp.jsp'>誘쇱썝李쎄뎄 �냼媛�</a></li>
						</ul>
					</li>

					<li>�삁鍮� �냼�쑖�씤 <!-- 硫붾돱諛� �꽭踰덉㎏ - �삁鍮� �냼�쑖�씤 移댄뀒怨좊━ -->
						<ul id='submenu'>
							<li><a href='admission_reviews.jsp'>�꽑諛곕뱾�쓽 �엯�떆 �썑湲�</a></li>
							<li><a href='admission_qnas.jsp'>QnA</a></li>
						</ul>
					</li>

					<li>痍⑥뾽&amp;議몄뾽 <!-- 硫붾돱諛� �꽕踰덉㎏ - 痍⑥뾽&議몄뾽 移댄뀒怨좊━ -->
						<ul id='submenu'>
							<li><a href='employ_reviews.jsp'>痍⑥갹�뾽 �썑湲�</a><br></li>
							<li><a href='graduate_interviews.jsp'>議몄뾽�깮 �씤�꽣酉�</a><br></li>
							<li><a href='graduate_qnas.jsp'>議몄뾽�깮 QnA</a><br></li>
						</ul>
					</li>

					<li>�솉蹂� <!-- 硫붾돱諛� �떎�꽢踰덉㎏ - �솉蹂� 移댄뀒怨좊━ -->
						<ul id='submenu'>
							<li><a href='school_contests.jsp'>援먮궡 怨듬え�쟾</a><br></li>
							<li><a href='not_school_contests.jsp'>援먯쇅 怨듬え�쟾</a><br></li>
						</ul>
					</li>

					<li>QnA <!-- 硫붾돱諛� �뿬�꽢踰덉㎏ - QnA 移댄뀒怨좊━ -->
						<ul id='submenu'>
							<li><a href='chatbot.jsp'>Chatbot</a><br></li>
							<li><a href='qna.jsp'>QnA</a><br></li>
						</ul>
					</li>
				</ul>
			</div>

			<h1 id='language'>�븳援��뼱 / EN</h1>
			<!--�쁺�뼱, �븳湲� 踰꾩쟾 諛붽씀�뒗 踰꾪듉-->
			<h1 id='login'>
				<a href="userLogin.jsp">LOGIN</a>
			</h1>
			<!-- 濡쒓렇�씤 踰꾪듉-->
		</nav>
	</header>
	<div id="container">
		<nav>
			<nav>
				<h2>
					<span></span> 媛ㅻ윭由�
				</h2>
				<ul class="lnb_deps2">
					<li><a href="student_council_introduce.jsp"
						class="jwxe_22350 active">�븰�깮�쉶 �냼媛�</a></li>
					<li><a href="student_council_photo.jsp" class="jwxe_22351 ">媛ㅻ윭由�</a>
					</li>
					<li><a href="student_council_events.jsp" class="jwxe_22351 ">�뻾�궗</a>
					</li>
					<li><a href="student_council_public_money.jsp"
						class="jwxe_22351 ">�븰�깮�쉶鍮� �궡�뿭</a></li>
				</ul>
			</nav>
		</nav>
		<section class="content">
			<header>
				<h1>湲��벐湲�</h1>
			</header>
			<form method="post" action="./gallery" enctype="multipart/form-data">

				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>�궗�슜�옄 �븘�씠�뵒</th>
							<td colspan="2"><input type="text" name="userID"
								value=<%=userID%>></td>
						</tr>
						<tr>
							<th>�젣紐�:</th>
							<td><input type="text" placeholder="�젣紐⑹쓣 �엯�젰�븯�꽭�슂. "
								name="galTitle" maxlength="50" class="form-control" /></td>
						</tr>
						<tr>
							<th>�궡�슜:</th>
							<td><textarea cols="10" placeholder="�궡�슜�쓣 �엯�젰�븯�꽭�슂. "
									maxlength="2048" name="galContent" class="form-control"></textarea></td>
						</tr>
						<tr>
							<th>�궗吏� �뾽濡쒕뱶</th>
							<td colspan="2"><input type="file" name="galFile"
								class="file">
								<div class="input-group col-xs-12">
									<span class="input-group-addon"><i class="fa fa-image"></i></span>
									<input type="text" class="form-control input-lg" disabled
										placeholder="�씠誘몄�瑜� �뾽濡쒕뱶 �븯�꽭�슂."> <span
										class="input-group-btn">
										<button class="browse btn btn-primary input-lg" type="button">
											<i class="fa fa-search"></i>�뙆�씪 李얘린
										</button>
									</span>
								</div></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit"
								class="btn btn-primary pull-right" value="�옉�꽦�븯湲�"></td>
						</tr>

					</tbody>
				</table>
			</form>

		</section>
	</div>

	<footer>
		<p id='footer_content' style="position:absolute;bottom:0;width:100%;height:70px;">
			010-0000-0000 | sejongsc3@gmail.com | �븰�깮�쉶愿� 409�샇 <br> COPYRIGHT
			&copy 2019 �꽭醫낅��븰援� �냼�봽�듃�썾�뼱�쑖�빀���븰 �뜲�떒�븳 �궗�엺�뱾 All rights reserved.
		</p>
	</footer>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		$(document).on('click', '.browse', function() {
			var file = $(this).parent().parent().parent().find('.file');
			file.trigger('click');
		});
		$(document).on(
				'change',
				'.file',
				function() {
					$(this).parent().find('.form-control').val(
							$(this).val().replace(/C:\\fakepath\\/i, ''));
				});
	</script>

</body>
</html>
