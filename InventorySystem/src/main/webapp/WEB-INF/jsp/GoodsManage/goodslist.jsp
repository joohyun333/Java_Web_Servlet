<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>물품조회</title>
</head>
<body>
<% if (session.getAttribute("email") == null){
	out.println("<a href= '/InventorySystem/Main/main'>로그인이 안되었습니다.</a></br>");
}else{
	String email = (String)session.getAttribute("email");
	out.println(email+"님 반갑습니다.</br></br>");
} %>
	<input type="button" id="main" name="main" onclick="location.href='../mainCallback'" value="메인"></input>
	<input type="button" id="goods" name="goods" onclick="location.href='../GoodsManage/goodslist'" value="물품 관리"></input>
	<input type="button" id="tradegoods" name="tradegoods" onclick="location.href='../TradeGoodsManage/tradelist'" value="물류 관리"></input>
	<input type="button" id="information" name="info" onclick="location.href='../Imformation/goods'" value="정보 조회"></input>
	<input type="button" id="customer" name="customer" onclick="location.href='../CustomersManage/selList'" value="고객 관리"></input>
	<input type="button" id="statistics" name="statistics" onclick="location.href='../Statistics/customers'" value="통계 정보"></input>
	
	<table>
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
				<td> <input type="button" id="input1" name="input1" onclick="location.href='../GoodsManage/GoodsModifyForm?goodsNo=${list.goodsNo}'" value="수정"></td>
				<td><input type="button" id="input2" name="input2" onclick="location.href='../GoodsManage/goodsDelete?goodsNo=${list.goodsNo}'" value="삭제"></input></td>
				<td><input type="button" id="input3" name="input3" onclick="location.href='../TradeGoodsManage/inputlist?goodsNo=${list.goodsNo}&goodsName=${list.goodsName}&goodsPrice=${list.goodsPrice}'" value="거래 등록"></input></td>
			</tr>
		</c:forEach>
	</table>
	<!-- <span style="float:right;"> -->
		<input type="button" id="input" name="input" onclick="location.href='../GoodsManage/GoodsRegisterForm'" value="물품 등록"></input>
	<!--</span> -->

	<!-- 검색칸 -->
	<form action="../GoodsManage/goodslist" method="get">
		<select name="searchType">
			<option value="GoodsNo" <c:if test="${searchType eq GoodsNo}">selected="selected"</c:if>>물품번호</option>
			<option value="GoodsName"<c:if test="${searchType eq GoodsName}">selected="selected"</c:if>>물품명</option>
		</select> 
		<input type="text" name="searchWord" value="${searchWord}"/> 
		<input type="submit"value="검색" id="btnSearch"/>
	</form>
</body>
</html>