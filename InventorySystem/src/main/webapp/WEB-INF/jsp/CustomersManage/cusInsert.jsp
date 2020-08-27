<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 추가</title>
<!-- CSS -->
<link href="${pageContext.request.contextPath}/CSS/list.css" rel="stylesheet" type="text/css" />
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
		<a href="../Main/main">메인</a> <a href="../GoodsManage/goodslist">물품 관리</a>
		<a href="../TradeGoodsManage/tradelist">물류 관리</a>
		<a href="../Imformation/goods">정보 조회</a>
		<a href="../CustomersManage/cusMain">거래처 관리</a>
	</div>

	<div id="wrap">
		<form action="../CustomersManage/cusInsert" method="post">
			<table>
				<tr>
					<th>거래처 이름</th>
					<th>타입</th>
					<th>전화번호</th>
					<th>주소</th>
				</tr>
				<tr>
					<td><input type="text" name="cusName"></td>
					<td>
						<input type="radio" name="classification" value="출고">출고
						<input type="radio" name="classification" value="입고">입고
					</td>
					<td><input type="text" name="phoneNo"></td>
					<td><input type="text" name="address"></td>
				</tr>
			</table>
			<div id=input_group>
				<span style="float: right;">
					<button type="submit">거래처 저장</button>
				</span>
			</div>
		</form>
	</div>
	<footer id="footer">
	<div class="foo_div1"> 
		<h3>재고관리프로그램</h3> 
		<p>재고관리프로그램 was created by <span>비트교육 3조</span> / Designed by <span>비트교육 3조</span></p> 
	</div>
</footer>
</body>
</html>