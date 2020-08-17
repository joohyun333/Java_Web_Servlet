<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="ordermanager" class="order.OrderManager"/>
<jsp:useBean id="order" class="order.OrderBean"/>
<jsp:setProperty property="*" name="order"/>
<%
	String flag = request.getParameter("flag");
	String no = request.getParameter("no");
	String state = request.getParameter("state");
	
	boolean result = false;
	
	if(flag.equals("update")){
		result = ordermanager.updateOrder(no, state);
	} else if(flag.equals("delete")) { 
		result = ordermanager.deleteOrder(order);
	}
	
	if(result){
%>
	<script>
		alert("정상적으로 처리되었습니다.");
		location.href = "ordermanager.jsp";
	</script>
<%	}else{	%>

	<script>
		alert("오류발생! \n 관리자에게 문의하세요.");
		location.href = "ordermanager.jsp";
	</script>
<%	}	%>