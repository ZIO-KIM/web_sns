package email;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class EmailOpenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		int emailID = 0;
		if(request.getParameter("emailID")!=null) {
			emailID=Integer.parseInt(request.getParameter("emailID"));
		}
		String divide = null;
		if(request.getParameter("divide")!=null) {
			divide=request.getParameter("divide");
		}
		String email = null;
		if(request.getParameter("email")!=null) {
			email=request.getParameter("email");
		}
		
		if(emailID==0 ||divide==null ||divide.equals("")||email==null ||email.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('빈칸을 모두 채워주세요.')");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		EmailDAO emailDAO = new EmailDAO();
		emailDAO.open(new EmailDTO(emailID,divide,email,1));

		session.setAttribute("messageType", "성공 메시지");
		session.setAttribute("messageContent", "이메일 수신 개설이 완료되었습니다.");
		response.sendRedirect("admin_email.jsp");
		return;
	}
}
