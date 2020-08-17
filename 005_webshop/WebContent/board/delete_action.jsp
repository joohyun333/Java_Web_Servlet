<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="boardmanager" class="board.BoardManager"/>
<c:set var="dto" value="${boardmanager.getData(param.num)}"/>

<c:if test="${dto.pass == param.pass}">
	${boardmanager.deleteData(param.num)}
<c:redirect url="boardlist.jsp?page=${param.page}"/>
</c:if>