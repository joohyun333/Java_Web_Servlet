<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 거래처 목록</title>
<!-- CSS -->
<link href="${pageContext.request.contextPath}/CSS/list.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form name="sellist" enctype="multipart/form-data" method="post">
		<h1 id="title">재고관리프로그램</h1>
		<%
			if (session.getAttribute("email") == null) {
				out.println("<a href= '/InventorySystem/Main/main'>로그인이 안되었습니다.</a></br>");
			} else {
				String email = (String) session.getAttribute("email");
				out.println(email + "님 반갑습니다.</br></br>");
			}
		%>
		<div class="topnav">
			<a href="../Main/main">메인</a>
			<a href="../GoodsManage/goodslist">물품 관리</a>
			<a href="../TradeGoodsManage/tradelist">물류 관리</a>
			<a href="../Imformation/goods">정보 조회</a>
			<a href="../CustomersManage/cusMain">거래처 관리</a>
		</div>
		<div id="wrap">
			<h1>판매 거래처 목록</h1>
			<span style="float: right;">
				<button type="button" id="insert" name="insert" onclick="location.href='../CustomersManage/cusInsert'">거래처 추가</button>
			</span>
			<table>
				<tr>
					<th>거래처 이름</th>
					<th>타입</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>

				<c:forEach items="${selList}" var="list">
					<!-- <tr onclick="location.href='../CustomersManage/selRead?cusName=${list.cusName}'"> -->
					<tr>
						<td style="cursor: pointer;" onclick="location.href='../CustomersManage/selRead?cusName=${list.cusName}'">${list.cusName}</td>
						<td>${list.classification}</td>
						<td>${list.phoneNo}</td>
						<td>${list.address}</td>
						<td><input type="button" id="update" name="update" onclick="location.href='../CustomersManage/cusUpdate?cusName=${list.cusName}'" value="수정"></td>
						<td><input type="button" id="delete" name="delete" onclick="location.href='../CustomersManage/cusDelete?cusName=${list.cusName}'" value="삭제"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>
