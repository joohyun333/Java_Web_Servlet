<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="membermanger" class="member.MemberManager"/>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	boolean b = membermanger.modifyData(bean);
	if(b){
%>
	<script>
		alert("수정되었습니다");
		location.href="membermanager.jsp"
	</script>
<%	} else { %>
	<script>
		alert("수정 실패!");
		history.back();
	</script>	
<%	} %>
