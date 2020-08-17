<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){

		//비밀번호 입력칸이 비었는지 확인
		if(frm.pass.value==""){
			alert("비밀번호를 입력하세요");
			frm.pass.focus();
			return;
		}
		
		//confirm 알림창에서 "확인" 을 하면 삭제 실행
		if(confirm("정말 삭제할까요?")){
			frm.submit();
		}
	}
</script>
</head>
<body>
	<h2>** 글 삭제 **</h2>
	<form action="delete_action.jsp" method="post" name="frm">
		<input type="hidden" name="num" value="${param.num }" />
		<input type="hidden" name="page" value="${param.page }" />
		비밀번호 입력 : <input type="password" name="pass"/>
		<p/>
		<input type="button" onclick="check()" value="삭제 확인" />
		<input type="button" value="목록 보기" onclick="location.href='boardlist.jsp?page=${param.page}'"/>
	</form>
</body>
</html>