<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="boardmanager" class="board.BoardManager"/>
<jsp:useBean id="dto" class="board.BoardDto"/>

<c:set var="content" value="${boardmanager.getData(param.num)}"/>
<c:set var="readcnt" value="${boardmanager.updateReadCnt(param.num)}"/>
<c:set var="pass" value="******"/>
<c:if test="${!empty sessionScope.admin}">
	<c:set var = "pass" value = "${content.pass}"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function modifycheck(){
		if(prompt("비밀번호를 입력하세요")==document.getElementById("origin_pass").value){
			location.href = "modify_form.jsp?num=${content.num}&page=${param.page}";
		}
	}
</script>
<body>
	<!-- 비밀번호 확인을 위한 처리 -->
	<input type="hidden" id="origin_pass" value="${content.pass}"/>
	<table style = "width:100%">
		<tr>
			<td><b>비밀번호 : ${pass}</b></td>
			<td colspan="2" style="text-align: right;">
				<a href="reply_write_form.jsp?num=${content.num}&page=${param.page}">
					<img src="../images/icon/icon_reply.gif"></a>
				<a href="javascript:modifycheck();">
					<img src="../images/icon/icon_modify.gif"></a> 
				<a href="delete_form.jsp?num=${content.num}&page=${param.page}">
					<img src="../images/icon/icon_delete.gif"></a> 
				<a href="boardlist.jsp?page=${param.page}">
					<img src="../images/icon/icon_boardlist.gif"></a>
			</td>
		</tr> 
		<tr>
			<td>작성자 : <a href="mailto:${content.mail }">${content.mail }</a> (ip : ${content.write_ip })</td>
			<td>작성일 : ${content.write_date}</td>
			<td>조회수 : ${content.readcnt }</td>
		<tr>
			<td colspan="3" style="background-color: cyan">제목 : ${content.title }</td>
		</tr>
		<tr>
			<td colspan="3">
				<textarea rows="10" style="width:99%" readonly="readonly">${content.cont }</textarea>
			</td>
		</tr> 
	</table>
	
</body>
</html>