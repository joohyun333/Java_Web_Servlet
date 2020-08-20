<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 삭제</title>
</head>
<body>
	<form action="/CustomersManage/cusDeleteStart" method="post">
		<input type="hidden" name="cusName" value="${cusName}" />
		<input type="hidden" name="classification" value="${classification}" />
		<input type="hidden" name="phoneNo" value="${phoneNo}" />
		<input type="hidden" name="address" value="${address}" />
	</form>
	<script>
		alert("거래처 삭제 성공");
		location.href="../CustomersManage/selList";
	</script>
</body>
</html>