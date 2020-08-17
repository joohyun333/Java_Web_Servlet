<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>거래 내역</title>
</head>
<body>
	<!-- 파일을 전송하기 위한 enctype -->
	<form name="inputlist" action="tradelist" enctype="multipart/form-data" method="post">
	<input type="button" id="main" name="main" onclick="location.href='../Main/main'" value="메인"></input>
	<input type="button" id="goods" name="goods" onclick="location.href='../GoodsManage/goodslist'" value="물품 관리"></input>
	<input type="button" id="tradegoods" name="tradegoods" onclick="location.href='../TradeGoodsManage/tradelist'" value="물류 관리"></input>
	<input type="button" id="information" name="info" onclick="location.href='../Imformation/goods'" value="정보 조회"></input>
	<input type="button" id="customer" name="customer" onclick="location.href='../CustomersManage/selList'" value="고객 관리"></input>
	<input type="button" id="statistics" name="statistics" onclick="location.href='../Statistics/customers'" value="통계 정보"></input>

	<table style="width: 80%">
		<tr>
			<th>거래번호</th>
			<th>거래 구분</th>
			<th>물품번호</th>
			<th>물품명</th>
			<th>사이즈</th>
			<th>단가</th>
			<th>수량</th>
			<th>총가격</th>
			<th>색깔</th>
			<th>브랜드</th>
			<th>제조사</th>
			<th>거래일자</th>
		</tr>
		<!-- dealNumber, classification, g.goodsNo, goodsName, size, goodsPrice, amount, totalprice, goodsColor, brandName, manufacturer, Date -->
		<%-- <tr>
					<th>${tradelist.dealNumber}</th>
					<th>${tradelist.classification}</th>
					<th>${tradelist.goodsNo}</th>
					<th>${tradelist.goodsName}</th>
				    <th>${tradelist.size}</th>
					<th>${tradelist.goodsPrice}</th> 
					<th>${tradelist.amount}</th>
					<th>${tradelist.totalprice}</th>
					<th>${tradelist.goodsColor}</th>
					<th>${tradelist.brandName}</th> 
					<th>${tradelist.manufacturer}</th>
					<th>${tradelist.Date}</th>
				</tr> --%>
				
				
				<%-- <th>${tradelist.dealNumber}</th>
				<th>${tradelist.classification}</th>
				<th>${tradelist.goodsNo}</th>
				<th></th>
				<th></th>
				<th></th>
				<th>${tradelist.amount}</th>
				<th>${tradelist.totalprice}</th>
				<th></th>
				<th></th>
				<th>${tradelist.cusName}</th>
				<th>${tradelist.date}</th> --%>
				
				
		<c:forEach items="${TradeList}" var="tradelist">
			<tr>
				<th>${tradelist.dealNumber}</th>
				<th>${tradelist.classification}</th>
				<th>${tradelist.goodsNo}</th>
				<th>${tradelist.goodsName}</th>
				<th>${tradelist.size}</th>
				<th>${tradelist.goodsPrice}</th>
				<th>${tradelist.amount}</th>
				<th>${tradelist.totalprice}</th>
				<th></th>
				<th></th>
				<th>${tradelist.cusName}</th>
				<th>${tradelist.date}</th> 
				<td><input type="button" id="input" name="input" onclick="location.href='../TradeGoodsManage/tradeGoodsDelete?dealNumber=${tradelist.dealNumber}'" value="삭제"></input></td>
			</tr>
		</c:forEach>

		<tr>
			<td colspan="2"><br /> 
			<span style="float: right;">
					<button type="button" onclick="location.href='../TradeGoodsManage/inputlist'">추가</button>
			</span>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>