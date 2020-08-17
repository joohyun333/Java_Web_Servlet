<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%@ page import="member.beans.Member" %> 

  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> JSTL </title>
</head>
<body>

1. 자바소스 <br/>
<%
	Member m = new Member();
	m.setName("홍길자");
	m.setAddr("대한민국");
%>
이름 : <%= m.getName() %> / 주소 : <%= m.getAddr() %> <br/><br/>

2. JSTL 변수 선언하여 사용 <br/>
<c:set var="name1"><%= m.getName() %></c:set>
<c:set var="name2" value="<%= m.getName() %>" />
name1 : ${name1 } <br/>
name2 : ${name2 } <br/>

<!-- 값을 지정이 안됨  -->
<c:set var="addr1">${m.addr }</c:set>
<c:set var="addr2" value="${m.addr }" />
addr1 : ${addr1 } <br/>
addr2 : ${addr2 } <br/>


<c:set var="m2" value="<%=m %>"/>
<c:set var="addr1">${m2.addr }</c:set>
<c:set var="addr2" value="${m2.addr }" />
addr1 : ${addr1 } <br/>
addr2 : ${addr2 } <br/><br/>

3. JSTL에서 setter를 사용하려면 <br/>
<c:set var="m3" value="<%=m %>"/>
<c:set target="<%=m %>" property="name" value="홍길자"/>
<c:set target="${m3 }" property="addr" value="판교"/>
name : ${m3.name}<br/>
addr : ${m3.addr}<br/><br/>

</body>
</html>