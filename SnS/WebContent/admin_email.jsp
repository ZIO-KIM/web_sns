<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="email.EmailDAO" %>
<%@ page import="email.EmailDTO" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<title>세종소융 관리자페이지</title>
<link rel="shortcut icon" type="image/x-icon" href="imgs/favicon.ico">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
<link rel="stylesheet" href="css/bootstrap1.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		UserDAO userDAO=new UserDAO();
		int userLevel=userDAO.getUserEmailChecked(userID);
		if (userLevel<2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='admin.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
		EmailDAO emailDAO = new EmailDAO();
	%>
	
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
							<h4 class="modal-title">
								<%=messageType %>
							</h4>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
								<span class="sr-only">Close</span>
							</button>
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

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<a class="navbar-brand" href="admin.jsp">세종소융 관리자</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
  		<div class="collapse navbar-collapse" id="navbarNavDropdown">
    		<ul class="navbar-nav">
      			<li class="nav-item active">
        			<a class="nav-link" href="admin_user.jsp">User <span class="sr-only">(current)</span></a>
      			</li>
      			<li class="nav-item">
       	 		<a class="nav-link" href="admin_board.jsp">Board</a>
     	 		</li>
     	 		<li class="nav-item">
       	 		<a class="nav-link" href="admin_email.jsp">Email</a>
     	 		</li>
     	 		<li class="nav-item">
      			  <a class="nav-link" href="admin_report.jsp">Report</a>
    			  </li>
     	 		<li class="nav-item">
       	 		<a class="nav-link" href="admin_customizing.jsp">Customizing</a>
     	 		</li>
      			<li class="nav-item dropdown" style="float:right !important;">
        			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         	 		SJSW Link
        			</a>
       				 <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
         				 <a class="dropdown-item" href="index.jsp">Main</a>
         				 <a class="dropdown-item" href="cmp_to_student_council.jsp">Complaints</a>
         				 <a class="dropdown-item" href="student_council_photo.jsp">Gallery</a>
       				 </div>
      			</li>
				<li class="nav-item"><a class="nav-link" href="userLogoutAction.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>

	<div id="modal-login" class="modal fade">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">관리자 로그인</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
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
							<label for="keep_signed" onclick="jQuery('#modal-login input[name=\'keep_signed\']').click();">
							<input type="checkbox" name="keep_signed" value="Y"
								onclick="if(this.checked) return confirm('브라우저를 닫더라도 로그인이 계속 유지될 수 있습니다.\n\n로그인 유지 기능을 사용할 경우 다음 접속부터는 로그인할 필요가 없습니다.\n\n단, 게임방, 학교 등 공공장소에서 이용 시 개인정보가 유출될 수 있으니 꼭 로그아웃을 해주세요.');">
							로그인 유지</label>
						</div>
						<button type="submit" id="btnLogin" class="btn btn-block">
							<i class="fa fa-sign-in" aria-hidden="true"></i> 로그인
						</button>
						<br>
					</form>
				</div>
			</div>
		</div>
	</div>

 	<div class="col-md-12">
    	<div class="card card-plain table-plain-bg">
			<div class="card-header ">
				<h4 class="card-title">이메일 관리</h4>
				<p style="display:inline-block;"class="card-category">민원 등록 시에 발송되는 이메일을 관리할 수 있습니다.</p>
				<button type="button" style="display:inline-block;" class="btn btn-primary pull-right" data-toggle="modal" data-target="#updateModal">이메일 수신지 수정하기</button>
				<button type="button" style="display:inline-block; margin-right:1%;" class="btn btn-primary pull-right" data-toggle="modal" data-target="#openModal">이메일 수신지 개설하기</button>				

				<div class="modal fade" id="openModal" tabindex="-1"
					role="dialog" aria-labelledby="openModal"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="openModalLabel">이메일 수신지 개설</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="./emailOpen" method="post">
							<div class="modal-body">
									<div class="form-group">
										<label for="board-id" class="col-form-label">이메일 구분ID:</label>
										<input type="text" class="form-control" name="emailID" value="<%=emailDAO.getNext()%>">
									</div>
									<div class="form-group">
										<label for="board-title" class="col-form-label">민원 구분</label>
										<input type="text" class="form-control" name="divide">
									</div>
									
									<div class="form-group">
										<label for="board-url" class="col-form-label">이메일 주소</label>
										<input type="text" class="form-control" name="email">
									</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">open Board
								</button>
							</div>
							</form>
						</div>
					</div>
				</div>
					
				<div class="modal fade" id="updateModal" tabindex="-1"
					role="dialog" aria-labelledby="updateModal"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="updateModalLabel">이메일 수신지 업데이트</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="./emailUpdate" method="post">
							<div class="modal-body">
									<div class="form-group">
										<label for="email-id" class="col-form-label">변경할 이메일 수신지의 ID:</label>
										<input type="text" class="form-control" name="emailID">
									</div>
									<div class="form-group">
										<label for="email-title" class="col-form-label">변경할 이메일 수신지의 구분:</label>
										<input type="text" class="form-control" name="emailTitle">
									</div>
									<div class="form-group">
										<label for="email-title" class="col-form-label">변경할 이메일 수신지 주소</label>
										<input type="text" class="form-control" name="emailURL">
									</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Update email
								</button>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body table-full-width table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
						<th>ID</th>
						<th>Divide</th>
						<th>Email</th>
						<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<EmailDTO> list = emailDAO.getList();
							int emailLevel=0;
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getEmailID()%></td>
							<td><%=list.get(i).getDivide()%></td>
							<td><%=list.get(i).getEmail()%></td>
							<%
								if(list.get(i).getStatus()==1){
							%>
							<td><a onclick="return confirm('정말로 게시판을 비활성화시키겠습니까?')" href="admin_email_Ban.jsp?emailID=<%=list.get(i).getEmailID() %>" class="btn btn-success">활성화</a></td>
							<%
								}else{
							%>
							<td><a onclick="return confirm('정말로 게시판을 활성화시키겠습니까?')" href="admin_email_unBan.jsp?emailID=<%=list.get(i).getEmailID() %>" class="btn btn-danger">비활성화</a></td>
							<%
								}
							%>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

 
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
</body>

</html>
