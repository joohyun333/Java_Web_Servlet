<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="cartmanager" class="order.CartManager" scope="session"/>
<jsp:useBean id="bean" class="order.OrderBean"/>
<jsp:setProperty property="*" name="bean"/>

<%
	String flag = request.getParameter("flag"); //구매목록 보기, 수정, 삭제 구분 
	String id = (String)session.getAttribute("idKey"); //로그인 확인
	
	if(id == null){ //로그인이 안되어있을때
		response.sendRedirect("login.jsp"); //로그인 강요
	} else {
		
		//카트에 상품담기
		if(flag == null){
			bean.setId(id);
			cartmanager.addCart(bean);
%>
			<script>
				alert("장바구니에 담았습니다");
				location.href = "cartlist.jsp";
			</script>
<%
		//카트에 상품 수정
		} else if(flag.equals("update")){
			bean.setId(id);
			cartmanager.updateCart(bean);
%>
			<script>
				alert("장바구니에 내용을 수정했습니다");
				location.href = "cartlist.jsp";
			</script>
<%
		} else if(flag.equals("delete")){
			cartmanager.deleteCart(bean);
%>
			<script>
				alert("장바구니에 상품을 삭제했습니다.");
				location.href = "cartlist.jsp";
			</script>
<%
		}
	}
	
%>