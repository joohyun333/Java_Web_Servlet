<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="upload.model.*" %>
<%@ page import="upload.service.*" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>   
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>

<%  
	// 넘겨받는 한글 깨지지 않도록 지정
	request.setCharacterEncoding("euc-kr"); 
%>

<%	
	// 앞의 화면의 Form의 enctype이 multipart/form-data 인지 확인
	boolean isMutipart = ServletFileUpload.isMultipartContent( request );
	if( !isMutipart ){	return;	}
	
	// FileItem의 Factory를 설정 - 파일을 넘겨받으면 FileItem으로 지정되는데 그것을 관리하는 클래스 
	DiskFileItemFactory factory = new DiskFileItemFactory();
	
	// 업로드요청을 처리하는 ServletFileUpload 클래스 생성
	ServletFileUpload upload = new ServletFileUpload( factory );
	
	// 이전 화면에서 데이타를 넘겨받는 request 객체를 파싱하여 데이타를 FileItem 클래스의 List로 넘겨받음
	List <FileItem> items = upload.parseRequest( request );
	
	// List에 들어있는 내용들을 하나씩 얻어오고자 Iterator로 변환
	Iterator <FileItem> iters = items.iterator();
	
	// 객체 생성 ***
	UploadRec rec = new UploadRec();
	
	while( iters.hasNext())
	{
		// 넘겨받은 객체들을 하나씩 얻어오기
		FileItem item = iters.next();
		
		if( item.isFormField())	// 폼의 입력 항목이라면 [예] <input type='text'>의 입력값
		{
			// 폼의 이름을 얻어와서 그 이름에서 앞의 폼에서 지정한 이름을 찾아 그 값을 얻어온다
			String name = item.getFieldName();
			if( name.equals("writer")){			// 폼의 입력태그 중에 이름이 "writer"인가	
				String writer = item.getString("euc-kr");	// euc-kr을 지정하지 않으면 넘겨오는 한글이 깨짐
				rec.setWriter(writer);
			}									// 폼의 입력태그 중에 이름이 "explain"인가	
			else if( name.equals("explain")) rec.setExplain( item.getString("euc-kr"));
			
		}else{					// 폼에서 화일입력항목이라면 [예] <input type='file'>
			String name = item.getFieldName();
			if( name.equals("upFileFirst"))		// 폼의 화일태그 중에 "upFileFirst"인가
			{
				String realpath = FileSaveHelper.save("C:\\Users\\dlwngus\\eclipse-workspace\\web\\UI\\practice", item.getInputStream());
				rec.setFilename( item.getName()); 
				rec.setRealpath( realpath );		
			
			}
		}
	}
	// 데이타베이스로 입력
	// Service에서 insert() 호출 ***
	// 넘겨받는 데이타들을 저장할 클래스 ( 사용자 지정 )
	UploadService service = UploadService.getInstance();
	service.insert(rec);  // insert 메소드가 void 타입이므로 나눠 실행!

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 업로드 된 화일 정보보기 </title>
</head>
<body>
		<%=rec.getWriter() %>님께서 <%= rec.getFilename() %> 파일을 업로드 했습니다. <br/>
		화일 설명 : <%= rec.getExplain() %>

	  목록보기 할 때 :<a href="FileList.jsp"> [파일 목록보기] </a>  
</body>
</html>