 <%@page import="product.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productmanager" class="product.ProductManager"/>
<%
	String no = request.getParameter("no");
	ProductDto dto = productmanager.getProduct(no); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품보기</title>
<link href="../css/style.css" rel="style/sheet" type="text/css">
<script type="text/javascript" src="../js/script.js?ver=0.3"></script>
</head>
<body>
	<h2>** 상품 상세 보기 **</h2>
	<%@ include file = "admin_top.jsp" %>
	<table style="width: 80%">
		<tr>
			<td style="width: 20%">
				<img src="../images/product/<%=dto.getImage() %>" style="width:100%">
			</td>
			<td style="width: 50%; vertical-align: top;">
				<table style="width: 100%">
					<tr>
						<td>번호 : </td>
						<td><%=dto.getNo() %></td>
					</tr>
					<tr>
						<td>품명 : </td>
						<td><%=dto.getName() %></td>
					</tr>
					<tr>
						<td>가격 : </td>
						<td><%=dto.getPrice() %></td>
					</tr>
					<tr>
						<td>등록일 : </td>
						<td><%=dto.getSdate() %></td>
					</tr>
					<tr>
						<td>재고량 : </td>
						<td><%=dto.getStock() %></td>
					</tr>
				</table>
			</td>
			<td style="width: 30%; vertical-align: top;">
				<b>* 상품 설명 *</b><br/>
				<%=dto.getDetail() %>
			</td>
		</tr>
		<tr>
			<td colspan="3" style="text-align: center;">
				<a href="javascript:productUpdate('<%=dto.getNo() %>')">수정하기</a>&nbsp;&nbsp;
				<a href="javascript:productDelete('<%=dto.getNo() %>')">삭제하기</a>
			</td>
		</tr>
	</table>
	<%@ include file = "admin_bottom.jsp" %>
	
	<form action="product_update.jsp" name="updateFrm" method="post">
		<input type="hidden" name="no">
	</form>
	
	<form action="product_process.jsp?flag=delete" name="delFrm" method="post">
		<input type="hidden" name="no">
	</form>
</body>
</html>