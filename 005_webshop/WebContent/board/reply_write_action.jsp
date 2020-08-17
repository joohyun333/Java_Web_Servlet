<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="boardmanager" class="board.BoardManager"/>
<jsp:useBean id="bean" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>

<!-- 오늘 날짜 구하기 -->
<jsp:useBean id="date" class="java.util.Date"/>
<fmt:formatDate var="now" value="${date}" pattern="yyyy-MM-dd HH:mm:ss"/>
<c:set var="write_date" value="${now }"/>
<jsp:setProperty property="write_date" name="bean" value="${write_date}"/>

<!-- ip주소 구하기 -->
<c:set var="write_ip" value="${pageContext.request.remoteHost }"/>
<jsp:setProperty property="write_ip" name="bean" value="${write_ip}"/>

<!-- 글 번호 구하기 -->
<c:set var="insert_num" value="${boardmanager.getCurrentNum()+1}"/>
<jsp:setProperty property="num" name="bean" value="${insert_num}"/>

<!-- 그룹내 댓글 최근번호 구하기 -->
<c:set var="num_in_group" value="${boardmanager.getCurrent_num_in_group(param.num)}"/>
<jsp:setProperty property="num_in_group" name="bean" value="${num_in_group+1 }"/>

<!-- 댓글 단계 계산 -->
<c:set var="nested" value="${param.nested+1}"/>
<jsp:setProperty property="nested" name="bean" value = "${nested}"/>

<!-- 댓글 삽입작업 -->
${boardmanager.insertReply(bean)}

<!-- 리플 삽입하고 돌아가기 -->
<c:redirect url="content.jsp?num=${insert_num}&page=${param.page}"/>