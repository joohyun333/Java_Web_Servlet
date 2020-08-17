<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 입력</title>
<script src="../js/script.js?ver=0.3"></script>
<script type="text/javascript">
function calcNow(){
	inputlist.totalprice.value = calc_multiply(inputlist.amount.value, inputlist.price.value);
}
function calc_multiply(amount, price){
    return amount * price;
}

//거래처 비워두고 추가를 눌렀을때 를 위한 스크립트
window.onload = function(){
document.getElementById("input").onclick=function(){
	if(inputlist.cusName.value==""){
		inputlist.cusName.focus();
		alert("거래처를 입력하세요");
		return;
	}
	inputlist.submit();
}
}
</script>
<body>
	<!-- 파일을 전송하기 위한 enctype -->
	<form name="inputlist" enctype="multipart/form-data" method="post" autocomplete="off">
		<input type="button" id="main" name="main" onclick="location.href='../Main/main'" value="메인"></input> 
		<input type="button" id="goods" name="goods" onclick="location.href='../GoodsManage/goodslist'" value="물품 관리"></input>
		<input type="button" id="tradegoods" name="tradegoods" onclick="location.href='../TradeGoodsManage/tradelist'" value="물류 관리"></input>
		<input type="button" id="information" name="info" onclick="location.href='../Imformation/goods'" value="정보 조회"></input>
		<input type="button" id="customer" name="customer" onclick="location.href='../CustomersManage/selList'" value="고객 관리"></input>
		<input type="button" id="statistics" name="statistics" onclick="location.href='../Statistics/customers'" value="통계 정보"></input>
		<table style="width: 80%">
			<tr>
				<th>물품번호</th>
				<th>물품명</th>
				<th>거래 구분</th>
				<th>수 량</th>
				<th>물건가격</th>
				<th> </th>
				<th>총 가 격</th>
				<th>거 래 처</th>
			</tr>
			<td><input type="text" name= "goodNo" value = "${param.goodsNo}"></td>
			<td><input type="text" value = "${param.goodsName}"></td> <!-- 알아보기 쉬우라고 첨가함. -->
			<td valgn="top">
			<select name="classification">
					<option value="입고">입고</option>
					<option value="출고">출고</option>
					<option value="입고후반품">입고 후 반품</option>
					<option value="출고후반품">출고 후 반품</option>
			</select>
			</td>
			<td><input type="text" name="amount" ></td>
            <td><input type="text" name="price" value = "${param.goodsPrice}"/></td>
            <td><input type="button" value="=" onClick="calcNow()"/></td>
           	<td><input type="text" name="totalprice" /></td>
			<td><input type="text" id = "cusName" name="cusName"></td>
			<tr>
			<!-- 거래처 파라미터 -->
				<td colspan="2"><br/> 
				<span style="float: right;">
						<button type="submit" id="input">저장</button>
						<button type="button" onclick="location.href='../GoodsManage/goodslist'">취소</button>
				</span>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>