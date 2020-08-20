<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 정보 수정</title>
</head>
<body>
	<h2>거래처 정보 수정</h2>
	<hr />
	<input type="button" id="main" name="main" onclick="location.href='../Main/main'" value="메인"></input>
	<input type="button" id="goods" name="goods" onclick="location.href='../GoodsManage/goodslist'" value="물품 관리"></input>
	<input type="button" id="tradegoods" name="tradegoods" onclick="location.href='../TradeGoodsManage/tradelist'" value="물류 관리"></input>
	<input type="button" id="information" name="info" onclick="location.href='../Imformation/goods'" value="정보 조회"></input>
	<input type="button" id="customer" name="customer" onclick="location.href='../CustomersManage/cusMain'" value="거래처 관리"></input>
	<input type="button" id="statistics" name="statistics" onclick="location.href='../Statistics/customers'" value="통계 정보"></input>
	<hr/>
	
	<form action="cusUpdate" method="post">
		<table>
			<colgroup>
				<col style="width: 5%;" />
				<col style="width: auto;" />
				<col style="width: 15%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
			</colgroup>
			<tr>
				<td>거래처 이름 : <input type="text" name="cusName" id="cusName" value="${cusInfo.cusName}"></td>
				<td>타입 : <input type="text" name="classification" id="classification" value="${cusInfo.classification}"></td>
				<td>전화번호 : <input type="text" name="phoneNo" id="phoneNo" value="${cusInfo.phoneNo}"></td>
				<td>주소: <input type="text" name="address" id="address" value="${cusInfo.address}"></td>
			</tr>
		</table>
		<!-- <input type="hidden" name="cusName" value="${cusName}" /> -->
		<!-- <input type="hidden" name="classification" value="${classification}" />-->
		<button type="submit">정보 수정</button>
	</form>
</body>
</html>