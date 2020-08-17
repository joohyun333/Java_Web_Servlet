<%@page import="java.util.Enumeration"%>
<%@page import="order.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="cartmanager" class="order.CartManager" scope="session"/>
<jsp:useBean id="productmanager" class="product.ProductManager"/>
<jsp:useBean id="ordermanager" class="order.OrderManager"/>

<%
	Hashtable<String,OrderBean> hCart = cartmanager.getCartList();
	Enumeration enu = hCart.keys();
	if(hCart.size() == 0 ){
%>
	<script>
		alert("주문 내역이 없습니다");
		location.href = "orderlist.jsp";
	</script>
<%
	} else {
		while(enu.hasMoreElements()){
			OrderBean order = (OrderBean)hCart.get(enu.nextElement());
			ordermanager.insertOrder(order);  //주문추가
			productmanager.reduceProduct(order);  //재고감소
			cartmanager.deleteCart(order);  //장바구니에서 삭제
		}
%>
	<script>
		alert("주문처리가 완료되었습니다 \n 감사합니다");
		location.href = "orderlist.jsp";
	</script>
<%
	}
%>
