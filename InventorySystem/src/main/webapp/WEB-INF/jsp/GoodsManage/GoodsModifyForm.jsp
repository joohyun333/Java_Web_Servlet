<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>물품수정</title>
<!-- CSS -->
<link href="${pageContext.request.contextPath}/CSS/GoodsRegister.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<!--  <form name="GoodsModify" action="GoodsModify" enctype="multipart/form-data" method="post"> -->
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
		<a href="../mainCallback">메인</a> 
			<a href="goodslist">물품관리</a> 
			<a href="../TradeGoodsManage/tradelist">물류 관리</a> 
			<a href="../Imformation/goods">정보 조회</a> 
			<a href="../CustomersManage/selList">고객 관리</a> 
			<a href="../Statistics/customers'">통계정보</a>
	</div>

	<div id="wrap">
		<form action="../GoodsManage/goodsModify" method="post">
			<table>
				<tr>
					<td>물품번호</td>
					<td><input type="text" name="goodsNo" value="${goods.goodsNo}"></td>
				</tr>
				<tr>
					<td>물품명</td>
					<td><input type="text" name="goodsName"
						value="${goods.goodsName}"></td>
				</tr>
				<tr>
					<td>색상</td>
					<td><input type="text" name="goodsColor"
						value="${goods.goodsColor}"></td>
				</tr>
				<tr>
					<td>제조사</td>
					<td><input type="text" name="manufacturer"
						value="${goods.manufacturer}"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="goodsPrice"
						value="${goods.goodsPrice}"></td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td><input type="text" name="size" value="${goods.size}"></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="text" name="totalAmount"
						value="${goods.totalAmount}"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">입력</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>