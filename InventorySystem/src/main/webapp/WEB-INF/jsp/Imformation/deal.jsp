<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>거래내역조회</title>
<!-- CSS -->
<link href="${pageContext.request.contextPath}/CSS/tradelist.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1 id="title">재고관리프로그램</h1>
<% if (session.getAttribute("email") == null){
	out.println("<a href= '/InventorySystem/Main/main'>로그인이 안되었습니다.</a></br>");
}else{
	String email = (String)session.getAttribute("email");
	out.println(email+"님 반갑습니다.</br></br>");
} %>
<div class="topnav">
	<a href="../mainCallback">메인</a>
	<a href="../GoodsManage/goodslist">물품 관리</a>
	<a href="../TradeGoodsManage/tradelist">물류 관리</a>
	<a href="../Imformation/goods">정보 조회</a>
	<a href="../CustomersManage/cusMain">고객 관리</a>
</div>

<div id="wrap">
	<h1>거래 내역 조회</h1>
	<div id=input_group>
		<button id="goods" name="goods" onclick="location.href='/InventorySystem/Imformation/goods'">물품 조회</button>
		<!-- <button id="sale" name="sale" onclick="location.href='/InventorySystem/Imformation/sale'">판매 조회</button> -->
    </div>
    <table>
		<tr>
			<th>거래 번호</th>
			<th>거래 구분</th>
			<th>물품번호</th>
			<th>물품명</th>
			<th>사이즈</th>
			<th>단가</th>
			<th>수량</th>
			<th>총가격</th>
			<th>색 깔</th>
			<th>브랜드</th>
			<th>제조사</th>
			<th>거래일자</th>
		</tr>
		<c:forEach items="${TradeList}" var="tradeList">
			<tr>
				<td>${tradeList.dealNumber}</td>
				<td>${tradeList.classification}</td>
				<td>${tradeList.goodsNo}</td>
				<td>${tradeList.goodsName}</td>
				<td>${tradeList.size}</td>
				<td>${tradeList.goodsPrice}</td>
				<td>${tradeList.amount}</td>
				<td>${tradeList.totalprice}</td>
				<td>${tradeList.goodsColor}</td>
				<td>${tradeList.brandName}</td>
				<td>${tradeList.cusName}</td>
				<td>${tradeList.date}</td> 
   			</tr>
   			<!--
     		<c:set var="goodsNo" value="${list.goodsNo}"/>
     		<input type="text" id="goodsno" value="${list.goodsNo}"></input>
     		-->
		</c:forEach>
	</table>
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