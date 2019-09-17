package complaints;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import email.EmailDAO;
import util.Gmail;

public class ComplaintsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		MultipartRequest multi = null;
		int fileMaxSize = 10 * 1024 * 1024;
		String savePath = request.getRealPath("/upload").replaceAll("\\\\","/");
		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
		}catch(Exception e) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('파일 크기는 10MB를 넘을 수 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
		HttpSession session = request.getSession();
		String userID = multi.getParameter("userID");
		String cmpTitle = multi.getParameter("cmpTitle");
		String cmpContent = multi.getParameter("cmpContent");
		String cmpDivide = multi.getParameter("cmpDivide");
		int isStudent= Integer.parseInt(multi.getParameter("isStudent"));
		
		if(cmpTitle==null || cmpContent==null||cmpTitle.equals("")||cmpContent.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제목과 내용을 채워주세요.')");
			script.println("history.go(-2);");
			script.println("</script>");
			script.close();
			return;
		}
		File file = multi.getFile("cmpFile");
		ComplaintsDAO cmpDAO = new ComplaintsDAO();
		String cmpFile = "";
		String cmpRealFile = "";
		
		if(file !=null) {
			cmpFile = multi.getOriginalFileName("cmpFile");
			cmpRealFile = file.getName();
		}
		int result= cmpDAO.write(new ComplaintsDTO(0,userID,"",cmpTitle,cmpContent,cmpDivide,cmpFile,cmpRealFile,0,0,0,0,0,1,isStudent),isStudent);
		if(result!=1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");
			script.println("history.go(-2);");
			script.println("</script>");
			script.close();
			return;
		}
		
		EmailDAO emailDAO = new EmailDAO();
		
		String host="http://sejongsc.org/SnS/";
			String from="sjswsns@gmail.com";
			String to = emailDAO.getEmailAddress(cmpDivide);
			String subject ="[세종소융]민원이 접수되었습니다."+cmpDAO.getDate();
			String content ="제목: "+cmpTitle+"<br>접수날짜: "+cmpDAO.getDate()+"<br>"+cmpContent+
			"\n<a href='" + host + "cmp_View.jsp?isStudent="+isStudent+"&cmpID="+cmpDAO.countCmp(isStudent)+
					"'><br>민원 바로가기</a>";
			
			Properties p = new Properties();
			p.put("mail.smtp.user",from);
			p.put("mail.smtp.host","smtp.googlemail.com");
			p.put("mail.smtp.port","465");
			p.put("mail.smtp.starttls.enable","true");
			p.put("mail.smtp.auth","true");
			p.put("mail.smtp.debug","true");
			p.put("mail.smtp.socketFactory.port","465");
			p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback","false");
			
			try{
				Authenticator auth =new Gmail();
				Session ses=Session.getInstance(p,auth);
				ses.setDebug(true);
				MimeMessage msg=new MimeMessage(ses);
				msg.setSubject(subject);
				Address fromAddr=new InternetAddress(from);
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO,toAddr);
				msg.setContent(content,"text/html;charset=UTF8");
				Transport.send(msg);
			}catch(Exception e){
				e.printStackTrace();
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('오류가 발생했습니다.')");
				script.println("history.back();");
				script.println("</script>");
				script.close();
				return;
			}
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("history.go(-2);");
		script.println("</script>");
		script.close();
		return;
	}
}
