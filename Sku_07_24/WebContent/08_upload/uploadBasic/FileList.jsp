<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="upload.service.*, upload.model.*" %>    

<%
	// Service���� selectList() ȣ��
	List <UploadRec> mList = UploadService.getInstance().selectList();
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ���ε� ȭ�� ��� </title>
</head>
<body>

	<table border='1' bordercolor='green'>
		<tr>
			<td> ��ȣ </td>
			<td> �ø��� </td>
			<td> ���ϸ� </td>
			<td> �ٿ�ε� </td>
		</tr>
		<% for( UploadRec rec : mList ) { %>
		<tr>
			<td><%= rec.getFileIdx() %></td>
			<td><%= rec.getWriter() %></td>
			<td><%= rec.getFilename() %></td>
			<td><a href="Download.jsp?idx=<%=rec.getFileIdx()%>">[�ٿ�ޱ�]</a></td>
		</tr>
		<% } %>

		
	</table>
</body>
</html>