<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title> JSTL 연습</title>
</head>
<body>

<!-- 변수 선언 -->
<c:set var="gender" value="male" /> 

<!-- 제어 흐름 -->
<!-- } " 사이 공백으로 안될 수 있음 -->

<c:if test="${ gender eq 'male' }"> 당신은 남자입니다. </c:if> <br/>
<c:if test="${ gender == 'female' }"> 당신은 여자입니다. </c:if> <br/>

<c:set var="age" >24</c:set>
<c:if test="${ age ge 20  }"> 당신은 성인입니다. </c:if> <br/><br/>

<c:choose>
	<c:when test="${ age lt 10 }"> 당신은 어린이입니다. </c:when>
	<c:when test="${ age ge 10 and age le 20 }" > 당신은 청소년입니다.</c:when>
	<c:otherwise> 당신은 성인입니다. </c:otherwise>
</c:choose>

<%-- <c:set var="sum" value="0" /> --%>
<!-- sum 변수에 자동으로 0 초기화가 되어 위 코드 필요없지만  -->
<c:forEach var="i" begin="1" end="100">
<c:set var="sum" value="${ sum + i }" />	
</c:forEach>
1~100까지의 합 : ${sum}  <br/>  <hr/>

<!--  짝수의 합과 홀수의 합을 구하기  -->


<!-- 변수를 하나 선언하여 그 변수 값에 따른 구구단 출력  -->

</body>
</html>