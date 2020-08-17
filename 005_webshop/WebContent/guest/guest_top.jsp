<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String memberid = (String)session.getAttribute("idKey");
	String login_check = "";
	String member_register_check = "";
	
	if(memberid == null){  //로그인 중이면
		login_check = "<a href='login.jsp'>로그인</a>";
		member_register_check = "<a href='../member/register_form.jsp'>회원가입</a>";
		
	} else {  //로그인이 되어있지 않으면
		login_check = "<a href='login_out.jsp'>로그아웃</a>";
		member_register_check = "<a href='../member/modify_member_form.jsp'>회원수정</a>";
	}
%>
<table style="width: 80%">
	<tr style="background-color: #ffbbcc; text-align: center;">
		<td><%=login_check %></td>
		<td><%=member_register_check %></td>
		<td><a href="productlist.jsp">상품목록</a></td>
		<td><a href="cartlist.jsp">장바구니</a></td>
		<td><a href="orderlist.jsp">구매목록</a></td>
		<td><a href="../board/boardlist.jsp">게 시 판</a></td>
	</tr>
</table>