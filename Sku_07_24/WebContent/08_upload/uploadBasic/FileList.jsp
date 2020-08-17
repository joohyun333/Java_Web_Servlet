<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="upload.service.*, upload.model.*" %>    

<%
	// Service에서 selectList() 호출
	List <UploadRec> mList = UploadService.getInstance().selectList();
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 업로드 화일 목록 </title>
</head>
<body>

	<table border='1' bordercolor='green'>
		<tr>
			<td> 번호 </td>
			<td> 올린이 </td>
			<td> 파일명 </td>
			<td> 다운로드 </td>
		</tr>
		<% for( UploadRec rec : mList ) { %>
		<tr>
			<td><%= rec.getFileIdx() %></td>
			<td><%= rec.getWriter() %></td>
			<td><%= rec.getFilename() %></td>
			<td><a href="Download.jsp?idx=<%=rec.getFileIdx()%>">[다운받기]</a></td>
		</tr>
		<% } %>

		
	</table>
</body>
</html>