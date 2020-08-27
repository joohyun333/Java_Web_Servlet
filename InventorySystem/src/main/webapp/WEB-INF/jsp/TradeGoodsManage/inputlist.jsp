<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>거래 입력</title>
<!-- CSS -->
<link href="${pageContext.request.contextPath}/CSS/tradelist.css"
	rel="stylesheet" type="text/css" />

<script src="../js/script.js?ver=0.3"></script>
<script type="text/javascript">
	function calcNow(){
		input.totalprice.value = calc_multiply(input.amount.value, input.price.value);
		input.totalAmount.value = calc(input.tAmount.value, input.amount.value, input.classification.value);
	}
	function calc_multiply(amount, price){
	    return amount * price;
	}
	function calc(tamount, amount, classification){
		if (classification=="입고" || classification=="출고후반품"){
			return Number(tamount) + Number(amount);
		}
		else{
			return Number(tamount) - Number(amount);
		}
	}
	
	//거래처 비워두고 추가를 눌렀을때 를 위한 스크립트
	window.onload = function(){
		document.getElementById("inputs").onclick=function(){
			if(input.cusName.value==""){
				input.cusName.focus();
				alert("거래처를 입력하세요");
				return "";
			}
		}
	}
</script>
</head>
<body>
<!-- 파일을 전송하기 위한 enctype -->
<form name="input" 
	enctype="multipart/form-data" method="POST" autocomplete="off">
	<h1 id="title">재고관리프로그램</h1>
	<%
		if (session.getAttribute("email") == null) {
		out.println("<a href= '/InventorySystem/Main/main'>로그인이 안되었습니다.</a></br>");
	} else {
		String email = (String) session.getAttribute("email");
		out.println(email + "님 반갑습니다.</br></br>");
	}
	%>
	<div class="topnav">
		<a href="../mainCallback">메인</a> <a href="../GoodsManage/goodslist">물품
			관리</a> <a href="../TradeGoodsManage/tradelist">물류 관리</a> <a
			href="../Imformation/goods">정보 조회</a> <a
			href="../CustomersManage/selList">고객 관리</a> <a
			href="../Statistics/customers'">통계정보</a>
	</div>

	<div id="wrap">
		<h1>거래 입력</h1>
		<span style="float: right;">
			<input type="button" id="plus" onclick="location.href='../GoodsManage/goodslist'" value="물품 목록"></input>
			<input type="button" id="plus" onclick="location.href='../TradeGoodsManage/tradelist'" value="거래 목록"></input>
		</span>
		</br>
		
		<table>
			<tr>
				<th>물품 번호</th>
				<th>물품명</th>
				<th>거래 구분</th>
				<th>수 량</th>
				<th>물품 가격</th>
				<th></th>
				<th>총 가 격</th>
				<th>거 래 처</th>
			</tr>
			<tr>
				<td><input type="text" id="goodNo" name="goodNo"
					style="width: 90%;" value="${param.goodsNo}"></td>
				<td><input type="text" style="width: 90%;"
					value="${param.goodsName}"></td>
				<!-- 알아보기 쉬우라고 추가 -->
				<td><select id="classification" name="classification"
					style="width: 90%;">
						<option value="입고">입고</option>
						<option value="출고">출고</option>
						<option value="입고후반품">입고 후 반품</option>
						<option value="출고후반품">출고 후 반품</option>
				</select>
				</th>
				<td><input type="text" id="amount" name="amount" style="width: 90%;"></td>
				<td><input type="text" id="price" name="price" style="width: 90%;" value="${param.goodsPrice}" /></td>
				<td><input type="button" value="=" onClick="calcNow()" /></td>
				<td><input type="text" id="totalprice" name="totalprice" style="width: 90%;"/></td>
				<td><input type="text" id="cusName" name="cusName" style="width: 90%;"></td>
			</tr>
			<tr>
				<th>기존 물품 수량</th>
				<th>거래 후 물품 수량</th>
			</tr>
			<tr>
				<td><input type="text" id="tAmount" name="tAmount"
					style="width: 90%;" value="${param.totalAmount}"/></td>
				<td><input type="text" id="totalAmount" name="totalAmount" value=""/></td>
			</tr>
		</table>

		</br>
		<div id=input_group>
			<span style="float: right;">
				<button type="submit" id="inputs">저장</button>
				<button type="button" id="cancle" onclick="location.href='../GoodsManage/goodslist'">취소</button>
			</span>
		</div>
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