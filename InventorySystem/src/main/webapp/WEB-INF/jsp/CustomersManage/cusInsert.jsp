<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>거래처 추가</title>
</head>
<body>
	<h2>거래처 추가</h2>
	<hr />
	<form action="/cusInsertStart" method="post">
		<table>
			<colgroup>
				<col style="width: 5%;" />
				<col style="width: auto;" />
				<col style="width: 15%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
			</colgroup>
			<tr>
				<td><label for="cusName">거래처 이름 : <input type="text" name="cusName" id="cusName"></label></td>
				<td>
					<label for="classification">타입 : </label>
					<input type="radio" name="classification" id="classification" value="sel"><label>판매</label>
					<input type="radio" name="classification" id="classification" value="buy"><label>구매</label>				
				</td>
				<td><label for="phoneNo">전화번호 : <input type="text" name="phoneNo" id="phoneNo"></label></td>
				<td><label for="address">주소: <input type="text" name="address" id="address"></label></td>
			</tr>
		</table>
		<input type="submit" value="cusInsert">
	</form>
</body>
</html>