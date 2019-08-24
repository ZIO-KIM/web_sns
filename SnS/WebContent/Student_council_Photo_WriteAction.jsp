<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> 
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 파일 업로드</title>
</head>
<body>
	<%
		String directory=application.getRealPath("/upload/");
		//application 내장 객체 = 전체 프로젝트에 대한 자원을 관리하는 객체 , 서버의 실제 프로젝트 경로에서 자원을 찾을 때 가장 많이 사용 , upload폴더 안에 파일을 저장하도록 만들어줌 
		int maxSize=1024*1024*100; 
		String encoding="UTF-8";
		
		MultipartRequest multipartRequest //전달한 파일을 지정한 경로에 설정한 사이즈와 인코딩을 적용하여 실제로 파일 업로드를 수행
		=new MultipartRequest(request,directory,maxSize,encoding,
				new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasMoreElements()){
			String parameter = (String)fileNames.nextElement();
			String fileName=multipartRequest.getOriginalFileName(parameter);
			String fileRealName=multipartRequest.getFilesystemName(parameter);
			
			if(fileName==null) continue;
			//아래 확장자인 파일들만 업로드가 가능하도록 봉쇄
			if(!fileName.endsWith(".doc")&&!fileName.endsWith(".hwp")&&
					!fileName.endsWith(".pdf")&&!fileName.endsWith(".xls")&&
					!fileName.endsWith(".jpg")&&!fileName.endsWith(".png")){
				File file=new File(directory + fileRealName);
				file.delete(); //올바른 확장자가 아니라면 해당 파일 삭제 (multipartrequest를 통해 업로드가 되기 떄문에 업로드 후 삭제방식)
				out.write("업로드 할 수 없는 확장자입니다.");
			}else{
				new FileDAO().upload(fileName,fileRealName); //upload수행
				out.write("파일명:"+fileName+"<br>");
				out.write("실제 파일명:"+fileRealName+"<br>");		
			}
		}
	%>
</body>
</html>