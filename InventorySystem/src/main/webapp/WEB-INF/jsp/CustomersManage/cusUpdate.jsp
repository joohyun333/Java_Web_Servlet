<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ŷ�ó ���� ����</title>
</head>
<body>
	<h2>�ŷ�ó ���� ����</h2>
	<hr />
	<form action="/cusUpdateStart" method="post">
		<table>
			<colgroup>
				<col style="width: 5%;" />
				<col style="width: auto;" />
				<col style="width: 15%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
			</colgroup>
			<tr>
				<td><label for="cusName">�ŷ�ó �̸� : <input type="text" name="cusName" id="cusName" value="${cusInfo.cusName}"></label></td>
				<td><label for="phoneNo">��ȭ��ȣ : <input type="text" name="phoneNo" id="phoneNo" value="${cusInfo.phoneNo}"></label></td>
				<td><label for="address">�ּ�: <input type="text" name="address" id="address" value="${cusInfo.address}"></label></td>
			</tr>
		</table>
		<!-- <input type="hidden" name="cusName" value="${cusName}" /> -->
		<input type="hidden" name="classification" value="${classification}" />
		<button type="submit" class="btn btn-primary">���� ����</button>
	</form>
</body>
</html>