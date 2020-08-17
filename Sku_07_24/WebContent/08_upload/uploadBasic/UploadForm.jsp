<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 화일 업로드</title>
</head>
<body>

<form action="FileUpload.jsp" name='frm' method="post" enctype="multipart/form-data">
	자료 올린이 : <input type="text" name="writer" /><br/><br/>
	자료 설명 : <input type="text" name="explain"/> <br/><br/>
	업로드할 화일 : <input type="file" name="upFileFirst"/> <br/><br/>	
	<input type="submit" value="전송"/>
</form>
</body>
</html>

