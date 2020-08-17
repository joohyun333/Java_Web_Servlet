<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Statistics.customers</title>
</head>
<body>
	<input type="button" id="main" name="main"
		onclick="location.href='../Main/main'" value="메인"></input>
	<input type="button" id="goods" name="goods"
		onclick="location.href='../GoodsManage/goodslist'" value="물품 관리"></input>
	<input type="button" id="tradegoods" name="tradegoods"
		onclick="location.href='../TradeGoodsManage/tradelist'" value="물류 관리"></input>
	<input type="button" id="information" name="info"
		onclick="location.href='../Imformation/goods'" value="정보 조회"></input>
	<input type="button" id="customer" name="customer"
		onclick="location.href='../CustomersManage/selList'" value="고객 관리"></input>
	<input type="button" id="statistics" name="statistics"
		onclick="location.href='../Statistics/customers'" value="통계 정보"></input>
</body>
</html>