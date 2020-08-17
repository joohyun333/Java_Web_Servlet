<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!-- 언어설정 : 브라우저에서 해도 됨 -->
<%-- <fmt:setLocale value="en"/> --%>
<fmt:setLocale value="sp"/> 

<fmt:bundle basename="resource.message">
<!-- bundle 태그를 맨 마지막에 닫아야 한다  -->

<fmt:message key="TITLE" var="title"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> ${title} </title>
</head>
<body>

<fmt:message key="GREETING"/><br/>
----------------------------------- <br/>

<!-- url 뒤에 파라메터로 name=xxxx 붙여면 실행됨  -->
<c:if test="${ ! empty param.name }">
	<fmt:message key="NAME">
		<fmt:param value="${param.name }" />
	</fmt:message>
</c:if>


</body>
</html>

</fmt:bundle>