<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> 
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="Gallery.GalleryDAO" %>
<%@ page import="Gallery.Gallery" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 파일 업로드</title>
</head>
<body>
<%
		String directory=application.getRealPath("/upload/");
		int maxSize=1024*1024*100; 
		String encoding="UTF-8";
		
		MultipartRequest multi=new MultipartRequest(request,directory,maxSize,
				new DefaultFileRenamePolicy());
		
		String galTitle=multi.getParameter("galTitle");
		String galContent=multi.getParameter("galContent");
		
		String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		if(userID==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='userLogin.jsp'");
			script.println("</script>");
		}else{
			if(galTitle==null ||galContent==null ||galTitle.equals("")||galContent.equals("")){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				GalleryDAO galleryDAO=new GalleryDAO();
				int result=galleryDAO.write(galTitle,userID,galContent);
				if(result==1){
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('글이 등록되었습니다.')");
					script.println("location.href='student_council_photo.jsp'");
					script.println("</script>"); 
					
				}else{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} 
			}
		}
		Enumeration fileNames = multi.getFileNames();
			
		while(fileNames.hasMoreElements()){
			String parameter = (String)fileNames.nextElement();
			String fileName=multi.getOriginalFileName(parameter);
			String fileRealName=multi.getFilesystemName(parameter);
				
			if(fileName==null) continue;
			//아래 확장자인 파일들만 업로드가 가능하도록 봉쇄
			if(!fileName.endsWith(".doc")&&!fileName.endsWith(".hwp")&&
					!fileName.endsWith(".pdf")&&!fileName.endsWith(".xls")&&
					!fileName.endsWith(".jpg")&&!fileName.endsWith(".png")){
				File file=new File(directory + fileRealName);
				file.delete(); //올바른 확장자가 아니라면 해당 파일 삭제 (multipartrequest를 통해 업로드가 되기 떄문에 업로드 후 삭제방식)
				out.write("업로드 할 수 없는 확장자입니다.");
			}else{
				int result = new FileDAO().upload(fileName,fileRealName); //upload수행
				if(result==1){
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('게시글이 등록되었습니다.')");
					script.println("location.href='student_council_photo.jsp'");
					script.println("</script>");
				}else{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('게시글 등록에 실패하였습니다.')");
					script.println("location.href='student_council_photo.jsp'");
					script.println("</script>");
				}
				
			}
		}
%>
</body>
</html>