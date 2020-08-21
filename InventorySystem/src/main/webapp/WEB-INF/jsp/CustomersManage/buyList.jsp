<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 거래처 목록</title>
</head>
<body>
	<h2>구매 거래처 목록</h2>
	<% if (session.getAttribute("email") == null){
	out.println("<a href= '/InventorySystem/Main/main'>로그인이 안되었습니다.</a></br>");
}else{
	String email = (String)session.getAttribute("email");
	out.println(email+"님 반갑습니다.</br></br>");
} %>
	<hr/>
	<input type="button" id="main" name="main" onclick="location.href='../mainCallback'" value="메인"></input>
	<input type="button" id="goods" name="goods" onclick="location.href='../GoodsManage/goodslist'" value="물품 관리"></input>
	<input type="button" id="tradegoods" name="tradegoods" onclick="location.href='../TradeGoodsManage/tradelist'" value="물류 관리"></input>
	<input type="button" id="information" name="info" onclick="location.href='../Imformation/goods'" value="정보 조회"></input>
	<input type="button" id="customer" name="customer" onclick="location.href='../CustomersManage/cusMain'" value="거래처 관리"></input>
	<input type="button" id="statistics" name="statistics" onclick="location.href='../Statistics/customers'" value=""></input>
	<hr/>
	<input type="button" id="insert" name="insert" onclick="location.href='../CustomersManage/cusInsert'" value="거래처 추가"></input>
	<table>
		<!--
		<colgroup>
			<col width="10%;" />
			<col width="10%;" />
			<col width="10%;" />
			<col width="*;" />
			<col width="5%;" />
			<col width="5%;" />
		</colgroup>
		 -->
		<thead>
			<tr>
				<th>거래처 이름</th>
				<th>타입</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${buyList}" var="list">
				<!-- <tr onclick="location.href='../CustomersManage/buyRead?cusName=${list.cusName}'"> -->
				<tr>
					<td onclick="location.href='../CustomersManage/buyRead?cusName=${list.cusName}'">${list.cusName}</td>
					<td>${list.classification}</td>
					<td>${list.phoneNo}</td>
					<td>${list.address}</td>
					<td><input type="button" id="update" name="update" onclick="location.href='../CustomersManage/cusUpdate?cusName=${list.cusName}'" value="수정"></td>
					<td><input type="button" id="delete" name="delete" onclick="location.href='../CustomersManage/cusDelete?cusName=${list.cusName}'" value="삭제"></input></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</body>
</html>
