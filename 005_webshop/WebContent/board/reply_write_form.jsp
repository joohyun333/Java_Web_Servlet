<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="boardmanager" class="board.BoardManager"/>
<jsp:useBean id="dto" class="board.BoardDto"/>

<c:set var="content" value = "${boardmanager.getData(param.num)}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
//입력 자료 검사
function check() {
	if (frm.name.value == "") {
		alert("이름을 입력하세요");
		frm.name.focus();
	} else if (frm.pass.value == "") {
		alert("비밀번호를 입력하세요");
		frm.pass.focus();
	} else if (frm.mail.value == "") {
		alert("이메일을 입력하세요");
		frm.mail.focus();
	} else if (frm.title.value == "") {
		alert("제목을 입력하세요");
		frm.title.focus();
	} else if (frm.cont.value == "") {
		alert("내용을 입력하세요");
		frm.cont.focus();
	} else
		frm.submit();
}
</script>
<body>
	<h2 style="text-align:center;"> *** 댓글 쓰기 *** </h2>
	<form name="frm" method="post" action = "reply_write_action.jsp">
	
		<!-- 댓글을 위한 그룹 번호 전달 -->
		<input type="hidden" name = "group_num" value = "${content.group_num}"/>
		
		<!-- 댓글 들여쓰기를 위한 단계 번호 전달 -->
		<input type="hidden" name = "nested" value = "${content.nested}"/>
		
		<!-- 페이지처리를 위한 페이지 번호 넘기기 -->
		<input type="hidden" name = "page" value = "${param.page}"/>
		
		<!-- 내용 저장을 위한 기본적인 데이터 전달 -->
		<input type="hidden" name = "num" value = "${content.num}"/>
		<table border="1">
			<tr>
				<td align="center" width="100">이 름</td>
				<td width="430"><input name="name" size="15"></td>
			</tr>
			<tr>
				<td align="center">암 호</td>
				<td><input type="password" name="pass" size="15"></td>
			</tr>
			<tr>
				<td align="center">메 일</td>
				<td><input name="mail" size="25"></td>
			</tr>
			<tr>
				<td align="center">제 목</td>
				<td><input name="title" size="50" value="[re]:${content.title}"></td>
			</tr>
			<tr>
				<td align="center">내 용</td>
				<td><textarea name="cont" cols="50" rows="10">


--------------- main content -----------------
제목 : ${content.cont } 
작성자 : ${content.name}
${content.cont}
				</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="30">
					<input type="button" value="메  인" onClick="location.href='../index.jsp'">&nbsp;
					<input type="button" value="작  성" onClick="check()">&nbsp;
					<input type="button" value="목  록" onClick="location.href='boardlist.jsp?page=${param.page}'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>