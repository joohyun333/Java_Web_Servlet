<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 거래처 목록</title>
</head>
<body>
	<h2>판매 거래처 목록</h2>
	<hr/>
	<button onclick="location.href='../CustomersManage/cusInsert'">추가</button>
	<table>
		<colgroup>
			<col style="width: 5%;" />
			<col style="width: auto;" />
			<col style="width: 15%;" />
			<col style="width: 10%;" />
			<col style="width: 10%;" />
		</colgroup>
		<thead>
			<tr>
				<th>거래처 이름</th>
				<th>타입</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${selList}" var="list">
				<tr>
					<td>"${list.cusName}"</td>
					<td>"${list.classification}"</td>
					<td>"${list.phoneNo}"</td>
					<td>"${list.address}"</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</body>
</html>
