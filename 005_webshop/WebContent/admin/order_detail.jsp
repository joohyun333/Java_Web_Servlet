<%@page import="product.ProductDto"%>
<%@page import="order.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="ordermanager" class="order.OrderManager"/>
<jsp:useBean id="productmanager" class="product.ProductManager"/>
<%	
	String no = request.getParameter("no");
	OrderBean bean = ordermanager.getOrderDetail(no);
	ProductDto product = productmanager.getProduct(bean.getProduct_no());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 주문 내역</title>
<script src="../js/script.js?ver=0.2"></script>
</head>
<body>
	<%@ include file= "admin_top.jsp" %>
	<form action="orderprocess_admin.jsp" name="detailFrm" method="post">
		<table style="width: 80%">
			<tr>
				<td>고객 아이디 : <%=bean.getId() %></td>
				<td>주 문 번 호 : <%=bean.getNo() %></td>
				<td>상 품 번 호 : <%=bean.getProduct_no() %></td>
				<td>주 문 상 품 : <%=product.getName() %></td>
			</tr>
			<tr>
				<td>상 품 가 격 : <%=product.getPrice() %></td>
				<td>주 문 수 량 : <%=bean.getQuantity() %></td>
				<td>재 고 수 량 : <%=product.getStock() %></td>
				<td>주 문 일 자 : <%=bean.getSdate() %></td>
			</tr>
			<tr>
				<td colspan="4">
					총 결제 금액 : <%=Integer.parseInt(bean.getQuantity()) * Integer.parseInt(product.getPrice()) %>
				</td>
			</tr>	
			<tr>
				<td colspan="4">
					주문 상태 :
					<select name="state">
						<option value="1">접수</option>
						<option value="2">입금확인</option>
						<option value="3">배송준비</option>
						<option value="4">배송중</option>
						<option value="5">처리완료</option>
					</select>
					<script type="text/javascript">
						document.detailFrm.state.value = <%=bean.getState() %>
					</script>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;">
					<input type="button" value="수 정" onclick="orderUpdate(this.form)"> / 
					<input type="button" value="삭 제" onclick="orderDelete(this.form)">
					<input type="hidden" name="no" value="<%=bean.getNo() %>">
					<input type="hidden" name="product_no" value="<%=bean.getProduct_no() %>">
					<input type="hidden" name="quantity" value="<%=bean.getQuantity() %>">
					<input type="hidden" name="flag">
				</td>
			</tr>
		</table>
	</form>
	<%@ include file= "admin_bottom.jsp" %>
</body>
</html>