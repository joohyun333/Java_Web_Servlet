<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="boardmanager" class="board.BoardManager"/>
<jsp:useBean id="bean" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>
${boardmanager.updateData(bean)}

<c:redirect url="content.jsp?num=${param.num}&page=${param.page}"/>