package gallery;

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

public class GalleryUpdateServlet extends HttpServlet {
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
		String galTitle = multi.getParameter("galTitle");
		String galContent = multi.getParameter("galContent");
		int galID= 0;
		if(request.getParameter("galID")!=null) {
			galID=Integer.parseInt(request.getParameter("galID"));
		}
		
		if(galTitle==null || galContent==null||galTitle.equals("")||galContent.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 모두 채워주세요.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
		File file = multi.getFile("galFile");
		GalleryDAO galleryDAO = new GalleryDAO();
		
		
		if(file !=null) {
			String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
			if(ext.equals("jpg") ||ext.equals("png") ||ext.equals("gif")||ext.equals("jpeg")) {
				String galFile = multi.getOriginalFileName("galFile");
				String galRealFile = file.getName();
				galleryDAO.update(galID,galTitle, galContent,galFile,galRealFile);
				response.sendRedirect("student_council_photo.jsp");
				
			}else {
				if(file.exists()) {
					file.delete();
				}
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미지 파일만 업로드 할 수 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
				return;
			}
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('사진을 첨부해주세요.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}		
	}
}
