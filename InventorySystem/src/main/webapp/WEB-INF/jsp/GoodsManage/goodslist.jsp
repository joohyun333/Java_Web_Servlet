<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>물품조회</title>
<!-- CSS -->
<link href="${pageContext.request.contextPath}/CSS/tradelist.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
<form name="goodslist" action="goodslist" enctype="multipart/form-data"
	method="post">
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
		<a href="../CustomersManage/cusMain">고객 관리</a> 
	</div>

	<div id="wrap">
		<h1>물품관리</h1>

		<span style="float: right;">
			<button type="button" id="plus" onclick="location.href='../GoodsManage/GoodsRegisterForm'">물품 추가</button>
		</span>
		</br>
		
		<table style="width: 90%">

			<tr>
				<th>물품번호</th>
				<th>물품명</th>
				<th>색상</th>
				<th>제조사</th>
				<th>브랜드</th>
				<th>가격</th>
				<th>사이즈</th>
				<th>수량</th>
				<th>수정</th>
				<th>삭제</th>
				<th>입/출고</th>
			</tr>
			<c:forEach items="${goodsList}" var="list">
				<tr>
					<td>${list.goodsNo}</td>
					<td>${list.goodsName}</td>
					<td>${list.goodsColor}</td>
					<td>${list.manufacturer}</td>
					<td>${list.brandName}</td>
					<td>${list.goodsPrice}</td>
					<td>${list.size}</td>
					<td>${list.totalAmount}</td>
					<td><input type="button" id="modify" name="modify"
						onclick="location.href='../GoodsManage/GoodsModifyForm?goodsNo=${list.goodsNo}'"
						value="수정"></td>
					<td><input type="button" id="delete" name="delete"
						onclick="location.href='../GoodsManage/goodsDelete?goodsNo=${list.goodsNo}'"
						value="삭제"></input></td>
					<td><input type="button" id="input" name="input"
						onclick="location.href='../TradeGoodsManage/inputlist?goodsNo=${list.goodsNo}&goodsName=${list.goodsName}&goodsPrice=${list.goodsPrice}&totalAmount=${list.totalAmount}'"
						value="거래 등록"></input></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</form>

<!-- 검색칸 -->
<div style="position: absolute; left: 40%; top: 340px;">
	<form name="search" action="../GoodsManage/goodslist" method="get">
		<select name="searchType">
			<option value="GoodsNo"
				<c:if test="${searchType eq GoodsNo}">selected="selected"</c:if>>물품번호</option>
			<option value="GoodsName"
				<c:if test="${searchType eq GoodsName}">selected="selected"</c:if>>물품명</option>
		</select> <input type="text" id="searchWord" name="searchWord" value="${searchWord}" /> <input
			type="submit" value="검색" id="btnSearch" />
	</form>
</div>

<br/><br/><br/><br/><br/><br/><br/><br/>

<footer id="footer">
	<div class="foo_div1"> 
		<h3>재고관리프로그램</h3> 
		<p>재고관리프로그램 was created by <span>비트교육 3조</span> / Designed by <span>비트교육 3조</span></p> 
	</div>
</footer>
</body>
</html>