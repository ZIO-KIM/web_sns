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


public class PageImageServlet extends HttpServlet {
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
		File file = multi.getFile("pageImage");
		HttpSession session = request.getSession();
		if(file !=null) {
			String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
			if(ext.equals("ico")) {
				String prev = new PageDAO().searchPageImage();
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
				script.println("alert('아이콘 파이만 업로드 가능합니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
				return;
			}
		}
		new PageDAO().ImageUpdate(fileName);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('대표이미지가 변경되었습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}

}
