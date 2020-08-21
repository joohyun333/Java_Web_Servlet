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
	<input type="button" id="customer" name="customer" onclick="location.href='../CustomersManage/'" value="고객 관리"></input>
	<input type="button" id="statistics" name="statistics" onclick="location.href='../Statistics/customers'" value="통계 정보"></input>
	<form action="../GoodsManage/goodsModify" method="post">
		<table>
			<tr>
				<td>물품번호</td>
				<td><input type="text" name="goodsNo" value="${goods.goodsNo}"></td>
			</tr>
			<tr>
				<td>물품명</td>
				<td><input type="text" name="goodsName" value="${goods.goodsName}"></td>
			</tr>
			<tr>
				<td>색상</td>
				<td><input type="text" name="goodsColor" value="${goods.goodsColor}"></td>
			</tr>
			<tr>
				<td>제조사</td>
				<td><input type="text" name="manufacturer" value="${goods.manufacturer}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="goodsPrice" value="${goods.goodsPrice}"></td>
			</tr>
			<tr>
				<td>사이즈</td>
				<td><input type="text" name="size" value="${goods.size}"></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="text" name="totalAmount" value="${goods.totalAmount}"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">입력</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>