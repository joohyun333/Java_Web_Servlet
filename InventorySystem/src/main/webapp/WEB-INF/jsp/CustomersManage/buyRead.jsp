<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 내역</title>
<!-- CSS -->
<link href="${pageContext.request.contextPath}/CSS/list.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
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
		<h1>거래 내역</h1>
		<span style="float: right;"> <input type="button" id="insert" name="insert" onclick="location.href='../CustomersManage/buyList'" value="뒤로 가기"></input>
		</span>
		<table>
			<tr>
				<th>거래 번호</th>
				<th>거래일자</th>
				<th>거래 구분</th>
				<th>수량</th>
				<th>총가격</th>
			</tr>

			<c:forEach items="${buyRead}" var="list">
				<tr>
					<td>${list.dealNumber}</td>
					<td>${list.date}</td>
					<td>${list.classification}</td>
					<th>${list.amount}</th>
					<th>${list.totalprice}</th>
				</tr>
			</c:forEach>

		</table>
	</div>
</body>
</html>
