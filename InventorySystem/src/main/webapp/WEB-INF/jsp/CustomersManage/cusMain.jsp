<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 관리</title>
<!-- CSS -->
<link href="${pageContext.request.contextPath}/CSS/list.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form>
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
			<input type="button" id="selList" name="selList" onclick="location.href='../CustomersManage/selList'" value="판매 거래처"></input>
			<input type="button" id="buyList" name="buyList" onclick="location.href='../CustomersManage/buyList'" value="구매 거래처"></input>
		</div>
	</form>
	<footer id="footer">
	<div class="foo_div1"> 
		<h3>재고관리프로그램</h3> 
		<p>재고관리프로그램 was created by <span>비트교육 3조</span> / Designed by <span>비트교육 3조</span></p> 
	</div>
</footer>
</body>
</html>
