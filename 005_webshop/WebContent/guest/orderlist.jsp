<%@page import="product.ProductDto"%>
<%@page import="product.ProductBean"%>
<%@page import="order.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="ordermanager" class="order.OrderManager"/>
<jsp:useBean id="productmanager" class="product.ProductManager"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/script.js"></script>
</head>
<body>
	<h2>** 주문 완료된 목록**</h2>
	<%@ include file="guest_top.jsp" %>
	<table style="width: 80%">
		<tr>
			<th>주문번호</th><th>품명</th><th>주문수</th><th>주문일</th><th>주문상태</th>
		</tr>
	<%	
		String id = (String)session.getAttribute("idKey");
		ArrayList<OrderBean> list = ordermanager.getOrder(id);
		if(list.size()==0) {
	%>
		<tr>
			<td colspan="5"> 주문한 상품이 없습니다.</td>
		</tr>
	<%
		} else {
			for(OrderBean order:list){
				ProductDto product = productmanager.getProduct(order.getProduct_no());
	%>
				<tr>
					<td><%=order.getNo() %></td>
					<td><%=product.getName() %></td>
					<td><%=order.getQuantity() %></td>
					<td><%=order.getSdate() %></td>
					<td>
					<%
						switch(Integer.parseInt(order.getState())){
							case 1: out.println("접수");break;
							case 2: out.println("입금확인");break;
							case 3: out.println("배송준비");break;
							case 4: out.println("배송중");break;
							default : out.println("점수중");break;
						}
					%>
					</td>
				</tr>			
	<%
			}
		}
	%>
	</table>
	<%@ include file="guest_bottom.jsp" %>
</body>
</html>