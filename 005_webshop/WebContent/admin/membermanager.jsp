<%@page import="member.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="membermanager" class="member.MemberManager"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원관리</title>
<script src="../js/script.js?ver=0.2"></script>
</head>
<body>
	<h2> ** 관리자 - 전체 회원 관리 ** </h2>
	<%@ include file="admin_top.jsp" %>
	<table style="width:80%">
		<tr style="background-color: cyan">
			<th>아이디</th><th>회원명</th><th>이메일</th><th>전화</th><th>수정</th>
		</tr>
	<%
		ArrayList<MemberDto> list = membermanager.getMemberAll();
		for(MemberDto dto : list){
	%>
			<tr>
				<td><%=dto.getId() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getMail() %></td>
				<td><%=dto.getPhone() %></td>
				<td><a href="javascript:admin_modify_member('<%=dto.getId() %>')">수정하기</a></td>
			</tr>
	<%
		}
	%>
	</table>	
	
	<%@ include file="admin_bottom.jsp" %>
	
	<form action="member_modify_admin_form.jsp" name="modifyFrm" method="post">
		<input type="hidden" name="id">
	</form>
</body>
</html>