<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>물품등록</title>
<!-- CSS -->
<link href="${pageContext.request.contextPath}/CSS/tradelist.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
<form name="GoodsRegister" action="GoodsRegister"
	enctype="multipart/form-data" method="post">
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
		<a href="../mainCallback">메인</a> <a href="goodslist">물품관리</a> <a
			href="../TradeGoodsManage/tradelist">물류 관리</a> <a
			href="../Imformation/goods">정보 조회</a> <a
			href="../CustomersManage/cusMain">고객 관리</a>
	</div>

	<!--  	<form action="../GoodsManage/GoodsRegister" method="post">-->
	<div id="wrap">
		<table>
			<tr>
				<th>물품 번호</th>
				<th>물품명</th>
				<th>색상</th>
				<th>제조사</th>
				<th>브랜드</th>
				<th>가격</th>
				<th>사이즈</th>
				<th>수량</th>
			</tr>
			<tr>
				<td><input type="text" name="goodsNo"></td>
				<td><input type="text" name="goodsName"></td>
				<td><input type="text" name="goodsColor"></td>
				<td><input type="text" name="manufacturer"></td>
				<td><input type="text" name="brandName"></td>
				<td><input type="text" name="goodsPrice"></td>
				<td><input type="text" name="size"></td>
				<td><input type="text" name="totalAmount"></td>
			</tr>
		</table>
		<div id=input_group>
			<span style="float: right;">
				<button type="submit" id="input">입력</button>
				<button type="button" id="cancle"
					onclick="location.href='../GoodsManage/goodslist'">취소</button>
			</span>
		</div>
	</div>
</form>

<br/><br/><br/><br/><br/><br/><br/><br/>

<footer id="footer">
	<div class="foo_div1"> 
		<h3>재고관리프로그램</h3> 
		<p>재고관리프로그램 was created by <span>비트교육 3조</span> / Designed by <span>비트교육 3조</span></p> 
	</div>
</footer>
</body>
</html>