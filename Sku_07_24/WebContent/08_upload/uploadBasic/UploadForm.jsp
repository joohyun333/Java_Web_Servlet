<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ȭ�� ���ε�</title>
</head>
<body>

<form action="FileUpload.jsp" name='frm' method="post" enctype="multipart/form-data">
	�ڷ� �ø��� : <input type="text" name="writer" /><br/><br/>
	�ڷ� ���� : <input type="text" name="explain"/> <br/><br/>
	���ε��� ȭ�� : <input type="file" name="upFileFirst"/> <br/><br/>	
	<input type="submit" value="����"/>
</form>
</body>
</html>

