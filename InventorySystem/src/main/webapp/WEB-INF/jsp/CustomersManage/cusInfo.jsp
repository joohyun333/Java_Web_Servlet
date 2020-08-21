<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 정보</title>
</head>
<body>
	<h2>거래처 정보</h2>
	<% if (session.getAttribute("email") == null){
	out.println("<a href= '/InventorySystem/Main/main'>로그인이 안되었습니다.</a></br>");
}else{
	String email = (String)session.getAttribute("email");
	out.println(email+"님 반갑습니다.</br></br>");
} %>
	<hr />
	<form method="post">
		<table>
			<colgroup>
				<col style="width: 5%;" />
				<col style="width: auto;" />
				<col style="width: 15%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
			</colgroup>
			<tr>
				<td>거래처 이름 : <input type="text" name="cusName" id="cusName" value="${cusInfo.cusName}"></td>
				<td>타입 : <input type="text" name="classification" id="classification" value="${cusInfo.classification}"></td>
				<td>전화번호 : <input type="text" name="phoneNo" id="phoneNo" value="${cusInfo.phoneNo}"></td>
				<td>주소: <input type="text" name="address" id="address" value="${cusInfo.address}"></td>
			</tr>
		</table>
	</form>
</body>
</html>