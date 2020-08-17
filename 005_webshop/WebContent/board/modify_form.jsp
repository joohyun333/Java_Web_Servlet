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
	if (modify_form.name.value == "") {
		alert("이름을 입력하세요");
		modify_form.name.focus();
	} else if (modify_form.pass.value == "") {
		alert("비밀번호를 입력하세요");
		modify_form.pass.focus();
	} else if (modify_form.mail.value == "") {
		alert("이메일을 입력하세요");
		modify_form.mail.focus();
	} else if (modify_form.title.value == "") {
		alert("제목을 입력하세요");
		modify_form.title.focus();
	} else if (modify_form.cont.value == "") {
		alert("내용을 입력하세요");
		modify_form.cont.focus();
	} else
		modify_form.submit();
}
</script>
<body>
	<h2 style="text-align:center;"> *** 수정하기 *** </h2>
	<form name="modify_form" method="post" action = "modify_action.jsp">
		<input type="hidden" name = "page" value = "${param.page}"/><!-- page 넘기기 -->
		<input type="hidden" name = "num" value = "${content.num}"/>
		<table border="1">
			<tr>
				<td align="center" width="100">이 름</td>
				<td width="430"><input name="name" size="15" readonly="readonly" value="${content.name}"></td>
			</tr>
			<tr>
				<td align="center">암 호</td>
				<td><input type="password" name="pass" size="15"></td>
			</tr>
			<tr>
				<td align="center">메 일</td>
				<td><input name="mail" size="25" readonly="readonly" value="${content.mail}"></td>
			</tr>
			<tr>
				<td align="center">제 목</td>
				<td><input name="title" size="50" value="${content.title}"></td>
			</tr>
			<tr>
				<td align="center">내 용</td>
				<td><textarea name="cont" cols="50" rows="10">${content.cont }</textarea></td>
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