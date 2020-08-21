<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 추가</title>
</head>
<!--
<script>
	var type = document.getElementsByName('classification');
	var type_value;
	for(var i = 0; i < type.length; i++) {
		if(type[i].checked) {
			type_value = type[i].value;
			}
	}
</script>
-->
<body>
	<h2>거래처 추가</h2>
	<% if (session.getAttribute("email") == null){
	out.println("<a href= '/InventorySystem/Main/main'>로그인이 안되었습니다.</a></br>");
}else{
	String email = (String)session.getAttribute("email");
	out.println(email+"님 반갑습니다.</br></br>");
} %>
	<hr />
	<input type="button" id="main" name="main" onclick="location.href='../mainCallback'" value="메인"></input>
	<input type="button" id="goods" name="goods" onclick="location.href='../GoodsManage/goodslist'" value="물품 관리"></input>
	<input type="button" id="tradegoods" name="tradegoods" onclick="location.href='../TradeGoodsManage/tradelist'" value="물류 관리"></input>
	<input type="button" id="information" name="info" onclick="location.href='../Imformation/goods'" value="정보 조회"></input>
	<input type="button" id="customer" name="customer" onclick="location.href='../CustomersManage/cusMain'" value="거래처 관리"></input>
	<input type="button" id="statistics" name="statistics" onclick="location.href='../Statistics/customers'" value="통계 정보"></input>
	<hr/>
	
	<form action="../CustomersManage/cusInsert" method="post">
		<table>
			<colgroup>
				<col style="width: 5%;" />
				<col style="width: auto;" />
				<col style="width: 15%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
			</colgroup>
			<tr>
				<td>거래처 이름 : <input type="text" name="cusName"></td>
				<td>타입 : 
					<input type="radio" name="classification" value="출고">출고
					<input type="radio" name="classification" value="입고">입고
				</td>
				<td>전화번호 : <input type="text" name="phoneNo"></td>
				<td>주소: <input type="text" name="address"></td>
			</tr>
			<tr>
				<td>
					<button type="submit">거래처 저장</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>