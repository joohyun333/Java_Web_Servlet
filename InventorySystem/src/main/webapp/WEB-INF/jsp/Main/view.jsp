<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>읽기</title>
</head>
<body>
${Content}
<br/><br/>

<button type="button" id="modify" onclick="location.href='modify?num=${num}'">수정</button>
<button type="button" id="delete" onclick="location.href='delete?num=${num}'">삭제</button>
<input type="reset"   value="목록으로" onclick="location.href='/InventorySystem/mainCallback'">
</body>
</html>

