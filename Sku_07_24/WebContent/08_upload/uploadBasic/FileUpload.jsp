<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<%@ page import="upload.model.*" %>
<%@ page import="upload.service.*" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>   
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>

<%  
	// �Ѱܹ޴� �ѱ� ������ �ʵ��� ����
	request.setCharacterEncoding("euc-kr"); 
%>

<%	
	// ���� ȭ���� Form�� enctype�� multipart/form-data ���� Ȯ��
	boolean isMutipart = ServletFileUpload.isMultipartContent( request );
	if( !isMutipart ){	return;	}
	
	// FileItem�� Factory�� ���� - ������ �Ѱܹ����� FileItem���� �����Ǵµ� �װ��� �����ϴ� Ŭ���� 
	DiskFileItemFactory factory = new DiskFileItemFactory();
	
	// ���ε��û�� ó���ϴ� ServletFileUpload Ŭ���� ����
	ServletFileUpload upload = new ServletFileUpload( factory );
	
	// ���� ȭ�鿡�� ����Ÿ�� �Ѱܹ޴� request ��ü�� �Ľ��Ͽ� ����Ÿ�� FileItem Ŭ������ List�� �Ѱܹ���
	List <FileItem> items = upload.parseRequest( request );
	
	// List�� ����ִ� ������� �ϳ��� �������� Iterator�� ��ȯ
	Iterator <FileItem> iters = items.iterator();
	
	// ��ü ���� ***
	UploadRec rec = new UploadRec();
	
	while( iters.hasNext())
	{
		// �Ѱܹ��� ��ü���� �ϳ��� ������
		FileItem item = iters.next();
		
		if( item.isFormField())	// ���� �Է� �׸��̶�� [��] <input type='text'>�� �Է°�
		{
			// ���� �̸��� ���ͼ� �� �̸����� ���� ������ ������ �̸��� ã�� �� ���� ���´�
			String name = item.getFieldName();
			if( name.equals("writer")){			// ���� �Է��±� �߿� �̸��� "writer"�ΰ�	
				String writer = item.getString("euc-kr");	// euc-kr�� �������� ������ �Ѱܿ��� �ѱ��� ����
				rec.setWriter(writer);
			}									// ���� �Է��±� �߿� �̸��� "explain"�ΰ�	
			else if( name.equals("explain")) rec.setExplain( item.getString("euc-kr"));
			
		}else{					// ������ ȭ���Է��׸��̶�� [��] <input type='file'>
			String name = item.getFieldName();
			if( name.equals("upFileFirst"))		// ���� ȭ���±� �߿� "upFileFirst"�ΰ�
			{
				String realpath = FileSaveHelper.save("C:\\Users\\dlwngus\\eclipse-workspace\\web\\UI\\practice", item.getInputStream());
				rec.setFilename( item.getName()); 
				rec.setRealpath( realpath );		
			
			}
		}
	}
	// ����Ÿ���̽��� �Է�
	// Service���� insert() ȣ�� ***
	// �Ѱܹ޴� ����Ÿ���� ������ Ŭ���� ( ����� ���� )
	UploadService service = UploadService.getInstance();
	service.insert(rec);  // insert �޼ҵ尡 void Ÿ���̹Ƿ� ���� ����!

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ���ε� �� ȭ�� �������� </title>
</head>
<body>
		<%=rec.getWriter() %>�Բ��� <%= rec.getFilename() %> ������ ���ε� �߽��ϴ�. <br/>
		ȭ�� ���� : <%= rec.getExplain() %>

	  ��Ϻ��� �� �� :<a href="FileList.jsp"> [���� ��Ϻ���] </a>  
</body>
</html>