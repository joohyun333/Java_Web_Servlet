<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ŷ�ó �߰�</title>
</head>
<body>
	<h2>�ŷ�ó �߰�</h2>
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
				<td><label for="cusName">�ŷ�ó �̸� : <input type="text" name="cusName" id="cusName"></label></td>
				<td>
					<label for="classification">Ÿ�� : </label>
					<input type="radio" name="classification" id="classification" value="sel"><label>�Ǹ�</label>
					<input type="radio" name="classification" id="classification" value="buy"><label>����</label>				
				</td>
				<td><label for="phoneNo">��ȭ��ȣ : <input type="text" name="phoneNo" id="phoneNo"></label></td>
				<td><label for="address">�ּ�: <input type="text" name="address" id="address"></label></td>
			</tr>
		</table>
		<input type="submit" value="cusInsert">
	</form>
</body>
</html>