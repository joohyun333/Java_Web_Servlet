<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 내역</title>
</head>
<body>
	<h2>거래 내역</h2>
	<hr/>
	<input type="button" id="main" name="main" onclick="location.href='../Main/main'" value="메인"></input>
	<input type="button" id="goods" name="goods" onclick="location.href='../GoodsManage/goodslist'" value="물품 관리"></input>
	<input type="button" id="tradegoods" name="tradegoods" onclick="location.href='../TradeGoodsManage/tradelist'" value="물류 관리"></input>
	<input type="button" id="information" name="info" onclick="location.href='../Imformation/goods'" value="정보 조회"></input>
	<input type="button" id="customer" name="customer" onclick="location.href='../CustomersManage/cusMain'" value="거래처 관리"></input>
	<input type="button" id="statistics" name="statistics" onclick="location.href='../Statistics/customers'" value="통계 정보"></input>
	<hr/>
	<input type="button" id="insert" name="insert" onclick="location.href='../CustomersManage/selList'" value="뒤로 가기"></input>
	<table>
		<colgroup>
			<col style="width: 5%;" />
			<col style="width: auto;" />
			<col style="width: 15%;" />
			<col style="width: 10%;" />
			<col style="width: 10%;" />
		</colgroup>
		<thead>
			<tr>
				<th>거래 번호</th>
				<th>거래일자</th>
				<th>거래 구분</th>
				<th>물품명</th>
				<th>수량</th>
				<th>총가격</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${TradeList}" var="tradelist">
				<tr>
					<td>${tradelist.dealNumber}</td>
					<td>${tradelist.date}</td>
					<td>${tradelist.classification}</td>
					<td>${tradelist.goodsName}</td>
					<th>${tradelist.amount}</th>
					<th>${tradelist.totalprice}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
