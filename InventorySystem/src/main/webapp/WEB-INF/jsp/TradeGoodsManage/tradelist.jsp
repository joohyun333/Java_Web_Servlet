<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>거래 내역</title>

<!-- CSS -->
<link href="${pageContext.request.contextPath}/CSS/tradelist.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- 파일을 전송하기 위한 enctype -->
<form name="tradelist" enctype="multipart/form-data" method="post">
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
		<h1>거래 내역</h1>
		<span style="float: right;">
			<input type="button" id="plus" onclick="location.href='../GoodsManage/goodslist'" value="거래 추가"></input>
		</span>
		</br>
				
		<table>
			<tr>
				<th>거 래 번 호</th>
				<th>거 래 구 분</th>
				<th>물 품 번 호</th>
				<th>물  품  명</th>
				<th>사  이  즈</th>
				<th>단       가</th>
				<th>수       량</th>
				<th>총  가  격</th>
				<th>색       깔</th>
				<th>브  랜  드</th>
				<th>제  조  사</th>
				<th>거 래 일 자</th>
				<th></th>
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
					<td><input type="button" id="delete" name="delete" onclick="location.href='../TradeGoodsManage/tradeGoodsDelete?dealNumber=${tradeList.dealNumber}'" value="삭제"></input></td>
				</tr>
			</c:forEach>
		</table>
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