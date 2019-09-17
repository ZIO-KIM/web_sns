package page;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class PageLogoServlet extends HttpServlet {
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
		String fileName="";
		File file = multi.getFile("pageLogo");
		HttpSession session = request.getSession();
		if(file !=null) {
			String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
			if(ext.equals("jpg") ||ext.equals("png") ||ext.equals("gif")||ext.equals("JPG") ||ext.equals("PNG") ||ext.equals("GIF")) {
				String prev = new PageDAO().searchPageLogo();
				File prevFile = new File(savePath + "/" + prev);
				if(prevFile.exists()) {
					prevFile.delete();
				}
				fileName = file.getName();
			}else {
				if(file.exists()) {
					file.delete();
				}
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미지 파일만 업로드 가능합니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
				return;
			}
		}
		new PageDAO().logoUpdate(fileName);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('홈페이지 로고가 변경되었습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}

}
