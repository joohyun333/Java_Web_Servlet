<%@page import="product.ProductDto"%>
<%@page import="order.OrderBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cartmanager" class="order.CartManager" scope="session"/>
<jsp:useBean id="productmanager" class="product.ProductManager"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/script.js?ver=0.1"></script>
</head>
<body>
	<h2>*** 장바구니 목록 ***</h2>
	<%@ include file="../guest/guest_top.jsp" %>
	<form action="cartprocess.jsp" method="get">
		<table style="width:80%;">
			<tr style="background-color: gold">
				<th>주문상품</th><th>가격</th><th>수량</th><th>수정/삭제</th><th>조회</th>
			</tr>
		<%
			int totalPrice = 0;
			Hashtable<String, OrderBean> hCart = cartmanager.getCartList();
				
			//장바구니가 비었을경우
			if(hCart.size()==0){
		%>
			<tr><td>주문 건수가 없습니다.</td></tr>
		<% 
			//장바구니에 내용이 있을경우
			} else { 
				//카트의 모든 제품코드(키값)을 추출
				Enumeration<String> enu = hCart.keys();
				while(enu.hasMoreElements()){ //남은 키 값이 있다면
						
					//해당 제품코드(키값)의 카트내용을 담음
					OrderBean order = (OrderBean)hCart.get(enu.nextElement());
						
					//해당 제품코드의 제품정보를 db에서 가져옴
					ProductDto product = productmanager.getProduct(order.getProduct_no());
						
					int price = Integer.parseInt(product.getPrice());
					int quantity = Integer.parseInt(order.getQuantity());
					int subTotal = price * quantity;
					totalPrice += subTotal;
		%>		
				
				<tr style="text-align: center;">
					<td><%=product.getName() %></td>
					<td><%=subTotal %></td>
					<td>
						<input type="text" name="quantity" size="5" value="<%=order.getQuantity() %>" style="text-align: center;">
					</td>
					<td> 
						<!-- form 에서 가져갈 데이터 -->
						<input type="hidden" name="flag">
						<input type="hidden" name="product_no" value="<%=product.getNo() %>">
						<!-- 수정/삭제 버튼 -->
						<input type="button" value="수정" onclick="cartUpdate(this.form)" style="background-color: silver"> /
						<input type="button" value="삭제" onclick="cartDelete(this.form)" style="background-color: silver"> 
					</td>
					<td><a href="javascript:productDetail('<%=product.getNo()%>')">상세보기</a></td>
				</tr>
		<%
				}
		%>
			<tr>
				<td colspan="5">
					<br/>
					<b>총 결제 금액 : <%=totalPrice %> 원</b>
					&nbsp;&nbsp;&nbsp;
					<a href="orderprocess.jsp">[ 주문하기 ]</a>
				</td>
			</tr>
		<%	
			}
		%>
		</table>
	
	</form>
	<%@ include file = "guest_bottom.jsp" %>
	<form action="productdetail_guest.jsp" name="detailFrm">
		<input type="hidden" name="no">
	</form>
</body>
</html>